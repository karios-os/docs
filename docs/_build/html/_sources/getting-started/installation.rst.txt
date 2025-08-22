Installation
============

.. meta::
   :description: Complete installation guide for Karios hyper-converged infrastructure platform
   :keywords: Karios, installation, setup, FreeBSD, HCI, hypervisor

Overview
--------

Karios is built on the robust FreeBSD operating system, providing a complete hyper-converged infrastructure solution. The Karios installer contains all necessary packages and components pre-configured for optimal performance and security.

System Requirements
-------------------

Production Hardware Recommendations
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. important::
   We strongly recommend using high-quality server hardware when deploying Karios in production environments. Enterprise-grade hardware ensures reliability, performance, and long-term support for your critical infrastructure.

Minimum Requirements
~~~~~~~~~~~~~~~~~~~~

.. warning::
   These minimum requirements are intended for **evaluation and testing purposes only**. Do not use these specifications for production deployments.

.. list-table:: 
   :header-rows: 1
   :widths: 25 75

   * - Component
     - Specification
   * - **CPU**
     - 64-bit processor
   * - **Virtualization Support**
     - Intel VT-x or AMD-V capable CPU and motherboard for hardware-assisted virtualization
   * - **RAM**
     - 32 GB system RAM minimum, plus additional RAM allocation for virtual machines and guests
   * - **Storage**
     - Hard drive with sufficient capacity for the operating system and guest storage
   * - **Network**
     - One network interface card (NIC) minimum

Recommended Production Requirements
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. list-table:: 
   :header-rows: 1
   :widths: 20 80

   * - Component
     - Specification
   * - **CPU**
     - Intel Xeon Scalable, AMD EPYC or equivalent (minimum 8 cores)
   * - **RAM**
     - 64GB DDR4 ECC RAM (minimum) - ECC RAM is strongly recommended for data integrity
   * - **Storage**
     - Minimum 2 x 1TB SATA drives (for redundancy). SSD/NVMe drives are highly recommended for performance
   * - **Network**
     - Gigabit Ethernet adapter minimum

.. note::
   For detailed hardware requirements, refer to the hardware compatibility section.

Pre-Installation Planning
-------------------------

.. important::
   **MANDATORY REQUIREMENT**: Internet connectivity is required during installation.

Preparing Your Hardware and Software
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Before you begin installing Karios, careful preparation is crucial for a smooth and successful deployment. This section outlines the necessary hardware checks, software downloads, and USB drive creation process.

Hardware Requirements Verification
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

**Hardware Compatibility**

While Karios supports a wide range of hardware, we maintain a list of tested and validated configurations. Consult the hardware compatibility documentation before proceeding if you have specific concerns about hardware compatibility.

**BIOS/UEFI Settings**

Ensure your BIOS or UEFI is configured properly:

- Set boot order with USB drive as the primary boot device
- Enable virtualization support (Intel VT-x or AMD-V)
- Refer to your motherboard manual for instructions on accessing and modifying these settings

Downloading the Karios ISO Image
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

1. Navigate to the official Karios download page
2. Select the appropriate version based on your hardware architecture (typically x86_64)
3. If unsure about architecture, consult with your system administrator

**Verify Download Integrity**

.. code-block:: bash

   # On Linux/macOS, verify the ISO checksum
   sha256sum karios-installer.iso
   
   # Compare with the official checksum from the download page

Creating a Bootable USB Drive
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

**Recommended Software**

- **Rufus** (Windows)
- **Etcher** (Cross-platform) 
- **dd** command (Linux/macOS)

**Rufus Instructions (Windows)**

1. Download and run Rufus
2. Select your USB drive from the "Device" dropdown menu

.. warning::
   All data on the selected USB drive will be erased.

3. Click the "SELECT" button and browse to the downloaded Karios ISO image file
4. Set partition scheme to "MBR" or "GPT" based on your system's BIOS/UEFI settings

.. tip::
   If unsure, try GPT first for newer systems.

5. Click "START" and confirm any warnings about data loss

**Etcher Instructions (Cross-Platform)**

1. Download and run Etcher
2. Click "Flash from file" and select the Karios ISO image
3. Select your USB drive as the target device
4. Click "Flash!"

