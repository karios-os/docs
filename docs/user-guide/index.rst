User Guide
==========

.. meta::
   :description: Comprehensive user guide for Karios hyper-converged infrastructure platform
   :keywords: Karios, user guide, virtualization, management, API

Getting Started as a User
-------------------------

This section guides you through accessing and validating your Karios system.

Accessing the System - Logging In & Registration
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

**Logging In**

To access the Karios management interface, open a supported web browser (Chrome or Safari – current year release recommended). Navigate to the Karios management URL and you'll see a login screen.

**Default Administrator Account**

- **Username**: ``admin``
- **Password**: Use the generated password

.. note::
   The system-generated password can be retrieved directly from your node using the steps below.

**Alternative Password Retrieval Method**

1. **SSH Access to Node**

   Access your node via command line using SSH:

   .. code-block:: bash

      ssh root@192.168.xxx.xxx

   Default Password: ``adminadmin``

2. **Retrieve Generated Password**

   Once logged in, execute the following command to display the GUI password:

   .. code-block:: bash

      cat /root/karios_install_info.txt

3. **Access GUI with Retrieved Password**

   - Copy the password displayed in the file
   - Navigate to the Karios web interface in your browser
   - Enter credentials:
     
     - Username: ``admin``
     - Password: Paste the copied password from the file
   
   - Access Level: Full administrative privileges (complete system access)

.. important::
   Use these credentials initially to explore the application's full capabilities, but immediately change them after your first login.

**Login Process**

1. **Open Web Browser**: Launch a supported web browser (Chrome or Safari current year release)
2. **Navigate to Karios**: Enter the Karios management interface URL
3. **Enter Credentials**: Input username and password in the login form
4. **Sign In**: Click the "Sign in" button to access the system

**New User Registration**

1. **Sign Up Option**: Click "New User? Sign Up" link on the login page
2. **Complete the registration form** with required details:

   - Username: A unique username for system identification
   - Email Address: A valid email address (used for account verification)
   - First Name: Your first name
   - Last Name: Your last name
   - Password: A strong, secure password that meets the system requirements
   - Confirm Password: Re-enter your password to verify it

3. **Account Creation**: Click "Sign Up" to create the new user account

.. note::
   New users are granted read-only access by default. Contact a system administrator for permission upgrades if needed.

**Access Level Considerations**

- **Read-Only Access**: New registered users have limited read-only permissions
- **Administrative Access**: Full system capabilities require administrative privileges
- **Permission Management**: Contact system administrators for permission upgrades
- **Security Best Practice**: Use administrative accounts only when necessary

**Account Management & Security**

- To return to the login page, click "Existing User? Login."
- **Password Security is Critical**: Implement strong password policies for all accounts. Change your password regularly.
- **Account Recovery**: If you forget your password, contact a system administrator for assistance.
- **Administrative Account Usage**: Use administrative accounts only when necessary and change the default admin credentials immediately after initial login.

License Validation (Mandatory)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

License validation is required before you can access all Karios features.

**License Validation Process**

After successful login, the system will display the "Access Karios" license validation modal with the following steps:

**Step 1: Copy License Token**

1. After logging in, a "Access Karios" license validation modal will appear
2. The system displays a unique license token
3. Click the "Copy" button to copy this token to your clipboard. Keep this token secure
4. Click on the highlighted link to access the "license request portal"

**Step 2: Generate License File**

1. Navigate to the Karios payment portal website to request license
2. Verify the payment details and click "proceed"
3. Locate the "License Token" or "Token" input field and paste the copied license token

   **Necessary details:**
   
   - First Name: Your first name
   - Email: Unique email id
   - Token: Your copied token from karios GUI
   
   Click "proceed"

4. Review the contact details and click "proceed"
5. Enter the CAPTCHA code and click "Start Trial"
6. A confirmation page appears, indicating that you have successfully subscribed to the plan
7. After successful subscription, a license file will be sent to your registered email address. Download the file from your inbox

**Step 3: Upload License File**

1. Return to the Karios interface (the validation modal)
2. In the "Security Configuration File (JSON)" section, upload your downloaded license file using one of these methods:

   - Drag and drop the file into the designated area
   - Click "click to browse" and select the file from your computer

3. Verify that the file is uploaded correctly – you should see its filename and size displayed

**Step 4: Validate License**

1. Click the "Validate license" button
2. The system will process and validate your license file
3. Upon successful validation, you'll be redirected to the main dashboard

