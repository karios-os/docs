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

Security Center Walkthrough
--------------------------

The Security Center provides a centralized interface for managing and monitoring your infrastructure's security posture. This walkthrough will guide you through the key features and functionalities available in the Security Center.

Accessing the Security Center
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   - Log in to the Karios platform
   - Navigate to the "Security" tab on any node in the node's main menu

   - The below image clearly indicates where to find the 'Security' tab on the interface.

   .. figure:: _static/images/security/security_tab_pointer.png
      :width: 600
      :alt: Security Tab Pointer

      Figure 1: Security Tab Pointer

Overview Dashboard
~~~~~~~~~~~~~~~~~~
   - The Security Centre Overview Dashboard displays a real-time snapshot of your security posture
   - Key metrics include risk percentage, system status, last scan status and top risk category.
   - The below image clearly shows where to find 'Scan' Button

   .. figure:: _static/images/security/security_scan_pointer.png
      :width: 600
      :alt: Security Scan Button

      Figure 2: Security Scan Button

Vulnerability Management
~~~~~~~~~~~~~~~~~~~~~~~~
   - Access the Vulnerability Management section to view and manage identified vulnerabilities
   - Use filters to sort vulnerabilities by severity

   - Scroll Down to view detailed vulnerabilities information along with remediation options, 
   - Please click on the vulnerability to know more information about it

   .. figure:: _static/images/security/security_vuln_info.png
      :width: 600
      :alt: Vulnerability Information

      Figure 3: Vulnerability Information

   - A Pop up for the Vulnerability will look this this

   .. figure:: _static/images/security/security_vuln_popup.png
      :width: 600
      :alt: Vulnerability Popup

      Figure 4: Vulnerability Popup

Remediation Actions
~~~~~~~~~~~~~~~~~~~
   - The Remediation Actions section allows you to initiate automated fixes for identified issues
   - Where to find the remediation option (if there are any vulnerabilities to remediate)

   .. figure:: _static/images/security/security_vuln_remediation_pointer_section.png
      :width: 600
      :alt: Vulnerability Remediation Pointer

      Figure 5: Vulnerability Remediation Pointer

Scan History
~~~~~~~~~~~~
   - The Scan History section provides a log of all security scans performed
   - Review past scan results and reports

   - Where to find the Scan History
   .. figure:: _static/images/security/security_navigate_to_history_page.png
      :width: 600
      :alt: Security Scan History Pointer

      Figure 6: Security Scan History Pointer

Security Centre History Page
~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   - The Security Centre History Page provides a metrics dashboard for previous scans performed.
   - Review historical reports in html and PDF formats.

   - You can find the previous scan details, risk score from earlier scan and other additional details in this Security Scan History Page.
   .. figure:: _static/images/security/security_history_page.png
      :width: 600
      :alt: Security History Page

      Figure 7: Security History Page

Security Report
~~~~~~~~~~~~~~~

   - Where to find the Security Report

   .. figure:: _static/images/security/security_report_pointer.png
      :width: 600
      :alt: Security Report Pointer

      Figure 8: Security Report Pointer

   - What's included in the Security Report

   .. figure:: _static/images/security/security_report_content.png
      :width: 600
      :alt: Security Report Content

      Figure 9: Security Report Content

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