**dd Command Instructions (Linux/macOS)**

.. code-block:: bash

   # Replace /dev/sdX with your USB drive identifier
   # Use 'lsblk' or 'fdisk -l' to identify the correct drive
   sudo dd if=karios-installer.iso of=/dev/sdX bs=4M status=progress
   sudo sync

Installation Process
--------------------

Kickstart Installation Steps
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The Karios installation follows a two-phase process:

**Phase 1: FreeBSD Base Installation**

1. Boot from the USB drive
2. Follow the FreeBSD installation prompts
3. Wait for the base system installation to complete
4. Allow the system to reboot

.. note::
   **Detailed FreeBSD Installation Guide**: For comprehensive step-by-step FreeBSD installation instructions, refer to the official FreeBSD Handbook: `FreeBSD Installation Guide <https://docs.freebsd.org/en/books/handbook/bsdinstall/>`_

   The FreeBSD Handbook provides detailed guidance on installation options, disk partitioning, network configuration, and system setup that forms the foundation for your Karios deployment.

**Phase 2: Karios Bootstrap**

After FreeBSD installation is complete and the node is up, execute the following commands:

.. tip::
   **What is Bootstrap?** A bootstrap script is an automated installer that downloads and configures all necessary software components. It eliminates manual setup by handling package installation, configuration, and service initialization automatically.

Security Best Practices for Bootstrap Installation
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. warning::
   **Critical Security Requirements**: Always follow these security practices before executing any bootstrap script to protect your system from potential security vulnerabilities.

**Pre-Execution Security Verification**

Before running the bootstrap script, implement these mandatory security checks:

.. code-block:: bash

   # 1. Verify script source authenticity
   # Ensure the download URL came from official Karios documentation
   
   # 2. Inspect script contents before execution
   less /root/test1.sh
   # or
   cat /root/test1.sh
   
   # 3. Verify file integrity and permissions
   ls -la /root/test1.sh

.. note::
   **Why Review Scripts?** Examining scripts before execution is a fundamental security practice. This verification ensures scripts contain expected commands, haven't been tampered with, and don't contain malicious code that could compromise your system.

**Understanding Privilege Escalation Security**

.. tip::
   **Why Privilege Escalation Matters**
   
   Running commands as root (superuser) provides unlimited system access, which creates significant security risks. Privilege escalation tools like sudo and doas allow users to execute specific commands with elevated privileges while maintaining security controls and accountability.

**Sudo: Industry Standard Privilege Escalation**

**Sudo (Superuser Do)** is the most widely used privilege escalation tool across Unix and Linux systems, providing comprehensive security features:

**Core Security Features:**

- **Audit Trails and Logging**: Every sudo command is logged with timestamps, user information, command executed, and working directory. Logs are stored in ``/var/log/auth.log`` and can be forwarded to central logging systems for compliance and forensic analysis.

- **Time-Limited Sessions**: Sudo sessions expire automatically (default 5 minutes), requiring re-authentication for continued access. This minimizes the window of exposure if a session is compromised.

- **User Accountability**: Commands are always traced to specific user accounts, enabling forensic analysis and compliance reporting. Unlike direct root access, you always know who executed what command and when.

- **Granular Permission Control**: Administrators can precisely control which users can execute which commands, on which hosts, and under what conditions. This supports the principle of least privilege.

- **Environment Management**: Sudo can sanitize environment variables, preventing privilege escalation through environment manipulation attacks.

- **Plugin Architecture**: Supports plugins for advanced authentication (LDAP, Kerberos), logging, and policy enforcement.


**FreeBSD doas: Security-Focused Alternative**

**doas (Dedicated OpenBSD Authentication System)** was developed by the OpenBSD project as a security-focused alternative to sudo, emphasizing simplicity and security over feature richness.

**Design Philosophy and Architecture:**

- **Minimalist Approach**: doas was designed with the philosophy that simpler code is more secure code. The entire doas codebase is significantly smaller than sudo, reducing the potential attack surface.

- **Security-First Design**: Developed by the OpenBSD team, known for their security-focused approach to system design. Every feature is evaluated for security implications before implementation.

