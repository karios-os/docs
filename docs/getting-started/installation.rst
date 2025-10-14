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

.. important::
   **Always Use Latest FreeBSD Release**
   
   Karios requires the latest stable FreeBSD release for optimal security, performance, and hardware compatibility. Always download FreeBSD 14.3 or the most current stable release available.

**Download Steps:**

1. Navigate to the official FreeBSD download page: https://www.freebsd.org/where/
2. **Download FreeBSD 14.3** (or latest stable version)
3. Select the appropriate version based on your hardware architecture (typically x86_64)
4. **Recommended ISO**: Use `FreeBSD-14.3-RELEASE-amd64-disc1.iso` for complete offline installation
5. If unsure about architecture, consult with your system administrator

**Why Latest Release Matters:**

- **Security Updates**: Latest patches and vulnerability fixes
- **Hardware Support**: Improved driver support for newer hardware
- **Performance**: Optimized kernel and system components
- **Compatibility**: Best compatibility with Karios components
- **Long-term Support**: Extended maintenance and update lifecycle

**Verify Download Integrity**

.. code-block:: bash

   # On Linux/macOS, verify the FreeBSD 14.3 ISO checksum
   sha256sum FreeBSD-14.3-RELEASE-amd64-disc1.iso
   
   # On FreeBSD, use:
   sha256 FreeBSD-14.3-RELEASE-amd64-disc1.iso
   
   # On Windows (PowerShell), use:
   Get-FileHash FreeBSD-14.3-RELEASE-amd64-disc1.iso -Algorithm SHA256
   
   # Compare with the official checksum from FreeBSD download page:
   # https://www.freebsd.org/where/

.. important::
   **Official FreeBSD 14.3 Checksums**
   
   Always verify your downloaded ISO matches the official FreeBSD checksums:
   - Download the CHECKSUM.SHA256-FreeBSD-14.3-RELEASE-amd64 file
   - Compare the calculated hash with the official checksum
   - **Never proceed with installation if checksums don't match**

.. code-block:: bash

   # Automated verification on FreeBSD/Linux:
   fetch https://download.freebsd.org/releases/amd64/amd64/ISO-IMAGES/14.3/CHECKSUM.SHA256-FreeBSD-14.3-RELEASE-amd64
   sha256sum -c CHECKSUM.SHA256-FreeBSD-14.3-RELEASE-amd64 FreeBSD-14.3-RELEASE-amd64-disc1.iso

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

3. Click the "SELECT" button and browse to the downloaded FreeBSD 14.3 ISO file
4. Set partition scheme to "MBR" or "GPT" based on your system's BIOS/UEFI settings

.. tip::
   If unsure, try GPT first for newer systems.

5. Click "START" and confirm any warnings about data loss

**Etcher Instructions (Cross-Platform)**

1. Download and run Etcher
2. Click "Flash from file" and select the FreeBSD 14.3 ISO file
3. Select your USB drive as the target device
4. Click "Flash!"

**dd Command Instructions (Linux/macOS)**

.. code-block:: bash

   # Replace /dev/sdX with your USB drive identifier
   # Use 'lsblk' or 'fdisk -l' to identify the correct drive
   sudo dd if=FreeBSD-14.3-RELEASE-amd64-disc1.iso of=/dev/sdX bs=4M status=progress
   sudo sync

Installation Process
--------------------

**Complete Installation Overview**

For new users, here's the complete installation process from start to finish:

.. important::
   **Installation Summary Checklist**
   
   **Phase 1: Preparation**
   ✓ Download FreeBSD 14.3 ISO and verify checksum
   ✓ Create bootable USB drive
   ✓ Configure BIOS/UEFI settings (enable VT-x/AMD-V, IOMMU)
   
   **Phase 2: FreeBSD Installation**
   ✓ Boot from USB drive
   ✓ Select all components (base-dbg, kernel-dbg, lib32, ports, **src**)
   ✓ **CRITICAL**: Select "Auto (ZFS)" - NOT UFS
   ✓ Configure ZFS with proper swap size formula: (RAM × 1.5) + 2GB
   ✓ Enable ALL security hardening options
   ✓ Create user account and add to wheel group
   ✓ Verify ZFS after reboot: `zpool status`
   
   **Phase 3: Karios Bootstrap**
   ✓ Obtain bootstrap URL from Karios support
   ✓ Download and execute bootstrap script
   ✓ Accept EULA by typing exactly "yes"
   ✓ Access web interface after completion

