=============================
Storage & Data Management
=============================

.. contents:: Table of Contents
   :depth: 3
   :local:

Overview
========

Karios delivers a fully GUI-driven ZFS storage management experience. All ZFS operations—pool creation, disk management, dataset/zvol provisioning, snapshots, compression, deduplication, encryption, and VM disk integration—are abstracted behind RESTful APIs and presented in a user-friendly interface. This design empowers users to manage complex storage workflows without command-line expertise, while the backend ensures robust validation, error handling, and security.

Storage Architecture & End-to-End Flow
======================================

The architecture is built around a modular backend that exposes granular ZFS operations as APIs, orchestrated by the GUI in logical, stepwise flows:

1. **Disk Discovery & Preparation**
   - The system scans for available disks, filters out those already in use, and presents candidates for pool creation.
   - When a user selects disks, the backend wipes, partitions, and prepares them for ZFS, ensuring reliability and compatibility.

2. **Pool Creation & Device Management**
   - Users create ZFS pools by selecting disks and configuration options (RAID type, cache/log devices).
   - The backend validates selections, executes ZFS pool creation, and updates the pool with L2ARC (cache) or SLOG (log) devices as needed.

3. **Dataset & Zvol Provisioning**
   - Users create datasets for file storage or zvols for block devices (VM disks) via the GUI.
   - The backend handles creation, property assignment (compression, deduplication), and returns status and details to the GUI.

4. **Snapshot & Backup Management**
   - Snapshots of datasets/zvols can be taken for backup or rollback, with metadata tracked for restore/delete operations.

5. **VM Disk Integration**
   - VM disk operations (attach, detach, reassign) are managed via zvol provisioning and config updates, all exposed as simple GUI actions.
   - Unused disks are identified and presented for cleanup or reassignment.

6. **Performance & Tuning**
   - ARC cache size and device management are exposed for advanced users, with recommendations and safe defaults.
   - The backend reads and sets system parameters, ensuring optimal performance.

7. **Security & Encryption**
   - Encryption key management is integrated, allowing users to lock/unlock datasets securely.
   - All sensitive operations are permission-controlled and logged.

This end-to-end flow ensures that even complex ZFS storage operations are accessible and manageable through the Karios GUI, with backend APIs handling validation, error reporting, and system integration.

Setup and Workflow
==================

The following workflow describes how a typical storage operation is performed in Karios:

1. **User Action in GUI**: The user initiates an operation (e.g., create pool, add disk, take snapshot) via the web interface.
2. **API Request**: The GUI sends a RESTful API request to the backend, specifying the desired action and parameters.
3. **Backend Processing**: The backend validates permissions, checks input, and executes the corresponding ZFS/system command.
4. **Result & Feedback**: The backend returns structured results (success, error, status) to the GUI, which updates the user view and provides actionable feedback.
5. **Audit & Security**: All operations are logged, and sensitive actions require appropriate permissions.

This modular workflow allows for extensibility, automation, and integration with other Karios modules (e.g., VM management, monitoring).

API Endpoints
=============

All endpoints are grouped under ``/storage/zfs``. Each endpoint is mapped to a backend service function, which performs permission checks, input validation, and invokes the appropriate ZFS or system command. Responses are structured and errors are handled gracefully.

ZFS Pool Management
-------------------

.. list-table::
   :widths: 35 15 50
   :header-rows: 1

   * - Endpoint
     - Method
     - Description
   * - ``/storage/zfs/pools``
     - GET
     - Returns a list of all ZFS pools on the system, including their status and configuration details.
   * - ``/storage/zfs/available_disks``
     - GET
     - Provides a list of disks available for new pool creation, filtering out those already in use or unsuitable.
   * - ``/storage/zfs/create_pool``
     - POST
     - Creates a new ZFS pool with the specified disks and configuration, preparing disks as needed.
   * - ``/storage/zfs/destroy_pool/:pool_name``
     - DELETE
     - Destroys the specified ZFS pool and cleans up associated resources.
   * - ``/storage/zfs/pool_status/:pool_name``
     - GET
     - Returns detailed health and configuration status for the specified ZFS pool.

Dataset and Zvol Management
---------------------------