**License Information Display**

- **File Confirmation**: Successfully uploaded files show filename and file size
- **Validation Status**: Green checkmark indicates successful file upload
- **Error Handling**: The system will display errors if the license file is invalid or corrupted

Post-License Validation and Resource Management
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Upon successful license validation, you'll access the Karios Provisioning Center dashboard.

**Dashboard Overview**

- **Control Center**: Provides access to the main control center interface
- **Navigation Menu**: Offers quick access to key system components (Provisioning Center, Storage, Seaweed, ISO, Network, Event logs, Stats, Releases)
- **License Status**: Displays your license expiration date in the top banner
- **User Profile**: Allows you to manage your user settings and profile information
- **System Statistics**: Provides real-time system status and resource counters

**License Management and Monitoring**

The License Features modal provides three main tabs for comprehensive license management:

1. **Available Quota Tab**
   
   Monitor available resources and quota allocations

2. **Usage Tab**
   
   Current License Usage Tracking:
   
   - **Sockets Usage**: Total CPU sockets currently in use across the cluster
   - **Usage Display**: Shows actual socket consumption

3. **Update License Tab**
   
   License Renewal and Upgrades:
   
   - **Token Generation**: Copy token for license updates
   - **Portal Access**: Use token at payment portal to generate updated license
   - **File Upload**: Upload new JSON license file for updates
   - **License Processing**: System processes and applies license updates

Interface Overview
~~~~~~~~~~~~~~~~~~

**Main Dashboard Components**

After license validation and resource allocation, users have access to the following interface elements:

**Navigation Elements**

- **Control Center**: Main system management interface
- **Provisioning Center**: VM and resource provisioning tools
- **Storage**: Storage management and configuration
- **Seaweed**: Distributed file system
- **ISO**: Operating system image management and virtual media mounting
- **Network**: Network configuration and monitoring
- **Event Logs**: System event monitoring, and log management
- **Stats**: System statistics and performance metrics
- **Releases**: System release and update management

**System Status Indicators**

- **Discovered**: Number of discovered hardware components
- **Registered**: Number of registered systems
- **Provisioned**: Number of provisioned resources
- **Configured**: Number of configured systems

**Node Management**

- **Selected Server**: Current server selection
- **Server Information**: System details including make, model, and network configuration
- **Add-in Cards**: PCIe device information and availability
- **Power Management**: Power consumption and efficiency metrics
- **Network Interfaces**: Physical and virtual interface management

Basic Operations
~~~~~~~~~~~~~~~~

**Common User Tasks**

- **Dashboard Navigation**: Navigate between different system components using the main navigation menu
- **Status Monitoring**: Monitor real-time system status and health indicators
- **Information Viewing**: Access system information, documentation, and help resources
- **Search and Filters**: Use search and filtering tools for efficient navigation

**License Management**

- **License Monitoring**: Regular monitoring of license expiration dates
- **Renewal Planning**: Proactive license renewal to avoid service interruption
- **License Dashboard**: Access detailed license information and history
- **Compliance Tracking**: Ensure ongoing license compliance and usage

**System Monitoring**

- **Performance Metrics**: Monitor system performance and resource utilization
- **Alert Management**: Review and respond to system alerts and notifications
- **Health Indicators**: Monitor system health and operational status
- **Resource Tracking**: Track resource usage and capacity planning

Getting Full Access
~~~~~~~~~~~~~~~~~~~~

**Upgrading User Permissions**

To access the full capabilities of the Karios platform:

1. **Administrative Login**: Use the default admin credentials for complete access
2. **Permission Request**: Contact system administrators to upgrade user account permissions
3. **Role Assignment**: Request appropriate role assignment based on job responsibilities
4. **Access Validation**: Verify upgraded permissions through system access testing

**Security Considerations**

- **Principle of Least Privilege**: Request only the minimum permissions necessary for job functions
- **Regular Access Review**: Periodically review and validate user access permissions
- **Security Compliance**: Follow organizational security policies for account management
- **Administrative Coordination**: Coordinate with system administrators for permission changes

Web Interface Navigation
------------------------

Dashboard Overview
~~~~~~~~~~~~~~~~~~

The Karios web interface provides a comprehensive management dashboard with the following key areas:

- **Datacenter Hierarchy**: Navigate between different datacenters and control nodes using the left sidebar
- **Component Tabs**: Access major system components via the top navigation bar
- **Status Indicators**: Real-time status information and metrics displayed prominently
- **Action Buttons**: Primary actions like "Setup VM" accessible from the main interface

Datacenter Management
~~~~~~~~~~~~~~~~~~~~~

- **Datacenter Selection**: Use the datacenter dropdown to select and manage different datacenter environments
- **Control Node Overview**: The selected datacenter displays the active control node and provides access to all managed infrastructure components

Bare Metal Server Management
----------------------------

Server Discovery Process
~~~~~~~~~~~~~~~~~~~~~~~~

Karios provides automated bare metal server discovery through network scanning:

1. **Subnet Scanning**: Navigate to the scan section and enter the target subnet (e.g., ``192.168.111.0/24``)
2. **Initiate Scan**: Click the "Scan" button to begin automatic server discovery
3. **Discovery Results**: Discovered servers appear in the "Bare Metal Discovery" section

Server Lifecycle Management
~~~~~~~~~~~~~~~~~~~~~~~~~~~

Servers progress through distinct stages in the Karios management lifecycle:

**Stage 1: Discovered**
- Servers detected during network scanning
- Basic hardware information collected (BMC IP, Vendor)
- No management capabilities yet established
- Ready for credential configuration and registration

**Stage 2: Creds Set**
- Intermediate stage after credential configuration
- BMC credentials have been set but registration not yet complete
- Transitional state before full registration

**Steps to set credentials:**

1. Click on the highlighted edit icon for your discovered node
2. Enter the BMC credentials for your node
3. Click register to complete the registration process

**Stage 3: Registered**
- Servers added to the Karios management system
- BMC (Baseboard Management Controller) connectivity established
- Credentials configured and validated
- Ready for provisioning and configuration operations

**Stage 4: Provisioned and Configured**
- Management credentials are configured
- Remote management capabilities are enabled
- Server is ready for operating system deployment
- Operating system is installed and configured
- Server is ready for workload deployment
- Full management capabilities are available

**Management Actions**

Click on "more" to select actions:

- **Configure**: Installing all required services and packages to provide a ready-to-use node
- **Override BMC Status**: Cleans the existing file system and allows you to reprovision your node
- **Unregister**: The node will be removed from the GUI. Run the scan again to discover the node

Server Information Display
~~~~~~~~~~~~~~~~~~~~~~~~~~

The server management table provides comprehensive information:

- **BMC IP Address**: Management interface IP address
- **Vendor**: Hardware manufacturer (Dell, Supermicro, etc.)
- **Stage**: Current management stage
- **Last Updated**: Timestamp of last status update
- **Credentials**: Management credential status
- **Node IP**: Production network IP address
- **FQDN**: Fully qualified domain name
- **Actions**: Available management actions dropdown menu

Server Registration and Management
----------------------------------

Server Registration Process
~~~~~~~~~~~~~~~~~~~~~~~~~~~

To register a discovered server:

1. **Select Discovered Server**: Choose a server in "Discovered" stage
2. **Set Credentials**: Configure BMC credentials for remote management
3. **Credential Validation**: System validates BMC connectivity
4. **Registration Completion**: Server moves to "Registered" stage
5. **Management Access**: Server is now available for provisioning operations

Server Management Operations
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Once a server is registered, administrators can perform various management operations:

**Provision**
- Purpose: Provision and configure the registered server
- Process: Initiates the provisioning workflow including OS deployment
- Result: Server progresses through Provisioned to Configured stage

**Override BMC Status**
- Purpose: Reset server to previous management state
- Process: Deprovisions the server and reverts to registered state
- Use Case: Troubleshooting, reconfiguration, or maintenance operations

**Unregister**
- Purpose: Remove server from Karios inventory
- Process: Removes server registration and management capabilities
- Impact: Loss of remote management and monitoring capabilities

Node Level Storage Management
-----------------------------

Navigating to Node Level
~~~~~~~~~~~~~~~~~~~~~~~~
**Accessing Worker Node Components:** 
To access worker node level management, administrators must first navigate to the specific server they want to manage. This provides access to individual server components and detailed node-specific operations.

**Navigation Process:**

1. **Server Selection:** From the datacenter hierarchy in the left sidebar, select the specific worker node you want to manage

2. **Component Access:** Once a worker node is selected, the interface displays “Selected Server” with the server’s name(e.g., k00000)

3. **Component Tabs:** The worker node interface provides access to specialized component tabs designed for individual server management

