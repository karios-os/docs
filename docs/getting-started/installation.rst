Installation
============

.. meta::
   :description: Complete installation guide for Karios hyper-converged infrastructure platform
   :keywords: Karios, installation, setup, FreeBSD, HCI, hypervisor

Overview
--------

Karios is built on the robust FreeBSD operating system, providing a complete hyper-converged infrastructure solution. The Karios installer contains all necessary packages and components pre-configured for optimal performance and security.


.. _system-requirements:

System Requirements
-------------------

Security Considerations
~~~~~~~~~~~~~~~~~~~~~~~

Mitigating Spectre & Meltdown Vulnerabilities
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. important::
   **Tech Tip: Mitigating Spectre & Meltdown Vulnerabilities**
   
   Spectre and Meltdown are hardware vulnerabilities that affect many processors. While mitigations have been implemented in software (kernel patches), they often come with a performance penalty. Newer CPUs generally offer better performance with the mitigations enabled, as they incorporate architectural improvements to reduce the impact.

.. note::
   For more information related to Spectre and Meltdown, please refer to https://meltdownattack.com/


Processor Recommendations
~~~~~~~~~~~~~~~~~~~~~~~~~

**Recommendation:** Avoid older Intel processors (pre-8th generation Core series and pre-Xeon Scalable 1st Generation) and AMD processors (pre-Zen/Zen+ architecture). While software patches can address these vulnerabilities, performance degradation is often significant on older hardware. If you must use an older processor, ensure that the latest microcode updates are installed and thoroughly test the impact on your workloads.

**Processors to Avoid:**

- Intel processors: pre-8th generation Core series
- Intel Xeon: pre-Scalable 1st Generation
- AMD processors: pre-Zen/Zen+ architecture

**If Using Older Processors:**

- Ensure latest microcode updates are installed
- Thoroughly test the impact on your workloads
- Consider performance degradation in capacity planning

Production Hardware Recommendations
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. important::
   We strongly recommend using high-quality server hardware when deploying Karios in production environments. Enterprise-grade hardware ensures reliability, performance, and long-term support for your critical infrastructure.

Minimum Requirements
^^^^^^^^^^^^^^^^^^^^

.. warning::
   These minimum requirements are intended for **evaluation and testing purposes only**. Do not use these specifications for production deployments.


.. list-table:: 
   :header-rows: 1
   :widths: 20 80

   * - Component
     - Specification
   * - **CPU**
     - Intel Core i5 or AMD Ryzen 5 series (6 cores / 12 threads minimum) with VT-x/AMD-V enabled. Clock speed: 3.0 GHz+
   * - **RAM**
     - 16 GB DDR4 2666 MHz. This is the absolute floor. You'll be very limited in VM sizes and concurrency
   * - **Storage**
     - 256GB NVMe SSD (for FreeBSD + VMs). Consider a second, smaller SSD for boot/root filesystem to isolate it from potential VM disk issues
   * - **Network Card**
     - Gigabit Ethernet
   * - **Notes**
     - This is barely sufficient for basic testing and experimentation. Performance will be constrained, and you'll need to carefully manage resources. Not suitable for anything approaching a mission-critical workload

Recommended Configuration
^^^^^^^^^^^^^^^^^^^^^^^^^

.. note::
   Quality Test Environment Essential - Use reliable hardware to ensure accurate testing results and valid performance assessments

.. list-table:: 
   :header-rows: 1
   :widths: 20 80

   * - Component
     - Specification
   * - **CPU**
     - Intel Core i7 or AMD Ryzen 7 series (8 cores / 16 threads minimum). Clock speed: 3.5 GHz+
   * - **RAM**
     - 32 GB DDR4 3200 MHz or faster. This provides more breathing room for VMs and the host OS
   * - **Storage**
     - 512GB - 1TB NVMe SSD (or a RAID-Z1/RAID-Z2 array of two NVMe drives) for data storage. A separate 128GB boot drive is highly recommended. Crucially, use ZFS
   * - **Network Card**
     - Dual Gigabit Ethernet ports configured in LACP (Link Aggregation Control Protocol) for increased bandwidth and redundancy
   * - **Notes**
     - This configuration allows you to run a reasonable number of VMs with acceptable performance. RAID-Z1/RAID-Z2 provides data protection against single drive failure. LACP adds network redundancy. Still, mission-critical workloads require more robust solutions

