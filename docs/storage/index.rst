===============================================
Local Storage - ZFS (Zettabyte File System)
===============================================

Pool Architecture
=================

Fundamental Concepts
--------------------

ZFS (Zettabyte File System) is built upon a revolutionary storage architecture that fundamentally differs from traditional file systems. At its core, ZFS implements a **pooled storage model** where physical storage devices are aggregated into storage pools (zpools), and logical file systems are created from these pools.

Storage Pool Design Philosophy
------------------------------

The ZFS pool architecture is based on several key principles:

Virtual Device (VDEV) Hierarchy
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Storage pools are constructed from Virtual Devices (VDEVs), which represent logical groupings of physical storage devices. VDEVs can be:

* **Leaf VDEVs**: Physical devices (disks, files, or partitions)
* **Interior VDEVs**: Logical constructs that aggregate leaf VDEVs (mirrors, RAID-Z groups)
* **Root VDEV**: The top-level container that encompasses all VDEVs in a pool

Copy-on-Write (COW) Transaction Model
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

All data modifications in ZFS are transactional and atomic. When data is modified, ZFS creates a new copy rather than overwriting existing data in place. This ensures consistency and enables powerful features like instantaneous snapshots.

Merkle Tree Structure
~~~~~~~~~~~~~~~~~~~~~

ZFS organizes all metadata and data in a self-validating tree structure where each node contains checksums of its children. This creates an end-to-end data integrity model where corruption can be detected at any level.

Pool Composition and Scaling
----------------------------

Storage pools can contain multiple top-level VDEVs of different types:

* **Data VDEVs**: Store user data and metadata
* **Log VDEVs (ZIL)**: Accelerate synchronous writes through dedicated intent log devices
* **Cache VDEVs (L2ARC)**: Provide additional read caching beyond system memory
* **Spare VDEVs**: Hot spare devices for automatic replacement of failed drives

Scaling Characteristics
~~~~~~~~~~~~~~~~~~~~~~~

* **Horizontal Scaling**: Pools can be expanded by adding new top-level VDEVs
* **Performance Scaling**: I/O operations are distributed across all top-level VDEVs
* **Capacity Scaling**: Total pool capacity equals the sum of all top-level VDEV capacities

Disk Layout Types
==================

Mirror VDEVs
------------

Theoretical Foundation
~~~~~~~~~~~~~~~~~~~~~~

Mirror VDEVs implement N-way replication where data is identically stored across multiple devices. This provides fault tolerance through redundancy and can improve read performance through parallel access.

Implementation Details
~~~~~~~~~~~~~~~~~~~~~~

* **Write Operations**: Data is written to all mirror members simultaneously
* **Read Operations**: Reads can be satisfied by any healthy mirror member, allowing for load balancing
* **Failure Handling**: Can tolerate N-1 device failures where N is the number of mirror members
* **Rebuild Process**: When a failed device is replaced, only the differences need to be resilvered

Performance Characteristics
~~~~~~~~~~~~~~~~~~~~~~~~~~~

* **Write Performance**: Limited by the slowest mirror member
* **Read Performance**: Can scale with the number of mirror members
* **Space Efficiency**: 1/N where N is the number of mirror members

RAID-Z Implementation
---------------------

RAID-Z is ZFS's implementation of RAID with parity, designed to overcome the limitations of traditional hardware RAID implementations.

RAID-Z1 (Single Parity)
~~~~~~~~~~~~~~~~~~~~~~~

**Mathematical Foundation**: Uses Reed-Solomon error correction codes to generate one parity block for every N data blocks. The parity is calculated using Galois Field arithmetic (GF(2^8)), allowing reconstruction of any single failed disk.

**Variable Stripe Width**: Unlike traditional RAID-5, RAID-Z uses variable stripe widths that match the logical block size of the data being written. This eliminates the "write hole" problem common in traditional RAID implementations.

**Parity Calculation**: For each stripe, parity P is calculated as:

.. math::

   P = D_1 ⊕ D_2 ⊕ ... ⊕ D_n

where ⊕ represents XOR operation and D represents data blocks.

RAID-Z2 (Double Parity)
~~~~~~~~~~~~~~~~~~~~~~~

**Advanced Error Correction**: Implements two parity blocks (P and Q) using more complex Reed-Solomon codes. Q parity uses multiplication in GF(2^8), enabling recovery from any two disk failures.

**Parity Calculations**:

.. math::

   P = D_1 ⊕ D_2 ⊕ ... ⊕ D_n

.. math::

   Q = (D_1 × g^0) ⊕ (D_2 × g^1) ⊕ ... ⊕ (D_n × g^{n-1})

Where g is a generator element in GF(2^8).

RAID-Z3 (Triple Parity)
~~~~~~~~~~~~~~~~~~~~~~~

**Triple Redundancy**: Extends RAID-Z2 with a third parity block (R), providing protection against three simultaneous disk failures. Uses even more sophisticated Reed-Solomon encoding.

**Mathematical Complexity**: Requires solving systems of linear equations in Galois Fields for reconstruction, making it computationally intensive but extremely resilient.

Striped Configuration
---------------------

**Performance Optimization**: Striping distributes data across multiple devices without redundancy, maximizing both performance and capacity utilization.

**Load Distribution**: Data is distributed using a round-robin or hash-based algorithm to ensure even load distribution across all devices.

**Failure Implications**: Any device failure results in complete data loss, making this suitable only for non-critical data or when redundancy is provided at other levels.

ZVols (ZFS Volumes)
===================

Block Device Abstraction
------------------------

ZVols represent ZFS's implementation of block storage within the file system namespace. They present as block devices to the operating system while leveraging all ZFS features internally.

Implementation Architecture
---------------------------

Virtual Block Device
~~~~~~~~~~~~~~~~~~~~

ZVols are implemented as sparse objects within the ZFS object store, appearing as contiguous block devices to applications while being managed as ZFS datasets internally.

DMU Integration
~~~~~~~~~~~~~~~

ZVols interact directly with the Data Management Unit (DMU), bypassing the ZPL (ZFS Posix Layer) for optimal performance in block-oriented workloads.

Use Cases and Characteristics
-----------------------------

* **Virtual Machine Storage**: Ideal for VM disk images, providing snapshots, clones, and compression while maintaining block-level semantics expected by hypervisors
* **Database Storage**: Suitable for database files that require direct block access while benefiting from ZFS's integrity and snapshot capabilities
* **Swap Devices**: Can serve as swap space with compression and deduplication benefits

Snapshots and Properties
========================

Copy-on-Write Snapshot Implementation
-------------------------------------

**Instantaneous Creation**: Snapshots are created by simply marking the current transaction group as immutable and creating a new reference to the same block tree.

**Space Efficiency**: Initial snapshots consume no additional space since they reference the same physical blocks as the original dataset. Space is consumed only when blocks are modified in the active dataset.

Snapshot Hierarchy and Management
---------------------------------

**Hierarchical Relationships**: Snapshots maintain parent-child relationships that enable efficient space utilization and cloning operations.

**Reference Counting**: ZFS uses reference counting to track block usage across multiple snapshots and datasets, enabling precise space accounting.

Properties System
-----------------

**Inheritance Model**: ZFS properties follow a hierarchical inheritance model where child datasets inherit properties from their parents unless explicitly overridden.

Property Types
~~~~~~~~~~~~~~

* **Native Properties**: Built into ZFS (compression, checksum, quota)
* **User Properties**: Custom properties defined with arbitrary names  
* **Temporary Properties**: Properties that exist only for the current mount

Data Integrity and Checksums
============================

End-to-End Checksumming
-----------------------

Cryptographic Hash Functions
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

ZFS supports multiple checksum algorithms:

* **Fletcher2/4**: Fast but less secure, suitable for detecting hardware errors
* **SHA-256**: Cryptographically secure, suitable for detecting malicious corruption
* **Skein**: High-performance cryptographic hash designed for storage systems
* **Edon-R**: Alternative high-performance hash function