.. _filesystem-requirements:

Critical Filesystem Requirements
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. important::
   **ZFS Filesystem Requirement**
   
   Karios requires ZFS to be installed and will not work on FreeBSD systems installed with UFS. Please ensure you select ZFS.

**Why ZFS is Required:**

- **Storage Management**: Karios storage pools depend on ZFS features
- **Snapshot Technology**: VM snapshots require ZFS snapshot capabilities  
- **Data Integrity**: ZFS checksumming is essential for data protection
- **Performance**: ZFS caching and compression optimize VM performance
- **Replication**: Backup and replication features require ZFS send/receive

.. warning::
   **Installation Failure Modes**
   
   Installing Karios on UFS will cause:
   - Storage pool creation failures
   - VM creation and management failures  
   - Backup and snapshot system failures
   - Complete system unusability requiring full reinstallation

Understanding ZFS RAID Levels and Configuration
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

**Critical Knowledge for Operators**

Before proceeding with installation, operators must understand ZFS RAID levels and their implications for system reliability, performance, and storage capacity.

.. important::
   **Hardware Requirements for ZFS RAID**
   
   For mirror and RAID configurations, disks **MUST** be:
   - **Same physical size** (exact same capacity in bytes)
   - **Same model and manufacturer** (identical part numbers recommended)
   - **Same interface type** (all SATA or all NVMe)
   - **Same performance characteristics** (RPM for spinning disks, similar specs for SSDs)

**ZFS Pool Types Explained:**

.. list-table:: ZFS RAID Configuration Guide
   :header-rows: 1
   :widths: 15 20 20 25 20

   * - RAID Type
     - Minimum Disks
     - Fault Tolerance
     - Storage Efficiency
     - Use Case
   * - **Stripe**
     - 1 disk
     - **None** - Single disk failure = total data loss
     - 100% of disk space
     - Testing, evaluation, single-disk systems
   * - **Mirror**
     - 2 identical disks
     - **1 disk failure** tolerated
     - 50% of total disk space
     - **Production recommended** - High reliability
   * - **RAIDZ1**
     - 3+ disks
     - **1 disk failure** tolerated
     - ~67-90% depending on disk count
     - General production use
   * - **RAIDZ2**
     - 4+ disks
     - **2 disk failures** tolerated
     - ~50-85% depending on disk count
     - **Mission-critical** systems
   * - **RAIDZ3**
     - 5+ disks
     - **3 disk failures** tolerated
     - ~40-80% depending on disk count
     - Ultra-high availability systems

**Stripe Configuration (Single Disk):**

.. warning::
   **No Redundancy - Data Loss Risk**
   
   Stripe configuration provides no protection against disk failure. Any disk failure results in complete data loss. Only use for testing or evaluation environments.

**Mirror Configuration (Recommended for Production):**

.. note::
   **Mirror Requirements for Optimal Performance**
   
   - **Identical disks required**: Use exact same model, capacity, and manufacturer
   - **Performance**: Reads are faster (load balanced), writes are slightly slower
   - **Capacity**: Only 50% of total disk space available
   - **Reliability**: System continues operating with one disk failure
   - **Recovery**: Failed disk can be replaced and automatically resilvered

**RAIDZ Configurations (Software RAID-5/6 equivalent):**

- **RAIDZ1**: Similar to RAID-5, requires minimum 3 disks, tolerates 1 failure
- **RAIDZ2**: Similar to RAID-6, requires minimum 4 disks, tolerates 2 failures  
- **RAIDZ3**: Advanced configuration, requires minimum 5 disks, tolerates 3 failures

**Disk Selection Best Practices:**

1. **Purchase identical disks in sets** - Same part number, same batch if possible
2. **Test disks before installation** - Run disk health checks
3. **Keep spare disk available** - For quick replacement in RAID configurations
4. **Document disk serial numbers** - For tracking and warranty purposes
5. **Avoid mixing disk types** - Don't mix SSDs with HDDs in same pool

