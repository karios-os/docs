Introduction
============

.. meta::
   :description: Introduction to Karios, the software-defined foundation for modern IT infrastructure
   :keywords: Karios, HCI, hyper-converged, virtualization, ZFS

Welcome to Karios!
------------------

Imagine an infrastructure that adapts to your business and not the other way around. 
Karios is a next-generation hyper-converged infrastructure (HCI) platform designed to do just that.

.. important::
   Karios isn't just virtualization; it's a complete infrastructure solution that seamlessly 
   integrates compute, storage, and networking into a single software-defined platform.

Core Philosophy
---------------

.. epigraph::
   "Security shouldn't be a premium feature. It's fundamental."
   
   -- Karios Design Principles

Karios is built around three core principles:

1. **Simplicity** - Complex deployments and endless management overhead are things of the past
2. **Integrity** - Your data is protected with ZFS's advanced features like snapshots and self-healing
3. **Agility** - Respond instantly to changing business needs with software-defined everything

Architecture Overview
---------------------

Karios eliminates traditional infrastructure silos by providing unified compute, storage, and networking layers.

Hardware Requirements
---------------------

.. list-table:: Minimum System Requirements
   :header-rows: 1
   :widths: 20 40 40

   * - Component
     - Minimum
     - Recommended
   * - **CPU**
     - 4 cores, x86-64
     - 8+ cores, Intel VT-x/AMD-V
   * - **Memory**
     - 16 GB RAM
     - 32+ GB RAM
   * - **Storage**
     - 100 GB SSD
     - 500+ GB NVMe SSD
   * - **Network**
     - 1 Gbps NIC
     - 10+ Gbps NIC

Next Steps
----------

Ready to get started? Check out the installation guide and basic concepts.

.. toctree::
   :maxdepth: 2
   :caption: Getting Started
   
   installation
   basics
   initial-configuration