Self-Healing Architecture
-------------------------

**Automatic Corruption Detection**: Every read operation verifies checksums, enabling immediate detection of silent corruption.

**Self-Repair Mechanisms**: When corruption is detected and redundant copies exist (mirrors, parity), ZFS automatically repairs the corruption using good copies.

Scrubbing Process
-----------------

**Proactive Verification**: Scrubbing systematically reads all data in a pool, verifying checksums and repairing any detected corruption.

**Background Operations**: Scrubs run as low-priority background operations that can be throttled to minimize impact on normal operations.

Encryption
==========

ZFS Native Encryption Architecture
----------------------------------

**Dataset-Level Encryption**: ZFS implements encryption at the dataset level, allowing different datasets to use different encryption algorithms and keys.

**Encryption Hierarchy**: Child datasets can inherit encryption from parents or implement independent encryption policies.

Key Management Framework
------------------------

Key Formats
~~~~~~~~~~~

* **Passphrase**: User-provided passphrases derived using PBKDF2
* **Raw Keys**: Direct 256-bit encryption keys
* **Hex Keys**: Hexadecimal-encoded keys for programmatic use

**Key Derivation**: Uses PBKDF2 (Password-Based Key Derivation Function 2) with configurable iteration counts for passphrase-based keys.

Encryption Implementation
-------------------------

Block-Level Encryption
~~~~~~~~~~~~~~~~~~~~~~

Data is encrypted at the block level using AES in either CBC or GCM mode:

* **AES-128-CCM**: Counter with CBC-MAC for authenticated encryption
* **AES-192-CCM**: Extended key length for higher security
* **AES-256-CCM**: Maximum security with 256-bit keys
* **AES-128-GCM**: Galois/Counter Mode for high-performance authenticated encryption
* **AES-192-GCM**: Extended GCM implementation
* **AES-256-GCM**: Maximum security GCM implementation

**Hardware Acceleration**: Leverages AES-NI instructions on supported processors for optimal encryption performance.

File-Level vs Pool-Level Considerations
---------------------------------------

**Dataset Granularity**: ZFS encryption operates at the dataset level, providing more granular control than pool-level encryption while maintaining reasonable overhead.

**Key Hierarchy**: Allows for complex key management scenarios where different datasets have different security requirements and key rotation schedules.

ARC (Adaptive Replacement Cache) Memory Management
==================================================

ARC Algorithm Foundation
------------------------

Adaptive Replacement
~~~~~~~~~~~~~~~~~~~~

ARC maintains four lists tracking both recency and frequency of access:

* **T1**: Recent cache hits (recency)
* **B1**: Ghost entries for recently evicted T1 entries
* **T2**: Frequent cache hits (frequency)
* **B2**: Ghost entries for recently evicted T2 entries

Cache Management Logic
----------------------

**Adaptive Partitioning**: ARC dynamically adjusts the balance between recency (T1) and frequency (T2) based on workload characteristics.

**Ghost Lists**: B1 and B2 maintain metadata about recently evicted entries, allowing ARC to learn from past eviction decisions and adjust future caching behavior.

Memory Pressure Handling
------------------------

**Eviction Algorithm**: When memory pressure occurs, ARC uses the learned workload characteristics to evict the least valuable data, considering both recency and frequency.

**Integration with VM System**: ARC cooperates with the operating system's virtual memory system, releasing memory when needed for other purposes.

L2ARC (Level 2 ARC)
-------------------

**Persistent Cache**: L2ARC extends ARC to high-speed storage devices (SSDs), providing a persistent cache that survives system restarts.

**Cache Hierarchy**: Acts as a victim cache for data evicted from main memory ARC, significantly extending effective cache capacity.

ZFS Properties, Features, and Internal Operations
=================================================

Property System Architecture
----------------------------

**Property Inheritance**: Properties flow from parent datasets to children through a well-defined inheritance hierarchy that can be overridden at any level.

Property Sources
~~~~~~~~~~~~~~~~

* **Default**: Built-in system defaults
* **Inherited**: Inherited from parent datasets
* **Local**: Explicitly set on the dataset
* **Temporary**: Set only for current mount
* **Received**: Set during replication operations

Feature Flag System
-------------------

**Backward Compatibility**: Feature flags enable new functionality while maintaining compatibility with older ZFS implementations.

Feature Activation
~~~~~~~~~~~~~~~~~~

Features can be:

* **Enabled**: Feature is available but not required
* **Active**: Feature is in use and pool cannot be imported by incompatible implementations

Internal Operations
-------------------

* **Transaction Groups (TXGs)**: ZFS groups related operations into transaction groups that are committed atomically to storage, ensuring consistency
* **Space Map Objects**: Track free and allocated space within the pool using efficient bitmap representations
* **Intent Log (ZIL)**: Provides crash consistency for synchronous operations by logging intentions before committing data

Interactions with FreeBSD
=========================

Kernel Integration
------------------

**GEOM Integration**: ZFS integrates with FreeBSD's GEOM framework for storage device management while maintaining its own device discovery and management.

**VFS Layer**: ZFS implements the VFS (Virtual File System) interface, allowing it to work seamlessly with FreeBSD's file system layer.

Command-Line Tools
------------------

zpool Command
~~~~~~~~~~~~~

Manages storage pools with subcommands for:

* **create**: Pool creation with VDEV specification
* **import/export**: Pool portability between systems
* **status**: Pool health and configuration information
* **scrub**: Data integrity verification
* **resilver**: Repair operations after device replacement

zfs Command
~~~~~~~~~~~

Manages datasets and their properties:

* **create**: Dataset creation with property specification
* **snapshot**: Point-in-time dataset snapshots
* **clone**: Writable copies from snapshots
* **send/receive**: Stream-based replication
* **mount/unmount**: File system mounting operations

System Integration
------------------

**Boot Environments**: FreeBSD's beadm integrates with ZFS to provide atomic system updates and rollback capabilities.

**Jail Integration**: ZFS datasets can be used as jail roots, providing resource isolation and management capabilities.

Dump and Recovery
-----------------

**zfsdump Integration**: FreeBSD's dump utility integrates with ZFS to provide consistent backups of ZFS datasets.

**Crash Dump Support**: ZFS can store system crash dumps, providing compressed and deduplicated core dump storage.

Performance, Redundancy, Failure Handling, and Recovery
=======================================================

Performance Characteristics
---------------------------

I/O Scheduling
~~~~~~~~~~~~~~

ZFS implements its own I/O scheduler that optimizes for:

* **Elevator Algorithm**: Minimizes disk seek times
* **Deadline Scheduling**: Ensures I/O operations complete within reasonable time limits
* **Priority-Based Queuing**: Differentiates between synchronous and asynchronous operations

Prefetching
~~~~~~~~~~~

Adaptive prefetching algorithms predict future read patterns and proactively cache data:

* **Stream Detection**: Identifies sequential read patterns
* **Stride Prefetching**: Handles strided access patterns common in databases
* **Metadata Prefetching**: Prefetches directory and file metadata

Redundancy Implementation
-------------------------

Data Redundancy
~~~~~~~~~~~~~~~

Multiple mechanisms provide data protection:

* **Replication**: Full copies across mirror members
* **Parity**: Mathematical reconstruction using Reed-Solomon codes
* **Checksums**: Detect corruption in any copy
* **Self-Healing**: Automatic repair using good copies

**Metadata Redundancy**: Critical metadata is always stored with at least two copies, even on single-device pools.

Failure Detection and Response
------------------------------

Proactive Monitoring
~~~~~~~~~~~~~~~~~~~~

ZFS continuously monitors device health:

* **I/O Error Tracking**: Maintains error counters for each device
* **Latency Monitoring**: Tracks response times and identifies degraded devices
* **Checksum Verification**: Validates data integrity on every read