ZFS Swap Calculation Formula
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

**Critical for ZFS Root Installations**

ZFS requires specific swap calculations for optimal performance and system stability.

.. important::
   **ZFS Swap Calculation Formula**
   
   **Recommended Swap Size = 1.5 × RAM + 2GB**
   
   **Examples:**
   - 16GB RAM: (16 × 1.5) + 2 = **26GB swap**
   - 32GB RAM: (32 × 1.5) + 2 = **50GB swap**  
   - 64GB RAM: (64 × 1.5) + 2 = **98GB swap**
   - 128GB RAM: (128 × 1.5) + 2 = **194GB swap**

**Why This Formula:**

- **ZFS ARC Cache**: ZFS uses large amounts of RAM for caching
- **System Stability**: Prevents memory pressure during heavy VM loads  
- **Crash Dumps**: Ensures sufficient space for kernel crash dumps
- **VM Overcommit**: Allows for memory overcommitment in virtualization
- **Performance**: Reduces disk I/O during memory pressure

**Swap Configuration Notes:**

- **Mirror Swap**: In mirrored configurations, swap should also be mirrored
- **Performance Impact**: Insufficient swap can cause system instability
- **Monitoring**: Monitor swap usage in production environments

FreeBSD Installation with ZFS
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

**Step-by-Step ZFS Installation Process**

Follow these specific steps during the FreeBSD installation phase to ensure ZFS is properly configured:

**Phase 1: FreeBSD Base Installation with ZFS**

1. **Boot from USB Drive**
   - Insert the USB drive and boot from it
   - Select "Install" from the FreeBSD installer menu

.. figure:: _static/images/freebsd-installation/welcome-menu.png
   :width: 600
   :alt: FreeBSD installer welcome menu

2. **Installer Welcome Screen**
   - Press Enter to continue with installation

3. **Keymap Selection**
   - Select appropriate keymap for your region
   - Press Enter to continue

4. **Hostname Configuration**
   - Enter your desired hostname (e.g., "karios-node01")
   - Press Enter to continue

.. figure:: _static/images/freebsd-installation/hostname-configuration.png
   :width: 600
   :alt: FreeBSD hostname configuration screen

5. **Distribution Selection**
   - **CRITICAL**: Ensure "base-dbg", "kernel-dbg", "lib32", "ports", and **"src"** are selected
   - **MANDATORY**: Always install the source tree ("src") for Karios compatibility
   - Use spacebar to select/deselect components
   - Press Enter to continue

.. figure:: _static/images/freebsd-installation/component-selection.png
   :width: 600
   :alt: FreeBSD component selection screen

**Required Components Explained:**

.. list-table:: FreeBSD Component Requirements
   :header-rows: 1
   :widths: 20 80

   * - Component
     - Purpose and Requirement
   * - **base-dbg**
     - **Required** - Debug symbols for base system troubleshooting
   * - **kernel-dbg**  
     - **Required** - Kernel debug symbols for system analysis
   * - **lib32**
     - **Required** - 32-bit compatibility libraries for legacy applications
   * - **ports**
     - **Required** - FreeBSD Ports Collection for software installation
   * - **src**
     - **MANDATORY** - Complete FreeBSD source code required for Karios operation

.. important::
   **Source Tree Requirement**
   
   The FreeBSD source tree ("src") is **mandatory** for Karios installations. This provides:
   - Kernel module compilation capabilities
   - Device driver building support  
   - System customization options
   - Karios component integration
   - Security update compilation

6. **MANDATORY: Partitioning and ZFS Setup**

.. danger::
   **STOP: Critical Filesystem Selection**
   
   This is the most critical step. Selecting the wrong option will brick your Karios installation.

**Partitioning Menu Options:**

.. figure:: _static/images/freebsd-installation/partitioning-choices.png
   :width: 600
   :alt: FreeBSD partitioning choices menu showing Auto (ZFS) option

.. code-block:: text

   Partitioning
   
   How would you like to partition your disk?
   
   [ ] Auto (UFS)         ← DO NOT SELECT THIS
   [X] Auto (ZFS)         ← SELECT THIS OPTION
   [ ] Manual
   [ ] Shell

**ZFS Configuration Steps:**

a. **Select "Auto (ZFS)"** - This is mandatory for Karios

