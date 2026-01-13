Introduction
============

.. meta::
   :description: Introduction to Karios, the software-defined foundation for modern IT infrastructure
   :keywords: Karios, HCI, hyper-converged, virtualization, ZFS

.. toctree::
   :maxdepth: 2
   :hidden:

   installation
   control-node-registration

Welcome to Karios!
------------------

Imagine a world where your IT infrastructure anticipates your needs, adapts to changing demands, and empowers your team to achieve more. That is the promise of Karios.

Beyond Virtualization
----------------------

Karios is not just a virtualization platform, it is a foundation for future growth. A dynamic environment that evolves alongside your business, extending its reach beyond virtualization to manage resources like cooling and power, ensuring optimal performance and sustainability.

.. admonition:: New: Enhanced Security & Compliance
   :class: important
   
   Now, with integrated security scanning and automated compliance checks, Karios proactively safeguards your hypervisor and virtual machines, ensuring adherence to industry regulations, providing peace of mind and simplifying complex governance requirements.

Core Philosophy
---------------

.. epigraph::
   "Security shouldn't be a premium feature. It's fundamental."
   
   -- Karios Design Principles

Karios is built around three core principles:

1. **Simplicity** - Complex deployments and endless management overhead are things of the past
2. **Integrity** - Your data is protected with ZFS's advanced features like snapshots and self-healing
3. **Agility** - Respond instantly to changing business needs with software-defined everything

Hardware Requirements
---------------------

Absolute Minimum Configuration
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. warning::
   For Basic Testing/Lab - Not Recommended for Mission Critical

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
~~~~~~~~~~~~~~~~~~~~~~~~~

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
~~~~~~~~~~~~~~~~~~~

.. note::
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

Next Steps
----------

Ready to get started? Check out the installation guide and basic concepts.

.. toctree::
   :maxdepth: 2
   :caption: Getting Started
   
   installation