Automated Response
~~~~~~~~~~~~~~~~~~

When failures are detected:

* **Device Faulting**: Automatically removes failing devices from active service
* **Degraded Mode**: Continues operation with reduced redundancy
* **Resilver Operations**: Automatically rebuilds data on replacement devices

Recovery Mechanisms
-------------------

Resilver Process
~~~~~~~~~~~~~~~~

When devices are replaced or pools are expanded:

* **Block-Level Reconstruction**: Only copies blocks that are actually allocated
* **Distributed Resilver**: Spreads reconstruction load across all devices
* **Priority Queuing**: Balances resilver progress with normal I/O operations

Import Recovery
~~~~~~~~~~~~~~~

When pools are imported after unclean shutdown:

* **Transaction Log Replay**: Applies committed but unwritten transactions
* **Consistency Verification**: Validates pool structure and metadata
* **Automatic Repair**: Fixes minor inconsistencies automatically

Data Recovery Options
~~~~~~~~~~~~~~~~~~~~~

* **Snapshot Rollback**: Return dataset to previous known-good state
* **Clone and Repair**: Create writable copy for surgical data recovery
* **Send/Receive**: Replicate data to remote systems for disaster recovery

Advanced Recovery Scenarios
---------------------------

Pool Import Force
~~~~~~~~~~~~~~~~~

Override safety checks for emergency recovery:

* **Missing Devices**: Import degraded pools with failed devices
* **Metadata Corruption**: Attempt recovery despite minor corruption
* **Version Compatibility**: Import pools from newer ZFS versions

Device Replacement Strategies
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

* **Online Replacement**: Replace devices without unmounting file systems
* **Offline Replacement**: Replace devices during maintenance windows
* **Emergency Replacement**: Rapidly replace failed devices to maintain redundancy

.. note::
   This comprehensive documentation provides the theoretical foundation for understanding ZFS architecture and operations, enabling informed decisions about storage design, performance optimization, and failure recovery strategies.

.. warning::
   Always ensure proper backups before performing any ZFS recovery operations, especially when using force import or emergency replacement procedures.

.. tip::
   Regular scrubbing and monitoring of ZFS pools is essential for maintaining data integrity and early detection of potential issues.   


=========================================
Storage Client Protocols on FreeBSD
=========================================

Understanding Storage Client Protocols
=======================================

What are Storage Client Protocols?
----------------------------------

Storage client protocols are standardized methods that allow computers to access and store data on remote storage systems over a network. Think of them as different "languages" that computers use to communicate with storage servers.

Why Do We Need Different Storage Protocols?
-------------------------------------------

Different storage protocols exist because they solve different problems:

* **Performance Requirements**: Some applications need rapid access to data
* **Compatibility**: Different operating systems prefer different protocols
* **Scalability**: Some protocols work better with many users or large amounts of data
* **Security**: Different protocols offer different levels of security
* **Cost**: Some protocols require expensive hardware, others work with commodity equipment

Basic Concepts You Need to Know
-------------------------------

* **Client**: The computer or application that wants to access data
* **Server**: The computer that stores and provides access to data
* **Protocol**: The set of rules governing how client and server communicate
* **Latency**: How long it takes for a request to get a response (lower is better)
* **Throughput**: How much data can be transferred per second (higher is better)
* **Caching**: Temporarily storing frequently accessed data closer to where it's needed

MooseFS (Moose File System)
============================

What is MooseFS?
----------------

MooseFS is a distributed file system that allows you to combine multiple physical storage devices into one large, virtual file system. It's designed to handle massive amounts of data across many servers.

.. note::
   **Simple Explanation**: Imagine you have 10 different filing cabinets in different rooms, but you want them to appear as one giant filing cabinet. MooseFS does this for computer storage.

How MooseFS Works
-----------------

MooseFS has three main components:

Master Server (The Brain)
~~~~~~~~~~~~~~~~~~~~~~~~~

* **Role**: Keeps track of where all files are stored
* **Responsibilities**:
  
  * Maintains the directory structure (like a master index)
  * Decides where new files should be stored
  * Coordinates access to files

* **Analogy**: Like a librarian who knows exactly where every book is located in a library system with multiple branches

Chunkservers (The Storage Workers)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

* **Role**: Actually store the file data
* **How it works**: Files are split into small pieces called "chunks" (typically 64MB each)
* **Redundancy**: Each chunk is stored on multiple chunkservers for safety
* **Analogy**: Like having multiple copies of important documents stored in different safe deposit boxes

Clients (The Users)
~~~~~~~~~~~~~~~~~~~

* **Role**: Applications and users that want to access files
* **How they work**: Connect to the master server to find files, then directly communicate with chunkservers to read/write data
* **User Experience**: Appears as a normal file system (like any folder on your computer)

MooseFS on FreeBSD
------------------

Installation and Setup
~~~~~~~~~~~~~~~~~~~~~~~

.. code-block:: bash

   # Install MooseFS from FreeBSD ports
   cd /usr/ports/sysutils/moosefs3-master && make install clean
   cd /usr/ports/sysutils/moosefs3-chunkserver && make install clean
   cd /usr/ports/sysutils/moosefs3-client && make install clean

Configuration Basics
~~~~~~~~~~~~~~~~~~~~

**Master Server Configuration** (``/usr/local/etc/mfs/mfsmaster.cfg``):

.. code-block:: ini

   # Basic master server settings
   WORKING_USER = mfs
   WORKING_GROUP = mfs
   SYSLOG_IDENT = mfsmaster
   LOCK_FILE = /var/lib/mfs/mfsmaster.lock
   DATA_PATH = /var/lib/mfs

**Chunkserver Configuration** (``/usr/local/etc/mfs/mfschunkserver.cfg``):

.. code-block:: ini

   # Basic chunkserver settings
   WORKING_USER = mfs
   WORKING_GROUP = mfs
   DATA_PATH = /mnt/mfs/chunks
   MASTER_HOST = 192.168.1.100
   MASTER_PORT = 9420

Understanding MooseFS Features
------------------------------

Data Replication (Goals)
~~~~~~~~~~~~~~~~~~~~~~~~

* **What it means**: How many copies of each file should exist
* **Goal 1**: One copy (no redundancy) - fastest but risky
* **Goal 2**: Two copies - good balance of speed and safety
* **Goal 3**: Three copies - maximum safety but uses more storage
* **Goal 4+**: Even more copies for critical data

Automatic Load Balancing
~~~~~~~~~~~~~~~~~~~~~~~~

* MooseFS automatically spreads files across available chunkservers
* When you add new chunkservers, MooseFS gradually moves data to balance the load
* No manual intervention required

Self-Healing
~~~~~~~~~~~~

* If a chunkserver fails, MooseFS automatically creates new copies of the lost data
* Works transparently in the background
* Users don't notice the failure

Caching in MooseFS
------------------

Client-Side Caching
~~~~~~~~~~~~~~~~~~~

**What happens**: Frequently accessed files are stored temporarily on the client computer's memory or local disk

**Benefits**:

* Faster access to recently used files
* Reduced network traffic
* Better performance for applications

**How it works**:

1. Application requests a file
2. Client checks if file is in local cache
3. If yes: Returns cached version
4. If no: Downloads from chunkserver and caches it

Attribute Caching
~~~~~~~~~~~~~~~~~

* File information (size, modification date, permissions) is cached
* Reduces the number of requests to the master server
* Makes file browsing much faster

When to Use MooseFS
-------------------

Ideal Scenarios
~~~~~~~~~~~~~~~

* **Large File Storage**: Great for storing many large files (videos, backups, archives)
* **Growing Storage Needs**: When you need to easily add more storage over time
* **High Availability**: When you can't afford to lose access to your data
* **Multiple Users**: When many people need to access the same files simultaneously

Not Ideal For
~~~~~~~~~~~~~~