b. **ZFS Configuration Menu:**

.. figure:: _static/images/freebsd-installation/zfs-configuration-menu.png
   :width: 600
   :alt: ZFS configuration menu with pool settings

   ZFS Configuration Menu

.. code-block:: text

   ZFS Configuration
   
   T Pool Type/Disks:    stripe: 1 disk
   - Rescan Devices
   - Disk Info  
   - Pool Name          zroot
   - Force 4K Sectors?  YES
   - Encrypt Disks?     NO (recommended for first installation)
   - Partition Scheme   GPT (UEFI)
   - Swap Size          [CALCULATE USING FORMULA]
   - Mirror Swap?       NO
   - Encrypt Swap?      NO

**Swap Size Configuration:**

.. important::
   **Use ZFS Swap Formula**
   
   **Calculate: (RAM in GB × 1.5) + 2GB**
   
   **Examples for common configurations:**
   - 16GB RAM → **26GB** swap (enter: 26g)
   - 32GB RAM → **50GB** swap (enter: 50g)
   - 64GB RAM → **98GB** swap (enter: 98g)
   - 128GB RAM → **194GB** swap (enter: 194g)

.. warning::
   **Critical Swap Sizing**
   
   Incorrect swap sizing can cause:
   - System instability under load
   - VM creation failures
   - Memory allocation errors
   - Poor ZFS performance

c. **Pool Type Selection** (choose based on your hardware):

.. figure:: _static/images/freebsd-installation/zfs-pool-type.png
   :width: 600
   :alt: ZFS pool type selection menu

   ZFS Pool Type Selection Menu

.. list-table:: 
   :header-rows: 1
   :widths: 25 75

   * - Configuration
     - When to Use
   * - **stripe: 1 disk**
     - Single disk installation (testing/evaluation)
   * - **mirror: 2 disks**  
     - Two identical disks (recommended for production)
   * - **raidz1: 3+ disks**
     - Three or more disks with single parity
   * - **raidz2: 4+ disks**
     - Four or more disks with double parity (high availability)

d. **Disk Selection:**
   - Use spacebar to select your target disk(s)
   - Verify correct disks are selected
   - **WARNING**: All data on selected disks will be destroyed

.. figure:: _static/images/freebsd-installation/zfs-disk-selection.png
   :width: 600
   :alt: ZFS disk selection screen

e. **Final ZFS Configuration:**
   - Review all settings carefully
   - Ensure "Pool Name" is set to "zroot"
   - Press Enter to proceed

f. **Confirmation:**
   - **LAST CHANCE**: Verify ZFS configuration is correct
   - Type "YES" to proceed with disk formatting
   - Installation will begin

.. figure:: _static/images/freebsd-installation/zfs-final-warning.png
   :width: 600
   :alt: ZFS final warning before installation begins

7. **Continue Standard Installation**
   - Set root password
   - Configure network interfaces  
   - Select time zone
   - Enable system services (sshd recommended)
   - Add users if desired
   - Apply configuration and exit installer

8. **Reboot Verification**
   - Remove USB drive when prompted
   - Allow system to reboot
   - Verify ZFS boot by checking: `zpool status`

**ZFS Verification Commands**

After FreeBSD installation completes, verify ZFS is properly configured:

.. code-block:: bash

   # Verify ZFS pool exists and is healthy
   zpool status
   
   # Should show output similar to:
   #   pool: zroot
   #   state: ONLINE
   
   # Verify ZFS filesystems
   zfs list
   
   # Should show zroot filesystem tree
   
   # Verify ZFS is mounted as root
   df -h /
   
   # Should show /dev/zvol/zroot/... as root filesystem

**Common ZFS Installation Issues**

.. list-table:: 
   :header-rows: 1
   :widths: 30 70

   * - Issue
     - Solution
   * - **"Auto (UFS)" was selected**
     - Restart installation from beginning, select "Auto (ZFS)"
   * - **ZFS pool won't create**
     - Verify disk has no existing partitions, use "Shell" to wipe disk with `gpart destroy -F ada0`
   * - **Boot failure after installation**
     - Verify UEFI boot mode is enabled in BIOS, check for GPT partition scheme
   * - **"zpool status" shows errors**
     - Restart installation, verify disk health before proceeding