**Node Component Overview:** The worker node interface provides access to the following key components:

- **Home:** Server dashboard with performance metrics and system information

- **ISO:** Node-specific ISO image management and mounting

- **Storage:** Local storage management and disk health monitoring

- **Monitoring:** Server-specific performance monitoring and analytics

- **Power:** Power consumption monitoring and energy efficiency metrics

- **Network:** Network interface management and connectivity status

- **Firewall:** Node-level firewall configuration and security policies

- **Security:** Server-specific security settings and compliance monitoring

- **Logs:** System logs and event monitoring for the individual server

**Interface Context:** When working at the worker node level, all operations and configurations apply specifically to the selected server, providing granular control over individual infrastructure components.

Home Dashboard
~~~~~~~~~~~~~~

**Worker Node Home Overview:** The Home tab serves as the primary dashboard for individual worker node management, providing comprehensive real-time metrics and system information essential for server administration and monitoring.

**Performance Metrics Dashboard:** The Home dashboard displays five key performance indicators in an intuitive card-based layout:


**System Uptime:**

- **Display Format:** Shows uptime in weeks, days, and hours format (e.g., “0W 0D 18H”)
- **Uptime Tracking:** Continuous monitoring of system availability since last restart
- **Reliability Indicator:** Provides quick assessment of system stability and availability
- **Color-coded Status:** Visual indicators for uptime duration and system health

**Efficiency Rating:**

- **Efficiency Score:** Displays overall system efficiency rating (e.g., “91”)
- **Performance Optimization:** Indicates how efficiently the server is utilizing resources
- **Energy Efficiency:** Reflects power consumption relative to performance output
- **Operational Insights:** Provides guidance for optimization opportunities

**CPU Utilization:**

- **Real-time CPU Usage:** Current CPU utilization percentage (e.g., “3.46%”)
- **Processing Load:** Indicates current computational workload on the server
- **Performance Monitoring:** Continuous tracking of CPU performance metrics
- **Capacity Planning:** Helps assess CPU capacity and usage patterns

**Storage Utilization:**

- **Storage Usage:** Current storage utilization percentage (e.g., “1.05%”)
- **Disk Capacity:** Indicates available storage space and usage trends
- **Storage Health:** Monitors storage system performance and availability
- **Capacity Management:** Assists with storage planning and optimization

**Memory Utilization:**

- **Memory Usage:** Current memory utilization percentage (e.g., “22.37%”)
- **RAM Consumption:** Indicates current memory usage and availability
- **Memory Performance:** Tracks memory allocation and usage patterns
- **Resource Optimization:** Helps optimize memory allocation for better performance

System  Information
^^^^^^^^^^^^^^^^^^^

**Hardware Information Display:** The System Information section provides comprehensive details about the server’s hardware configuration and specifications.

**System Specifications:**

- **Make:** Hardware manufacturer information (e.g., “Supermicro”)
- **Model:** Server model designation (e.g., “Super Server”)
- **Network Interface:** Primary network interface details with IP address and MAC address

  - **Interface Name:** Network interface identifier (e.g., “bnxt0”)
  - **IP Address:** Server’s network IP address (e.g., “192.168.116.111”)
  - **MAC Address:** Hardware MAC address (e.g., “7c:c2:55:e8:77:8c”)

**System Identity:**

- **Server Identification:** Complete server identification including network configuration
- **Hardware Fingerprint:** Unique hardware identifiers for system tracking
- **Network Configuration:** Network interface configuration and connectivity details


Add-in Card and PCIe Devices
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

**PCIe Expansion Monitoring:** The Add-in Card and PCIe Devices section provides real-time monitoring of expansion card slots and their current status.

**PCIe Slot Information:**

- **CPU SLOT1 PCI-E 4.0 X16:** PCIe slot specification with availability status
- **CPU SLOT2 PCI-E 4.0 X8:** Secondary PCIe slot with current status
- **CPU SLOT3 PCI-E 4.0 X16:** Third PCIe slot monitoring
- **CPU SLOT4 PCI-E 4.0 X8:** Fourth PCIe slot status

**Slot Status Monitoring:**

- **Available:** Indicates slots available for expansion cards
- **Occupied:** Shows slots currently in use with installed devices
- **Slot Specifications:** Detailed PCIe lane configuration and capabilities
- **Expansion Planning:** Assists with hardware expansion planning and compatibility