* **Small Files**: Overhead makes it inefficient for millions of tiny files
* **Low Latency Requirements**: Network overhead makes it slower than local storage
* **Simple Setups**: Overkill for single-user or simple file sharing

Virtual Machine Storage with MooseFS
------------------------------------

How VMs Use MooseFS
~~~~~~~~~~~~~~~~~~~

* VM disk files are stored as regular files in MooseFS
* Multiple VM hosts can access the same storage
* Enables features like live migration between hosts

Benefits for VMs
~~~~~~~~~~~~~~~~

* **Shared Storage**: Multiple hypervisor hosts can access the same VM files
* **High Availability**: VMs continue running even if one storage server fails
* **Easy Expansion**: Add storage capacity without downtime
* **Centralized Management**: All VM storage in one place

Performance Considerations
~~~~~~~~~~~~~~~~~~~~~~~~~~

* **Network Dependency**: VM performance depends on network speed
* **Caching Important**: Local caching crucial for good VM performance
* **Replication Balance**: More copies = safer but slower writes

NFS (Network File System)
==========================

What is NFS?
------------

NFS is one of the oldest and most widely used network file systems. It allows you to mount remote directories as if they were local folders on your computer.

.. note::
   **Simple Explanation**: NFS is like having a folder on your computer that's actually stored on another computer across the network. You can read, write, and organize files in this folder just like any other folder.

How NFS Works
-------------

Basic Operation Flow
~~~~~~~~~~~~~~~~~~~~

1. Client sends request: "I want to read file /shared/document.txt"
2. NFS server receives request
3. Server checks permissions
4. Server reads file from local storage
5. Server sends file content back to client
6. Client receives data and presents it to application

NFS on FreeBSD
--------------

Native FreeBSD NFS Features
~~~~~~~~~~~~~~~~~~~~~~~~~~~

FreeBSD has excellent built-in NFS support:

* **Kernel NFS Server**: High-performance server built into the kernel
* **Mature Client**: Rock-solid NFS client implementation
* **ZFS Integration**: Seamless integration with ZFS file system
* **Kerberos Support**: Strong security through Kerberos authentication

Setting Up NFS Server on FreeBSD
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

**Enable NFS in rc.conf**:

.. code-block:: bash

   # /etc/rc.conf
   nfs_server_enable="YES"
   nfs_server_flags="-u -t -n 4"
   nfsd_enable="YES"
   nfsd_flags="-u -t -n 4"
   mountd_enable="YES"
   rpcbind_enable="YES"

**Configure NFS Exports** (``/etc/exports``):

.. code-block:: bash

   # Share /tank/shared with specific networks
   /tank/shared -network 192.168.1.0 -mask 255.255.255.0

   # Share /tank/vms with specific hosts, read-write access
   /tank/vms -maproot=root -rw 192.168.1.10 192.168.1.11

   # Share /tank/public with everyone, read-only
   /tank/public -ro -network 192.168.0.0 -mask 255.255.0.0

**Start NFS Services**:

.. code-block:: bash

   service rpcbind start
   service mountd start
   service nfsd start

Setting Up NFS Client on FreeBSD
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

**Mount NFS Share Temporarily**:

.. code-block:: bash

   mount -t nfs 192.168.1.100:/tank/shared /mnt/shared

**Permanent Mount** (``/etc/fstab``):

.. code-block:: bash

   192.168.1.100:/tank/shared /mnt/shared nfs rw,tcp,intr 0 0

Understanding NFS Caching
-------------------------

Client-Side Caching
~~~~~~~~~~~~~~~~~~~

**Attribute Caching**:

* Caches file attributes (size, permissions, timestamps)
* Default timeout: 3-60 seconds depending on file type
* Reduces server requests for file information

**Data Caching**:

* Uses FreeBSD's unified buffer cache
* Recently read data stays in memory
* Writes can be cached and delayed

**Configuration Example**:

.. code-block:: bash

   # Mount with custom cache settings
   mount -t nfs -o tcp,rsize=65536,wsize=65536,intr,soft \
     192.168.1.100:/tank/shared /mnt/shared

Close-to-Open Consistency
~~~~~~~~~~~~~~~~~~~~~~~~~

* When a file is opened, client checks if cached version is still valid
* When a file is closed, any cached writes are flushed to server
* Ensures reasonable consistency between multiple clients

NFS Security
------------

Basic Security (Host-Based)
~~~~~~~~~~~~~~~~~~~~~~~~~~~

* Uses IP addresses to control access
* Simple but not very secure
* Good for trusted networks

Kerberos Security
~~~~~~~~~~~~~~~~~

* Strong mutual authentication
* Encrypted communications
* Suitable for enterprise environments

**Setting up Kerberos NFS**:

.. code-block:: bash

   # Server side - require Kerberos
   echo '/tank/secure -sec=krb5:krb5i:krb5p' >> /etc/exports

   # Client side - use Kerberos
   mount -t nfs -o sec=krb5 nfsserver:/tank/secure /mnt/secure

Virtual Machine Storage with NFS
--------------------------------

VM Disk Storage Models
~~~~~~~~~~~~~~~~~~~~~~

**File-Based VM Storage**:

* VM disk images stored as files on NFS exports
* Easy to manage and backup
* Good performance for most workloads

**Example Setup**:

.. code-block:: bash

   # Server: Export VM storage directory
   echo '/tank/vms -maproot=root vmhost1 vmhost2' >> /etc/exports

   # Client: Mount on VM host
   mount -t nfs -o tcp,hard,intr,rsize=65536,wsize=65536 \
     nfsserver:/tank/vms /vmware/datastore

Benefits for Virtual Machines
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

* **Shared Storage**: Multiple VM hosts can access same storage
* **Live Migration**: VMs can move between hosts without copying storage
* **Centralized Backup**: Backup all VMs from the NFS server
* **Easy Management**: Manage VM storage from central location

Performance Considerations
~~~~~~~~~~~~~~~~~~~~~~~~~~

* **Network Latency**: Affects VM responsiveness
* **Bandwidth**: Multiple VMs can saturate network links
* **Caching**: Important for good performance
* **Synchronous vs Asynchronous**: Balance between safety and speed

When to Use NFS
---------------

Ideal Scenarios
~~~~~~~~~~~~~~~

* **UNIX/Linux Environments**: Native protocol, excellent compatibility
* **Shared File Access**: Multiple users/systems accessing same files
* **Centralized Storage**: Consolidating storage for many systems
* **VMware Environments**: Traditional choice for VMware datastores

Consider Alternatives When
~~~~~~~~~~~~~~~~~~~~~~~~~~

* **Windows-Heavy Environment**: SMB/CIFS might be more appropriate
* **High-Performance Databases**: Direct block storage (iSCSI) might be better
* **Very High Security Requirements**: Object storage with encryption might be preferred

S3 (Simple Storage Service) Compatible Storage
===============================================

What is S3?
-----------

S3 (Simple Storage Service) was originally created by Amazon Web Services, but the S3 API has become a standard that many storage systems implement. It's an object storage system, which is different from traditional file systems.

.. note::
   **Simple Explanation**: Instead of organizing data in folders and files like a traditional file system, S3 organizes data as "objects" in "buckets". Think of it like a massive warehouse where each item has a unique label, and you can store and retrieve items using that label.

Object Storage vs File Storage
------------------------------

Traditional File Storage
~~~~~~~~~~~~~~~~~~~~~~~~

.. code-block:: text

   /home/user/documents/report.pdf
   /home/user/pictures/vacation/beach.jpg
   /var/log/system.log

* Hierarchical structure (folders within folders)
* Files have paths and directories
* Good for small to medium files

Object Storage
~~~~~~~~~~~~~~

.. code-block:: text

   Bucket: company-documents
   Object: report-2024-q1.pdf (with metadata: size, type, created date)

   Bucket: employee-photos  
   Object: john-vacation-beach-2024.jpg (with metadata: location, camera info)

   Bucket: system-logs
   Object: webserver-log-2024-03-15.log (with metadata: server, date, type)

