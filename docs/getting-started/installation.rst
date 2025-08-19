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

- **CPU**: 64-bit processor
- **Virtualization Support**: Intel VT-x or AMD-V capable CPU and motherboard for hardware-assisted virtualization
- **RAM**: 32 GB system RAM minimum, plus additional RAM allocation for virtual machines and guests
- **Storage**: Hard drive with sufficient capacity for the operating system and guest storage
- **Network**: One network interface card (NIC) minimum

Recommended Production Requirements
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. list-table:: Production Hardware Specifications
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

**Phase 2: Karios Bootstrap**

After FreeBSD installation is complete and the node is up, execute the following commands:

.. code-block:: bash

   cd /root/
   fetch --no-verify-peer --no-verify-hostname -o /root/bootstrap.sh \
     https://install.karios.ai/bootstrap.sh
   chmod +x bootstrap.sh
   ./bootstrap.sh

.. note::
   The bootstrap script will automatically install and configure all Karios components.

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
- **Mobile Access**: When accessed from a mobile device, Karios automatically displays a lightweight, touch-optimized interface

System Validation
~~~~~~~~~~~~~~~~~~

Verify that your Karios installation is functioning correctly:

.. list-table:: Validation Checklist
   :header-rows: 1
   :widths: 30 70

   * - Check
     - Description
   * - **Service Status**
     - Verify that all essential services are running
   * - **Hardware Recognition**
     - Confirm that all hardware components are detected
   * - **Network Connectivity**
     - Test network connectivity and performance
   * - **Storage Availability**
     - Verify storage pools and volumes are accessible

Installation Troubleshooting
-----------------------------

Common Installation Issues
~~~~~~~~~~~~~~~~~~~~~~~~~~

If you encounter problems during installation:

**Hardware Compatibility**
   Verify that your hardware meets all requirements and is on the compatibility list.

**Installation Media**
   Ensure installation media is not corrupted by verifying checksums.

**Network Configuration**
   Check network settings and connectivity during the bootstrap phase.

**Storage Issues**
   Verify storage hardware is properly connected and functional.

Getting Help
~~~~~~~~~~~~

If you need assistance with the installation process:

- **Documentation**: Refer to the comprehensive Karios documentation
- **Support Resources**: Access available support channels and community forums  
- **Log Files**: Review installation logs for detailed error information
- **Professional Support**: Contact professional support services if available

**Common Log Locations**

.. code-block:: bash

   # Installation logs
   /var/log/karios-install.log
   
   # System logs
   /var/log/messages
   
   # Bootstrap logs
   /tmp/bootstrap.log

Next Steps
----------

After successful installation, proceed to:

- **Configuration**: Review the management section for detailed setup procedures
- **User Guide**: Familiarize yourself with user operations and interface
- **Component Configuration**: Configure individual Karios components as needed
- **Security Hardening**: Implement additional security measures for production use

.. seealso::

   :doc:`basics`
       Learn Karios fundamentals and basic operations
   
   :doc:`initial-configuration`
       Complete the initial system configuration