- **Code Auditability**: The smaller codebase makes comprehensive security audits more feasible and effective, allowing security researchers to thoroughly examine the entire system.

**Core Security Features:**

- **Simplified Configuration**: doas uses a straightforward configuration syntax that reduces the likelihood of misconfigurations that could lead to security vulnerabilities.

- **Native FreeBSD Integration**: doas integrates seamlessly with FreeBSD's security architecture, including proper integration with system logging, user management, and security frameworks.

- **Memory Safety**: doas is written with memory safety as a primary concern, using secure coding practices to prevent buffer overflows and other memory-related vulnerabilities.

- **Privilege Separation**: doas employs privilege separation techniques to isolate different components of the system, limiting the impact of potential security breaches.



**Security Recommendations:**

- **Use sudo for**: Complex environments requiring granular control, extensive logging, or plugin support
- **Use doas for**: Security-focused deployments, FreeBSD environments, or systems requiring minimal attack surface
- **Avoid direct root for**: Any multi-user environment or production system where accountability and security are required

Bootstrap Script Download and Preparation
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The bootstrap script download location and preparation steps vary depending on your chosen execution method. Follow the appropriate section below based on your security requirements.

**Execution Method Selection**

Choose one of the following three methods based on your security requirements and system configuration:

Method 1: Using sudo (Recommended - Highest Security)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. tip::
   **Best Practice**: This is the recommended approach for production environments as it provides the highest level of security and audit capabilities.

**Prerequisites:**
- Non-root user account must exist
- User must have sudo privileges configured


.. note::
   **Bootstrap Link Access**: Replace "placeholder link" with the actual bootstrap download URL provided by your Karios sales team. Each customer receives a unique, time-limited download link for security purposes.

**Step 1: Download and Prepare Bootstrap Script**

.. code-block:: bash

   # Create non-root user if not already existing
   sudo adduser karios-admin
   
   # Add user to wheel group for sudo privileges
   sudo pw groupmod wheel -m karios-admin
   
   # Switch to non-root user
   su - karios-admin
   
   # Create working directory in user's home
   mkdir -p ~/karios-setup
   cd ~/karios-setup
   
   # Download bootstrap script to user directory
   fetch --no-verify-peer --no-verify-hostname "placeholder link" -o bootstrap.sh
   
   # Set executable permissions
   chmod o+x bootstrap.sh


**Step 2: Security Verification**

.. code-block:: bash

   # Verify sudo access
   sudo whoami  # Should return "root"
   
   # Review script contents before execution
   less bootstrap.sh
   # or
   cat bootstrap.sh

**Step 3: Execute Bootstrap Script**

.. code-block:: bash

   # Execute bootstrap with sudo from user directory
   sudo ./bootstrap.sh
   
   # Monitor execution - sudo will log all commands for audit purposes
   # Logs available in: /var/log/auth.log

**sudo Security Benefits:**
- All commands logged to ``/var/log/auth.log`` for audit trails
- Time-limited privilege escalation (default 5-minute timeout)
- User accountability and traceability
- Granular permission control
- Script executed from user directory, not root filesystem

Method 2: Using doas (FreeBSD Security-Focused Alternative)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. note::
   **FreeBSD Optimized**: doas is designed specifically for FreeBSD environments with enhanced security and simplified configuration.

**Prerequisites:**
- Non-root user account must exist
- doas package must be installed and configured

**Step 1: Install and Configure doas**

.. code-block:: bash

   # Install doas if not already installed (as root initially)
   pkg install doas
   
   # Create non-root user if not already existing
   adduser karios-admin

**Step 2: Configure doas Permissions**

.. code-block:: bash

   # Configure doas permissions (as root)
   # Edit /usr/local/etc/doas.conf
   echo "permit nopass karios-admin as root" >> /usr/local/etc/doas.conf
   echo "permit karios-admin as root cmd bootstrap.sh" >> /usr/local/etc/doas.conf
   
   # Set proper permissions on doas configuration
   chmod 600 /usr/local/etc/doas.conf

**Step 3: Download and Prepare Bootstrap Script**