* Flat structure with buckets containing objects
* Objects identified by unique keys
* Excellent for large files and massive scale

S3-Compatible Solutions on FreeBSD
----------------------------------

MinIO
~~~~~

* **What it is**: High-performance object storage server
* **Written in**: Go language
* **Best for**: High-performance scenarios, cloud-native applications

SeaweedFS
~~~~~~~~~

* **What it is**: Distributed object storage with S3 compatibility
* **Written in**: Go language
* **Best for**: Massive scale, distributed environments

Ceph RadosGW
~~~~~~~~~~~~

* **What it is**: S3 gateway for Ceph distributed storage
* **Written in**: C++
* **Best for**: Enterprise environments, integration with existing Ceph

Understanding S3 Concepts
-------------------------

Buckets
~~~~~~~

* **What they are**: Containers for objects (like top-level folders)
* **Naming**: Must be globally unique names
* **Purpose**: Organize objects and apply policies

Objects
~~~~~~~

* **What they are**: Individual files/data stored in buckets
* **Size limits**: Can be very large (up to 5TB per object in S3)
* **Metadata**: Each object can have custom metadata attached

Keys
~~~~

* **What they are**: Unique identifiers for objects within a bucket
* **Example**: ``bucket-name/folder/subfolder/filename.ext``
* **Note**: Even though it looks like a path, it's just a flat key name

S3 API Basics
-------------

Common Operations
~~~~~~~~~~~~~~~~~

**Create a Bucket**:

.. code-block:: bash

   # Using aws-cli tool
   aws --endpoint-url http://localhost:9000 s3 mb s3://my-bucket

**Upload an Object**:

.. code-block:: bash

   # Upload a file
   aws --endpoint-url http://localhost:9000 s3 cp file.txt s3://my-bucket/

   # Upload with metadata
   aws --endpoint-url http://localhost:9000 s3 cp file.txt s3://my-bucket/ \
     --metadata "author=john,department=engineering"

**Download an Object**:

.. code-block:: bash

   # Download a file
   aws --endpoint-url http://localhost:9000 s3 cp s3://my-bucket/file.txt ./

**List Objects**:

.. code-block:: bash

   # List all objects in bucket
   aws --endpoint-url http://localhost:9000 s3 ls s3://my-bucket/

S3 Caching Strategies
---------------------

Client-Side Caching
~~~~~~~~~~~~~~~~~~~

Applications can cache frequently accessed objects locally:

* **Benefits**: Faster access, reduced network traffic
* **Challenges**: Cache invalidation, consistency

CDN Caching
~~~~~~~~~~~

Content Delivery Networks can cache S3 objects globally:

* **Benefits**: Fast access from anywhere in the world
* **Use cases**: Web content, software downloads, media files

Gateway Caching
~~~~~~~~~~~~~~~

S3 gateways can cache hot objects:

* **Benefits**: Reduced backend load, faster response times
* **Implementation**: Built into many S3-compatible solutions

Encryption Options
------------------

Server-Side Encryption (SSE)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

* Objects encrypted by the storage server
* Transparent to clients
* Keys managed by server

Client-Side Encryption (CSE)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

* Objects encrypted by client before upload
* Server never sees unencrypted data
* Client manages encryption keys

Transport Encryption
~~~~~~~~~~~~~~~~~~~~

* HTTPS for all API communications
* Protects data in transit

Virtual Machine Storage with S3
-------------------------------

VM Images as Objects
~~~~~~~~~~~~~~~~~~~~

.. code-block:: bash

   # Store VM disk image in S3
   aws s3 cp vm-disk.qcow2 s3://vm-storage/disks/

   # Store VM snapshots
   aws s3 cp vm-snapshot-1.qcow2 s3://vm-storage/snapshots/

   # Store VM templates
   aws s3 cp ubuntu-template.qcow2 s3://vm-storage/templates/

Benefits for VMs
~~~~~~~~~~~~~~~~

* **Unlimited Scale**: Store thousands of VM images
* **Global Access**: Access VM images from multiple data centers
* **Cost Effective**: Pay only for storage used
* **Durability**: High durability through replication
* **Versioning**: Keep multiple versions of VM images

Challenges
~~~~~~~~~~

* **Performance**: Higher latency than block storage
* **Compatibility**: Not all hypervisors natively support S3
* **Caching**: Need good caching for acceptable performance

When to Use S3 Storage
----------------------

Ideal Scenarios
~~~~~~~~~~~~~~~

* **Backup and Archive**: Long-term storage of backups
* **Content Distribution**: Serving static content globally
* **Data Lakes**: Storing large amounts of unstructured data
* **Cloud-Native Applications**: Applications designed for object storage
* **Cost-Sensitive Storage**: When storage cost is primary concern

Consider Alternatives When
~~~~~~~~~~~~~~~~~~~~~~~~~~

* **High-Performance Applications**: Traditional file systems might be faster
* **Small Files**: Object storage overhead significant for tiny files
* **POSIX Compliance**: Applications requiring POSIX file system semantics

SMB/CIFS (Server Message Block)
===============================

What is SMB/CIFS?
-----------------

SMB (Server Message Block) is a network file sharing protocol primarily developed by Microsoft. CIFS (Common Internet File System) is an older name for the same protocol family. SMB allows Windows computers (and other systems) to share files, printers, and other resources over a network.

.. note::
   **Simple Explanation**: SMB is like the "native language" of Windows file sharing. When you browse "Network" on a Windows computer and see shared folders from other computers, you're using SMB.

SMB Protocol Evolution
----------------------

SMB1/CIFS (1984-1996)
~~~~~~~~~~~~~~~~~~~~~

* Original protocol developed by IBM and Microsoft
* Basic file sharing functionality
* Security vulnerabilities led to deprecation
* **Status**: Should not be used (disabled by default in modern systems)

SMB2 (2006)
~~~~~~~~~~~

* Complete protocol redesign with Windows Vista/Server 2008
* Better performance and security
* Reduced "chattiness" (fewer network round trips)
* Larger read/write sizes

SMB3 (2012)
~~~~~~~~~~~

* Introduced with Windows 8/Server 2012
* End-to-end encryption
* SMB Direct (RDMA) support
* Scale-out clustering
* Transparent failover

SMB3.1.1 (2015)
~~~~~~~~~~~~~~~

* Enhanced security features
* Pre-authentication integrity
* AES-128 encryption
* Better performance optimizations

Understanding SMB Features
--------------------------

SMB Direct (RDMA)
~~~~~~~~~~~~~~~~~

* Uses Remote Direct Memory Access for high performance
* Bypasses TCP/IP stack for lower latency
* Requires special network hardware (InfiniBand or RoCE)
* Excellent for high-performance storage

SMB Multichannel
~~~~~~~~~~~~~~~~

* Uses multiple network connections simultaneously
* Automatic failover between network adapters
* Higher aggregate bandwidth
* Better fault tolerance

Persistent Handles
~~~~~~~~~~~~~~~~~~

* SMB connections survive network interruptions
* Applications don't lose connection during brief network issues
* Critical for reliable operation over unreliable networks

SMB Caching Mechanisms
----------------------

Client-Side Caching
~~~~~~~~~~~~~~~~~~~

**BranchCache**:

* Microsoft's distributed caching technology
* Caches content at branch offices
* Reduces WAN traffic for remote offices

**Offline Files**:

* Windows feature that caches SMB files locally
* Allows work when disconnected from network
* Synchronizes changes when reconnected

Server-Side Optimization
~~~~~~~~~~~~~~~~~~~~~~~~

**Read-Ahead Caching**:

.. code-block:: ini

   [global]
       # Enable read-ahead for better performance
       use sendfile = yes
       aio read size = 65536
       aio write size = 65536

**Memory Mapping**:

* Samba can use memory mapping for better performance
* Reduces memory copies
* Better for large files