Ideal Configuration
^^^^^^^^^^^^^^^^^^^

.. important::
   Mission Critical - High Availability & Performance

.. list-table:: 
   :header-rows: 1
   :widths: 20 80

   * - Component
     - Specification
   * - **CPU**
     - Intel Xeon or AMD EPYC series (16+ cores / 32+ threads). Clock speed: 4.0 GHz+. Consider a dual-socket configuration for increased processing power and redundancy
   * - **RAM**
     - 64 GB DDR4/DDR5 3200 MHz or faster ECC Registered RAM. ECC (Error Correcting Code) is essential for data integrity in mission-critical environments. Registered RAM provides better stability with higher capacities
   * - **Storage**
     - 1TB - 2TB NVMe SSDs configured in a RAID-Z2/RAID-Z3 array. Consider using enterprise-grade drives designed for continuous operation. A separate boot drive with ZFS is highly recommended
   * - **Network Card**
     - Dual or Quad 10 Gigabit Ethernet ports configured in LACP with redundant switches
   * - **Power Supply**
     - Redundant power supplies (RPS) to ensure continuous operation even if one PSU fails
   * - **Hardware Watchdog**
     - Implement a hardware watchdog timer to automatically reboot the system in case of software hangs or crashes


Pre-Installation Planning
-------------------------

.. important::
   **MANDATORY REQUIREMENT**: Internet connectivity is required during installation.


Understanding Virtualization Constraints
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Critical Platform Dependencies
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. warning::
   **Hardware Dependency Requirements**
   Understanding these constraints is essential for successful Karios deployment and optimal virtualization performance.

Bhyve Hardware Dependencies
~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. important::
   **Bhyve is Hardware Dependent**
   Unlike some other virtualization solutions, Bhyve relies heavily on hardware features like Intel VT-x or AMD-V for efficient operation. Without these hardware features, performance will be abysmal and effectively unusable.

**Required Hardware Features:**

- **Intel VT-x**: Essential for Intel-based systems
- **AMD-V**: Required for AMD-based systems
- **Hardware Virtualization Support**: Must be enabled in BIOS/UEFI
- **Performance Impact**: Missing hardware support renders virtualization unusable

Resource Planning Considerations
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. note::
   **Host System Resources are Shared**
   The host system (Karios) needs sufficient resources to function alongside the virtual machines (VMs) you create. When planning your deployment, ensure you calculate virtual machine overhead in addition to VM resource requirements.

**Resource Planning Guidelines:**

- Reserve adequate CPU cores for the host system
- Allocate sufficient RAM for host operations
- Account for storage I/O overhead
- Plan network bandwidth for host management traffic
- Consider hypervisor overhead in total resource calculations

Nested Virtualization Limitations
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. warning::
   **Production Deployment Restrictions**
   While technically possible, nested virtualization (running Bhyve inside another hypervisor like VMware or VirtualBox) is generally not recommended for production use due to significant performance overhead.

**Nested Virtualization Constraints:**

- **Performance Overhead**: Substantial performance degradation
- **Not Production Ready**: Unsuitable for mission-critical workloads
- **Testing Only**: Acceptable for development and testing scenarios
- **Hardware Requirements**: These specifications assume direct hardware installation

**Deployment Recommendations:**

.. list-table:: 
   :header-rows: 1
   :widths: 30 35 35

   * - Scenario
     - Recommendation
     - Use Case
   * - **Direct Hardware Installation**
     - **Recommended** - Optimal performance
     - Production, mission-critical workloads
   * - **Nested Virtualization**
     - **Not Recommended** - Performance penalty
     - Development, testing, lab environments only
   * - **Cloud Infrastructure**
     - **Evaluate carefully** - Provider dependent
     - Ensure hypervisor or optimized virtualization

Planning Considerations
~~~~~~~~~~~~~~~~~~~~~~~

**Before Deployment:**

1. **Verify Hardware Compatibility**
   - Confirm VT-x/AMD-V support
   - Check BIOS/UEFI settings
   - Validate hardware feature availability

2. **Calculate Resource Requirements**
   - Host system overhead
   - Virtual machine resource needs
   - Network and storage I/O requirements
   - Management interface resources