.. code-block:: bash

   # Switch to non-root user
   su - karios-admin
   
   # Test doas configuration
   doas whoami  # Should return "root"
   
   # Create working directory in user's home
   mkdir -p ~/karios-setup
   cd ~/karios-setup
   
   # Download bootstrap script to user directory
   
   fetch --no-verify-peer --no-verify-hostname "placeholder link" -o bootstrap.sh

   # Set executable permissions
   chmod o+x bootstrap.sh


**Step 4: Security Verification and Execution**

.. code-block:: bash

   # Review script contents before execution
   less bootstrap.sh
   
   # Execute bootstrap with doas from user directory
   doas ./bootstrap.sh
   
   # Monitor execution logs
   tail -f /var/log/messages

**doas Security Benefits:**
- Smaller codebase reduces attack surface
- OpenBSD security model implementation
- Simpler configuration than sudo
- Native FreeBSD integration
- Comprehensive audit logging
- Script executed from user directory, not root filesystem

Method 3: Direct Root Execution (Use Only When Necessary)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. warning::
   **Security Warning**: This method should only be used when no other users are available or when explicitly required. It provides the least security and audit capability.

**When to Use Direct Root Execution:**
- Single-user systems during initial setup
- Emergency situations where sudo/doas are unavailable
- Automated deployment scripts (with proper safeguards)

**Step 1: Download and Prepare Bootstrap Script**

.. code-block:: bash

   # Ensure you are logged in as root
   whoami  # Should return "root"
   
   # Navigate to root directory
   cd /root/
   
   # Download bootstrap script from official source
   
   fetch --no-verify-peer --no-verify-hostname "placeholder link" -o bootstrap.sh

   # Set executable permissions
   chmod o+x bootstrap.sh

**Step 2: Final Security Verification**

.. code-block:: bash

   # Review script contents one more time
   less bootstrap.sh
   # or
   cat bootstrap.sh
   
   # Verify file integrity
   ls -la bootstrap.sh

**Step 3: Execute Bootstrap Script**

.. code-block:: bash

   # Execute bootstrap script directly
   ./bootstrap.sh
   
   # Monitor system logs during execution
   # Open another terminal and monitor:
   tail -f /var/log/messages

**Additional Security Measures for Root Execution:**
- Enable detailed logging before execution
- Document the execution for audit purposes
- Restrict root access after installation completion
- Implement additional monitoring during execution
- Script executed from root directory (/root/)

**Installation Security Checklist**

Implement this comprehensive security checklist during installation:

.. list-table:: 
   :header-rows: 1
   :widths: 30 70

   * - Security Check
     - Verification Steps
   * - **Script Source Verification**
     - Confirm bootstrap script URL is from official Karios sources
   * - **Network Security**
     - Ensure secure network connection during download and installation
   * - **Script Content Review**
     - Examine bootstrap script contents for expected commands and functionality
   * - **User Privilege Management**
     - Use appropriate privilege escalation (sudo/doas instead of direct root access)
   * - **System Backup**
     - Backup critical data before installation to prevent data loss

EULA Agreement and License Acceptance
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

During the bootstrap installation, you will be prompted to accept the End User License Agreement (EULA).

.. note::
   **What is EULA?** An End User License Agreement is a legal contract between the software provider and user that defines terms, conditions, limitations, and rights for software use. EULA acceptance is mandatory to proceed with Karios installation.

**EULA Acceptance Process:**

1. **Comprehensive Review**: Thoroughly read the license agreement terms displayed on screen
2. **Legal Compliance**: Ensure your organization's policies allow acceptance of the license terms
3. **Precise Acceptance**: When prompted for EULA agreement, type exactly ``yes`` (lowercase)
4. **Confirmation**: Press Enter to confirm your acceptance and proceed with installation

.. warning::
   **Critical Input Requirement**: The confirmation text must be exactly lowercase ``yes``. Any other format (Yes, YES, y, etc.) will terminate the script and prevent installation from continuing. This precision is required for legal compliance verification.

**Reinstallation Security Considerations**

If the system prompts about reinstallation during bootstrap execution:

.. warning::
   **Reinstallation Impact**: Reinstalling Karios will completely remove all existing configurations, virtual machines, storage pools, network settings, and user data. This action is irreversible without proper backups.