Power Monitoring
^^^^^^^^^^^^^^^^

**Real-time Power Metrics:** The Power section provides comprehensive power consumption monitoring and energy efficiency tracking.

**Power Consumption Metrics:**

- **Current:** Real-time current draw measurement (e.g., “0.34 A”)
- **Energy:** Cumulative energy consumption tracking (e.g., “15250.86 Wh (15.25 kWh)”)
- **Power:** Instantaneous power consumption (e.g., “38.53 W”)
- **Voltage:** Current voltage levels (e.g., “114.05 V”)

**Power Management Features:**

- **Energy Efficiency:** Track power usage effectiveness and optimization opportunities
- **Power Trends:** Historical power consumption patterns and analysis
- **Cost Monitoring:** Energy cost tracking and budgeting assistance
- **Environmental Impact:** Carbon footprint monitoring and sustainability metrics


Storage System Overview
^^^^^^^^^^^^^^^^^^^^^^^

**Storage Health Monitoring:** The Storage section provides comprehensive monitoring of all storage controllers and attached storage devices.

**NVMe SSD Controllers:**

- **Controller Model:** NVMe SSD controller specifications (e.g., “NVMe SSD Controller MAP1602 (DRAM-less)”)
- **Disk Information:** Individual disk identification and capacity (e.g., “nda0 - ORICO 1.02TB”)
- **Health Status:** Real-time health monitoring with status indicators (e.g., “Healthy”)
- **Multiple Disk Support:** Monitoring of multiple attached storage devices

**Other Storage Controllers:**

- **SATA Controllers:** Traditional SATA controller monitoring (e.g., “Raptor Lake SATA AHCI Controller”)
- **Storage Devices:** Individual storage device monitoring (e.g., “sda - Sample Disk (1TB)”)
- **Health Monitoring:** Comprehensive health status for all storage devices
- **Performance Tracking:** Storage performance metrics and optimization insights

Network Interface Management
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

**Physical Network Interfaces:** The Network section provides detailed information about all network interfaces configured on the server.

**Network Interface Information:**

- **Interface Model:** Network interface model identification (e.g., “bnxt0”, “bnxt1”)
- **MAC Address:** Hardware MAC address for each interface
- **IP Configuration:** Current IP address assignments and network configuration
- **Interface Status:** Current operational status of each network interface

**Virtual Network Interfaces:** The system also displays virtual network interfaces created for virtualization and network segmentation.

**Virtual Interface Details:**

- **Virtual Interface Names:** Virtual interface identifiers (e.g., “vm-default”, “vm-vlan115-sw”)
- **MAC Address Assignment:** Virtual MAC addresses for each interface
- **Network Segmentation:** Virtual network configuration for traffic isolation


**VLAN Configuration:** VLAN-specific virtual interfaces and their configurations

Chassis View
^^^^^^^^^^^^
**Physical Server Visualization:** The Chassis View provides a visual representation of the physical server hardware, helping administrators understand the physical layout and configuration.

**Chassis Display Features:**

- **3D Server Visualization:** Three-dimensional representation of the server chassis
- **Front Panel View:** Default front panel view of the server hardware
- **Hardware Identification:** Visual identification of physical server components
- **Physical Layout:** Understanding of physical component placement and accessibility

**Chassis Navigation:**

- **View Options:** Toggle between different chassis views (Front/Back)
- **Show Back Button:** Option to view the rear panel of the server
- **Hardware Mapping:** Visual correlation between logical and physical components
- **Physical Maintenance:** Assistance with physical hardware maintenance and identification

**Chassis View Benefits:**

- **Hardware Identification:** Quickly identify physical components and their locations
- **Maintenance Planning:** Plan physical maintenance and hardware replacement
- **Visual Reference:** Provide visual context for hardware troubleshooting
- **Documentation:** Visual documentation of server configuration and layout


ISO Management
~~~~~~~~~~~~~~

**ISO Operations:**

- **Download ISO:** Download ISO files using FQDN URL with appended ISO file path
- **Upload ISO:** Upload valid ISO files to the data center storage
- **RAW File Support:** Upload and manage RAW disk image files
- **File Selection:** Browse and select from available ISO and RAW files
- **Availability Tracking:** Real-time view of available ISO and RAW files

**ISO Management Features:**