Kickstart Installation Steps
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The Karios installation follows a two-phase process:

**Phase 1: FreeBSD Base Installation with ZFS** ✓ Completed Above

**Phase 2: Karios Bootstrap**

.. important::
   **Prerequisites Verification**
   
   Before proceeding with bootstrap, verify ZFS is properly installed:

.. code-block:: bash

   # MANDATORY: Verify ZFS before bootstrap
   zpool status zroot
   # Must show: state: ONLINE
   
   # Verify ZFS root filesystem  
   df -h / | grep zfs
   # Must show ZFS filesystem mounted as root

If either command fails or doesn't show ZFS, **DO NOT PROCEED** with bootstrap installation. You must reinstall FreeBSD with ZFS.

After FreeBSD installation is complete and ZFS is verified, execute the bootstrap commands:

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

.. important::
   **Bootstrap Access Required**
   
   Before proceeding with this section, you **must** have:
   - Completed FreeBSD installation with ZFS
   - Obtained your unique bootstrap download URL from Karios
   - Verified ZFS is working: `zpool status` shows "ONLINE"

**How to Obtain Bootstrap URL**

If you don't have your bootstrap download link:

1. **Contact Karios Support**: Email support@karios.ai 
2. **Sales Representative**: Contact your assigned Karios sales representative  
3. **Customer Portal**: Check your customer portal for download links
4. **Phone Support**: Call the support number provided in your welcome email



**Bootstrap Download and Common Preparation**

.. note::
   **Bootstrap Download Link**: Contact your Karios sales representative or support team to obtain the official bootstrap download URL. Each customer receives a unique, secure download link for their specific deployment.

**Execution Method Selection**

Choose one of the following methods based on your security requirements and system configuration:

Method 1: Using sudo (Recommended - Highest Security)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. tip::
   **Best Practice**: This is the recommended approach for production environments as it provides the highest level of security and audit capabilities.

**Prerequisites:**
- Non-root user account must exist
- User must have sudo privileges configured

**Steps:**
**Bootstrap Link Access**: Replace "placeholder link" with the actual bootstrap download URL provided by your Karios sales team. Each customer receives a unique, time-limited download link for security purposes.
.. code-block:: bash

   # Install sudo if not present
   pkg install sudo

   # Download bootstrap script to user directory
   fetch --no-verify-peer --no-verify-hostname "YOUR_PROVIDED_BOOTSTRAP_URL" -o bootstrap.sh
   chmod +x bootstrap.sh

   # Verify sudo access and review script
   sudo whoami  # Should return "root"
   less bootstrap.sh

   # Execute bootstrap with sudo
   sudo ./bootstrap.sh

**sudo Security Benefits:**
- Time-limited privilege escalation (default 5-minute timeout)
- User accountability and traceability  
- Granular permission control
- Script executed from user directory, not root filesystem


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

**Critical FreeBSD Installation Security Settings**

.. important::
   **Security Hardening During Installation**
   
   During the FreeBSD installation process (before bootstrap), you will encounter security hardening options. **SELECT ALL SECURITY OPTIONS** for production Karios deployments:

**Required Security Hardening Options:**

.. list-table:: Security Options to Enable
   :header-rows: 1
   :widths: 30 70

   * - Security Option
     - Purpose and Requirement
   * - **hide_uids**
     - **Enable** - Hide processes from other users for better security
   * - **hide_gids**
     - **Enable** - Hide group processes for enhanced privacy
   * - **hide_jail**
     - **Enable** - Hide jail processes for container security
   * - **read_msgbuf**
     - **Enable** - Disable kernel message buffer access for unprivileged users
   * - **proc_debug**
     - **Enable** - Disable process debugging for non-privileged users
   * - **random_pid**
     - **Enable** - Randomize process IDs for security
   * - **clear_tmp**
     - **Enable** - Clean /tmp directory on system startup
   * - **disable_syslogd**
     - **Enable** - Secure syslogd network socket configuration
   * - **disable_sendmail**
     - **Enable** - Disable sendmail service (not needed for Karios)
   * - **secure_console**
     - **Enable** - Require root password for single-user mode
   * - **disable_ddtrace**
     - **Enable** - Disable destructive DTrace operations
   * - **enable_aslr**
     - **Enable** - Enable Address Space Layout Randomization