3. **Avoid Nested Scenarios**
   - Plan for direct hardware installation
   - Consider performance implications
   - Evaluate alternative solutions for testing environments

Preparing Your Hardware and Software
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Before you begin installing Karios, careful preparation is crucial for a smooth and successful deployment. This section outlines the necessary hardware checks, software downloads, and USB drive creation process.

Hardware Requirements Verification
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. note::
   For detailed hardware requirements, refer to the :ref:`system-requirements` section.

**Hardware Compatibility**

While Karios supports a wide range of hardware, we maintain a list of tested and validated configurations. Consult the hardware compatibility documentation before proceeding if you have specific concerns about hardware compatibility.

BIOS/UEFI Settings
^^^^^^^^^^^^^^^^^^

**Essential BIOS Settings for Bhyve with Advanced Features**

.. important::
   **GPU Pass-through and Advanced Virtualization Configuration**
   The following BIOS/UEFI settings are essential for optimal bhyve performance with advanced features such as GPU pass-through.

**Required Settings**

.. list-table:: 
   :header-rows: 1
   :widths: 30 70

   * - Setting
     - Configuration
   * - **Virtualization Technology (VT-x/AMD-V)**
     - **Enable** - Crucial for virtualization functionality
   * - **IOMMU (VT-d/AMD-Vi)**
     - **Enable** - Required for direct device assignment and GPU pass-through
   * - **Above 4G Decoding**
     - **Enable** - Necessary for larger memory addressing capabilities
   * - **SR-IOV**
     - **Enable** (Optional) - Improves performance when supported by hardware
   * - **Resizable BAR**
     - **Enable** (Optional) - Provides potential performance boost with compatible hardware
   * - **CSM (Compatibility Support Module)**
     - **Consider Disabling** - Try disabling for UEFI boot mode (proceed with caution)
   * - **Secure Boot**
     - **Consider Disabling** - May interfere with bhyve operation; disable if needed

Critical Configuration Notes
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. warning::
   Incorrect BIOS/UEFI settings can prevent the system from booting. Always proceed with extreme caution when modifying these settings.

**Essential Preparation Steps:**

1. **Consult Motherboard Manual**
   - BIOS settings vary significantly by manufacturer and model
   - Refer to specific documentation for your hardware

2. **Update BIOS/UEFI Firmware**
   - Install latest BIOS version for improved compatibility
   - Recent updates often include bug fixes and enhanced virtualization support

3. **Research IOMMU Grouping**
   - Verify proper GPU isolation capabilities
   - Ensure IOMMU groups support your intended device pass-through configuration
   - Test IOMMU grouping before deployment

**Best Practices**

**Pre-Configuration Checklist:**

- Document current BIOS settings before making changes
- Update BIOS/UEFI to latest stable version
- Verify hardware compatibility with intended virtualization features
- Research motherboard-specific IOMMU limitations
- Plan rollback procedures in case of boot issues

**Post-Configuration Validation:**

- Verify successful boot after each setting change
- Test virtualization functionality incrementally
- Validate IOMMU device grouping
- Confirm GPU pass-through capabilities if required

Downloading the Karios ISO Image (Roadmap Ahead)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

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


**Post-Installation Prerequisites**

After completing the FreeBSD operating system installation, perform the following essential configuration steps before proceeding with Karios deployment.

1. Update the FreeBSD base system to ensure you have the latest security patches and system components::

       freebsd-update fetch
       freebsd-update install

2. Install the sudo package for administrative privilege management::

       pkg install sudo


3. Configure and enable the Packet Filter (PF) firewall system:

        a. **Load the PF kernel module**::

               kldload pf

        b. **Enable PF operation**::

               pfctl -e

        c. **Verify PF status**::

              pfctl -s info

.. note::
   These PF commands need to be executed with root privileges. The PF firewall is essential for network security and will be managed through the Karios interface after installation.

.. warning::
   Ensure you have console or physical access to the system before enabling PF, as improper firewall configuration can lock you out of remote access.

**Phase 2: Karios Bootstrap**

After FreeBSD installation is complete and the node is up, execute the following commands:

.. tip::
   **What is Bootstrap?** A bootstrap script is an automated installer that downloads and configures all necessary software components. It eliminates manual setup by handling package installation, configuration, and service initialization automatically.


