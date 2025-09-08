# Sphinx Documentation Deployment to AWS

This guide covers the complete process for deploying Sphinx documentation to AWS infrastructure for the Karios.ai documentation site.

## Prerequisites

- SSH access to the source server (192.168.116.125)
- AWS EC2 bastion host access
- Private key file (`karios-central.pem`)
- Git repository with documentation sources

## Deployment Process

### Step 1: Prepare Documentation Archives

#### For English Documentation

1. SSH to the source server as root:
   ```bash
   ssh root@192.168.116.125
   ```

2. Navigate to the documentation directory:
   ```bash
   cd /root/secure-sphinx-infra/docs
   ```

3. Switch to main branch and pull latest changes:
   ```bash
   git checkout main
   git pull
   ```

4. Create the English documentation archive:
   ```bash
   cd /root/secure-sphinx-infra/
   tar -czf docs-en.tar.gz docs/
   ```

#### For Italian Documentation

1. Switch to Italian branch:
   ```bash
   cd /root/secure-sphinx-infra/docs
   git checkout italian
   git pull
   ```

2. Create the Italian documentation archive:
   ```bash
   cd /root/secure-sphinx-infra/
   tar -czf docs-it.tar.gz docs/
   ```

### Step 2: Upload Archives to AWS Bastion

Upload the documentation archives to the AWS bastion host:

```bash
# Upload Italian docs
scp -i karios-central.pem docs-it.tar.gz ec2-user@3.147.57.128:

# Upload English docs  
scp -i karios-central.pem docs-en.tar.gz ec2-user@3.147.57.128:
```

### Step 3: Connect to AWS Bastion

SSH to the AWS bastion host:

```bash
ssh -i karios-central.pem ec2-user@3.147.57.128
```

### Step 4: Transfer to Documentation Server

Copy the archives to the documentation build server:

```bash
# Copy English docs
scp docs-en.tar.gz sphinx-server:/home/sphinx/

# Copy Italian docs
scp docs-it.tar.gz sphinx-server:/home/sphinx/
```

### Step 5: Deploy Documentation

Deploy the documentation using the deployment script:

```bash
# Deploy English documentation
./deploy-docs.sh docs-en.tar.gz en

# Deploy Italian documentation
./deploy-docs.sh docs-it.tar.gz it
```

## Deployment Script Details

The `deploy-docs.sh` script performs the following operations:

1. **File Transfer**: Copies the archive to the documentation server
2. **Environment Setup**: Installs required Python packages (urllib3, Sphinx, themes, extensions)
3. **Build Process**: Extracts archive and builds HTML documentation using Sphinx
4. **Web Deployment**: Copies built documentation to `/var/www/sphinx-docs/`

### Expected Build Output

The build process will:
- Extract the documentation archive
- Install/verify Sphinx dependencies
- Build HTML documentation with the Read the Docs theme
- Generate search indices
- Copy static assets and images
- Deploy to the web directory

### Documentation URLs

After successful deployment:
- **English**: https://docs.karios.ai/
- **Italian**: https://docs.karios.ai/it/

## Common Build Warnings

The following warnings are normal and can be ignored:
- Missing image files (RBAC screenshots)
- Social cards not generated (matplotlib not installed)
- TOC tree references to nonexistent documents (language-specific structure)

## Troubleshooting

### Connection Issues
- Verify SSH key permissions: `chmod 0600 karios-central.pem`
- Ensure bastion host IP is current
- Check security group rules for SSH access

### Build Failures
- Check Sphinx configuration in the archive
- Verify all required dependencies are installed
- Review build logs for specific error messages

### Missing Images
- Ensure static assets are included in the archive
- Check image file paths in RST files
- Verify image files exist in `_static/Images/` directory

## File Structure

```
/root/secure-sphinx-infra/
├── docs/                    # Documentation source files
│   ├── conf.py             # Sphinx configuration
│   ├── index.rst           # Main documentation index
│   ├── user-guide/         # User guide sections
│   ├── administration/     # Admin documentation
│   └── _static/           # Static assets and images
├── docs-en.tar.gz         # English documentation archive
└── docs-it.tar.gz         # Italian documentation archive
```

## Security Notes

- Private key file must be properly secured with 0600 permissions
- Access is restricted through AWS security groups
- Documentation server is only accessible via bastion host
- All transfers use encrypted SSH connections

## Maintenance

- Regularly update documentation sources in Git
- Monitor build logs for any new warnings or errors
- Periodically verify documentation URLs are accessible
- Keep Sphinx and theme versions updated