.. list-table::
   :widths: 35 15 50
   :header-rows: 1

   * - Endpoint
     - Method
     - Description
   * - ``/storage/zfs/list``
     - GET
     - Lists all datasets and zvols in a pool, including usage and mount information.
   * - ``/storage/zfs/create_dataset``
     - POST
     - Creates a new dataset under a specified pool for file storage.
   * - ``/storage/zfs/create_zvol``
     - POST
     - Creates a new zvol (block device) under a specified pool, typically for VM disk use.
   * - ``/storage/zfs/destroy_dataset``
     - DELETE
     - Destroys a specified dataset or zvol, freeing up space and resources.
   * - ``/storage/zfs/take_snapshot``
     - POST
     - Takes a snapshot of a dataset or zvol for backup or rollback purposes.

Compression and Deduplication
-----------------------------

.. list-table::
   :widths: 35 15 50
   :header-rows: 1

   * - Endpoint
     - Method
     - Description
   * - ``/storage/zfs/set_compression``
     - POST
     - Sets the compression property for a dataset to optimize storage usage.
   * - ``/storage/zfs/get_compression``
     - GET
     - Retrieves the current compression setting for a dataset.
   * - ``/storage/zfs/set_dedup``
     - POST
     - Sets the deduplication property for a dataset to reduce duplicate data.
   * - ``/storage/zfs/get_dedup``
     - GET
     - Retrieves the current deduplication setting for a dataset.

Datastore Management
--------------------

.. list-table::
   :widths: 35 15 50
   :header-rows: 1

   * - Endpoint
     - Method
     - Description
   * - ``/storage/zfs/datastore/list``
     - GET
     - Lists all configured datastores available for VM and storage operations.
   * - ``/storage/zfs/datastore/add``
     - POST
     - Adds a new datastore by creating a ZFS dataset and registering it for use.
   * - ``/storage/zfs/datastore/remove/:name``
     - DELETE
     - Removes a datastore and its underlying ZFS dataset from the system.

VM Disk Management
------------------

.. list-table::
   :widths: 35 15 50
   :header-rows: 1

   * - Endpoint
     - Method
     - Description
   * - ``/storage/zfs/vm/attach_disk``
     - POST
     - Creates and attaches a new disk (zvol) to a VM, updating its configuration.
   * - ``/storage/zfs/vm/detach_disk``
     - DELETE
     - Detaches a disk from a VM and updates its configuration.
   * - ``/storage/zfs/vm/reassign_disk``
     - POST
     - Reassigns a disk from one VM to another, handling detachment, renaming, and attachment.
   * - ``/storage/zfs/vm/unused_disks/:vmname``
     - GET
     - Lists disks that are not currently attached to the specified VM, available for cleanup or reassignment.

ARC, L2ARC, and SLOG Management
-------------------------------

.. list-table::
   :widths: 35 15 50
   :header-rows: 1

   * - Endpoint
     - Method
     - Description
   * - ``/storage/zfs/arc_info``
     - GET
     - Returns current and recommended ZFS ARC cache size and system RAM info for performance tuning.
   * - ``/storage/zfs/set_arc_max``
     - POST
     - Sets the maximum size of the ZFS ARC cache for the system.
   * - ``/storage/zfs/l2arc/add``
     - POST
     - Adds a cache device (L2ARC) to a ZFS pool to improve read performance.
   * - ``/storage/zfs/device/remove``
     - DELETE
     - Removes a device from a ZFS pool, including cache or log devices.
   * - ``/storage/zfs/slog/add``
     - POST
     - Adds a log device (SLOG) to a ZFS pool for write acceleration and data safety.

Encryption Management
---------------------

.. list-table::
   :widths: 35 15 50
   :header-rows: 1

   * - Endpoint
     - Method
     - Description
   * - ``/storage/zfs/load_key``
     - POST
     - Loads the encryption key for a dataset and mounts it, making encrypted data accessible.
   * - ``/storage/zfs/unload_key``
     - POST
     - Unloads the encryption key and unmounts the dataset, securing its contents.

Integration
===========

* RESTful APIs for storage management and monitoring, mapped to backend service logic and ZFS commands.
* Integration with VM and node management, supporting dynamic disk provisioning and lifecycle operations.
* Secure, permission-based access to all endpoints, with audit logging and error handling.

Security and Maintenance
========================

* Disk preparation and secure wiping before pool creation, using system commands and backend validation.
* Encryption key management for sensitive datasets, with permission checks and audit logging.
* Data validation and error handling in backend and API, ensuring reliable and secure operations.
