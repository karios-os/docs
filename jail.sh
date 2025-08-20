#!/bin/sh
#
# Documentation Jail Setup Script - Complete Fixed Version
# Includes all fixes for Python 3.11, SSL, IPv6, and PF rules
#

# Configuration Variables
DOCS_JAIL_NAME="${DOCS_JAIL_NAME:-docs}"
DOCS_JAIL_IP="${DOCS_JAIL_IP:-192.168.116.50}"
DOCS_HTTP_PORT="${DOCS_HTTP_PORT:-80}"
DOCS_HTTPS_PORT="${DOCS_HTTPS_PORT:-443}"
DOCS_GIT_REPO="${DOCS_GIT_REPO:-https://git.karios.ai/karios/docs}"
DOCS_GIT_BRANCH="${DOCS_GIT_BRANCH:-main}"
DOCS_BUILD_CMD="${DOCS_BUILD_CMD:-make clean && make html}"
DOCS_UPDATE_INTERVAL="${DOCS_UPDATE_INTERVAL:-300}"
EXT_INTERFACE="${EXT_INTERFACE:-vtnet0}"
DNS_SERVER="${DNS_SERVER:-192.168.116.240}"
ZFS_POOL="${ZFS_POOL:-zroot}"
ALLOWED_NETWORKS="${ALLOWED_NETWORKS:-192.168.111.0/24 192.168.112.0/24 192.168.113.0/24 192.168.114.0/24 192.168.116.0/24 192.168.218.0/24}"

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
BOLD='\033[1m'
NC='\033[0m' # No Color

# Logging functions
log_info() { echo "${CYAN}[INFO]${NC} $@"; }
log_error() { echo "${RED}[ERROR]${NC} $@" >&2; }
log_success() { echo "${GREEN}[SUCCESS]${NC} $@"; }
log_warning() { echo "${YELLOW}[WARNING]${NC} $@"; }
log_header() { 
    echo ""
    echo "${CYAN}${BOLD}=== $@ ===${NC}"
}

# Display banner
show_banner() {
    echo "${CYAN}${BOLD}"
    echo "╔══════════════════════════════════════════════════════════════════════════════╗"
    echo "║                   Sphinx Documentation Jail Setup                           ║"
    echo "║                            Version 2.0.0 (Fixed)                           ║"
    echo "╚══════════════════════════════════════════════════════════════════════════════╝"
    echo "${NC}"
}

# Display configuration
show_config() {
    log_header "Sphinx Documentation Configuration"
    
    echo "${BOLD}Documentation Setup:${NC}"
    echo "  Jail Name: ${DOCS_JAIL_NAME}"
    echo "  Jail IP: ${DOCS_JAIL_IP}"
    echo "  HTTP Port: ${DOCS_HTTP_PORT}"
    echo "  HTTPS Port: ${DOCS_HTTPS_PORT}"
    
    echo "${BOLD}Git Repository:${NC}"
    echo "  Repository: ${DOCS_GIT_REPO}"
    echo "  Branch: ${DOCS_GIT_BRANCH}"
    echo "  Build Command: ${DOCS_BUILD_CMD}"
    echo "  Update Interval: ${DOCS_UPDATE_INTERVAL}s"
    
    echo "${BOLD}Infrastructure:${NC}"
    echo "  External Interface: ${EXT_INTERFACE}"
    echo "  DNS Server: ${DNS_SERVER}"
    echo "  ZFS Pool: ${ZFS_POOL}"
    
    echo "${BOLD}Access Control:${NC}"
    for net in ${ALLOWED_NETWORKS}; do
        echo "  - ${net}"
    done
}

# Validate configuration
validate_config() {
    local errors=0
    
    log_header "Configuration Validation"
    
    # Check required variables
    if [ -z "${DOCS_JAIL_IP}" ]; then
        log_error "DOCS_JAIL_IP is not set"
        errors=$((errors + 1))
    fi
    
    if [ -z "${DOCS_GIT_REPO}" ]; then
        log_error "DOCS_GIT_REPO is not set"
        errors=$((errors + 1))
    fi
    
    # Check ZFS pool
    if ! zpool list "${ZFS_POOL}" >/dev/null 2>&1; then
        log_error "ZFS pool '${ZFS_POOL}' does not exist"
        errors=$((errors + 1))
    fi
    
    # Check external interface
    if ! ifconfig "${EXT_INTERFACE}" >/dev/null 2>&1; then
        log_error "External interface '${EXT_INTERFACE}' does not exist"
        errors=$((errors + 1))
    fi
    
    # Test Git repository (with SSL verification disabled)
    log_info "Testing Git repository access..."
    GIT_SSL_NO_VERIFY=true git ls-remote "${DOCS_GIT_REPO}" "${DOCS_GIT_BRANCH}" >/dev/null 2>&1
    if [ $? -eq 0 ]; then
        log_success "Git repository is accessible"
    else
        log_warning "Git repository may require authentication"
    fi
    
    if [ ${errors} -gt 0 ]; then
        log_error "Configuration validation failed with ${errors} error(s)"
        return 1
    fi
    
    log_success "Configuration validation passed"
    return 0
}