**Understanding Privilege Escalation Security**

.. tip::
   **Why Privilege Escalation Matters**
   
   Running commands as root (superuser) provides unlimited system access, which creates significant security risks. Privilege escalation tools like sudo and doas allow users to execute specific commands with elevated privileges while maintaining security controls and accountability.

**Sudo: Industry Standard Privilege Escalation**

**Sudo (Superuser Do)** is the most widely used privilege escalation tool across Unix and Linux systems, providing comprehensive security features:

**Core Security Features:**

- **Audit Trails and Logging**: Every sudo command is logged with timestamps, user information, command executed, and working directory.

- **Time-Limited Sessions**: Sudo sessions expire automatically (default 5 minutes), requiring re-authentication for continued access. This minimizes the window of exposure if a session is compromised.

- **User Accountability**: Commands are always traced to specific user accounts, enabling forensic analysis and compliance reporting. Unlike direct root access, you always know who executed what command and when.

- **Granular Permission Control**: Administrators can precisely control which users can execute which commands, on which hosts, and under what conditions. This supports the principle of least privilege.

- **Environment Management**: Sudo can sanitize environment variables, preventing privilege escalation through environment manipulation attacks.

- **Plugin Architecture**: Supports plugins for advanced authentication (LDAP, Kerberos), logging, and policy enforcement.


**Security Recommendations:**

- **Use sudo for**: Complex environments requiring granular control, extensive logging, or plugin support
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

   # Ensure you have sudo installed
   pkg install sudo

   # Ensure you have sudo privileges
   sudo whoami  # Should return "root"

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
   

**sudo Security Benefits:**
- Time-limited privilege escalation (default 5-minute timeout)
- User accountability and traceability
- Granular permission control
- Script executed from user directory, not root filesystem

Method 2: Direct Root Execution (Use Only When Necessary)
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


**Post-Bootstrap Security Validation**

After successful bootstrap completion, verify system security:

.. figure:: _static/images/installation/installation1.png
   :width: 600
   :alt: Bootstrap installation initiated  

.. figure:: _static/images/installation/installation2.png
   :width: 600
   :alt: Bootstrap installation started

.. figure:: _static/images/installation/installation3.png
   :width: 600
   :alt: Bootstrap installation in progress    

.. figure:: _static/images/installation/installation5.png
   :width: 600
   :alt: Bootstrap installation completed

.. code-block:: bash

   # Verify bootstrap installation logs
   tail -f /tmp/bootstrap.log
   
   # Check system security status
   sudo service status
   
   # Verify network security configuration
   netstat -an | grep LISTEN

.. note::
   The bootstrap script automatically installs and configures all Karios components, security settings, and service dependencies after successful EULA acceptance and execution.


**Reinstallation Security Considerations**

If the system prompts about reinstallation during bootstrap execution:

.. warning::
   **Reinstallation Impact**: Reinstalling Karios will completely remove all existing configurations, virtual machines, storage pools, network settings, and user data. This action is irreversible without proper backups.

**Reinstallation Decision Process:**

.. figure:: _static/images/installation/bootstrap.png
   :width: 600
   :alt: Bootstrap Execution Screen

- **Type "yes"** only if you specifically need to reinstall Karios and have verified all data is backed up
- **Press Enter to exit** if uncertain about reinstallation requirements or lack proper backups
- **Backup Verification**: Ensure comprehensive backups exist before proceeding with any reinstallation

.. tip::
   **Backup Recommendations**: Before any reinstallation, create complete backups of virtual machines, configuration files, storage pools, and user data. Test backup restoration procedures to ensure data recovery capability.


Post-Installation Configuration
-------------------------------

Accessing the Karios Interface
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Once installation is complete, access the Karios management interface:

.. figure:: _static/images/installation/installation4.png
   :width: 600
   :alt: Bootstrap installation completed

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

.. note::
   For detailed post-installation security hardening steps, refer to the Karios User Guide:
   https://docs.karios.ai/user-guide/index.html
   

Installation Troubleshooting
-----------------------------

.. note::
   For troubleshooting common installation issues, refer to the Appendices section of the Karios Documentation:
   https://docs.karios.ai/appendices/index.html

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

   