.. warning::
   **Security Requirement**
   
   For production Karios deployments, **ALL** security hardening options must be enabled during FreeBSD installation. This provides essential security baseline required for hypervisor environments.

**User Account Creation Requirements**

.. important::
   **Administrative User Configuration**
   
   During FreeBSD installation, when prompted to create user accounts, **ALL** users must be added to the `wheel` group for proper administrative access in Karios environments.

**User Creation Best Practices:**

.. list-table:: User Account Requirements
   :header-rows: 1
   :widths: 30 70

   * - Setting
     - Required Configuration
   * - **Username**
     - Use descriptive, unique usernames (e.g., admin, karios-admin)
   * - **Full Name**
     - Complete administrator name for accountability
   * - **Login Group**
     - Leave blank (default user group will be created)
   * - **Additional Groups**
     - **MANDATORY**: Enter `wheel` for administrative privileges
   * - **Shell**
     - Recommend: `/bin/sh` or `/bin/tcsh` for reliability
   * - **Password**
     - Strong password required (complex, minimum 12 characters)
   * - **Account Status**
     - Do NOT lock account after creation

.. warning::
   **Wheel Group Requirement**
   
   Users **must** be added to the `wheel` group during installation. This provides:
   - `sudo` access capabilities
   - Administrative command execution
   - System configuration privileges
   - Karios management interface access
   
   **Without wheel group membership, users cannot perform administrative tasks required for Karios operation.**

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

**Installation Success Verification**

After bootstrap completion, verify your Karios installation:

.. code-block:: bash

   # Verify all Karios services are running
   service karios_core status
   service karios_license status
   service karios_rms status
   service karios_rms_client status
   service kshield status
   
   # Check if all Karios services are listening on their ports
   sockstat -l | grep karios
   # Should show:
   # karios_core on port 8080 (main web interface)
   # karios_license on port 8069 (licensing service)
   # karios_rms on port 9094 (RMS management)
   # karios_rms_client on port 9096 (RMS client)
   
   # Check security shield service
   sockstat -l | grep kshield
   # Should show kshield on port 9592
   
   # Verify ZFS pools are healthy
   zpool status
   
   # Check system logs for any errors
   tail -n 50 /var/log/messages

**Expected Results:**
- All Karios services should show "running" status
- Ports 8080, 8069, 9094, 9096, and 9592 should be listening
- ZFS pool should show "ONLINE" status  
- No critical errors in system logs

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

**Immediate Post-Installation Tasks**

After successful installation, complete these essential tasks in order:

1. **Access Web Interface**
   - Open browser and navigate to: `https://YOUR_SERVER_IP`
   - Accept SSL certificate warning (self-signed)
   - Login with credentials created during FreeBSD installation

2. **Complete Initial Setup**
   - Follow the Karios setup wizard
   - Configure network settings
   - Set up storage pools
   - Create initial virtual machine

3. **Documentation Review**
   - **User Guide**: Navigate to the user guide for detailed Karios operation
   - **Management Configuration**: Review network and storage configuration options
   - **Security Configuration**: Implement additional security measures for production

4. **System Validation**
   - Create a test virtual machine
   - Verify network connectivity  
   - Test snapshot functionality
   - Validate backup procedures

**If Installation Failed**

Common failure recovery steps:

.. list-table:: 
   :header-rows: 1
   :widths: 30 70

   * - Problem
     - Solution
   * - **UFS was installed instead of ZFS**
     - **Complete reinstall required** - Boot from USB, start over with ZFS
   * - **Bootstrap script fails**
     - Check internet connectivity, verify bootstrap URL, check logs in /tmp/bootstrap.log
   * - **Web interface not accessible**
     - Verify services with `sockstat -l | grep karios`, check firewall settings
   * - **ZFS errors after installation**
     - Run `zpool scrub zroot`, check disk health, verify BIOS settings

**Getting Additional Help**

- **Documentation**: https://docs.karios.ai/
- **Support Portal**: Contact information provided in your welcome package
- **Community Forums**: Access through your customer portal
- **Emergency Support**: Phone numbers provided with your license

   