# Setup ZFS datasets
setup_zfs() {
    log_header "ZFS Dataset Setup for Documentation"
    
    # Create main jail dataset
    log_info "Creating ZFS dataset for documentation jail..."
    if ! zfs list "${ZFS_POOL}/jails/${DOCS_JAIL_NAME}" >/dev/null 2>&1; then
        zfs create -o mountpoint=/usr/jails/${DOCS_JAIL_NAME} ${ZFS_POOL}/jails/${DOCS_JAIL_NAME}
        log_success "Created ZFS dataset"
    else
        log_info "ZFS dataset already exists"
    fi
    
    # Create datasets for documentation storage
    log_info "Creating datasets for documentation storage..."
    for dataset in docs git; do
        if ! zfs list "${ZFS_POOL}/jails/${DOCS_JAIL_NAME}/${dataset}" >/dev/null 2>&1; then
            zfs create ${ZFS_POOL}/jails/${DOCS_JAIL_NAME}/${dataset}
            log_success "Created ${dataset} dataset"
        else
            log_info "${dataset} dataset already exists"
        fi
    done
    
    log_success "ZFS datasets configured"
}

# Configure network (with fixed arithmetic)
configure_network() {
    log_header "Network Configuration for Documentation Jail"
    
    # Add jail IP to external interface
    log_info "Adding documentation jail IP to external interface..."
    if ifconfig "${EXT_INTERFACE}" | grep -q "${DOCS_JAIL_IP}"; then
        log_info "IP ${DOCS_JAIL_IP} already configured on ${EXT_INTERFACE}"
    else
        ifconfig "${EXT_INTERFACE}" alias "${DOCS_JAIL_IP}/24" up
        if [ $? -eq 0 ]; then
            log_success "Added ${DOCS_JAIL_IP} to ${EXT_INTERFACE}"
        else
            log_error "Failed to add IP alias"
            return 1
        fi
    fi
    
    # Update rc.conf for persistence (using named alias to avoid arithmetic issues)
    log_info "Updating rc.conf for documentation jail..."
    if ! grep -q "${DOCS_JAIL_IP}" /etc/rc.conf 2>/dev/null; then
        echo "# Documentation jail IP - added $(date)" >> /etc/rc.conf
        echo "ifconfig_${EXT_INTERFACE}_alias_docs=\"inet ${DOCS_JAIL_IP} netmask 255.255.255.0\"" >> /etc/rc.conf
        log_success "Added persistent network configuration to rc.conf"
    else
        log_info "IP ${DOCS_JAIL_IP} already in rc.conf"
    fi
    
    log_success "Network configuration completed"
}

# Update PF rules for documentation jail
update_pf_rules() {
    log_header "Updating PF Rules for Documentation Jail"
    
    # Check if PF is enabled
    if ! service pf status >/dev/null 2>&1; then
        log_warning "PF is not running. Enabling PF..."
        sysrc pf_enable="YES"
        service pf start
    fi
    
    # Check if docs_jail variable exists in pf.conf
    if ! grep -q "docs_jail" /etc/pf.conf 2>/dev/null; then
        log_info "Adding documentation jail to PF configuration..."
        
        # Backup current pf.conf
        cp /etc/pf.conf /etc/pf.conf.backup.$(date +%Y%m%d_%H%M%S)
        
        # Add docs_jail variable if not present
        if ! grep -q 'docs_jail = "192.168.116.50"' /etc/pf.conf; then
            # Find where other jail variables are defined and add docs_jail
            sed -i '' '/haproxy2_jail/a\
docs_jail = "192.168.116.50"' /etc/pf.conf
        fi
        
        # Add pass rule for docs jail
        if ! grep -q "pass in.*docs_jail" /etc/pf.conf; then
            # Add the rule after the haproxy2 rules
            cat >> /etc/pf.conf << 'EOF'

# Documentation jail (192.168.116.50): HTTP (80) and HTTPS (443)
pass in log on $ext_if proto tcp from $allowed_nets to $docs_jail port { 80, 443 } keep state
EOF
            log_success "Added PF rules for documentation jail"
        fi
    else
        log_info "Documentation jail rules already exist in pf.conf"
    fi
    
    # Test and reload PF configuration
    if pfctl -nf /etc/pf.conf 2>/dev/null; then
        pfctl -f /etc/pf.conf
        log_success "PF rules reloaded successfully"
    else
        log_error "PF configuration has errors. Please check /etc/pf.conf"
        return 1
    fi
}