- **Dual Upload Support:** Support for both ISO and RAW file formats
- **URL-based Downloads:** Download ISO files directly from FQDN URLs
- **File Browser Integration:** Integrated file selection interface
- **Availability Dropdown:** Dropdown menu displaying all available ISO and RAW files
- **Upload Status Monitoring:** Real-time upload progress and completion status
- **File Validation:** Automatic validation of uploaded ISO and RAW files

**ISO Management Interface:**


Virtual Machine Management
--------------------------

VM Creation Overview
~~~~~~~~~~~~~~~~~~~~

The "Setup VM" button provides access to virtual machine creation with two distinct deployment methods:

- **Standard VM Setup**: Traditional virtual machine configuration for FreeBSD, Windows 10, and Ubuntu
- **Cloud-Init Setup**: Automated VM deployment with cloud-init support for FreeBSD and Ubuntu

Standard VM Setup
~~~~~~~~~~~~~~~~~

**VM Configuration Process**

1. **Setup Method Selection**: Choose "Standard VM Setup" from the available options
2. **Server Selection**: Select the target server from available configured servers
3. **Basic Configuration**: Configure fundamental VM parameters
4. **Resource Allocation**: Set CPU, memory, and storage resources
5. **Network Configuration**: Configure network connectivity
6. **VM Creation**: Finalize and create the virtual machine

**Basic VM Configuration**

- **VM Name**: Specify a unique name for the virtual machine
- **Loader Configuration**: Select the appropriate boot loader for the operating system
- **Operating System**: Choose from supported OS options (FreeBSD, Windows 10, Ubuntu Linux)

**Resource Allocation**

Configure virtual machine resources based on requirements:

- **CPU Cores**: Select number of CPU cores from available range
- **Memory**: Allocate RAM from available server memory
- **CPU Sockets**: Configure CPU socket topology

**Storage Configuration**

- **Storage Pool**: Select from available storage pools
- **Disk Size**: Specify virtual disk size based on requirements

**Network Configuration**

- **Network Switch**: Select virtual network switch
- **Network Driver**: Choose network driver type for optimal performance
- **Network Adapter**: Configure virtual network adapter settings

Cloud-Init VM Setup
~~~~~~~~~~~~~~~~~~~

**Cloud-Init Overview**

Cloud-Init setup provides automated VM deployment with pre-configuration capabilities, supporting:

- **FreeBSD**: Automated FreeBSD deployment with cloud-init
- **Ubuntu**: Automated Ubuntu deployment with cloud-init integration

**Cloud-Init Configuration Process**

1. **Setup Method Selection**: Choose "Cloud-Init Setup" from available options
2. **Server Selection**: Select target server for VM deployment
3. **Basic VM Configuration**: Configure VM name, loader, and OS
4. **Resource Allocation**: Set CPU, memory, and storage parameters
5. **User Account Setup**: Configure initial user account and authentication
6. **Network Configuration**: Set network parameters (DHCP or static)
7. **VM Creation**: Deploy the cloud-init enabled virtual machine

**User Account Configuration**

Cloud-Init VMs require initial user account setup:

- **Username**: Primary user account for the VM
- **Password**: Secure password for user account authentication
- **SSH Public Key (Optional)**: Add SSH public key for passwordless authentication

**Network Configuration Options**

**DHCP Configuration (Default)**:
- Automatic IP address assignment
- Dynamic network configuration
- Simplified setup process

**Static IP Configuration**:
- Static IP Address: Manually specify IP address
- Subnet Mask: Configure network subnet mask
- Domain Name: Set domain name for the VM

VM Lifecycle Management
~~~~~~~~~~~~~~~~~~~~~~~

**VM Management Interface**

Once a VM is created, the VM management interface provides comprehensive control through several key sections:

- **Hardware Tab**: Configure VM hardware specifications and resources
- **Console Tab**: Direct console access to the virtual machine
- **Snapshots Tab**: Create and manage VM snapshots
- **Activity Logs Tab**: View VM operation history and logs

**VM Hardware Configuration**

The Hardware tab allows dynamic modification of VM specifications:

- **VM Details Configuration**: Adjust CPU and memory allocation
- **CD/DVD Drive Management**: Attach ISO images for installation or boot
- **Network Switch Management**: Configure network interfaces and switches
- **Virtual Disk Management**: Attach, detach, and manage virtual disks

**VM Power Operations**

Standard VM management operations include:

- **Start**: Power on the virtual machine
- **Stop**: Gracefully shut down the virtual machine
- **Restart**: Reboot virtual machine
- **Reset**: Force restart the virtual machine
- **Rename**: Create a new name for the virtual machine
- **Power Off**: Force power off the virtual machine
- **Clone**: Create VM copies for testing or deployment
- **Snapshot**: Create point-in-time VM snapshots
- **Delete**: Remove the virtual machine permanently

API Integration
---------------

API Authentication and Usage Guide
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

**Prerequisites**

- Postman installed
- Swagger/OpenAPI documentation for the API
- Valid user credentials

**Authentication Process**

1. **Login and Obtain Access Token**

   - Open Postman
   - Create a new POST request to the login/authentication endpoint
   - Set request type to POST
   - Enter the full authentication endpoint URL
   - In the request body, include username and password

2. **Configure Authentication Request**

   Set Headers:
   
   .. code-block:: http
   
      Content-Type: application/json

   Prepare JSON body with login credentials:
   
   .. code-block:: json
   
      {
        "username": "your_username",
        "password": "your_password"
      }

3. **Retrieve Access Token**

   - Send the login request
   - The response will contain an access token
   - Copy the access token from the response body

4. **Prepare API Request in Postman**

   - Create a new request for your desired API endpoint
   - Go to the "Authorization" tab
   - Select "Bearer Token" as the authorization type
   - Paste the copied access token in the token field

5. **Configure API Request**

   - Set the appropriate HTTP method (GET, POST, PUT, DELETE)
   - Enter the complete API endpoint URL
   - Add any required headers
   - Prepare request body if needed (for POST/PUT requests)

6. **Send the Request**

   - Click "Send" to execute the API call
   - Review the response status and body

Swagger API Documentation Guide
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

**Overview**

The Karios platform provides a comprehensive RESTful API interface accessible through Swagger UI, enabling developers and administrators to interact with all platform features programmatically.

**Step-by-Step API Access Guide**

**Step 1: Access Swagger Endpoint**

The Swagger UI provides an interactive interface for exploring and testing the Karios API.

Navigate to Swagger Interface:

.. code-block:: text

   http://192.168.116.132:8084/swagger/index.html

**Swagger Interface Components**

Upon accessing the Swagger interface, you'll see:

- **API Title and Version**: Displays the current API version
- **Server Information**: Shows the base URL for API calls
- **Authorization Section**: Located at the top-right corner
- **API Endpoints**: Organized by functional categories
- **Try it Out Buttons**: Interactive testing for each endpoint
- **Response Examples**: Sample request/response formats

**Step 2: Authentication - Obtain Access Token**

1. **Locate the Login API Endpoint**

   Find the User management Section and locate the "Login" endpoint

2. **Execute the Login Request**

   - Click "Try it out" button on the login endpoint
   - Enter Request Body with your credentials:

   .. code-block:: json

      {
        "username": "admin",
        "password": "admin"
      }

   - Click "Execute" to send the login request
   - Review the Response in the response section

**Step 3: Configure Bearer Token Authorization**

1. **Locate the Authorization Section**

   - Find the "Authorize" button at the top of the Swagger interface
   - Click the "Authorize" button to open the authorization dialog

2. **Configure Bearer Token Authentication**

   - Select "Bearer Auth" section
   - Enter the Bearer Token:

   .. code-block:: text

      Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...

   - Click "Authorize" to save the configuration

**Step 4: Test API Endpoints**

With authentication configured, you can now test all available API endpoints:

1. **Select an Endpoint**: Choose the desired API endpoint from the list
2. **Review Endpoint Information**: HTTP Method, URL Path, Parameters, Request Body, Response Codes
3. **Click "Try it out"**: This enables the interactive testing interface
4. **Configure Request Parameters**: Fill in required path variables, query parameters, request body
5. **Execute the Request**: Click the "Execute" button

**Best Practices**

- Always use HTTPS for API calls
- Keep access tokens confidential
- Refresh tokens as per the system's security policy
- Handle authentication errors gracefully
- Validate response status codes

**Troubleshooting**

- **401 Unauthorized**: Incorrect or expired token
- **403 Forbidden**: Insufficient permissions
- **400 Bad Request**: Incorrect request format

.. seealso::

   :doc:`../getting-started/installation`
       Complete installation guide
   
   :doc:`../getting-started/initial-configuration`
       Initial system configuration
       
   :doc:`../storage/index`
       Storage management documentation
       
   :doc:`../networking/index`
       Network configuration guide