Virtual Machine Storage with SMB
--------------------------------

Benefits for VMs
~~~~~~~~~~~~~~~~

* **Native Windows Support**: Excellent integration with Windows hypervisors
* **High Availability**: SMB3 clustering and failover features
* **Performance**: SMB Direct provides high performance
* **Manageability**: Standard Windows tools for management

Performance Considerations
~~~~~~~~~~~~~~~~~~~~~~~~~~

* **Network Dependency**: Performance limited by network speed
* **Protocol Overhead**: SMB has some protocol overhead
* **Caching Important**: Client-side caching critical for performance

When to Use SMB/CIFS
--------------------

Ideal Scenarios
~~~~~~~~~~~~~~~

* **Windows-Centric Environments**: Native protocol for Windows
* **Mixed Environments**: Good cross-platform compatibility
* **Branch Offices**: BranchCache reduces WAN traffic
* **Active Directory Integration**: Seamless integration with AD authentication

Consider Alternatives When
~~~~~~~~~~~~~~~~~~~~~~~~~~

* **Pure Linux/UNIX Environment**: NFS might be more appropriate
* **High-Performance Computing**: iSCSI or other protocols might be faster
* **Internet-Facing Services**: SMB not designed for internet exposure
* **Very High Security Requirements**: Consider more secure protocols

iSCSI (Internet Small Computer System Interface)
================================================

What is iSCSI?
--------------

iSCSI is a protocol that allows SCSI commands to be sent over IP networks. SCSI (Small Computer System Interface) is the traditional way computers communicate with storage devices like hard drives. iSCSI extends this to work over networks.

.. note::
   **Simple Explanation**: iSCSI makes a remote storage device appear as if it's directly connected to your computer. Your computer thinks it's talking to a local hard drive, but actually it's sending commands over the network to a storage server.

iSCSI vs Other Storage Protocols
--------------------------------

Block-Level vs File-Level Access
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

**iSCSI (Block-Level)**:

.. code-block:: text

   Computer → iSCSI commands → Network → Storage Server
   Computer sees: /dev/da0 (raw disk device)
   Usage: Can format with any file system, use as raw storage

**NFS/SMB (File-Level)**:

.. code-block:: text

   Computer → File operations → Network → Storage Server
   Computer sees: Mounted directory with files
   Usage: Access files and directories

Benefits of Block-Level Access
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

* **No File System Overhead**: Direct access to storage blocks
* **Any File System**: Can use ext4, ZFS, NTFS, or any other file system
* **Database Friendly**: Databases prefer direct block access
* **Better Performance**: Less protocol overhead for some workloads

iSCSI Architecture
------------------

Components
~~~~~~~~~~

**iSCSI Target**:

* The storage server that provides storage devices
* Exports LUNs (Logical Unit Numbers) - virtual disk drives
* Runs target daemon software

**iSCSI Initiator**:

* The client computer that connects to storage
* Connects to targets and uses the provided LUNs
* Built into most operating systems

**Portal**:

* Network endpoint (IP address + port) where target can be reached
* Targets can have multiple portals for redundancy

**IQN (iSCSI Qualified Name)**:

* Unique identifier for targets and initiators
* Format: ``iqn.yyyy-mm.domain.reversed:unique-name``
* Example: ``iqn.2024-01.com.mycompany:storage.server1``

iSCSI on FreeBSD
----------------

FreeBSD has excellent native iSCSI support built into the kernel.

iSCSI Target (Server) Setup
~~~~~~~~~~~~~~~~~~~~~~~~~~~