# Create jail
create_jail() {
    log_header "Creating Documentation Jail"
    
    # Check if jail already exists
    if jls -j ${DOCS_JAIL_NAME} >/dev/null 2>&1; then
        log_info "Jail ${DOCS_JAIL_NAME} already exists"
        return 0
    fi
    
    # Create jail directory structure
    JAIL_ROOT="/usr/jails/${DOCS_JAIL_NAME}"
    log_info "Creating jail directory structure..."
    mkdir -p ${JAIL_ROOT}/{dev,etc,tmp,var,usr/local}
    
    # Install base system
    log_info "Installing base system..."
    if [ ! -f ${JAIL_ROOT}/bin/sh ]; then
        tar -xf /usr/jails/media/14.1-RELEASE-base.txz -C ${JAIL_ROOT}
    fi
    
    # Configure jail
    log_info "Configuring jail..."
    
    # Create jail.conf entry
    if ! grep -q "^${DOCS_JAIL_NAME} {" /etc/jail.conf 2>/dev/null; then
        cat >> /etc/jail.conf << EOF

${DOCS_JAIL_NAME} {
    host.hostname = "${DOCS_JAIL_NAME}.local";
    ip4.addr = "${EXT_INTERFACE}|${DOCS_JAIL_IP}/24";
    path = "${JAIL_ROOT}";
    mount.devfs;
    exec.start = "/bin/sh /etc/rc";
    exec.stop = "/bin/sh /etc/rc.shutdown";
    exec.clean;
    allow.raw_sockets = 1;
    allow.sysvipc = 1;
}
EOF
    fi
    
    # Configure resolv.conf
    echo "nameserver ${DNS_SERVER}" > ${JAIL_ROOT}/etc/resolv.conf
    echo "search local" >> ${JAIL_ROOT}/etc/resolv.conf
    
    # Configure rc.conf in jail
    cat > ${JAIL_ROOT}/etc/rc.conf << EOF
hostname="${DOCS_JAIL_NAME}.local"
sshd_enable="NO"
sendmail_enable="NO"
syslogd_enable="YES"
syslogd_flags="-ss"
nginx_enable="YES"
docs_updater_enable="YES"
EOF
    
    # Enable jail at boot
    sysrc jail_enable="YES"
    sysrc jail_list+="${DOCS_JAIL_NAME}"
    
    # Start jail
    log_info "Starting documentation jail..."
    service jail start ${DOCS_JAIL_NAME}
    
    if jls -j ${DOCS_JAIL_NAME} >/dev/null 2>&1; then
        log_success "Documentation jail created and started"
    else
        log_error "Failed to start documentation jail"
        return 1
    fi
}

# Install packages (with Python 3.11 fix)
install_packages() {
    log_header "Installing Required Packages"
    
    # Test DNS
    log_info "Testing DNS resolution in documentation jail..."
    if jexec ${DOCS_JAIL_NAME} host google.com >/dev/null 2>&1; then
        log_success "DNS resolution working in jail"
    else
        log_warning "DNS resolution not working, using IP-based repository"
    fi
    
    # Bootstrap pkg
    log_info "Bootstrapping package manager..."
    jexec ${DOCS_JAIL_NAME} env ASSUME_ALWAYS_YES=yes pkg bootstrap
    
    # Install packages - using Python 3.11 (current default)
    log_info "Installing required packages..."
    if jexec ${DOCS_JAIL_NAME} pkg install -y \
        git gmake nginx \
        python311 py311-pip py311-sphinx py311-sphinx_rtd_theme; then
        log_success "Base packages installed"
    else
        log_warning "Some packages failed, trying alternative method..."
        
        # Alternative: Install Python and use pip
        jexec ${DOCS_JAIL_NAME} pkg install -y python3 git gmake nginx
        jexec ${DOCS_JAIL_NAME} python3 -m ensurepip
        jexec ${DOCS_JAIL_NAME} pip3 install sphinx sphinx_rtd_theme
    fi
    
    # Create symlinks for convenience
    jexec ${DOCS_JAIL_NAME} ln -sf /usr/local/bin/python3.11 /usr/local/bin/python3 2>/dev/null
    jexec ${DOCS_JAIL_NAME} ln -sf /usr/local/bin/pip-3.11 /usr/local/bin/pip3 2>/dev/null
    
    log_success "Package installation completed"
}