**Reinstallation Decision Process:**

- **Type "yes"** only if you specifically need to reinstall Karios and have verified all data is backed up
- **Press Enter to exit** if uncertain about reinstallation requirements or lack proper backups
- **Backup Verification**: Ensure comprehensive backups exist before proceeding with any reinstallation

.. tip::
   **Backup Recommendations**: Before any reinstallation, create complete backups of virtual machines, configuration files, storage pools, and user data. Test backup restoration procedures to ensure data recovery capability.

**Post-Bootstrap Security Validation**

After successful bootstrap completion, verify system security:

.. code-block:: bash

   # Verify bootstrap installation logs
   tail -f /tmp/bootstrap.log
   
   # Check system security status
   sudo service status
   
   # Verify network security configuration
   netstat -an | grep LISTEN

.. note::
   The bootstrap script automatically installs and configures all Karios components, security settings, and service dependencies after successful EULA acceptance and execution.

Post-Installation Configuration
-------------------------------

Accessing the Karios Interface
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Once installation is complete, access the Karios management interface:

1. **Web Browser**: Open a web browser on a computer connected to the same network
2. **Management URL**: Navigate to the Karios management interface URL (typically ``https://<server-ip>``)
3. **Login Credentials**: Use the administrative credentials created during installation
4. **Initial Setup Wizard**: Complete the guided setup process

Supported Web Browsers
~~~~~~~~~~~~~~~~~~~~~~~

To access the web-based user interface, we recommend using one of the following browsers:

- **Chrome**: A release from the current year
- **Safari**: A release from the current year


Post-Installation Security Hardening
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Implement these security measures immediately after installation:

.. list-table:: 
   :header-rows: 1
   :widths: 30 70

   * - Security Measure
     - Implementation Steps
   * - **Change Default Passwords**
     - Modify all default administrative credentials immediately after first login
   * - **Enable Comprehensive Logging**
     - Configure system, security, and audit logging for compliance and monitoring
   * - **Network Security Configuration**
     - Implement firewall rules, network segmentation, and access controls
   * - **Update Management**
     - Establish procedures for regular security updates and patch management
   * - **User Access Control**
     - Implement proper user permissions, role-based access, and authentication policies



Installation Troubleshooting
-----------------------------

Common Installation Issues
~~~~~~~~~~~~~~~~~~~~~~~~~~

If you encounter problems during installation:

**Hardware Compatibility**
   Verify that your hardware meets all requirements and is on the compatibility list.

**Installation Media**
   Ensure installation media is not corrupted by verifying checksums and creating fresh installation media if necessary.

**Network Configuration**
   Check network settings, connectivity, and DNS resolution during the bootstrap phase.

**Storage Issues**
   Verify storage hardware is properly connected, functional, and has sufficient capacity.

**Security-Related Issues**
   Review privilege escalation settings, user permissions, and script execution policies.

Getting Help
~~~~~~~~~~~~

If you need assistance with the installation process:

- **Documentation**: Refer to the comprehensive Karios documentation and security guides
- **Support Resources**: Access available support channels and community forums  
- **Log Files**: Review installation and security logs for detailed error information

**Common Log Locations**

.. code-block:: bash

   # Installation logs
   /var/log/karios-install.log
   
   # System logs
   /var/log/messages
   
   # Bootstrap logs
   /tmp/bootstrap.log
   
   # Security audit logs
   /var/log/auth.log
   
   # sudo/doas activity logs
   /var/log/secure

Next Steps
----------

After successful installation, proceed to:

- **User Guide**: Navigate to the user guide for further instructions on accessing the Karios GUI
- **Security Configuration**: Implement additional security hardening measures for production use
- **Management Configuration**: Review the management section for detailed setup procedures
- **Component Configuration**: Configure individual Karios components with appropriate security settings
- **Backup and Recovery**: Establish comprehensive backup and disaster recovery procedures

.. seealso::

   :doc:`basics`
       Learn Karios fundamentals and basic operations
   
   :doc:`initial-configuration`
       Complete the initial system configuration with security best practices
   
   :doc:`security-hardening`
       Implement advanced security measures for production deployments