**Using ctld (FreeBSD's built-in target daemon)**:

**Enable ctld**:

.. code-block:: bash

   echo 'ctld_enable="YES"' >> /etc/rc.conf

**Configure targets** (``/etc/ctl.conf``):

.. code-block:: text

   # Global settings
   pidfile /var/run/ctld.pid

   # Define a portal (network endpoint)
   portal-group default {
       discovery-auth-group no-authentication
       listen 0.0.0.0:3260
   }

   # Define authentication
   auth-group myauth {
       chap "username" "secretpassword"
   }

   # Define storage backend
   target iqn.2024-01.freebsd.local:vm-storage {
       auth-group myauth
       portal-group default
       
       # LUN backed by ZFS volume
       lun 0 {
           path /dev/zvol/tank/vm-disk1
           size 100GB
           blocksize 4096
       }
       
       # LUN backed by file
       lun 1 {
           path /tank/iscsi-luns/vm-disk2
           size 50GB
       }
   }

**Start the target service**:

.. code-block:: bash

   service ctld start

iSCSI Initiator (Client) Setup
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

**Discover available targets**:

.. code-block:: bash

   iscontrol -d target=192.168.1.100

**Connect to target**:

.. code-block:: bash

   # Create session configuration
   cat > /etc/iscsi.conf << EOF
   vm-storage {
       targetaddress   = 192.168.1.100
       targetname      = iqn.2024-01.freebsd.local:vm-storage
       initiatorname   = iqn.2024-01.freebsd.local:client1
       authmethod      = CHAP
       chapname        = username
       chapsecret      = secretpassword
   }
   EOF

   # Connect to target
   iscontrol -c /etc/iscsi.conf -n vm-storage

**Alternative using iscsictl (modern method)**:

.. code-block:: bash

   # Discover targets
   iscsictl -A -t sendtargets -a 192.168.1.100

   # Add target
   iscsictl -A -t iqn.2024-01.freebsd.local:vm-storage -a 192.168.1.100

   # Connect
   iscsictl -L

Understanding iSCSI Features
----------------------------

Authentication Methods
~~~~~~~~~~~~~~~~~~~~~~

**No Authentication**:

* No security, anyone can connect
* Only suitable for trusted networks
* Fastest performance

**Mutual CHAP**:

* Both target and initiator authenticate each other
* Higher security
* Slightly more complex setup

Multiple Connections per Session (MC/S)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

* Single session can use multiple TCP connections
* Higher bandwidth through parallel connections
* Better fault tolerance

Error Recovery Levels
~~~~~~~~~~~~~~~~~~~~~

* **Session Recovery**: Recover from session failures
* **Connection Recovery**: Recover from individual connection failures
* **Within-Connection Recovery**: Handle individual command failures

Virtual Machine Storage with iSCSI
----------------------------------

VM Disk Configuration
~~~~~~~~~~~~~~~~~~~~~

**Raw iSCSI LUNs**:

* VM uses iSCSI LUN directly as virtual disk
* Best performance due to direct block access
* VM manages file system on the LUN

**File-based on iSCSI**:

* iSCSI LUN mounted as file system
* VM disk files stored on mounted file system
* More flexible but slightly lower performance

Benefits for VMs
~~~~~~~~~~~~~~~~

* **High Performance**: Direct block access provides excellent performance
* **Native Support**: Most hypervisors have built-in iSCSI support
* **Flexible**: Can be used as both boot storage and data storage
* **Scalable**: Easy to add more storage by connecting to more targets
* **Feature Rich**: Supports advanced features like snapshots (if backend supports)

Performance Considerations
~~~~~~~~~~~~~~~~~~~~~~~~~~

* **Network Latency**: Lower latency networks provide better VM performance
* **Queue Depth**: Higher queue depths can improve performance for some workloads
* **Multipathing**: Multiple paths provide both performance and availability benefits

When to Use iSCSI
-----------------

Ideal Scenarios
~~~~~~~~~~~~~~~

* **Virtual Machine Storage**: Excellent for VM datastores
* **Database Storage**: Databases benefit from direct block access
* **SAN Consolidation**: Centralize storage for multiple servers
* **High-Performance Applications**: Applications requiring low-latency storage
* **Boot from SAN**: Diskless servers booting from network storage

Consider Alternatives When
~~~~~~~~~~~~~~~~~~~~~~~~~~

* **Simple File Sharing**: NFS or SMB might be easier to manage
* **Object Storage Needs**: S3-compatible storage for unstructured data
* **Very High Security**: Consider encrypted file systems or object storage
* **Internet Access**: iSCSI not designed for internet exposure

SeaweedFS
=========

What is SeaweedFS?
------------------

SeaweedFS is a distributed object storage system designed to store and serve massive amounts of data. Unlike traditional file systems, SeaweedFS is specifically designed for storing large numbers of files efficiently at massive scale.

.. note::
   **Simple Explanation**: Imagine you need to store millions of photos, videos, or documents. Traditional file systems become slow when dealing with so many files. SeaweedFS is designed to handle this scale efficiently by distributing files across many storage servers and using special techniques to quickly locate any file.

SeaweedFS vs Traditional Storage
--------------------------------

Traditional File System Limitations
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

* **Directory Size**: Large directories become slow
* **Single Point of Failure**: One server failure affects all data
* **Limited Scale**: Hard to add more storage capacity
* **Performance**: Slows down as more files are added

SeaweedFS Advantages
~~~~~~~~~~~~~~~~~~~~

* **No Directory Limits**: Can handle billions of files efficiently
* **Distributed**: Spread across many servers for reliability
* **Elastic**: Easy to add more storage servers
* **Fast Lookup**: Constant-time file lookup regardless of number of files

SeaweedFS Architecture
----------------------

Core Components
~~~~~~~~~~~~~~~

**Master Server**:

* **Role**: Coordinates the entire system
* **Responsibilities**:
  
  * Assigns file IDs to new files
  * Tracks which Volume Servers store which files
  * Manages Volume Servers and their capacity
  * Handles replication decisions

* **High Availability**: Can run multiple masters for redundancy

**Volume Server**:

* **Role**: Actually stores the file data
* **How it works**:
  
  * Stores files in "volumes" (large binary files)
  * Each volume can store many individual files
  * Replicates data to other volume servers for safety

* **Scalability**: Add more volume servers to increase storage capacity

**Filer (Optional)**:

* **Role**: Provides a traditional file system interface
* **Benefits**:
  
  * Makes SeaweedFS appear like a normal file system
  * Supports directories and file paths
  * Compatible with existing applications

* **Implementation**: Can use various storage backends for metadata

SeaweedFS on FreeBSD
--------------------

.. tip::
   It is recommended to configure seaweed from the UI.

Installation
~~~~~~~~~~~~

**From Packages**:

.. code-block:: bash

   # Install SeaweedFS
   pkg install seaweedfs

   # Or build from source (Go required)
   pkg install go
   go get github.com/seaweedfs/seaweedfs/weed

Basic Setup
~~~~~~~~~~~

**Start Master Server**:

.. code-block:: bash

   # Start master server
   weed master -port=9333 -mdir=/tank/seaweed/master

   # Start with high availability (multiple masters)
   weed master -port=9333 -peers=master1:9333,master2:9333,master3:9333 -mdir=/tank/seaweed/master

**Start Volume Server**:

.. code-block:: bash

   # Start volume server
   weed volume -port=8080 -dir=/tank/seaweed/volume1 -mserver=localhost:9333

   # Start with specific configuration
   weed volume -port=8080 -dir=/tank/seaweed/volume1 -max=100 -mserver=localhost:9333 -dataCenter=dc1 -rack=rack1

**Start Filer (Optional)**:

.. code-block:: bash

   # Start filer with leveldb backend
   weed filer -port=8888 -master=localhost:9333

   # Start with different metadata backend
   weed filer -port=8888 -master=localhost:9333 -leveldb2.dir=/tank/seaweed/filer

Advanced Configuration
~~~~~~~~~~~~~~~~~~~~~~

**Multiple Data Centers**:

.. code-block:: bash

   # Volume server in data center 1
   weed volume -port=8080 -dir=/tank/seaweed/dc1 -mserver=master:9333 -dataCenter=dc1 -rack=rack1

   # Volume server in data center 2  
   weed volume -port=8081 -dir=/tank/seaweed/dc2 -mserver=master:9333 -dataCenter=dc2 -rack=rack1

**Replication Configuration**:

.. code-block:: bash

   # Start with replication settings
   # 000: no replication
   # 001: replicate once in same rack
   # 010: replicate once in same data center
   # 100: replicate once in different data center
   weed volume -port=8080 -dir=/tank/seaweed/volume -mserver=localhost:9333 -defaultReplication=010

Understanding SeaweedFS Features
--------------------------------

Volume Management
~~~~~~~~~~~~~~~~~

**What are Volumes?**:

* Large files (typically 8GB) that store many individual files
* Similar to how a CD contains many music files
* Allows efficient storage of small files without file system overhead

**Volume States**:

* **Writable**: Can accept new files
* **ReadOnly**: Full volumes that only serve existing files
* **Compacting**: Being optimized to reclaim space from deleted files

File ID System
~~~~~~~~~~~~~~

**File ID Structure**: ``3,01637037d6``

* **Volume ID** (3): Which volume contains the file
* **File Key** (01637037d6): Unique identifier within the volume
* **Cookie**: Optional security token

**File Lookup Process**:

1. Client requests file: ``3,01637037d6``
2. Master server responds: "Volume 3 is on servers A and B"
3. Client directly contacts server A or B for the file
4. Volume server returns the file data

Replication and Fault Tolerance
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

**Replication Levels**:

* **No Replication (000)**: Single copy, highest performance, highest risk
* **Same Rack (001)**: Two copies in same rack, good for disk failures
* **Same DC (010)**: Two copies in same data center, good for server failures
* **Different DC (100)**: Two copies in different data centers, good for site failures

**Automatic Failover**:

* If a volume server fails, clients automatically use replica servers
* Master server detects failed servers and redirects traffic
* Failed volumes are automatically repaired when servers return

SeaweedFS Performance Features
------------------------------

Caching Strategies
~~~~~~~~~~~~~~~~~~

**Volume Server Caching**:

* Frequently accessed files cached in memory
* Operating system page cache utilized
* SSD caching for "warm" data

**Client-Side Caching**:

.. code-block:: bash

   # Mount with caching options
   weed mount -filer=localhost:8888 -dir=/mnt/seaweed -cacheDir=/tmp/cache -cacheCapacityMB=1000

**CDN Integration**:

* SeaweedFS can work behind CDNs
* Perfect for serving static content globally
* Automatic cache invalidation support

Performance Optimizations
~~~~~~~~~~~~~~~~~~~~~~~~~

**Concurrent Operations**:

* Multiple files uploaded/downloaded simultaneously
* Parallel operations across multiple volume servers
* Efficient handling of many small files

**Network Optimizations**:

.. code-block:: bash

   # Configure for high-performance networks
   weed volume -port=8080 -dir=/tank/seaweed -mserver=localhost:9333 -readTimeout=3s -max=1000

S3 Compatibility
----------------

SeaweedFS includes an S3-compatible gateway, allowing it to work with existing S3 tools and applications.

S3 Gateway Setup
~~~~~~~~~~~~~~~~

.. code-block:: bash

   # Start S3 gateway
   weed s3 -port=8333 -filer=localhost:8888

   # Start with authentication
   weed s3 -port=8333 -filer=localhost:8888 -config=/etc/seaweedfs/s3.json

Using S3 API
~~~~~~~~~~~~

.. code-block:: bash

   # Configure aws-cli
   aws configure --profile seaweed
   # AWS Access Key ID: admin-access-key
   # AWS Secret Access Key: admin-secret-key  
   # Default region name: us-east-1
   # Default output format: json

   # Use SeaweedFS via S3 API
   aws --profile seaweed --endpoint-url http://localhost:8333 s3 mb s3://my-bucket
   aws --profile seaweed --endpoint-url http://localhost:8333 s3 cp file.txt s3://my-bucket/

Virtual Machine Storage with SeaweedFS
--------------------------------------

VM Image Storage
~~~~~~~~~~~~~~~~

**Storing VM Disks**:

.. code-block:: bash

   # Upload VM disk image
   curl -F "file=@vm-disk.qcow2" "http://localhost:8080/submit"
   # Returns: {"fileId":"3,01637037d6","fileName":"vm-disk.qcow2","fileUrl":"localhost:8080/3,01637037d6","size":1073741824}

   # Download VM disk image
   curl "http://localhost:8080/3,01637037d6" -o vm-disk.qcow2

**Via S3 Interface**:

.. code-block:: bash

   # Store VM template
   aws --endpoint-url http://localhost:8333 s3 cp ubuntu-template.qcow2 s3://vm-templates/

   # Store VM snapshots
   aws --endpoint-url http://localhost:8333 s3 cp vm-snapshot.qcow2 s3://vm-snapshots/$(date +%Y%m%d)/

Benefits for VM Storage
~~~~~~~~~~~~~~~~~~~~~~~

* **Massive Scale**: Store thousands of VM images efficiently
* **Global Distribution**: Access VM images from multiple data centers
* **Cost Effective**: Efficient storage of large VM files
* **S3 Compatibility**: Works with existing S3-based tools
* **Fast Access**: Quick retrieval of VM images for deployment

Performance Considerations
~~~~~~~~~~~~~~~~~~~~~~~~~~

* **Large Files**: Optimized for large VM disk images
* **Sequential Access**: Good performance for VM boot sequences
* **Caching**: Important for frequently accessed VM templates
* **Network Bandwidth**: Performance depends on available network bandwidth

When to Use SeaweedFS
---------------------

Ideal Scenarios
~~~~~~~~~~~~~~~

* **Massive File Storage**: Storing millions or billions of files
* **Media Storage**: Photos, videos, audio files
* **Content Distribution**: Static content for websites or applications
* **Backup Storage**: Large-scale backup solutions
* **Object Storage**: When you need S3-compatible object storage
* **Multi-Data Center**: When you need geographic distribution

Consider Alternatives When
~~~~~~~~~~~~~~~~~~~~~~~~~~

* **Small Scale**: Traditional file systems might be simpler for small deployments
* **Relational Data**: Use databases for structured, relational data
* **High-Frequency Updates**: Files that change very frequently
* **Complex Queries**: When you need complex search capabilities
* **POSIX Compliance**: Applications requiring full POSIX file system semantics

Storage Protocol Comparison and Selection Guide
===============================================

Performance Comparison
----------------------

Latency (Lower is Better)
~~~~~~~~~~~~~~~~~~~~~~~~~

1. **iSCSI**: ~1-2ms (direct block access)
2. **NFS**: ~2-5ms (file system overhead)
3. **SMB**: ~3-8ms (depends on version and features)
4. **SeaweedFS**: ~5-15ms (object storage overhead)
5. **MooseFS**: ~10-30ms (distributed architecture)
6. **S3**: ~20-100ms (REST API overhead)

Throughput (Higher is Better)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

1. **iSCSI**: Up to network limit (excellent for large sequential I/O)
2. **SMB3**: Near network limit (with SMB Direct)
3. **NFS**: High throughput with proper tuning
4. **SeaweedFS**: High aggregate throughput
5. **MooseFS**: Scalable with cluster size
6. **S3**: Variable (depends on implementation)

Scalability Comparison
----------------------

Horizontal Scaling (Adding More Servers)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

* **Excellent**: MooseFS, SeaweedFS, S3 (designed for scale-out)
* **Good**: NFS (with clustering), SMB (with DFS)
* **Limited**: iSCSI (limited by target capabilities)

Vertical Scaling (More Powerful Servers)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

* **Excellent**: iSCSI, NFS, SMB
* **Good**: S3, SeaweedFS
* **Limited**: MooseFS (distributed by design)

Security Comparison
-------------------

Built-in Encryption
~~~~~~~~~~~~~~~~~~~

* **Excellent**: SMB3 (end-to-end), S3 (various options)
* **Good**: NFS (with Kerberos), SeaweedFS (HTTPS + data at rest)
* **Basic**: iSCSI (requires IPSec), MooseFS (TLS between components)

Authentication Strength
~~~~~~~~~~~~~~~~~~~~~~~

* **Strongest**: NFS + Kerberos, SMB + Active Directory
* **Strong**: S3 (IAM), SeaweedFS (JWT)
* **Moderate**: iSCSI (CHAP)
* **Basic**: MooseFS (IP-based)

Use Case Recommendations
------------------------

Virtual Machine Storage
~~~~~~~~~~~~~~~~~~~~~~~

* **Best**: iSCSI (high performance, native support)
* **Good**: NFS (traditional choice, good compatibility)
* **Specific Cases**: SMB (Windows environments), S3/SeaweedFS (cloud-native)

File Sharing
~~~~~~~~~~~~

* **Windows**: SMB/CIFS (native protocol)
* **Linux/UNIX**: NFS (native protocol)
* **Mixed**: SMB or NFS with proper configuration

Backup and Archive
~~~~~~~~~~~~~~~~~~

* **Best**: S3/SeaweedFS (cost-effective, scalable)
* **Good**: MooseFS (distributed, scalable)
* **Traditional**: NFS/SMB (familiar management)

High-Performance Computing
~~~~~~~~~~~~~~~~~~~~~~~~~~

* **Best**: iSCSI (low latency, high throughput)
* **Alternative**: NFS (if file-level access needed)

Web Content
~~~~~~~~~~~

* **Best**: SeaweedFS, S3 (CDN integration, global distribution)
* **Traditional**: NFS/SMB (familiar tools)

Database Storage
~~~~~~~~~~~~~~~~

* **Best**: iSCSI (direct block access preferred by databases)
* **Alternative**: NFS (for some database types)

Decision Matrix
===============

When choosing a storage protocol, consider these factors:

Primary Factors
---------------

1. **Performance Requirements**: How fast does storage need to be?
2. **Scale Requirements**: How much data and how many users?
3. **Environment**: Windows, Linux, mixed, or cloud?
4. **Skills**: What protocols does your team know?
5. **Hardware**: What equipment do you have or can buy?

Secondary Factors
-----------------

1. **Security Requirements**: What level of security is needed?
2. **Availability Requirements**: How much downtime is acceptable?
3. **Budget**: What are the cost constraints?
4. **Future Growth**: How will requirements change?

FreeBSD-Specific Considerations
===============================

Native Support
--------------

* **Excellent**: NFS, iSCSI (built into FreeBSD)
* **Good**: SMB (Samba), S3/SeaweedFS (third-party but mature)
* **Community**: MooseFS (smaller user base on FreeBSD)

ZFS Integration
---------------

* **Excellent**: iSCSI (ZVols), NFS (datasets)
* **Good**: SMB (Samba with ZFS)
* **Possible**: SeaweedFS, S3, MooseFS (can use ZFS as backend)

Performance on FreeBSD
----------------------

* All protocols perform well on FreeBSD
* FreeBSD's network stack is highly optimized
* ZFS integration provides additional benefits

Conclusion
==========

Each storage protocol has its strengths and ideal use cases. The key is matching the protocol to your specific requirements:

Protocol Selection Summary
--------------------------

* **Choose iSCSI** for high-performance virtual machines and databases
* **Choose NFS** for traditional UNIX file sharing and general purpose storage
* **Choose SMB** for Windows environments and mixed networks
* **Choose S3/SeaweedFS** for web applications and massive scale object storage
* **Choose MooseFS** for distributed file systems with high availability requirements

.. important::
   Remember that you don't have to choose just one protocol. Many environments use multiple protocols for different use cases, such as iSCSI for VM storage, NFS for user files, and S3 for backups and archives.

.. tip::
   The most important thing is to understand your requirements and choose the protocol that best meets those needs while considering your team's expertise and existing infrastructure.

.. warning::
   Always test performance and compatibility in your specific environment before making final decisions on storage protocols.