# Setup Git repository (with SSL verification disabled)
setup_git_repo() {
    log_header "Setting Up Git Repository"
    
    GIT_DIR="/usr/jails/${DOCS_JAIL_NAME}/usr/local/git/docs"
    
    # Configure git to disable SSL verification
    log_info "Configuring Git settings..."
    jexec ${DOCS_JAIL_NAME} git config --global http.sslVerify false
    jexec ${DOCS_JAIL_NAME} git config --global credential.helper store
    
    # Clone repository
    log_info "Cloning documentation repository..."
    if [ -d "${GIT_DIR}/.git" ]; then
        log_info "Repository already exists, updating..."
        jexec ${DOCS_JAIL_NAME} sh -c "cd /usr/local/git/docs && git pull origin ${DOCS_GIT_BRANCH}"
    else
        jexec ${DOCS_JAIL_NAME} mkdir -p /usr/local/git
        
        # Try to clone
        log_info "Cloning from ${DOCS_GIT_REPO}..."
        if ! jexec ${DOCS_JAIL_NAME} git clone -b "${DOCS_GIT_BRANCH}" "${DOCS_GIT_REPO}" /usr/local/git/docs; then
            log_warning "Clone failed, may need authentication"
            log_info "Please enter Git credentials:"
            read -p "Username: " git_user
            read -s -p "Password/Token: " git_pass
            echo ""
            
            DOCS_GIT_REPO_AUTH="https://${git_user}:${git_pass}@${DOCS_GIT_REPO#https://}"
            jexec ${DOCS_JAIL_NAME} git clone -b "${DOCS_GIT_BRANCH}" "${DOCS_GIT_REPO_AUTH}" /usr/local/git/docs
        fi
    fi
    
    # Install Python requirements if requirements.txt exists
    if [ -f "${GIT_DIR}/requirements.txt" ]; then
        log_info "Installing Python requirements..."
        jexec ${DOCS_JAIL_NAME} sh -c "cd /usr/local/git/docs && pip3 install -r requirements.txt"
    fi
    
    log_success "Git repository configured"
}

# Configure Nginx (with IPv6 disabled)
configure_nginx() {
    log_header "Configuring Nginx"
    
    # Create Nginx configuration without IPv6
    log_info "Creating Nginx configuration..."
    cat > "/usr/jails/${DOCS_JAIL_NAME}/usr/local/etc/nginx/nginx.conf" << EOF
worker_processes auto;
error_log /var/log/nginx/error.log;

events {
    worker_connections 1024;
}

http {
    include       mime.types;
    default_type  application/octet-stream;
    
    sendfile on;
    keepalive_timeout 65;
    
    # Logging
    access_log /var/log/nginx/access.log;
    
    # Gzip compression
    gzip on;
    gzip_types text/plain text/css application/json application/javascript text/xml application/xml application/xml+rss text/javascript;
    
    server {
        listen ${DOCS_HTTP_PORT};
        # IPv6 disabled - not supported in jail
        # listen [::]:${DOCS_HTTP_PORT};
        
        server_name docs.karios.ai ${DOCS_JAIL_IP};
        
        root /usr/local/www/docs;
        index index.html;
        
        # Security headers
        add_header X-Frame-Options "SAMEORIGIN" always;
        add_header X-Content-Type-Options "nosniff" always;
        add_header X-XSS-Protection "1; mode=block" always;
        
        location / {
            try_files \$uri \$uri/ /index.html =404;
        }
        
        # Cache static assets
        location ~* \.(css|js|jpg|jpeg|png|gif|ico|svg|woff|woff2|ttf|eot)$ {
            expires 30d;
            add_header Cache-Control "public, immutable";
        }
        
        # Deny access to hidden files
        location ~ /\. {
            deny all;
        }
    }
}
EOF
    
    # Create log directory
    jexec ${DOCS_JAIL_NAME} mkdir -p /var/log/nginx
    
    # Enable and start Nginx
    log_info "Starting Nginx service..."
    jexec ${DOCS_JAIL_NAME} sysrc nginx_enable="YES"
    jexec ${DOCS_JAIL_NAME} service nginx restart || jexec ${DOCS_JAIL_NAME} service nginx start
    
    log_success "Nginx configured and running"
}

# Setup build scripts (handles docs in subdirectory)
setup_build_scripts() {
    log_header "Setting Up Build Scripts"
    
    # Create build script that handles the repository structure correctly
    log_info "Creating build script..."
    cat > "/usr/jails/${DOCS_JAIL_NAME}/usr/local/bin/build-docs.sh" << 'EOF'
#!/bin/sh

# Documentation build script
GIT_DIR="/usr/local/git/docs"
BUILD_DIR="/usr/local/www/docs"
LOG_FILE="/var/log/docs-build.log"

echo "[$(date)] Starting documentation build..." >> $LOG_FILE

# Ensure directories exist
mkdir -p $BUILD_DIR
mkdir -p $(dirname $LOG_FILE)

# Check if git directory exists
if [ ! -d "$GIT_DIR" ]; then
    echo "[$(date)] ERROR: Git directory not found at $GIT_DIR" >> $LOG_FILE
    exit 1
fi

cd $GIT_DIR

# Update git repository
if [ -d ".git" ]; then
    git pull origin main >> $LOG_FILE 2>&1 || echo "[$(date)] Git pull failed (may be offline)" >> $LOG_FILE
fi

# The docs are in the 'docs' subdirectory based on repository structure
if [ -d "docs" ] && [ -f "docs/conf.py" ]; then
    echo "[$(date)] Building documentation from docs/ directory" >> $LOG_FILE
    cd docs
    
    # Build with sphinx
    if command -v sphinx-build >/dev/null 2>&1; then
        sphinx-build -b html . $BUILD_DIR >> $LOG_FILE 2>&1
    else
        python3 -m sphinx -b html . $BUILD_DIR >> $LOG_FILE 2>&1
    fi
    
    if [ $? -eq 0 ]; then
        echo "[$(date)] Documentation built successfully" >> $LOG_FILE
    else
        echo "[$(date)] Build failed, check log for details" >> $LOG_FILE
    fi
elif [ -f "conf.py" ]; then
    # Docs in root directory
    echo "[$(date)] Building documentation from root directory" >> $LOG_FILE
    sphinx-build -b html . $BUILD_DIR >> $LOG_FILE 2>&1
else
    echo "[$(date)] ERROR: No Sphinx configuration found!" >> $LOG_FILE
    echo "[$(date)] Repository structure:" >> $LOG_FILE
    ls -la >> $LOG_FILE 2>&1
fi

# Set proper permissions
chown -R www:www $BUILD_DIR
chmod -R 755 $BUILD_DIR

echo "[$(date)] Build complete" >> $LOG_FILE
EOF
    
    chmod +x "/usr/jails/${DOCS_JAIL_NAME}/usr/local/bin/build-docs.sh"
    
    # Create update script
    log_info "Creating update script..."
    cat > "/usr/jails/${DOCS_JAIL_NAME}/usr/local/bin/update-docs.sh" << EOF
#!/bin/sh

# Continuous update script for documentation
UPDATE_INTERVAL=\${1:-${DOCS_UPDATE_INTERVAL}}

while true; do
    /usr/local/bin/build-docs.sh
    sleep \$UPDATE_INTERVAL
done
EOF
    
    chmod +x "/usr/jails/${DOCS_JAIL_NAME}/usr/local/bin/update-docs.sh"
    
    # Create rc script for auto-start
    log_info "Creating rc script..."
    cat > "/usr/jails/${DOCS_JAIL_NAME}/usr/local/etc/rc.d/docs_updater" << 'EOF'
#!/bin/sh

# PROVIDE: docs_updater
# REQUIRE: DAEMON
# KEYWORD: shutdown

. /etc/rc.subr

name="docs_updater"
rcvar=docs_updater_enable
command="/usr/local/bin/update-docs.sh"
command_args="300"
pidfile="/var/run/${name}.pid"

start_cmd="${name}_start"
stop_cmd="${name}_stop"

docs_updater_start() {
    echo "Starting ${name}."
    /usr/sbin/daemon -p ${pidfile} -f ${command} ${command_args}
}

docs_updater_stop() {
    if [ -f ${pidfile} ]; then
        echo "Stopping ${name}."
        kill $(cat ${pidfile})
        rm -f ${pidfile}
    fi
}

load_rc_config $name
run_rc_command "$1"
EOF
    
    chmod +x "/usr/jails/${DOCS_JAIL_NAME}/usr/local/etc/rc.d/docs_updater"
    
    # Enable and start the updater
    jexec ${DOCS_JAIL_NAME} sysrc docs_updater_enable="YES"
    
    # Run initial build
    log_info "Running initial documentation build..."
    jexec ${DOCS_JAIL_NAME} /usr/local/bin/build-docs.sh
    
    # Start the updater service
    jexec ${DOCS_JAIL_NAME} service docs_updater start
    
    log_success "Build scripts configured"
}

# Final verification
verify_setup() {
    log_header "Verifying Documentation Jail Setup"
    
    local errors=0
    
    # Check jail is running
    if jls -j ${DOCS_JAIL_NAME} >/dev/null 2>&1; then
        log_success "Jail is running"
    else
        log_error "Jail is not running"
        errors=$((errors + 1))
    fi
    
    # Check Nginx
    if jexec ${DOCS_JAIL_NAME} service nginx status | grep -q "is running"; then
        log_success "Nginx is running"
    else
        log_error "Nginx is not running"
        errors=$((errors + 1))
    fi
    
    # Check if documentation is accessible
    if curl -s -o /dev/null -w "%{http_code}" "http://${DOCS_JAIL_IP}" | grep -q "200\|301\|302"; then
        log_success "Documentation is accessible at http://${DOCS_JAIL_IP}"
    else
        log_warning "Documentation may not be ready yet (still building)"
    fi
    
    # Check PF rules
    if pfctl -sr | grep -q "${DOCS_JAIL_IP}"; then
        log_success "PF rules configured for documentation jail"
    else
        log_warning "PF rules may need configuration"
    fi
    
    if [ ${errors} -eq 0 ]; then
        log_success "Documentation jail setup completed successfully!"
        
        echo ""
        echo "${GREEN}${BOLD}╔══════════════════════════════════════════════════════════════════╗${NC}"
        echo "${GREEN}${BOLD}║         Documentation Jail Setup Complete!                      ║${NC}"
        echo "${GREEN}${BOLD}╠══════════════════════════════════════════════════════════════════╣${NC}"
        echo "${GREEN}${BOLD}║${NC} Access URL:      ${CYAN}http://${DOCS_JAIL_IP}${NC}"
        echo "${GREEN}${BOLD}║${NC} Jail Name:       ${CYAN}${DOCS_JAIL_NAME}${NC}"
        echo "${GREEN}${BOLD}║${NC} Update Interval: ${CYAN}${DOCS_UPDATE_INTERVAL} seconds${NC}"
        echo "${GREEN}${BOLD}╠══════════════════════════════════════════════════════════════════╣${NC}"
        echo "${GREEN}${BOLD}║${NC} ${BOLD}Management Commands:${NC}"
        echo "${GREEN}${BOLD}║${NC}   View logs:     ${YELLOW}jexec ${DOCS_JAIL_NAME} tail -f /var/log/docs-build.log${NC}"
        echo "${GREEN}${BOLD}║${NC}   Rebuild docs:  ${YELLOW}jexec ${DOCS_JAIL_NAME} /usr/local/bin/build-docs.sh${NC}"
        echo "${GREEN}${BOLD}║${NC}   Nginx logs:    ${YELLOW}jexec ${DOCS_JAIL_NAME} tail -f /var/log/nginx/error.log${NC}"
        echo "${GREEN}${BOLD}║${NC}   Restart jail:  ${YELLOW}service jail restart ${DOCS_JAIL_NAME}${NC}"
        echo "${GREEN}${BOLD}╚══════════════════════════════════════════════════════════════════╝${NC}"
    else
        log_error "Setup completed with ${errors} error(s)"
        return 1
    fi
}

# Main execution
main() {
    show_banner
    show_config
    
    # Parse arguments
    FORCE_MODE=0
    for arg in "$@"; do
        case $arg in
            --force)
                FORCE_MODE=1
                log_warning "Force mode enabled - will recreate existing components"
                ;;
            --help)
                echo "Usage: $0 [--force]"
                echo "  --force    Recreate existing jail and components"
                exit 0
                ;;
        esac
    done
    
    # Run setup steps
    validate_config || exit 1
    setup_zfs || exit 1
    configure_network || exit 1
    update_pf_rules || exit 1
    create_jail || exit 1
    install_packages || exit 1
    setup_git_repo || exit 1
    configure_nginx || exit 1
    setup_build_scripts || exit 1
    verify_setup
}

# Run main function
main "$@"
