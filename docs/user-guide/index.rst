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
   **System Password Retrieval**
   The system generates a default password that can be retrieved directly from your node's command line interface. For step-by-step instructions, refer to `Obtaining UI Password from the CLI <https://docs.karios.ai/appendices/index.html>`_ in the documentation appendices.

.. important::
   Use these credentials initially to explore the application's full capabilities, but immediately change them after your first login.

**Login Process**

1. **Open Web Browser**: Launch a supported web browser (Chrome or Safari current year release)
2. **Navigate to Karios**: Enter the Karios management interface URL
3. **Enter Credentials**: Input username and password in the login form
4. **Sign In**: Click the "Sign in" button to access the system

.. figure:: _static/images/getting_started/login_process.png
      :width: 600
      :alt: Login Process

      Figure : Login Process

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
   New users are not granted any access by default. Contact a system administrator for permission upgrades if needed. Detailed instructions on how to provide access are available in the `Getting Full Access <https://docs.karios.ai/getting-started/index.html#getting-full-access>`_ section of the documentation.

**Access Level Considerations**

- **Read-Only Access**: New registered users have limited permissions
- **Administrative Access**: Full system capabilities require administrative privileges
- **Permission Management**: Contact system administrators for permission upgrades (Refer User Management & Permissions section)
- **Security Best Practice**: Use administrative accounts only when necessary

.. figure:: _static/images/getting_started/new_user_registration.png
      :width: 600
      :alt: New User Registration

      Figure : New User Registration

**Account Management & Security**

- To return to the login page, click "Existing User? Login."
- **Password Security is Critical**: Implement strong password policies for all accounts. Change your password regularly.

**2FA Setup Requirements**

Before proceeding, ensure you have:

* A smartphone or tablet with internet access
* One of the following authenticator apps installed:

  * **Google Authenticator** (iOS/Android)
  * **Microsoft Authenticator** (iOS/Android)
  * **Authy** (iOS/Android/Desktop)
  * **1Password** (with TOTP support)
  * **Bitwarden** (with authenticator feature)

.. tip::
   Authenticator apps generate time-based one-time passwords (TOTP) that change every 30 seconds, providing secure access even if your password is compromised.

**Setting Up 2FA**

1. **2FA Registration Prompt**

   * After successful admin login, you'll see the "Set up Two-Factor Authentication" screen

   .. figure:: _static/images/getting_started/2fa_mobile_registration_prompt.png
      :width: 600
      :alt: 2FA Mobile Registration Prompt

      Figure : 2FA Registration Prompt

   * The system displays: "You need to setup two-factor authentication to continue accessing your account."

2. **QR Code Display**

   * A unique QR code will be presented on the screen

   .. figure:: _static/images/getting_started/2fa_qr_code.png
      :width: 600
      :alt: 2FA QR Code

      Figure : 2FA QR Code

   * This QR code contains your account's secret key for generating time-based codes
   
   .. warning::
      This QR code is unique to your account and should not be shared with anyone or stored in unsecured locations.

3. **Configure Your Authenticator App**

   * Open your chosen authenticator app on your mobile device
   * Tap "Add Account" or the "+" button
   * Select "Scan QR Code" or "Scan Barcode"
   * Point your device's camera at the QR code displayed on screen
   * Your authenticator app will automatically configure the account

4. **Manual Entry Option** (if QR scanning fails)

   * Select "Enter Code Manually" in your authenticator app
   * Enter the following information:

     * **Account Name**: Your admin username
     * **Secret Key**: The alphanumeric code displayed below the QR code
     * **Time-based**: Ensure this option is selected (30-second intervals)

   .. note::
      Manual entry is useful when camera scanning isn't available or when setting up 2FA on multiple devices.

5. **Verify 2FA Setup**

   * Your authenticator app will immediately start generating 6-digit codes
   * Enter the current 6-digit code from your app into the "Verification Code" field

   
   .. figure:: _static/images/getting_started/2fa_enter_code.png
      :width: 600
      :alt: 2FA Enter Code

      Figure : 2FA Enter Code
   
   * Click "Verify and Enable 2FA"

   .. tip::
      If the first code doesn't work, wait for the next 30-second cycle and try the new code. Clock synchronization between your device and the server is important for successful verification.

6. **Backup Codes Generation**

   * Upon successful verification, the system generates backup recovery codes
   * Download or print the backup codes and store them in a secure location

   .. figure:: _static/images/getting_started/2fa_backup_codes.png
      :width: 600
      :alt: 2FA Backup Codes

      Figure : 2FA Backup Codes

   .. important::
      Save these backup codes securely - they allow account recovery if you lose your device. Each backup code can only be used once, so treat them like passwords and store them safely.


Account Recovery:
~~~~~~~~~~~~~~~~~

If you forget your password, use the "Forgot Password?" link to initiate the recovery process.

.. figure:: _static/images/getting_started/forgot_password.png
   :width: 600
   :alt: Forgot Password

   Figure : Forgot Password

Give your username to initiate a reset password request.

.. figure:: _static/images/getting_started/forgot_password_enter_username.png
   :width: 600
   :alt: Forgot Password Enter Username

   Figure : Forgot Password Enter Username

If a device is configured , please choose one from the list.

.. figure:: _static/images/getting_started/forgot_password_choose_device.png
   :width: 600
   :alt: Forgot Password Choose Device

   Figure : Forgot Password Choose Device

Give your 2FA code to reset your password.

.. figure:: _static/images/getting_started/forgot_password_enter_2fa.png
   :width: 600
   :alt: Forgot Password Enter 2FA

   Figure : Forgot Password Enter 2FA

Once 2FA is verified, you will be able to reset your password. Give your new password and confirm it.

.. figure:: _static/images/getting_started/forgot_password_reset_password.png
   :width: 600
   :alt: Forgot Password Reset To New Password

   Figure : Forgot Password Reset To New Password

Your password has been reset successfully. You can now log in with your new password.

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

.. figure:: _static/images/getting_started/request_license.png
      :width: 600
      :alt: License Request Portal

      Figure : License Request Portal

**Step 2: Generate License File**

1. Navigate to the Karios payment portal website to request license
2. Verify the payment details and click "proceed"

.. figure:: _static/images/getting_started/zoho_init_license_proceed.png
      :width: 600
      :alt: Proceed After Payment 

      Figure : Proceed After Payment

3. Locate the "License Token" or "Token" input field and paste the copied license token

   **Necessary details:**
   
   - First Name: Your first name
   - Email: Unique email id
   - Token: Your copied token from karios GUI
   
   Click "proceed"

.. figure:: _static/images/getting_started/zoho_user_details.png
      :width: 600
      :alt: Enter User Details

      Figure : Enter User Details

4. Review the contact details and click "proceed"

.. figure:: _static/images/getting_started/zoho_license_click_proceed.png
      :width: 600
      :alt: Click Proceed

      Figure : Click Proceed

5. Enter the CAPTCHA code and click "Start Trial"

.. figure:: _static/images/getting_started/zoho_license_start_trial.png
      :width: 600
      :alt: Enter CAPTCHA

      Figure : Enter CAPTCHA

6. A confirmation page appears, indicating that you have successfully subscribed to the plan

.. figure:: _static/images/getting_started/zoho_license_confirmation.png
      :width: 600
      :alt: License Confirmation

      Figure : License Confirmation

7. After successful subscription, a license file will be sent to your registered email address. Download the file from your inbox


.. figure:: _static/images/getting_started/license_email.png
      :width: 600
      :alt: Download License File

      Figure : Download License File

**Step 3: Upload License File**

1. Return to the Karios interface (the validation modal)
2. In the "Security Configuration File (JSON)" section, upload your downloaded license file using one of these methods:

   - Drag and drop the file into the designated area
   - Click "click to browse" and select the file from your computer

3. Verify that the file is uploaded correctly, you should see its filename and size displayed


.. figure:: _static/images/getting_started/upload_license.png
      :width: 600
      :alt: Uploaded License File

      Figure : Uploaded License File

**Step 4: Validate License**

1. Click the "Validate license" button
2. The system will process and validate your license file
3. Upon successful validation, you'll be redirected to the main dashboard


.. figure:: _static/images/getting_started/license_success.png
      :width: 600
      :alt: License Validation Success

      Figure : License Validation Success

**License Information Display**

- **File Confirmation**: Successfully uploaded files show filename and file size
- **Validation Status**: Green checkmark indicates successful file upload
- **Error Handling**: The system will display errors if the license file is invalid or corrupted


.. note::

   It is critical to set BMC credentials for the node to enable fetching system updates and performing essential system calls.

**BMC Security Configuration**

.. danger::
   **CRITICAL SECURITY NOTICE**
   
   Before connecting your BMCs to the Provisioning Center, **secure their credentials immediately**. Using default passwords creates serious security vulnerabilities.

**Password Security Requirements**

.. warning::
   **Password Configuration - Critical Security Step**
   
   **Strong Password Requirements:**
   - At least 12 characters long
   - Mix of uppercase, lowercase, numbers, and symbols  
   - Avoid common words or personal information
   - Change regularly (recommended every 90 days)

.. error::
   **Do not skip this crucial security step!**
   
   Failure to secure BMC credentials before network connection exposes your infrastructure to potential compromise.

**Step 5: Set BMC Credentials**
How to set BMC credentials:

1. Navigate to the Provisioning Center, located at the top of the control node interface.
2. Edit the first node, which is automatically added during bootstrap.

.. figure:: _static/images/getting_started/set_bmc_credentials.png
      :width: 600
      :alt: BMC Credentials

      Figure : Navigate to set BMC Credentials

3. Update the node with the actual BMC credentials and click save.

.. figure:: _static/images/getting_started/update_bmc_credentials.png
      :width: 600
      :alt: BMC Credentials

      Figure : Update BMC Credentials

These credentials are essential for various system operations and updates.


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


**License Dashboard Access**

Access detailed license information through the "License Dashboard" button located in the top banner of the interface.

.. figure:: _static/images/getting_started/license_dashboard_access.png
   :alt: License Dashboard Interface
   :align: center

   Figure : License Dashboard Interface   

**License Features Management**

The License Features popup provides three main tabs for comprehensive license management:


1. **Available Quota Tab**
   
   Monitor available resources and quota allocations

.. figure:: _static/images/getting_started/available_quota.png
   :alt: Available Quota Tab
   :align: center


.. list-table::
   :widths: 20 50 30
   :header-rows: 1
   :align: center

   * - Resource Type
     - Description
     - Example Allocation
   * - Sockets
     - CPU sockets available for cluster-wide allocation
     - x remaining
   * - Power
     - Power management feature availability
     - x remaining
   * - Security
     - Security feature availability
     - x remaining

Available Resources Overview:

- **Total Sockets**: Total CPU sockets licensed for the cluster
- **Used Sockets**: Number of CPU sockets currently allocated to nodes
- **Available Sockets**: Remaining CPU sockets available for allocation
- **Power Features**: Total, used, and available Power features
- **Security Features**: Total, used, and available Security features

2. **Usage Tab**
   
   Current License Usage Tracking:
   
   - **Sockets Usage**: Total CPU sockets currently in use across the cluster
   - **Usage Display**: Shows actual socket consumption

   .. figure:: _static/images/getting_started/license_usage.png
      :alt: Usage Display
      :align: center


3. **Update License Tab**
   
   License Renewal and Upgrades:
   
   - **Token Generation**: Copy token for license updates
   - **Portal Access**: Use token at payment portal to generate updated license
   - **File Upload**: Upload new JSON license file for updates
   - **License Processing**: System processes and applies license updates

   .. figure:: _static/images/getting_started/update_license.png
      :alt: Update License Tab
      :align: center

   **Node-Level License Management**

   **Add Licensed Features**

   Each registered node displays an “Add licensed features” button, allowing you to allocate specific features to individual nodes.

   .. figure:: _static/images/getting_started/add_license_features.png
      :alt: Add Features Tab
      :align: center

   **License Management for Nodes**

   Access node-level license management via the “License Management - [node-name]” modal. This modal provides two main tabs:

   - **Currently Used Tab**: Displays the current resource allocation for the selected node.

   .. figure:: _static/images/getting_started/currently_used.png
      :alt: Currently Used Tab
      :align: center

   - **Add Features Tab**: Allows allocation of available cluster resources (such as CPU sockets, Power, and Security features) to the node.

   .. figure:: _static/images/getting_started/add_features_tab.png
      :alt: Add Features Tab
      :align: center

   If all resources have been allocated, the interface will display “No features available to add.”

   To add a feature, select the toggle next to the desired feature and click “Add Feature.”

   License Monitoring and Alerts
   The system continuously monitors license status and resource allocation:

   - **License Status Indicators**: Proactive notifications show days remaining until license expiration.
   - **License Dashboard Access**: Quickly access detailed license information from the dashboard
   - **Resource Tracking**: Monitor real-time resource usage versus available quota.

   Resource Allocation Management

   - **Cluster-Wide Licensing**: License resources are shared across the entire cluster.
   - **CPU Socket Allocation**: Distribute available CPU sockets among multiple nodes.
   - **Feature Distribution**: Allocate Power and Security features to required nodes.
   - **Usage Monitoring**: Track actual resource consumption across the infrastructure.

   License Renewal Process
 

   Renew your license in the following scenarios:

   - **Expiration Approach**: When license expiration warnings appear in the dashboard.
   - **Feature Upgrades**: When additional resources or features are needed.
   - **Capacity Expansion**: When adding new nodes that require licensing.


   **Renewal Steps** (Please Refer to “Update License Tab”):

   1. Access the Update License tab: Navigate to License Features → Update License.
   2. Generate Token: Copy the system-generated token.
   3. Portal Processing: Use the token at the payment portal for renewal or upgrade.
   4. Download New License: Obtain the updated JSON license file.
   5. Upload and Validate: Upload the new license file and validate it.
   6. Resource Availability: Newly licensed resources become immediately available for allocation.



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

.. figure:: _static/images/getting_started/navigation_elements.png
   :width: 600
   :alt: Navigation Elements
   :align: center


**System Status Indicators**

- **Discovered**: Number of discovered hardware components
- **Registered**: Number of registered systems
- **Provisioned**: Number of provisioned resources
- **Configured**: Number of configured systems

.. figure:: _static/images/getting_started/system_status_indicators.png
   :width: 600
   :alt: System Status Indicators
   :align: center


**Node Management**

- **Selected Server**: Current server selection
- **Server Information**: System details including make, model, and network configuration
- **Add-in Cards**: PCIe device information and availability
- **Power Management**: Power consumption and efficiency metrics
- **Network Interfaces**: Physical and virtual interface management

.. figure:: _static/images/getting_started/node_management.png
   :width: 600
   :alt: Node Management
   :align: center

User Management & Permissions
-----------------------------

Karios employs a role-based access control (RBAC) model to manage user permissions. The following roles are available:

- **Admin**: Full access to all system features and settings.
- **User**: Limited access to specific features based on assigned permissions.
- **Viewer**: Read-only access to system information and dashboards.

**Managing User Accounts**

- **Creating Users**: Admins can create new user accounts through the user management interface.
- **Editing Users**: User details, including roles and permissions, can be modified by admins.
- **Deleting Users**: Inactive or unnecessary user accounts can be deleted by admins.


RBAC Architecture and Design Philosophy
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

**Hierarchical Permission Model**

**Permission-Based Authorization**: The RBAC system implements a granular permission model where access is controlled through specific permissions rather than broad administrative categories. This provides:

**Principle of Least Privilege**: Users are granted only the minimum permissions necessary to perform their required tasks, reducing security risks and preventing accidental system modifications.

**Separation of Duties**: Different administrative functions are separated into distinct roles, preventing any single user from having unlimited system access and creating accountability trails.

**Scalable Authorization**: The permission system can accommodate complex organizational structures with varying levels of access requirements across different operational domains.


Predefined Role Definitions
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

**Administrative Roles**:

**System Admin Role**

* **Scope**: Complete system administration with full access to all subsystems
* **Permissions**: All available permissions including user management and security configuration

**Node Admin Role**

* **Scope**: Comprehensive node management with extensive system access
* **Key Capabilities**: VM management, network configuration, storage administration, power management

**Specialized Administrative Roles**:

**VM Admin Role**

* **Focus**: Virtual machine lifecycle management and operations
* **Operational Scope**: VM creation, configuration, backup, and monitoring
* **Storage Access**: Read-only storage visibility for capacity planning
* **Network Access**: Read-only network visibility for VM network configuration

**Network Admin Role**

* **Specialization**: Network infrastructure configuration and management
* **Scope**: Network device configuration, VLAN management, routing policies
* **Integration**: Limited node visibility for network-related hardware management

**Storage Admin Role**

* **Domain**: Storage system configuration and management
* **Responsibilities**: ZFS pool management, filesystem creation
* **Integration**: Node visibility for storage hardware monitoring
* **Scope**: Storage client protocol configuration and management

**Power Admin Role**

* **Specialization**: Power management and energy efficiency optimization
* **Scope**: UPS management, power distribution monitoring, energy reporting
* **Integration**: Node visibility for power consumption monitoring
* **Operational Focus**: Power policy configuration and emergency power management

**Security Admin Role**

* **Domain**: Security policy enforcement and monitoring
* **Responsibilities**: Firewall configuration, security policy implementation, audit compliance
* **Access**: Console access for security incident response
* **Scope**: Security configuration across all system components

**Cooling Admin Role**

* **Specialization**: Thermal management and cooling system optimization
* **Scope**: HVAC integration, temperature monitoring, cooling efficiency management
* **Integration**: Node visibility for thermal monitoring
* **Focus**: Cooling policy configuration and thermal incident response

**Netbox Admin Role**

* **Purpose**: Network documentation and inventory management
* **Scope**: IP address management, network topology documentation, asset tracking
* **Integration**: Node visibility for accurate inventory management
* **Focus**: Network planning and documentation maintenance

**End-User Roles**:

**ReadOnly User Role**

* **Purpose**: Monitoring and reporting access without modification capabilities
* **Scope**: Comprehensive visibility across all system components


Role Assignment and Management Procedures
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

**User Provisioning Process**

The user provisioning process follows these key steps:

1. **Role Determination**: Select appropriate role based on job responsibilities
2. **Account Creation**: Create user account with assigned role
3. **Initial Setup**: Configure user preferences and access credentials
4. **Training**: Provide role-specific system training
5. **Monitoring**: Initial monitoring period for new users

**Role Modification Procedures**
Users may require role changes due to evolving job functions or organizational changes. The role modification process includes:

* **Role Upgrade**: Process for granting additional permissions
* **Role Downgrade**: Process for removing unnecessary permissions
* **Temporary Access**: Procedures for temporary permission elevation
* **Emergency Access**: Emergency procedures for critical system access

**RBAC Implementation Through Web Interface**

**Accessing RBAC Management**: The RBAC system is accessible through the admin dropdown menu in the top-right corner of the Karios interface, providing three main management sections:

* **Role Management**: Create, edit, and delete custom roles
* **User Management**: Register, manage, and assign roles to users
* **2FA Management**: Configure two-factor authentication settings

.. note::
   **Administrative Access Requirements**: RBAC management requires System Admin privileges or USER_MANAGE permissions to access role and user management functions.


Role Creation Process
~~~~~~~~~~~~~~~~~~~~~

**Step 1: Access Role Management**

1. Navigate to admin dropdown → "Role Management"

.. figure:: _static/images/rbac/role_management.png
   :width: 600
   :alt: Navigate to Role Management 

   Figure : Navigate to Role Management

2. The interface displays existing roles on the right side

.. figure:: _static/images/rbac/role_list.png
   :width: 600
   :alt: Role List

   Figure : Role List

3. Use the "Create Role" section on the left to define new roles

.. figure:: _static/images/rbac/create_role.png
   :width: 600
   :alt: Create Role Interface

   Figure : Create Role Interface

**Step 2: Define Role Properties**

**Name**: Human-readable role name (e.g., "Storage Admin", "Network Admin")
**Role Slug**: System identifier for the role (auto-generated or custom)
**Description**: Detailed explanation of role purpose and responsibilities

**Step 3: Permission Assignment**

The interface provides a comprehensive checkbox grid with all available permissions:

**Infrastructure Permissions**

* **VM_VIEW / VM_MANAGE**: Virtual machine visibility and control
* **NETWORK_VIEW / NETWORK_MANAGE**: Network infrastructure access
* **STORAGE_VIEW / STORAGE_MANAGE**: Storage system administration
* **NODE_VIEW / NODE_MANAGE**: Physical node management

**Specialized System Permissions**

* **NETBOX_VIEW / NETBOX_MANAGE**: Network documentation system
* **POWER_VIEW / POWER_MANAGE**: Power management system
* **USER_MANAGE / USER_VIEW**: User account administration
* **LOGS_VIEW**: System logging access

**Storage Client Permissions**

* **STORAGE_CLIENT_ISCSI**: iSCSI protocol access
* **STORAGE_CLIENT_MFS**: MooseFS distributed storage
* **STORAGE_CLIENT_S3**: S3-compatible object storage
* **STORAGE_CLIENT_SEAWEED**: SeaweedFS storage system
* **STORAGE_CLIENT_SMB**: SMB/CIFS file sharing

**System Access Permissions**

* **NODE_CONSOLE**: Physical node console access
* **CONSOLE**: System console access
* **CONTROL_CENTER_VIEW / CONTROL_CENTER_MANAGE**: Management interface access
* **SECURITY_VIEW / SECURITY_MANAGE**: Security system administration
* **COOLING_VIEW / COOLING_MANAGE**: Cooling system management


Select the appropriate permissions and click "create" to finalize the role.

.. figure:: _static/images/rbac/permission_grid.png
   :width: 600
   :alt: Permission Grid

   Figure : Permission Grid


Predefined Roles Display
~~~~~~~~~~~~~~~~~~~~~~~~

The interface shows all existing roles with their current configuration:

System Roles
^^^^^^^^^^^^

* **System Admin**: Complete administrative access
* **VM Admin**: Virtual machine management focus
* **Network Admin**: Network infrastructure specialization
* **Storage Admin**: Storage system administration
* **Node Admin**: Physical infrastructure management
* **Power Admin**: Power system management
* **Security Admin**: Security policy management
* **Cooling Admin**: Thermal management system
* **Netbox Admin**: Network documentation management
* **ReadOnly User**: Comprehensive read-only access

Custom Roles
^^^^^^^^^^^^

Additional custom roles created for specific organizational needs.

Role Actions
^^^^^^^^^^^^

* **Edit**: Modify existing role permissions and properties

.. figure:: _static/images/rbac/edit_role.png
   :width: 600
   :alt: Edit Role Interface

   Figure : Edit Role Interface

* **Delete**: Remove custom roles (predefined roles cannot be deleted)

.. figure:: _static/images/rbac/delete_role.png
   :width: 600
   :alt: Delete Role Confirmation

   Figure : Delete Role Confirmation

User Registration Process
~~~~~~~~~~~~~~~~~~~~~~~~~

Step 1: Access User Management

1. Navigate to admin dropdown → "User Management"

.. figure:: _static/images/rbac/UserManagement.png
   :width: 600
   :alt: Navigate to User Management

   Figure : Navigate to User Management

2. Click "Register User" button to create new user accounts

.. figure:: _static/images/rbac/RegisterUser.png
   :width: 600
   :alt: Register User Interface

   Figure : Register User Interface

Step 2: User Information Entry

The registration dialog requires comprehensive user information:

* **Username**: Unique system identifier for the user
* **Email**: Primary email address for notifications and communications
* **First Name**: User's given name for identification
* **Last Name**: User's last name for complete identification
* **Password**: Secure password meeting complexity requirements (8+ characters, 1 number, 1 uppercase, 1 special character)

.. figure:: _static/images/rbac/UserRegistrationForm.png
   :width: 600
   :alt: User Registration Form

   Figure : User Registration Form

User Account Management
~~~~~~~~~~~~~~~~~~~~~~~

User Status Management
^^^^^^^^^^^^^^^^^^^^^^

The interface provides comprehensive user account oversight:

Account Status Types
^^^^^^^^^^^^^^^^^^^^

* **Active**: User account is functional and can access the system
* **Inactive**: User account is disabled and cannot authenticate

Role Assignment Display
^^^^^^^^^^^^^^^^^^^^^^^

Each user shows their currently assigned role:

* **System Admin**: Complete administrative privileges
* **Security Admin**: Security-focused administrative access
* **ReadOnly User**: View-only access across all systems
* **Custom Roles**: Specialized roles created for specific requirements

Approval Workflow Management
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

* **Approval Required**: Some users require administrative approval before activation
* **Approvers**: Designated users who can approve account activation
* **No approval required**: Users who can be immediately activated

Role Assignment Strategies
~~~~~~~~~~~~~~~~~~~~~~~~~~

Full Access Implementation
^^^^^^^^^^^^^^^^^^^^^^^^^^

**Method 1: System Admin Role Assignment**

1. Navigate to User Management interface
2. Locate the target user account
3. Click "Edit" on the user's row

.. figure:: _static/images/rbac/EditUser.png
   :width: 600
   :alt: Edit User Interface

   Figure : Edit User Interface

4. Change role assignment to "System Admin"
5. Save changes to grant complete system access

.. figure:: _static/images/rbac/AssignSystemAdminRole.png
   :width: 600
   :alt: Assign System Admin Role

   Figure : Assign System Admin Role


**Method 2: Custom Full Access Role**

1. Access Role Management interface
2. Create new role with comprehensive name (e.g., "Full Administrator")
3. Select ALL available permissions in the permission grid
4. Save the custom role
5. Assign the new role to target users

.. figure:: _static/images/rbac/AssignCustomRole.png
   :width: 600
   :alt: Assign Custom Role

   Figure : Assign Custom Role

**Approval Role Assignment**

1. After Creating the User , if you wish to give them the restricted eligibility, select the dropdown "Approvals Required" to assign permission

.. figure:: _static/images/rbac/AssignApprovalRole.png
   :width: 600
   :alt: Assign Approval Role

   Figure : Assign Approval Role

2. To assign approvers, select eligible approvers from the popup

.. figure:: _static/images/rbac/SelectedApprovers.png
   :width: 600
   :alt: Selected Approvers

   Figure : Selected Approvers

.. figure:: _static/images/rbac/SelectApproversPopup.png
   :width: 600
   :alt: Select Approvers Popup

   Figure : Select Approvers Popup

Specialized Access Implementation
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Users can be assigned specialized roles based on job function:

* **Storage Administrators**: Storage Admin role for ZFS and storage management
* **Network Engineers**: Network Admin role for network infrastructure
* **Security Personnel**: Security Admin role for security policy management
* **Operations Staff**: ReadOnly User role for monitoring and reporting


.. warning::
   Full access roles carry significant security implications:

   * **Complete System Control**: Ability to modify any system configuration
   * **Data Access**: Unrestricted access to all stored data and configurations
   * **User Management**: Ability to create, modify, or delete user accounts
   * **Security Policy Control**: Can modify security policies and access controls


User Lifecycle Management
~~~~~~~~~~~~~~~~~~~~~~~~~

Account Activation Process
^^^^^^^^^^^^^^^^^^^^^^^^^^

The complete account activation workflow:

1. **Registration**: Create user account with required information
2. **Role Assignment**: Assign appropriate role based on job function
3. **Approval**: Process any required approvals through designated approvers
4. **Activation**: Activate account to enable system access
5. **Notification**: User receives activation notification and initial access instructions

Account Maintenance
^^^^^^^^^^^^^^^^^^^

Ongoing account management includes:

1. **Status Changes**: Toggle between Active and Inactive status as needed
2. **Role Modifications**: Update user roles based on changing responsibilities
3. **Approval Management**: Manage approval workflows for sensitive role assignments
4. **Access Reviews**: Regular review of user accounts and assigned permissions
5. **Account Deactivation and Deletion**: Process account deactivation / deletion requests by navigating to the user management block in User Management

.. figure:: _static/images/rbac/AccountDeactivation.png
   :width: 600
   :alt: Account Deactivation

   Figure : Account Deactivation

.. figure:: _static/images/rbac/AccountDeletion.png
   :width: 600
   :alt: Account Deletion

   Figure : Account Deletion


Two-Factor Management
---------------------

**Two-Factor Authentication Management Dashboard**

1. Navigate to the Two-Factor Management section

.. figure:: _static/images/rbac/NavigateToTwoFactorManagement.png
   :width: 600
   :alt: Navigate to Two-Factor Management

   Figure : Navigate to Two-Factor Management

2. View and manage two-factor authentication settings and devices 

.. figure:: _static/images/rbac/TwoFactorManagementDashboard.png
   :width: 600
   :alt: Two-Factor Management Dashboard

   Figure : Two-Factor Management Dashboard

3. Edit and delete devices in the dashboard

.. figure:: _static/images/rbac/TwoFactorDeviceManagement.png
   :width: 600
   :alt: Two-Factor Device Management

   Figure : Two-Factor Device Management

**Add new device**

1. Click on the "Add Device" button in the Two-Factor Device Management dashboard

.. figure:: _static/images/rbac/AddTwoFactorDevice.png
   :width: 600
   :alt: Add Two-Factor Device

   Figure : Add Two-Factor Device

2. Follow the prompts to enter new device information for two-factor authentication

   .. figure:: _static/images/rbac/TwoFactorDeviceEnrollment.png
      :width: 600
      :alt: Two-Factor Device Enrollment

   Figure : Two-Factor Device Enrollment

3. Scan and verify the new device to complete the enrollment process

   .. figure:: _static/images/rbac/TwoFactorDeviceVerification.png
      :width: 600
      :alt: Two-Factor Device Verification

   Figure : Two-Factor Device Verification

Best Practices
--------------

Account Security
~~~~~~~~~~~~~~~~~

- **Strong Passwords**: Use strong, unique passwords for account security.
- **Regular Updates**: Update passwords regularly according to security policies.
- **Session Management**: Log out properly when finished using the system.
- **Access Monitoring**: Monitor account access and report suspicious activity.

License Compliance
~~~~~~~~~~~~~~~~~~

- **Renewal Tracking**: Monitor license expiration dates proactively.
- **Compliance Documentation**: Maintain records of license validation and renewals.
- **Usage Monitoring**: Ensure system usage complies with license terms.
- **Renewal Planning**: Plan license renewals well in advance of expiration dates.

System Usage
~~~~~~~~~~~~

- **Resource Management**: Use system resources efficiently and responsibly.
- **Documentation**: Keep personal documentation of system configurations and procedures.
- **Change Management**: Follow proper change management procedures for system modifications.
- **Support Utilization**: Utilize available support resources and documentation effectively.

Security Recommendations
~~~~~~~~~~~~~~~~~~~~~~~~

.. important::
   Follow these security best practices:

   * Implement the principle of least privilege
   * Regularly review user permissions and roles
   * Use approval workflows for sensitive role assignments
   * Monitor user activity and access patterns
   * Maintain proper documentation of role assignments

Operational Guidelines
~~~~~~~~~~~~~~~~~~~~~~

* **Regular Audits**: Conduct periodic access reviews
* **Role Documentation**: Maintain clear documentation of role purposes and permissions
* **Training**: Provide adequate training for users with new role assignments
* **Change Management**: Follow proper procedures for role modifications
* **Emergency Procedures**: Maintain emergency access procedures for critical situations

.. note::
   This practical implementation guide provides step-by-step instructions for managing roles and users through the Karios web interface, ensuring proper access control while maintaining system security and operational efficiency.


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

- **Control Center Overview**: The selected datacenter displays the active control node and provides access to all managed infrastructure components
- **Datacenter Selection**: Use the datacenter dropdown to select and manage different datacenter environments


.. figure:: _static/images/web_interface_management/control_center_overview.png
   :width: 800
   :alt: Control Center Overview
   :align: center


Hypervisor Server Management
----------------------------

Server Discovery Process
~~~~~~~~~~~~~~~~~~~~~~~~

Karios provides automated hypervisor server discovery through network scanning:

1. **Subnet Scanning**: Navigate to the scan section and enter the target subnet (e.g., ``192.168.111.0/24``)
2. **Initiate Scan**: Click the "Scan" button to begin automatic server discovery
3. **Discovery Results**: Discovered servers appear in the "Hypervisor Discovery" section

.. figure:: _static/images/baremetal_management/server_discovery.png
   :width: 800
   :alt: Server Discovery
   :align: center


Server Lifecycle Management
~~~~~~~~~~~~~~~~~~~~~~~~~~~

Servers progress through distinct stages in the Karios management lifecycle:

**Stage 1: Discovered**
- Servers detected during network scanning
- Basic hardware information collected (BMC IP, Vendor)
- No management capabilities yet established
- Ready for credential configuration and registration


.. figure:: _static/images/baremetal_management/server_discovered.png
   :width: 800
   :alt: Server Discovery
   :align: center

**Stage 2: Creds Set**
- Intermediate stage after credential configuration
- BMC credentials have been set but registration not yet complete
- Transitional state before full registration

**Steps to set credentials:**

1. Click on the highlighted edit icon for your discovered node

.. figure:: _static/images/baremetal_management/server_edit_icon.png
   :width: 800
   :alt: Server Edit Icon
   :align: center

2. Enter the BMC credentials for your node
3. Click save to complete the registration process

.. figure:: _static/images/baremetal_management/server_edit_and_save_credentials.png
   :width: 800
   :alt: Server Edit and Save Credentials
   :align: center


**Stage 3: Registered**
- Servers added to the Karios management system
- BMC (Baseboard Management Controller) connectivity established
- Credentials configured and validated
- Ready for provisioning and configuration operations


.. figure:: _static/images/baremetal_management/server_registered.png
   :width: 800
   :alt: Server Registered
   :align: center

**Stage 4: Provisioned and Configured**
- Management credentials are configured
- Remote management capabilities are enabled
- Server is ready for operating system deployment
- Operating system is installed and configured
- Server is ready for workload deployment
- Full management capabilities are available

.. figure:: _static/images/baremetal_management/server_click_more_after_registered.png
   :width: 800
   :alt: Server Provisioned
   :align: center



**Management Actions**

Click on "more" to select actions:

.. figure:: _static/images/baremetal_management/server_management_actions.png
   :width: 800
   :alt: Server Management Actions
   :align: center

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


Control Center Level Management
-------------------------------

Administrators can access various control center management features. The control center provides centralized management capabilities for the entire Karios infrastructure.

Component Navigation Process
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

**Control Node Components:** The control node interface provides access to key system components:

- **Provisioning Center**: Central management and configuration hub
- **Storage**: Storage pool and volume management
- **Seaweed**: Distributed file system
- **ISO**: Operating system image management
- **Network**: Network configuration and management
- **Event logs**: System event monitoring, and log management
- **Stats**: Performance metrics and monitoring
- **Releases**: System updates and patch management

.. figure:: _static/images/control_center/control_center_management.png
   :width: 800
   :alt: Control Node Interface

**Navigation Best Practices:**

- **Tab Organization**: Use tabs to organize different management functions
- **Context Awareness**: Understand the current context (control node vs. worker node)
- **Permission Levels**: Ensure appropriate permissions for accessing different components

Liquid Cooling Management Operations - (Special Feature. Contact Sales)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. note::
   **Preview Feature Notice**
   This section on Liquid Cooling is currently reflecting the preview version of the feature. Expect updates and enhancements as it progresses towards general availability (GA).

**Karios Cool Integration:** The Liquid Cooling tab provides access to the Karios Cool thermal management system for monitoring and controlling liquid cooling infrastructure across your deployment.

**Liquid Cooling Interface:** The interface provides two main management categories:
Immersion Cooling and Rack Level.

.. figure:: _static/images/control_center/liquid_cooling/liquid_cooling_management.png
   :alt: Liquid Cooling Interface
   :width: 925px
   :height: 283px

Immersion Cooling Tab
^^^^^^^^^^^^^^^^^^^^^

**Immersion Cooling Systems:** The Immersion Cooling tab provides comprehensive management of immersion cooling systems and components:

**Netbox Configuration:**

Netbox is a system that acts as a central repository ("single source of truth") for all information about your datacenter. It runs in the background (backend) to manage and track assets and configurations.

**How does it work with Karios?**

Karios uses Netbox by creating connections (northbound/southbound APIs) to pull data from and send data to Netbox. This allows Karios to retrieve information about your datacenter.

**Integration Benefits:**

- Centralized asset management and tracking
- Automated configuration synchronization
- Real-time datacenter information access
- Unified infrastructure visibility


To connect Karios to Netbox, follow these configuration steps:

- **Click "Configure Netbox"**
   Initiates the setup process within the Karios interface

   .. figure:: _static/images/control_center/liquid_cooling/LQ_configure_netbox_button.png
      :alt: Configure Netbox Button
      :width: 600px
   
   Figure : Configure Netbox Button

- **Enter the Netbox URL**
   Provide the web address where your Netbox instance is located (e.g., http://example.com:8000)

- **Enter an API Token**
   This token acts as authentication credentials for Karios to access and modify data within Netbox

- **Click "Save Configuration"**
   Applies the settings and establishes the connection between Karios and Netbox


.. figure:: _static/images/control_center/liquid_cooling/LQ_configure_netbox.png
   :alt: Netbox Configuration
   :width: 679px
   :height: 405px

**Rack Selection:** After configuring Netbox, administrators can select and manage available racks:

- **DEV Rack**: Active rack with detailed specifications
- **Physical Specifications**: View rack dimensions, device counts, and power requirements
- **Rack Management**: Access rack-level cooling controls and monitoring

.. figure:: _static/images/control_center/liquid_cooling/LQ_rack_selection.png
   :alt: Rack Selection
   :width: 913px
   :height: 396px

**Immersion Cooling Loop Control:** The system provides visual control of the immersion cooling loop:

- **Tank**: Coolant tank with visual fluid level indicators
- **Pump**: Circulation pump with control capabilities
- **Servers**: Server units (U1-U10) with cooling connections
- **Chiller**: Cooling chiller with temperature control
- **Coolant Flow**: Visual representation of coolant flow paths

**Coolant Flow Management:**

- **Flow Control**: ON/OFF button to control coolant flow
- **Flow Direction**: Visual indicators showing coolant flow from Tank → Pump → Servers → Chiller → Tank
- **Flow Status**: Real-time status of coolant circulation
- **Temperature Zones**: Cold water (blue) and warm water (red) flow indicators

.. figure:: _static/images/control_center/liquid_cooling/LQ_coolant_flow_management.png
   :alt: Coolant Flow Management
   :width: 800

**Server Information Display:** Individual server information within the immersion cooling system:

- **Server Status**: Active/inactive status for each server unit
- **Server Identification**: Unit positions (U1, U2, U3, etc.)
- **Temperature Monitoring**: Per-server temperature monitoring

.. figure:: _static/images/control_center/liquid_cooling/LQ_server_information.png
   :alt: Server Information
   :width: 800

**Monitoring Controls:**

- **Sensors Dropdown**: Select "Sensors" to view different available sensors

.. figure:: _static/images/control_center/liquid_cooling/LQ_monitoring_controls.png
   :alt: Monitoring Controls
   :width: 800

**Sensor Types and Monitoring:** The system provides comprehensive sensor monitoring with 8 different sensor types:

.. figure:: _static/images/control_center/liquid_cooling/LQ_sensor_types.png
   :alt: Sensor Types Overview
   :width: 800

**Flame Sensor:** Fire detection and safety monitoring for the cooling system

.. figure:: _static/images/control_center/liquid_cooling/LQ_flame_sensor.png
   :alt: Flame Sensor
   :width: 800

**Motor:** Motor status and performance monitoring for pumps and fans

.. figure:: _static/images/control_center/liquid_cooling/LQ_motor_monitoring.png
   :alt: Motor Monitoring
   :width: 800

**Temperature Sensor (CPU):** CPU temperature monitoring for thermal management

.. figure:: _static/images/control_center/liquid_cooling/LQ_cpu_temperature_sensor.png
   :alt: CPU Temperature Sensor
   :width: 800

**Flow Rate Sensor (Outlet):** Coolant flow rate monitoring at outlet points

.. figure:: _static/images/control_center/liquid_cooling/LQ_flow_rate_sensor.png
   :alt: Flow Rate Sensor
   :width: 800

**CDU (Coolant Distribution Unit) Security:** Security monitoring for coolant distribution systems

.. figure:: _static/images/control_center/liquid_cooling/LQ_cdu_security.png
   :alt: CDU Security
   :width: 937px
   :height: 508px

**Temperature Sensor (Coolant Tank):** Coolant tank temperature monitoring

.. figure:: _static/images/control_center/liquid_cooling/LQ_coolant_tank_temperature.png
   :alt: Coolant Tank Temperature
   :width: 800

**Leak Detection Sensor:** Leak detection and prevention monitoring

.. figure:: _static/images/control_center/liquid_cooling/LQ_leak_detection_sensor.png
   :alt: Leak Detection Sensor
   :width: 800

**Tank Level Sensor:** Coolant tank level monitoring and management

.. figure:: _static/images/control_center/liquid_cooling/LQ_tank_level_sensor.png
   :alt: Tank Level Sensor
   :width: 800

**Sensor Capabilities:**

- **Real-time Monitoring**: Live sensor data collection and display
- **Alert Generation**: Automatic alerts for sensor threshold breaches
- **Historical Data**: Sensor data history and trend analysis
- **Safety Monitoring**: Critical safety sensors including flame and leak detection
- **Performance Tracking**: Operational sensors for flow, temperature, and motor performance

**Metrics Button:** Click "Metrics" to access real-time performance data

.. figure:: _static/images/control_center/liquid_cooling/LQ_click_metrics_interface.png
   :alt: Metrics Interface
   :width: 800

.. figure:: _static/images/control_center/liquid_cooling/LQ_metrics_data.png
   :alt: Metrics Data
   :width: 800

**Real-time Updates:** Live monitoring of cooling system performance

Rack Level Tab
^^^^^^^^^^^^^^

**Rack-Level Cooling Management:** The Rack Level tab provides detailed rack-level cooling management:

.. figure:: _static/images/control_center/liquid_cooling/LQ_rack_level_management.png
   :alt: Rack Level Management
   :width: 910px
   :height: 403px

**Available Nodes Display:** The system shows available nodes with comprehensive information:

- **Name**: Node identifier (e.g., "DEV Rack")
- **Status**: Operational status (Active/Inactive)
- **Physical Dimensions**: Width (19 inches) and Height (15U) specifications
- **Device Count**: Number of devices in the rack (18 devices)
- **Power Feeds**: Number of power connections (2 power feeds)

Real-time Monitoring and Metrics
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

**Sensor Information:** Access detailed sensor information through the Sensors tab

.. figure:: _static/images/control_center/liquid_cooling/LQ_sensor_information.png
   :alt: Sensor Information
   :width: 800

**Coolant Distribution System:**

.. figure:: _static/images/control_center/liquid_cooling/LQ_coolant_distribution_system.png
   :alt: Coolant Distribution System
   :width: 800

**Interactive Monitoring:**

- **Real-time Graphs**: Access real-time graphical data for each metric
- **Historical Data**: View historical trends and patterns
- **Alert Thresholds**: Configure alert thresholds for temperature and flow parameters
- **Performance Analysis**: Analyze cooling system performance over time

Operational Controls
^^^^^^^^^^^^^^^^^^^^

**Cooling System Control:**

- **Flow Control**: Start/stop coolant circulation with ON/OFF controls
- **Temperature Management**: Monitor and control temperature across the system
- **Pump Management**: Control pump operation and speed
- **Chiller Control**: Manage chiller operation and temperature settings

**System Status Monitoring:**

- **Visual Status Indicators**: Real-time visual indicators for system components
- **Component Health**: Monitor health status of pumps, chillers, and sensors
- **Flow Visualization**: Visual representation of coolant flow throughout the system
- **Temperature Mapping**: Visual temperature mapping across server units

**Navigation and Usage:**

- **Tab Navigation**: Switch between Immersion Cooling and Rack Level tabs
- **Back to Racks**: Return to rack overview with "Back to Racks" button
- **Node Selection**: Select specific nodes for detailed management
- **Configuration Access**: Access configuration options for cooling systems
- **Status Monitoring**: Monitor cooling system status and performance

For detailed information regarding liquid cooling functionality, configuration options, and advanced features, please refer to Section 5: Liquid Cooling Management.

Storage Management Operations
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

**Storage Tab Overview:** The Storage tab provides comprehensive storage management capabilities for all supported storage protocols and systems. This centralized interface allows administrators to configure, monitor, and manage various storage types through a unified dashboard.

**Storage Protocol Support:** The storage interface provides access to multiple storage protocols with dropdown selection:

MooseFS Storage
^^^^^^^^^^^^^^^

**MooseFS Distributed Storage:**
MooseFS is a distributed file system that provides scalable, fault-tolerant storage across multiple servers with a unified namespace. It offers high availability and automatic data replication for enterprise storage requirements.

.. figure:: _static/images/control_center/storage_management/storage_moosefs_storage_interface.png
   :alt: MooseFS Storage Interface
   :width: 800

**Mount MooseFS Storage:** Click "Mount MooseFS Storage" to configure MooseFS connections

**Server Information:** View MooseFS server details (e.g., 192.168.111.92)

**Port Configuration:** Configure MooseFS port settings (e.g., 9421)

**Storage Metrics:** Monitor storage usage and capacity

- **Size**: Total storage capacity (e.g., 49G)
- **Used**: Currently used storage (e.g., 11G)
- **Available**: Available storage space (e.g., 38G)
- **Capacity**: Storage utilization percentage (e.g., 22%)
- **Mount Point**: View mount directory (e.g., /mnt/moosefs/karios)

.. figure:: _static/images/control_center/storage_management/storage_moosefs_storage_metrics.png
   :alt: MooseFS Storage Metrics
   :width: 800

To mount MooseFS storage, follow these steps:

**Step 1: Gather MooseFS Server Information**
Before configuring, obtain the following details

- MooseFS server IP address
- Server port number (usually 9421)
- Available directory/namespace to mount

**Step 2: Configure MooseFS Mount**

**ID:** Enter a name to identify this storage mount (e.g., "main-storage")

.. tip::
   A MooseFS ID is a unique identifier used for user authentication, access control, and quota management within the distributed MooseFS file system.

**Server:** Enter the IP address of your MooseFS server (e.g., 192.168.111.92)

.. tip::
   A MooseFS server is any computer running the MooseFS software and fulfilling a specific role like managing metadata (master), storing data chunks (data), or facilitating discovery (listen) within a distributed file system cluster.

**Port:** Enter the MooseFS port number (default is 9421)

.. tip::
   MooseFS ports are network doorways used by the master, data, and listen servers to communicate with each other and clients, with default values like 10001 (master), 10003 (data), and 10005 (listen).

**Directory:** Enter the MooseFS directory path you want to access (e.g., "moosefs")

.. tip::
   A MooseFS directory is a hierarchical structure within the distributed file system, similar to traditional directories, that organizes files and subdirectories across multiple servers for storage and access.

**Step 3: Configure Options**

- ✓ **Auto Mount on Restart**: Check this to automatically connect to storage when system restarts
- ✓ **Add to Datastore**: Check this to make the storage available for virtual machines

**Step 4: Complete Setup**
Click Submit to save the configuration and mount the S3 storage.

.. figure:: _static/images/control_center/storage_management/storage_moosefs_mount_options.png
   :alt: MooseFS Storage Options
   :width: 800

**MooseFS Storage Management**

**Actions:** Unmount and manage MooseFS storage

.. figure:: _static/images/control_center/storage_management/storage_moosefs_unmount_actions.png
   :alt: MooseFS Storage Unmount Actions
   :width: 800

Click Delete icon to unmount the moosefs storage. It will prompt you for a confirmation. Click "unmount" to remove the moosefs mount.

.. figure:: _static/images/control_center/storage_management/storage_moosefs_unmount_confirmation.png
   :alt: MooseFS Unmount Confirmation
   :width: 600

S3 Storage
^^^^^^^^^^
S3 (Simple Storage Service) provides scalable object storage for backup, archival, and cloud-native applications. It offers cost-effective storage with global accessibility and integration with modern DevOps workflows.


**Why S3 is Useful for Hypervisors - Core Benefits**

**Centralized Storage for VM Images and Disks**

The most common and significant use case involves storing VM disk images (`.raw` files) in S3 buckets instead of local hypervisor storage. This approach provides:

- **Scalability:** Easily scale storage capacity as needed without being limited by the physical hardware of the hypervisor host

- **Cost-Effectiveness:** S3 is often cheaper than traditional SAN or NAS solutions for large amounts of data

**Data Durability & Redundancy:** S3 provides extremely high levels of data durability and redundancy, protecting against data loss


**Additional Use Cases**

- **Backup and Disaster Recovery:** S3 serves as an ideal target for VM backups. Regular VM backups to S3 ensure quick restoration in case of disaster or hardware failure

- **VM Migration & Replication:** Moving VMs between Karios hosts becomes easier when VM images are stored centrally in S3. This simplifies copying images between locations and enables streamlined disaster recovery replication

**Content Delivery:** For VMs hosting web applications or content-serving services, S3 can serve as a staging area or directly serve static assets


**Specific Advantages for Karios**

**Flexibility:** S3 allows Karios to operate more independently of the underlying storage hardware

**Cloud-Native Integration:** For Karios deployments in cloud environments, S3 integration provides natural architectural alignment

**Simplified Management:** Centralized storage simplifies management and reduces complexity compared to managing multiple local storage devices


.. important::
   **Summary**
   S3 enables a more scalable, resilient, and flexible Karios environment by separating VM images from the hypervisor's physical storage infrastructure.

.. figure:: _static/images/control_center/storage_management/storage_s3_storage_interface.png
   :alt: S3 Storage Interface
   :width: 800

To mount S3 storage, follow these steps:

**Step 1: Gather S3 Storage Information**
Before configuring, obtain the following details:

- S3 bucket name
- Access credentials (Access Key and Secret Key)
- S3 endpoint URL or region information

**Step 2: Configure S3 Mount**

**Bucket Name:** Enter the name of your S3 bucket you want to access

.. tip::
   An AWS bucket is a container within Amazon S3 that securely stores objects (files and their metadata) in the cloud, offering scalability, durability, and various configuration options for different use cases.

**Access Key:** Enter your S3 access key ID for authentication

.. tip::
   A bucket access key is a unique set of credentials, an Access Key ID and Secret Access Key that allows users or applications to authenticate and interact with an AWS S3 bucket.

**Secret Key:** Enter your S3 secret access key for authentication

.. tip::
   The bucket secret key, also known as the Secret Access Key, is a confidential string of characters paired with an Access Key ID that authenticates requests made to your AWS S3 bucket.

**Endpoint:** Enter the S3 endpoint URL (e.g., s3.amazonaws.com)

.. tip::
   The URL of the S3 service endpoint for your region (e.g., s3.amazonaws.com for global, or s3.us-west-2.amazonaws.com for specific regions). For S3-compatible services, this would be the custom endpoint URL

**Region:** Enter the S3 region (e.g., us-east-1) or leave default

.. tip::
   An S3 region is a geographical location where your Amazon S3 bucket's data is physically stored, impacting latency, cost, and compliance considerations.

**ID:** Enter a name to identify this storage mount (e.g., "karios")

.. tip::
   An S3 Access Key ID is a public identifier that acts as the first part of your credentials for authenticating requests to access your Amazon S3 bucket.

**Step 3: Configure Options**

- ✓ **Auto Mount on Restart**: Check this to automatically connect to storage when system restarts
- ✓ **Add to Datastore**: Check this to make the storage available for virtual machines

**Step 4: Complete Setup**
Click Submit to save the configuration and mount the S3 storage.

.. figure:: _static/images/control_center/storage_management/storage_s3_configuration_form.png
   :alt: S3 Configuration Form
   :width: 800

**Storage Status:** Monitor S3 storage availability and connection status

.. figure:: _static/images/control_center/storage_management/storage_s3_storage_status.png
   :alt: S3 Storage Status
   :width: 800

Click Delete to unmount the S3 storage. Click "unmount" to confirm the removal of S3 storage.

.. figure:: _static/images/control_center/storage_management/storage_s3_unmount_confirmation.png
   :alt: S3 Unmount Confirmation
   :width: 600

iSCSI Storage
^^^^^^^^^^^^^

**iSCSI Block Storage:**
iSCSI provides block-level storage access over IP networks, enabling remote storage to appear as locally attached disks. It's commonly used for shared storage in virtualization environments and high-performance database applications.

iSCSI integration provides Karios with flexible, centralized block storage that delivers:

- Improved performance through dedicated storage networks
- Enhanced reliability via centralized storage management  
- Better manageability with unified storage administration
- Scalable architecture supporting infrastructure growth

**Storage Benefits**

.. list-table:: 
   :header-rows: 1
   :widths: 25 75

   * - Benefit
     - Description
   * - **Centralized Storage**
     - Simplifies management and enables easy scaling of storage capacity as infrastructure grows
   * - **High Availability**
     - Supports live VM migration between hosts without data loss, ensuring continuous operations
   * - **Cost-Effective**
     - Provides SAN functionality at a lower cost than traditional Fibre Channel solutions

**Understanding iSCSI Terms:**

**Target:** An iSCSI target is the storage device or service on the remote server that provides the actual storage space. It's identified by an IQN (iSCSI Qualified Name) and contains one or more LUNs (Logical Unit Numbers).

**Mount:** Mounting makes the connected iSCSI storage accessible to the operating system as a usable disk or file system. After mounting, the remote storage appears as a local disk that can be used for data storage.

**Connect to iSCSI Target:** Click "Connect to iSCSI Target" to establish iSCSI connections

.. figure:: _static/images/control_center/storage_management/storage_iscsi_target_connection.png
   :alt: iSCSI Target Connection
   :width: 800

**Step 1: Gather iSCSI Target Information**
Before configuring, obtain the following details:

- iSCSI target server IP address
- Target name (IQN - iSCSI Qualified Name)
- Authentication credentials (username and password)

**Step 2: Configure iSCSI Connection**

**Portal:** Enter the IP address of your iSCSI target server (e.g., 192.168.116.113)

.. tip::
   An iSCSI portal is the combination of an IP address and TCP port (typically 3260) that defines a specific endpoint for initiating or accepting iSCSI connections, essentially acting as the doorway for communication between an initiator and target.

**Target:** Enter the iSCSI target name (e.g., iqn.store.ai.karios:storage.lun1)

**Username:** Enter the authentication username for the iSCSI target (e.g., admin)

.. tip::
   An iSCSI username is a credential used for authentication when connecting to an iSCSI target, ensuring only authorized initiators can access the shared storage.

**Password:** Enter the authentication password for the iSCSI target

.. tip::
   An iSCSI password, paired with a username, provides secure authentication for clients accessing an iSCSI target, verifying their identity before granting storage access.

**Step 3: Complete Connection**
Click Submit to establish the iSCSI connection and make the storage available as a block device.

.. figure:: _static/images/control_center/storage_management/storage_iscsi_connection_form.png
   :alt: iSCSI Connection Form
   :width: 800

To mount iSCSI devices, follow these steps:

After connecting to an iSCSI target, you need to mount the discovered devices to make them accessible for storage operations.

**Step 1: Configure Multipath Settings**

**Multipath Name:** Enter a name for the multipath device (e.g., "mp_disk")

.. tip::
   The Multipath Name is essentially the logical name you assign to the multipath device created from multiple iSCSI paths.

**Select Devices:** Choose the iSCSI devices you want to include in the multipath configuration

**Device Selection:** Check the boxes for available devices (e.g., "da1")

**Verify Selection:** Confirm your selected devices are listed correctly

.. figure:: _static/images/control_center/storage_management/storage_iscsi_mount.png
   :alt: iSCSI Device Verification
   :width: 800

**Step 2: Complete Mount Process**
Click Mount to mount the selected iSCSI devices and make them available for use.

.. figure:: _static/images/control_center/storage_management/storage_iscsi_device_mounting.png
   :alt: iSCSI Device Mounting
   :width: 800

**Device Actions:** These are the following actions that can be performed on an iSCSI storage device.

- **Mount**: Makes the iSCSI storage accessible to the system as a usable disk drive
- **Disconnect**: Terminates the connection to the iSCSI target while preserving configuration
- **Remove Device**: Completely removes the device from the system configuration
- **Destroy Path**: Removes the multipath configuration and destroys the path mapping

.. figure:: _static/images/control_center/storage_management/storage_iscsi_device_actions.png
   :alt: iSCSI Device Actions
   :width: 800

NFS Storage
^^^^^^^^^^^

**NFS File Storage:**
NFS (Network File System) allows you to access files on remote servers as if they were stored locally on your system. It's commonly used for shared storage in Unix/Linux environments and virtualization platforms.

**NFS Advantages for Hypervisors**

For hypervisors like Karios, NFS offers several crucial advantages:

**Shared Storage**
   The primary benefit of NFS integration. NFS allows multiple Karios hosts to access and use the same VM disk images (`.raw` files). This shared access is essential for advanced hypervisor features like live migration.

**Live Migration Support (Future)**
   Moving a running virtual machine from one Karios host to another becomes feasible with NFS. Since both hosts access the same storage, the VM's data remains accessible during migration, minimizing downtime.

**Centralized Management**
   Simplifies storage administration by consolidating management at the NFS server level rather than managing storage individually on each hypervisor host.

**Scalability & Flexibility**
   Enables easier storage capacity scaling by adding resources to the NFS server without modifying individual Karios hosts. This approach also provides flexibility in storage hardware selection, removing dependency on directly attached storage.

**Cost-Effectiveness**
   Can provide more economical storage solutions compared to dedicated SAN implementations, particularly beneficial for smaller deployments.

**Implementation Benefits**

**Operational Advantages:**

- Unified storage management across multiple hypervisor hosts
- Simplified backup and disaster recovery procedures
- Reduced storage hardware complexity per host
- Enhanced resource utilization through shared storage pools

**Technical Considerations:**

- Network bandwidth requirements for storage traffic
- NFS server performance impact on VM operations  
- Network reliability requirements for storage availability
- Security considerations for network-attached storage

.. figure:: _static/images/control_center/storage_management/storage_nfs_storage_interface.png
   :alt: NFS Storage Interface
   :width: 800

To mount NFS storage, follow these steps: Click "Mount NFS Storage" to configure NFS connections

**Step 1: Select NFS Server**

**NFS Server:** Enter the IP address or hostname of your NFS server (e.g., 192.168.116.113)

Click Next to proceed to mount configuration

.. figure:: _static/images/control_center/storage_management/storage_nfs_server_selection.png
   :alt: NFS Server Selection
   :width: 800

**Step 2: Configure NFS Mount**

**ID:** Enter a name to identify this storage mount

.. tip::
   An NFS ID (Network File System Identifier) is a unique identifier assigned to each client accessing an NFS server, used for access control and tracking.

**Server:** Enter the IP address or hostname of your NFS server (e.g., 192.168.1.100)

.. tip::
   A network file server that runs the Network File System daemon (nfsd) and exports (shares) directories to remote client systems over a network. The NFS server manages file access permissions, handles client requests for file operations (read, write, create, delete), and maintains the shared file systems that clients can mount and access as if they were local storage.

**Export Path:** Enter the directory path exported by the NFS server (e.g., /exports/shared)

.. tip::
   The directory path on the NFS server that has been configured and made available for sharing to client systems. This is the actual folder location on the server (e.g., /exports/shared, /home/data) that contains the files you want to access remotely.

.. tip::
   **Mount Point:** The local directory path on the client system where the remote NFS share will be attached and accessed. This is an empty directory on your local system (e.g., /mnt/nfs-storage, /data/shared) that serves as the access point for the remote files.

   **Mount Options:** Configuration parameters that control how the NFS file system is mounted and behaves, including NFS protocol version (NFSv3, NFSv4), read/write permissions, timeout settings, cache behavior, and security options. These options determine the performance characteristics and access rules for the mounted file system.

**Step 3: Configure Options**

- ✓ **Auto Mount on Restart**: Check this to automatically mount NFS storage when system restarts
- ✓ **Add to Datastore**: Check this to make the storage available for virtual machines
- ✓ **Enable pNFS**: Check this to enable parallel NFS for improved performance (if supported)

.. tip::
   An extension to NFSv4 that allows clients to access file data directly from multiple storage servers simultaneously, rather than routing all data through a single NFS server. This parallel access significantly improves performance and scalability by distributing I/O operations across multiple storage devices, reducing bottlenecks and enabling higher throughput for large file operations.

**Step 4: Complete Setup**
Click Submit to save the configuration and mount the NFS storage.

.. figure:: _static/images/control_center/storage_management/storage_nfs_configuration_form.png
   :alt: NFS Configuration Form
   :width: 800

To unmount the NFS storage, please click on the delete icon

.. figure:: _static/images/control_center/storage_management/storage_nfs_unmount_confirmation.png
   :alt: NFS Storage Management
   :width: 800

SMB Storage
^^^^^^^^^^^

**SMB/CIFS Storage:**

SMB (Server Message Block), formerly known as CIFS (Common Internet File System), is a network file sharing protocol primarily used by Windows environments. It allows computers to access files over a network as if they were local drives, similar to NFS functionality.

**Importance for Hypervisors**

For hypervisors like Karios, SMB offers valuable benefits, particularly in mixed or Windows-integrated environments:

**Windows Integration**
   Simplifies integration in infrastructures that heavily utilize Windows servers and Active Directory, leveraging existing expertise and tools

**Shared Storage Capabilities**
   Similar to NFS, SMB enables multiple Karios hosts to access the same VM disk images (`.raw` files), which is crucial for live migration and high availability

**Live Migration Support (Future)**
   Allows seamless movement of running VMs between Karios hosts since both access the same storage location, minimizing downtime during migrations

**Administrative Familiarity**
   For administrators experienced with Windows environments, SMB setup and management are often more straightforward than NFS alternatives

**Cost-Effective Implementation**
   SMB solutions can be economical, especially when leveraging existing Windows servers for file sharing

**Protocol Comparison**

.. list-table:: 
   :header-rows: 1
   :widths: 20 40 40

   * - Protocol
     - Best Use Case
     - Key Characteristics
   * - **SMB/CIFS**
     - Windows-centric environments
     - Native Windows integration, familiar management
   * - **NFS**
     - Linux/Unix-centric setups
     - POSIX compliance, Unix-native features
   * - **SAN**
     - High-performance requirements
     - Superior performance but higher cost and complexity

**Storage Decision Factors**

**Choose SMB when:**

- Infrastructure has strong Windows presence
- Existing Windows file sharing infrastructure available
- Administrative team has Windows storage expertise
- Integration with Active Directory is required


.. figure:: _static/images/control_center/storage_management/storage_smb_storage_interface.png
   :alt: SMB Storage Interface
   :width: 800

**Mount SMB/CIFS Storage:** Click "Mount SMB/CIFS Storage" to configure SMB connections and follow these steps:

**Step 1: Gather SMB Server Information**
Before configuring, obtain the following details:

- SMB server IP address or NetBIOS name
- Share name on the SMB server
- Authentication credentials (username and password)

**Step 2: Configure SMB Mount**

**ID:** Enter a name to identify this SMB mount (e.g., "karios")

**NetBIOS Name:** Enter the Windows computer name or NetBIOS name (e.g., "DESKTOP-FHPF4OS")

.. tip::
   A NetBIOS name is a legacy computer name used in Windows networking that can be utilized when specifying the server address for mounting SMB/CIFS shares.

**Server:** Enter the IP address of your SMB server (e.g., 192.168.111.230)

.. tip::
   An SMB (Server Message Block) / CIFS (Common Internet File System) server allows users on a network to share files, printers, and other resources using the Windows networking protocol.

**Share:** Enter the name of the shared folder (e.g., "shared-folder")

.. tip::
   An SMB share is a designated folder on an SMB/CIFS server that's made accessible to other computers on the network for file sharing.

**Username:** Enter your SMB authentication username (e.g., "smbuser")

.. tip::
   An SMB username is a specific account name used to authenticate and access resources (like files and folders) on an SMB/CIFS share, separate from your local computer's login.

**Password:** Enter your SMB authentication password

.. tip::
   An SMB password is the secret credential associated with an SMB username, required for authentication when accessing shared resources on an SMB/CIFS server.

**Step 3: Configure Options**

- ✓ **Auto Mount on Restart**: Check this to automatically mount SMB storage when system restarts
- ✓ **Add to Datastore**: Check this to make the storage available for virtual machines

**Step 4: Complete Setup**
Click Submit to save the configuration and mount the SMB storage.

.. figure:: _static/images/control_center/storage_management/storage_smb_configuration_form.png
   :alt: SMB Configuration Form
   :width: 600

**SMB Server Configuration:** SMB/CIFS server connections.

.. figure:: _static/images/control_center/storage_management/storage_smb_server_status.png
   :alt: SMB Server Status
   :width: 600

**Unmount:** Click on the "delete" icon to unmount SMB storage.


Storage Operations
^^^^^^^^^^^^^^^^^^

**Common Storage Operations:**

- **Mount/Unmount**: Mount and unmount storage systems
- **Connection Management**: Connect and disconnect from storage targets
- **Capacity Monitoring**: Real-time storage usage and capacity monitoring
- **Status Tracking**: Monitor connection status and storage health
- **Configuration Management**: Configure storage protocol settings

**Storage Management Features:**

- **Protocol Selection**: Dropdown selection for different storage protocols
- **Unified Interface**: Single interface for all storage protocol management
- **Real-time Monitoring**: Live storage metrics and status updates
- **Action Controls**: Direct action buttons for storage operations
- **Storage Analytics**: Detailed storage usage and performance metrics

For detailed information regarding storage protocols, configuration options, advanced features, and comprehensive storage management, please refer to Flexible Storage.

SeaweedFS Storage
^^^^^^^^^^^^^^^^^

**SeaweedFS Distributed Object Storage:**
SeaweedFS is a distributed file system that provides scalable object and file storage with automatic replication. It offers both S3-compatible object storage and POSIX file system interfaces for flexible data access.

**SeaweedFS Terms:**

**Master Server:** Controls the distributed file system by managing metadata, coordinating volume servers, and handling file location requests. It acts as the central coordinator for the entire SeaweedFS cluster.

**Volume Server:** Stores the actual file data and handles read/write operations. Multiple volume servers work together to provide distributed storage capacity and redundancy.

.. figure:: _static/images/control_center/storage_management/storage_seaweedfs_interface.png
   :alt: SeaweedFS Interface
   :width: 600

**Master Server Management:** Configure and manage SeaweedFS master servers

To configure SeaweedFS Master, follow these steps:

**Step 1: Access SeaweedFS Configuration**

Navigate to the SeaweedFS section in your Karios interface

Click Configure Master to begin master server setup

.. figure:: _static/images/control_center/storage_management/storage_seaweedfs_master_configuration.png
   :alt: SeaweedFS Master Configuration Navigate
   :width: 618

**Step 2: Configure Master Server**

**Datacenter:** Enter datacenter identifier (e.g., "dc0")

.. tip::
   A logical identifier that represents a physical data center or geographic location where SeaweedFS nodes are deployed. This helps SeaweedFS understand the physical topology and make intelligent replication decisions to ensure data copies are distributed across different locations for disaster recovery.

**Rack:** Enter rack identifier (e.g., "r0")

.. tip::
   A logical identifier that represents a physical server rack within a datacenter. SeaweedFS uses rack information to ensure data replicas are stored on servers in different racks, providing protection against rack-level failures such as power loss, network switch failures, or cooling issues affecting an entire rack.

**Default Replication:** Set replication factor (e.g., "000")

.. tip::
   A three-digit configuration that defines how many copies of data SeaweedFS automatically creates and where they are stored. The format is "XYZ" where X = copies across datacenters, Y = copies across racks, Z = copies across volume servers. For example, "001" means 1 copy on different volume servers, "010" means 1 copy on different racks, and "100" means 1 copy across different datacenters.

.. note::
   SeaweedFS replication 000: Stores only a single copy of each chunk (no replicas). Use this setting only when durability isn't required as any volume/node failure may result in data loss.

   In a single-node deployment, SeaweedFS replication is disabled and has no effect. Replication is only applicable when multiple volume servers (nodes) are configured.

**Select Node for Master Configuration:** Choose which node will serve as the master server


.. figure:: _static/images/control_center/storage_management/storage_seaweedfs_master_configuration_dialog.png
   :alt: SeaweedFS Master Configuration Navigate
   :width: 618

**Configure Volumes:** Click "Configure Volumes" to manage storage volumes and select a server IP address from the available list.

.. figure:: _static/images/control_center/storage_management/storage_seaweedfs_volume_configuration.png
   :alt: SeaweedFS Volume Configuration
   :width: 600

.. figure:: _static/images/control_center/storage_management/storage_seaweedfs_volume_configuration_dialog.png
   :alt: SeaweedFS Volume Configuration
   :width: 600

**Unmount Volumes:** Click on Unmount button to remove the volume servers

.. figure:: _static/images/control_center/storage_management/storage_seaweedfs_volume_unmount.png
   :alt: SeaweedFS Volume Unmount
   :width: 600

**Master Servers Display:** View active master servers with IP addresses and status

- **IP Address**: Master server addresses (e.g., 192.168.116.137:9333)
- **Status**: Active status for all master servers
- **Multi-Master Support**: Multiple master servers for high availability

**Delete Configure:** Removes the entire seaweed configuration.

.. figure:: _static/images/control_center/storage_management/storage_seaweedfs_remove_master_configuration.png
   :alt: SeaweedFS Master Servers
   :width: 600


ISO Management Operations
~~~~~~~~~~~~~~~~~~~~~~~~~

.. note::
   Control Center level ISO section is only enabled if seaweed is configured. If you don't wish to configure seaweed, please navigate to the node level ISO section to upload or download ISO.

**Understanding Basic Terms:**

**ISO:** A disk image file format that contains an exact copy of data from an optical disc (CD/DVD). In virtualization, ISO files are used as virtual installation media to install operating systems or software on virtual machines, eliminating the need for physical discs.

**RAW:** An uncompressed disk image format that contains a bit-for-bit copy of a storage device or partition. RAW images provide maximum compatibility and performance but consume more storage space since they don't use compression, making them ideal for high-performance virtual machine storage.

ISO Operations:
^^^^^^^^^^^^^^^

- **Download ISO**: Download ISO files using FQDN URL with appended ISO file path
- **Upload ISO**: Upload valid ISO files to the data center storage
- **RAW File Support**: Upload and manage RAW disk image files
- **File Selection**: Browse and select from available ISO and RAW files
- **Availability Tracking**: Real-time view of available ISO and RAW files

.. figure:: _static/images/control_center/iso_management/iso_management_interface.png
   :alt: ISO Management Interface
   :width: 600

ISO Management Features:
^^^^^^^^^^^^^^^^^^^^^^^^

- **Dual Upload Support**: Support for both ISO and RAW file formats
- **URL-based Downloads**: Download ISO files directly from FQDN URLs
- **File Browser Integration**: Integrated file selection interface
- **Availability Dropdown**: Dropdown menu displaying all available ISO and RAW files
- **Upload Status Monitoring**: Real-time upload progress and completion status
- **File Validation**: Automatic validation of uploaded ISO and RAW files

**ISO Management Interface:**

**Download Section:** FQDN URL input field with download button for remote ISO retrieval (e.g., https://download.freebsd.org/ftp/releases/ISO-IMAGES/14.2/FreeBSD-14.2-RELEASE-amd64-bootonly.iso)

Please give a valid FQDN URL in the input field and click "download"

.. figure:: _static/images/control_center/iso_management/iso_download_interface.png
   :alt: ISO Download Interface
   :width: 600

**Upload Section:** File selection interface with upload button for local ISO/RAW files

Select a valid iso or raw file and click "upload"

.. figure:: _static/images/control_center/iso_management/iso_upload_interface.png
   :alt: ISO Upload Interface
   :width: 600

**Available Files Dropdown:** Comprehensive list of all available ISO and RAW files (cloud images)

.. figure:: _static/images/control_center/iso_management/available_iso_files.png
   :alt: Available ISO Files
   :width: 600

**Status Indicators:** Visual indicators for file availability and upload status

**File Management Controls:** Direct access to file operations and management functions

**Supported File Types:**

- **ISO Files**: Standard ISO 9660 disk image files
- **RAW Files**: Raw disk image files and virtual machine disk formats
- **Validation**: Automatic file format validation during upload process

Network Management Operations
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Network Navigation Structure
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

- **Network Tab Selection:** Access network management by selecting the Network tab from the main navigation
- **Dropdown Menu Options:** Choose between "Switches" and "Interface" from the network options dropdown
- **Search Functionality:** Search network options using the integrated search bar
- **Server Selection:** Select target server from the server dropdown menu

.. figure:: _static/images/control_center/network_management/network_navigation.png
   :alt: Network Navigation
   :width: 600


Switches Section (Selected from Network dropdown)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
- **Virtual Switch:** A software-based network switch that operates within the host system, enabling communication between virtual machines and connecting them to physical or virtual network interfaces. It functions like a physical Ethernet switch by learning MAC addresses, forwarding traffic, and managing network connections entirely in software.
- **Interface:** A network connection point that allows systems to communicate over a network. This can be a physical network interface (like an Ethernet port) or a virtual interface (like a VM's network adapter), serving as the entry and exit point for network traffic.

Vale Switches Tab
^^^^^^^^^^^^^^^^^^

**A High performance networking (software) switch** that delivers packet delivery with low latency and high throughput compared to regular software switches.

After navigating to Switches and Select Vale Switch.

.. figure:: _static/images/control_center/network_management/vale_switches.png
   :alt: Vale Switches
   :width: 600

To create a Vale switch, please click on this.

.. figure:: _static/images/control_center/network_management/create_vale_switch.png
   :alt: Create Vale Switch
   :width: 600

Please enter the following fields for the vale switch configuration:

**Vale Switch Number (not greater than 4094):** An identifier to each VALE switch.

.. tip::
   VALE Switch Number: A unique numerical identifier assigned to each VALE switch instance within the system. This number distinguishes between multiple VALE switches running on the same host, allowing the system to route traffic to the correct high-performance switch instance (e.g., vale0, vale1, vale2).

**Tap Interface & VM Mapping field:** Select a tap interface of your desired vm from the available list for vale connection

**Network Interface:** Select the network interface from the available list of interfaces.

.. tip::
   **TAP Interface:** A virtual network interface that operates at Layer 2 (Ethernet level), simulating a complete network card that can send and receive raw Ethernet frames. It's commonly used to connect virtual machines to networks by creating a virtual ethernet adapter that appears as a real network device to the operating system.

   **VLAN:** A Virtual Local Area Network that logically segments a physical network into multiple isolated networks using VLAN tags. VLANs allow you to create separate network segments on the same physical infrastructure, improving security and organization by grouping devices logically rather than physically.

.. figure:: _static/images/control_center/network_management/vale_switch_configuration.png
   :alt: Vale Switch Configuration
   :width: 600

**The VALE switches module has 3 types of Network topologies.**

**a) Fully connected network:** parent interface - VALE - tap interface(s)

.. figure:: _static/images/control_center/network_management/fully_connected_network.png
   :alt: Fully Connected Network
   :width: 600

**b) Unused Networks:** parent interface - vale

.. figure:: _static/images/control_center/network_management/unused_networks.png
   :alt: Unused Networks
   :width: 600

**c) Isolated Networks:** VALE - tap interface(s)

.. figure:: _static/images/control_center/network_management/isolated_networks.png
   :alt: Isolated Networks
   :width: 600

Clicking on any topology element displays a detailed view showing the complete network hierarchy: the parent physical interface, the VALE switch configuration, and all connected virtual machine TAP interfaces.

.. figure:: _static/images/control_center/network_management/vale_topology_details.png
   :alt: Network Topology Details
   :width: 600

An option to detach the parent interface is available, which will convert the network into an isolated network. A warning will be displayed before performing this destructive action.

.. figure:: _static/images/control_center/network_management/detach_parent_warning.png
   :alt: Detach Warning
   :width: 600

You will find two detach options on the right side of the VALE switch:

- **Bulk detach all TAP interfaces**: Removes all connected virtual machine interfaces at once
- **Detach individual TAP interfaces**: Selectively remove specific virtual machine interfaces

If available interfaces exist, you can add them to the VALE switch.

.. figure:: _static/images/control_center/network_management/add_child_interfaces.png
   :alt: Add Child Interfaces
   :width: 600

A destroy switch option is available with a warning that displays the potential impact of destroying the VALE switch before executing the destructive action.

.. figure:: _static/images/control_center/network_management/destroy_switch_warning.png
   :alt: Destroy Switch Warning
   :width: 600


Virtual Switches Tab
^^^^^^^^^^^^^^^^^^^^

Access traditional network bridge switch management

.. figure:: _static/images/control_center/network_management/virtual_switches.png
   :alt: Virtual Switches
   :width: 600

**Create Switch Button:** Create new switches with type selection and configuration options

.. figure:: _static/images/control_center/network_management/create_virtual_switch.png
   :alt: Create Switch Button
   :width: 600

To create a new switch

**Switch name:** Give a unique alphanumeric name to the switch

.. tip::
   A unique identifier assigned to distinguish and manage individual virtual switches within the Karios network infrastructure.
   

**Select interface:** Select the desired interface for switch configuration

.. tip::
   A network connection point that allows systems to communicate over a network. This can be a physical network interface (like an Ethernet port) or a virtual interface (like a VM's network adapter), serving as the entry and exit point for network traffic.


Click "Create Network Switch" button


.. figure:: _static/images/control_center/network_management/create_network_switch.png
   :alt: Create Network Switch Form
   :width: 600


Interface Section (Selected from Network dropdown)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

- **Physical Tab:** Access physical network interface management and monitoring
- **Virtual Tab:** Access virtual network interface and VLAN configuration

Overview: You will be able to manage 2 kinds of interfaces:

Physical Interface
^^^^^^^^^^^^^^^^^^

This is the landing page which allows you to view your Network Interface Cards (NIC) and their status.

.. figure:: _static/images/control_center/network_management/physical_interface_landing.png
   :alt: Physical Interface Landing
   :width: 600

The Interface panel also gives the MAC address, IP address, media, VLAN's connected to the NIC, etc.

.. tip::
   **MAC Address:** A unique 48-bit hardware identifier assigned to network interfaces, displayed in hexadecimal format (e.g., 00:50:56:12:34:56). It serves as the physical address for network communication at the data link layer.

   **IP Address:** A numerical address assigned to devices on a network for identification and communication. It can be IPv4 (e.g., 192.168.1.100) or IPv6 format, used for routing traffic across networks.

   **Media:** The physical transmission medium or connection type used by a network interface, such as Ethernet copper cables, fiber optic cables, or wireless connections.

   **NIC:** Network Interface Card - a hardware component that connects a computer to a network, providing the physical interface for sending and receiving network data over Ethernet or other network protocols

.. figure:: _static/images/control_center/network_management/physical_interface.png
   :alt: Physical Interface
   :width: 600

Click on 'View Details' to view the Received & Transmitted packets.

.. note::
   View Details is only available for active interfaces.

**Interface Monitoring:** Real-time monitoring of physical network adapters (igc0, igc1, etc.)

**Speed and Duplex:** Display interface speed (1000 Mbps) and duplex settings (Full Duplex)

**MAC Address Information:** View MAC addresses and network interface identifiers

**IP Configuration:** Monitor IPv4 and IPv6 address assignments and CIDR notation

**MTU Settings:** View and manage Maximum Transmission Unit settings

**Status Indicators:** Active, Link Up, and Editable status monitoring

**View Details:** Access detailed interface configuration and statistics

.. figure:: _static/images/control_center/network_management/physical_interface_stats.png
   :alt: Physical Interface Stats
   :width: 600

Virtual Interfaces
^^^^^^^^^^^^^^^^^^
**Virtual Network Interfaces (VLANs):**
In the Network Interfaces tab, like shown below, please navigate to Virtual.

.. figure:: _static/images/control_center/network_management/virtual_interface_landing.png
   :alt: Virtual Interface Landing
   :width: 600

We have Virtual LANs (VLAN's) currently supported and the landing page shows you the metrics associated with VLANs like count, status, VLANs with IP and Tag ID.

In each VLAN, you will get basic information like its MAC address, IP, status, parent interface.(usually the physically interface which is seen above)

Under the Virtual Interface - Virtual LANs (VLANs), you will be able to find an option to create a VLAN - 'Add VLAN'

**VLAN Management:** Configure and manage Virtual LANs with comprehensive settings

.. figure:: _static/images/control_center/network_management/vlan_management.png
   :alt: VLAN Management
   :width: 600

**Add VLAN Button:** Click on 'Add VLAN', it redirects you to a vlan configuration popup.

.. figure:: _static/images/control_center/network_management/add_vlan.png
   :alt: Add VLAN Form
   :width: 600

**VLAN Configuration Process:**

Provide all the information given below and click "Create VLAN"

- **Tag ID Assignment:** Enter VLAN tag ID within valid range (1-4094) with duplicate avoidance

.. tip::
   - **Tag ID Assignment:** A unique numerical identifier (1-4094) assigned to VLAN traffic for network segmentation. The tag is added to Ethernet frames to identify which VLAN the traffic belongs to, enabling logical network separation on shared physical infrastructure.

- **Parent NIC Selection:** Choose parent network interface from available interfaces dropdown (Parent network interface is usually from the Network → physical Interfaces, an "active" parent interface is provided).

- **Selecting IP:** If you choose to allow Dynamic IP assignment based on the Tag ID you entered, you can skip entering the Static IP address and Subnet Mask. (It will either automatically assign an IP within 15 seconds or asks you to enter Static IP While Entering Static IP addresses it is recommended to enter IP as per the tag ID, and the subnet (the recommended formats are entered in the place holders).

.. tip::
   - **Subnet:** A logical subdivision of an IP network that groups devices within a specific IP address range using subnet masks (e.g., 192.168.1.0/24). Subnets organize network traffic and improve security by creating logical network boundaries.
   - **Dynamic IP:** An IP address automatically assigned to a device by a DHCP server from a predefined pool of available addresses. The address can change when the device reconnects or when the lease expires.
   - **Static IP:** A permanently assigned IP address that remains constant and is manually configured on a device. Static IPs provide consistent network identity and are essential for servers and network infrastructure that need predictable addressing.

.. note::
  It is recommended that you have your L2 network configurations ready as per your requirements.

.. figure:: _static/images/control_center/network_management/vlan_create_dialog.png
   :alt: VLAN Create Dialog
   :width: 600

**VLAN Management Module:**

- **VLAN Details:** Display VLAN name, Tag ID, MAC address information
- **Network Configuration:** Show Parent NIC, IPv4 addresses, and MTU settings

.. tip::
  MTU Settings: Maximum Transmission Unit - the largest size of data packet that can be transmitted over a network interface, measured in bytes. 
  
  Standard Ethernet MTU is 1500 bytes, while jumbo frames can support up to 9000 bytes for improved performance on high-speed networks.
  
  Status Monitoring: Active status, admin up/down state, and connectivity indicators

**Action Controls:** View, Stats, Ping, and Delete functionality for each VLAN

.. figure:: _static/images/control_center/network_management/vlan_management_module.png
   :alt: VLAN Management Module
   :width: 600

You can perform all the 4 actions mentioned above per VLAN:

**View:** This gives you details such as Parent NIC, MAC address, Status, Virtual Switches connected, Routing Table. (Please scroll down to find them)

.. figure:: _static/images/control_center/network_management/vlan_view_details.png
   :alt: VLAN View Details
   :width: 600

**Stats:** The packets VLAN receives and transmits is displayed here.

.. figure:: _static/images/control_center/network_management/vlan_stats.png
   :alt: VLAN Stats
   :width: 600

**Ping:** For an Active VLAN, a ping is possible to its gateway. In this case VLAN with Tag ID 115 is connecting to its interface 115.253.

.. figure:: _static/images/control_center/network_management/vlan_ping.png
   :alt: VLAN Ping
   :width: 600

**Delete:** Before you delete a VLAN, you will be given a warning on the connected switches that will be isolated if the VLAN is deleted.

.. figure:: _static/images/control_center/network_management/vlan_delete_warning.png
   :alt: VLAN Delete Warning
   :width: 600

Stats Management Operations
~~~~~~~~~~~~~~~~~~~~~~~~~~~

Stats Navigation Structure
^^^^^^^^^^^^^^^^^^^^^^^^^^

- **Stats Tab Selection**: Access statistics and monitoring by selecting the Stats tab from the main navigation
- **Live and Recommendations Tabs**: Toggle between real-time monitoring and system recommendations
- **Node & VM Stats Overview**: Comprehensive monitoring of both physical nodes and virtual machines
- **Real-time Data Updates**: Live statistics with automatic refresh capabilities

.. figure:: _static/images/control_center/node_monitoring/stats_navigation.png
   :alt: Stats Navigation
   :width: 600

Live Statistics Monitoring
^^^^^^^^^^^^^^^^^^^^^^^^^^

- **Node Performance Metrics**: Real-time monitoring of CPU percentage, memory usage, power consumption, and uptime
- **VM Performance Tracking**: Individual virtual machine CPU usage, memory consumption, and operational status
- **Status Indicators**: Visual status indicators showing NORMAL, Running, or Stopped states
- **Multi-Node Support**: Monitor multiple nodes simultaneously with consolidated view
- **Resource Utilization**: Track resource allocation and usage patterns across the infrastructure

.. figure:: _static/images/control_center/node_monitoring/live_statistics.png
   :alt: Live Statistics
   :width: 600

Node Statistics Display
^^^^^^^^^^^^^^^^^^^^^^^

- **Node Name**: Display of node identifiers and hostnames
- **CPU Usage**: Real-time CPU utilization percentage with core count information
- **Memory Usage**: Memory consumption percentage with total available memory in GB
- **Power Consumption**: Current power usage in watts with power status indicators
- **Uptime Information**: Node uptime tracking with days, hours, and minutes format
- **Status Monitoring**: Overall node health status with color-coded indicators

.. figure:: _static/images/control_center/node_monitoring/node_statistics.png
   :alt: Node Statistics
   :width: 600

Virtual Machine Statistics
^^^^^^^^^^^^^^^^^^^^^^^^^^

- **VM Name**: Individual virtual machine identification and naming
- **CPU Usage**: Per-VM CPU utilization with allocated CPU core information
- **Memory Usage**: VM memory consumption with allocated memory in GB
- **VM Status**: Current operational status (Running, Stopped) with color coding
- **Uptime Tracking**: Individual VM uptime monitoring with precise time formatting
- **Status Health**: VM health status indicators with NORMAL operational states

.. figure:: _static/images/control_center/node_monitoring/vm_statistics.png
   :alt: VM Statistics
   :width: 600

Recommendations System
^^^^^^^^^^^^^^^^^^^^^^

- **Time Range Selection**: Configurable time range dropdown for recommendation analysis (1 Week default)
- **Apply Button**: Apply selected time range for recommendation generation
- **Expandable Recommendations**: Click on any node row to expand detailed VM recommendations
- **Resource Optimization**: Intelligent recommendations for resource allocation and scaling
- **Performance Insights**: Detailed analysis and suggestions for infrastructure optimization

.. figure:: _static/images/control_center/node_monitoring/recommendations_system.png
   :alt: Recommendations System
   :width: 600

Recommendation Details
^^^^^^^^^^^^^^^^^^^^^^

- **VM-Level Recommendations**: Individual virtual machine optimization suggestions
- **CPU Recommendations**: CPU scaling recommendations with specific core adjustments
- **Memory Recommendations**: Memory optimization suggestions with GB-level adjustments
- **Action Suggestions**: Specific actions like "scale-down" for underutilized resources
- **Justification**: Detailed explanations for each recommendation with reasoning
- **Resource Efficiency**: Recommendations to free up capacity and optimize resource usage

.. figure:: _static/images/control_center/node_monitoring/recommendations_stats_features.png
   :alt: Recommendation Details
   :width: 600

Statistics Table Features
^^^^^^^^^^^^^^^^^^^^^^^^^^

- **Sortable Columns**: Sort by node name, CPU usage, memory usage, power, uptime, and status
- **Color-Coded Status**: Visual status indicators for quick health assessment
- **Expandable Rows**: Click to expand nodes and view detailed VM statistics
- **Real-time Updates**: Automatic refresh of statistics data
- **Multi-Level Monitoring**: Both node-level and VM-level statistics in unified view

Performance Monitoring Capabilities
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

- **Resource Utilization Tracking**: Monitor CPU, memory, and power consumption patterns
- **Capacity Planning**: Resource usage insights for infrastructure planning
- **Health Monitoring**: Continuous monitoring of system health and operational status
- **Optimization Insights**: Data-driven recommendations for performance improvements

System Releases Operations
~~~~~~~~~~~~~~~~~~~~~~~~~~

Releases Navigation Structure
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

- **Releases Tab Selection**: Access system releases and updates by selecting the Releases tab from the main navigation
- **Four Main Sections**: Navigate between Versions, Updates, History, and Install Jobs tabs
- **Host Management**: Filter and search functionality for managing multiple hosts and nodes
- **Remote Server Integration**: Fetch updates from remote servers with timestamp tracking

.. figure:: _static/images/control_center/releases_and_updates/releases_navigation.png
   :alt: Releases Navigation
   :width: 600

Versions Tab
^^^^^^^^^^^^

Click on versions tab and select any node to view the update versions.

- **Host Listing**: Display all available hosts with expandable rows for detailed version information
- **Version Count Indicators**: Show number of available versions per host with numeric badges
- **Search and Filter**: Filter by Host Name, Update Type (All/Core/OS), and Version numbers
- **Expandable Interface**: Click on host names to expand and view detailed version information
- **Version Details**: View specific update types (CORE, OS) with version numbers and request timestamps

.. figure:: _static/images/control_center/releases_and_updates/versions_tab.png
   :alt: Versions Tab
   :width: 600

.. figure:: _static/images/control_center/releases_and_updates/versions_tab_details.png
   :alt: Version Details
   :width: 600

Updates Tab
^^^^^^^^^^^

**Available Updates:** Click on the updates tab to display all available system updates with comprehensive details

.. figure:: _static/images/control_center/releases_and_updates/updates_tab.png
   :alt: Updates Tab
   :width: 600

- **Remote Server Sync**: Shows "Fetched from remote server" status with last fetch timestamp
- **Update Information**: Display update name, version, description, type, and available actions
- **Download and Install**: Direct download and install buttons for each available update

.. figure:: _static/images/control_center/releases_and_updates/download_button.png
   :alt: Update Information
   :width: 600

Once you click the Download button, the update package will be downloaded to the system. When the download is complete, the Install button will become active, allowing you to proceed with the installation. Click on "install" button to open the install update dialog.

.. figure:: _static/images/control_center/releases_and_updates/install_button.png
   :alt: Install Button
   :width: 600

.. figure:: _static/images/control_center/releases_and_updates/install_update_dialog.png
   :alt: Install Update Dialog
   :width: 600

- **Update Categories**: Filter updates by type (Core, OS, Security) and priority levels
- **Action Controls**: Install, Download, and Logs buttons for update management

Update Installation Process
^^^^^^^^^^^^^^^^^^^^^^^^^^^

**Install Update Dialog:** Comprehensive installation interface with multiple configuration options
- **Update Details**: Display update type (CORE, OS, UI) and version information
- **Node Selection**: Multi-select interface for choosing target nodes for installation
- **Installation Status**: Track Already Updated, Pending, and Scheduled installation states
- **Schedule Management**: Optional scheduling with date/time picker for future installations

**Steps to install an update:**

1. Select a node from the available list.
2. Choose between immediate installation or scheduled deployment
3. Click on "install now" for immediate installation.

.. figure:: _static/images/control_center/releases_and_updates/installation_steps.png
   :alt: Installation Steps
   :width: 600

.. note::
   We have two update install options i.e., "install now" for instant installation and "set schedule time" for later installation.

Installation Scheduling
^^^^^^^^^^^^^^^^^^^^^^^

- **Schedule Options**: Set specific date and time for update installation
- **Future Date Validation**: Ensure scheduled installations are set for future dates and times
- **Schedule Management**: Click on "Set Schedule Time" for scheduled update deployment.

.. figure:: _static/images/control_center/releases_and_updates/schedule_options_1.png
   :alt: Schedule Options 1
   :width: 600

.. figure:: _static/images/control_center/releases_and_updates/schedule_options_2.png
   :alt: Schedule Options 2
   :width: 600

- **Clear Schedule**: Option to clear scheduled time and install immediately
- **Multi-Node Support**: Schedule installations across multiple selected nodes

History Tab
^^^^^^^^^^^

Click on "history" tab to view

- **Update History**: Complete historical record of all system updates and installations
- **Filter Options**: Filter by Update Type, Host Name, Action, and Status
- **Detailed Records**: View update type, host name, action, version, initiated by, status, and request timestamp
- **Status Tracking**: Track SUCCESS, ERROR, and other status indicators for historical updates
- **User Attribution**: Show which user initiated each update or installation
- **Chronological View**: Updates displayed in chronological order with timestamps

.. figure:: _static/images/control_center/releases_and_updates/update_history.png
   :alt: Update History
   :width: 600

Install Jobs Tab
^^^^^^^^^^^^^^^^

Click on the "install jobs" tab

- **Job Management**: Monitor and manage all installation jobs and their current status
- **Job Filtering**: Filter by Update Type, Status, Requested By, and Scheduled status
- **Job Details**: Display Job ID, Update Type, Version, Requested By, Scheduled status, Nodes count, Success/Failure counts, and overall Status
- **Status Monitoring**: Track PENDING, FAILED, SUCCESS, and other job statuses
- **Scheduled Jobs**: Identify and manage scheduled installations with "Yes/No" indicators
- **Job Statistics**: View success and failure counts for each installation job

.. figure:: _static/images/control_center/releases_and_updates/install_jobs.png
   :alt: Install Jobs
   :width: 600

Installation Monitoring
^^^^^^^^^^^^^^^^^^^^^^^

- **Install Summary**: Comprehensive installation summary with timestamp, Job ID, and node count
- **Status Tracking**: Real-time status updates (FAILED, SUCCESS, PENDING, IN PROGRESS)
- **Success and Failure Counts**: Track installation success and failure statistics

.. figure:: _static/images/control_center/releases_and_updates/installation_monitoring.png
   :alt: Installation Monitoring
   :width: 600

- **Detailed Status View**: Click on installation jobs to view detailed status information
- **Host-Level Details**: View individual host installation status with timestamps
- **Error Logging**: Access detailed installation logs for troubleshooting failed installations

Installation Logs and Details
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
.. figure:: _static/images/control_center/releases_and_updates/installation_logs.png
   :alt: Installation Logs
   :width: 600

- **Detailed Log Access**: View comprehensive installation logs for each host
- **Error Diagnosis**: Detailed error messages and failure analysis
- **Installation Timeline**: Track installation start time, completion time, and duration
- **Log Status**: Monitor log status (ERROR, SUCCESS) for each installation attempt
- **Rollback Information**: View rollback procedures and restoration details when installations fail
- **Filter by Status**: Filter installation details by All, Success, Failed, Pending, and In Progress

Advanced Features
^^^^^^^^^^^^^^^^^

- **Multi-Node Management**: Support for managing updates across multiple nodes simultaneously
- **Remote Update Fetching**: Automatic fetching of updates from remote servers with status indicators
- **Installation Rollback**: Automatic rollback capabilities for failed installations
- **Comprehensive Logging**: Detailed logging for all installation activities and system changes
- **Status Filtering**: Advanced filtering options for monitoring specific installation states

For detailed information regarding system release management, advanced update procedures, rollback processes, and comprehensive release deployment strategies, please refer to Section 9: System Release Management.


Data Center Efficiency 
~~~~~~~~~~~~~~~~~~~~~~~

Overview
^^^^^^^^^

The Data Center Efficiency Overview provides comprehensive monitoring and analysis of power efficiency metrics for datacenter operations. This system tracks three critical efficiency measurements: Power Usage Effectiveness (PUE), Carbon Usage Effectiveness (CUE), and Water Usage Effectiveness (WUE) to help optimize datacenter environmental performance and operational costs.

The efficiency dashboard enables administrators to:

* Monitor real-time power efficiency metrics across configurable date ranges
* Track carbon footprint and environmental impact
* Analyze water usage patterns for cooling systems
* Compare efficiency trends year-over-year
* Generate reports for sustainability compliance

Interface Components
^^^^^^^^^^^^^^^^^^^^^

**Efficiency Metrics Dashboard**

The main dashboard displays three primary efficiency indicators with current values and historical context:

.. figure:: _static/images/control_center/node_monitoring/efficiency_dashboard.png
   :alt: Efficiency Dashboard
   :width: 600

**Power Usage Effectiveness (PUE)**
   Current efficiency rating with contextual interpretation

**Carbon Usage Effectiveness (CUE)**  
   Environmental impact measurement based on power consumption

**Water Usage Effectiveness (WUE)**
   Cooling system efficiency and water consumption metrics

**Date Range Selection**

**PUE & CUE Date Range Configuration**
   * **Start Date**: Beginning of analysis period
   * **End Date**: End of analysis period  
   * **Apply Button**: Execute analysis for selected timeframe

**WUE Annual Selection**
   * **Year Dropdown**: Select specific year for water usage analysis
   * **Apply Button**: Generate annual water usage effectiveness report

Power Usage Effectiveness (PUE)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

**Definition and Measurement**

Power Usage Effectiveness measures how efficiently a datacenter uses energy by comparing total facility energy consumption to IT equipment energy consumption.

**Formula:**

.. math::

   PUE = \frac{\text{Total Facility Energy}}{\text{IT Equipment Energy}}

**Interpretation Guidelines:**

.. list-table:: PUE Rating Scale
   :widths: 20 30 50
   :header-rows: 1

   * - PUE Value
     - Efficiency Rating
     - Description
   * - 1.0
     - Perfect (Theoretical)
     - All energy consumed by IT equipment only
   * - 1.2 - 1.5
     - Excellent
     - Highly efficient datacenter operation
   * - 1.5 - 2.0
     - Good
     - Industry average performance
   * - 2.0 - 3.0
     - Fair
     - Room for improvement
   * - > 3.0
     - Poor
     - Significant inefficiency

**Current PUE Analysis**

**Displayed Value: 0.90**

This PUE value of 0.90 indicates exceptional efficiency, suggesting the datacenter is operating below the theoretical minimum. This may indicate:

* Measurement calibration issues requiring verification
* On-site renewable energy generation offsetting grid consumption  
* Advanced cooling technologies providing net energy benefits
* Potential calculation errors in measurement methodology

.. note::
   A PUE below 1.0 is physically impossible under normal circumstances. This reading should be investigated to ensure measurement accuracy.

**Optimization Guidance:**
   Lower PUE values indicate more efficient power utilization, with the goal of approaching 1.0 for optimal efficiency.

Carbon Usage Effectiveness (CUE)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

**Definition and Measurement**

Carbon Usage Effectiveness quantifies the greenhouse gas emissions associated with powering IT equipment, based on the carbon intensity of the electricity used.

**Formula:**

.. math::

   CUE = \frac{\text{Total CO}_2\text{ Emissions}}{\text{IT Equipment Energy}}

**Calculation Components:**

* **Total CO₂ Emissions**: Greenhouse gas emissions from all facility power consumption
* **IT Equipment Energy**: Power consumed specifically by computing, storage, and networking equipment
* **Carbon Intensity**: CO₂ emissions per unit of electricity (varies by grid source)

**Current CUE Analysis**

**Environmental Impact Assessment:**

.. list-table:: CUE Performance Benchmarks
   :widths: 20 30 50
   :header-rows: 1

   * - CUE Range
     - Environmental Rating
     - Typical Power Sources
   * - 0.4 - 0.5
     - Average
     - Mixed renewable and clean sources
   * - 0.5 - 0.7
     - Average to Poor
     - Standard grid mix
   * - 0.7 - 0.9
     - Poor
     - Coal-heavy electrical grid
   * - > 0.8
     - Very Poor
     - Heavy fossil fuel dependence

**Improvement Strategies:**
   Lower CUE values indicate cleaner power sources and reduced environmental impact.

Water Usage Effectiveness (WUE)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

**Definition and Measurement**

Water Usage Effectiveness measures the amount of water a datacenter consumes for cooling and operations relative to the IT energy load.

**Formula:**

.. math::

   WUE = \frac{\text{Annual Water Usage}}{\text{IT Equipment Energy}}

**Measurement Units:**
   Typically expressed in liters per kilowatt-hour (L/kWh) of IT equipment energy consumption.

**Current WUE Analysis**

**Water Efficiency Benchmarks:**

.. list-table:: WUE Performance Standards
   :widths: 20 30 50
   :header-rows: 1

   * - WUE Range (L/kWh)
     - Efficiency Rating
     - Cooling Technology
   * - 0.0 - 0.5
     - Excellent
     - Air-cooled systems, arid climates
   * - 0.5 - 1.0
     - Good
     - Efficient evaporative cooling
   * - 1.0 - 2.0
     - Average
     - Standard chilled water systems
   * - 2.0 - 4.0
     - Poor
     - Inefficient cooling systems
   * - > 4.0
     - Very Poor
     - Legacy cooling infrastructure

**Water Conservation Strategies:**
   Lower WUE values indicate more efficient water usage and reduced environmental impact on local water resources.

Monitoring and Analysis
^^^^^^^^^^^^^^^^^^^^^^^^

**Date Range Configuration**

**PUE & CUE Analysis Period**
   Configure start and end dates to analyze efficiency trends over specific timeframes:

   * **Historical Analysis**: Compare seasonal efficiency variations
   * **Trend Identification**: Identify efficiency improvements or degradation
   * **Event Correlation**: Analyze efficiency changes after infrastructure modifications
   * **Compliance Reporting**: Generate data for regulatory or certification requirements

**WUE Annual Analysis**
   Select specific years for water usage effectiveness comparison:

   * **Year-over-Year Comparison**: Track WUE improvements across multiple years
   * **Seasonal Patterns**: Understand annual water usage cycles
   * **Infrastructure Impact**: Measure efficiency changes after cooling system upgrades

**Performance Interpretation**

**Efficiency Trend Analysis**

Understanding the relationship between the three metrics:

* **PUE Impact on CUE**: Lower PUE typically results in lower CUE through reduced total power consumption
* **Cooling Efficiency**: High WUE may indicate cooling systems contributing to higher PUE
* **Regional Factors**: Local climate and grid carbon intensity significantly impact CUE and WUE values

**Optimization Priorities**

.. list-table:: Efficiency Optimization Framework
   :widths: 25 25 25 25
   :header-rows: 1

   * - Metric
     - Current Status
     - Target Range
     - Optimization Actions
   * - PUE (0.90)
     - Verify accuracy
     - 1.2 - 1.5
     - Investigate measurement methodology
   * - CUE (0.40)
     - Good performance
     - < 0.3
     - Increase renewable energy usage
   * - WUE (2.00)
     - Average efficiency
     - < 1.0
     - Upgrade cooling systems



Node Level Management
---------------------

Navigating to Node Level
~~~~~~~~~~~~~~~~~~~~~~~~
**Accessing Worker Node Components:** 
To access worker node level management, administrators must first navigate to the specific server they want to manage. This provides access to individual server components and detailed node-specific operations.

**Navigation Process:**

1. **Server Selection:** From the datacenter hierarchy in the left sidebar, select the specific worker node you want to manage

2. **Component Access:** Once a worker node is selected, the interface displays “Selected Server” with the server's name(e.g., k00000)

3. **Component Tabs:** The worker node interface provides access to specialized component tabs designed for individual server management

.. figure:: _static/images/login/node1.png
   :width: 600

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

.. figure:: _static/images/nodemanagement/Image_071.png
   :width: 600
   :alt: Node Home Dashboard

   Figure: Worker Node Home Dashboard

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

.. figure:: _static/images/nodemanagement/Image_071a.png
   :width: 600



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

**Hardware Information Display:** The System Information section provides comprehensive details about the server's hardware configuration and specifications.

**System Specifications:**

- **Make:** Hardware manufacturer information (e.g., “Supermicro”)
- **Model:** Server model designation (e.g., “Super Server”)
- **Network Interface:** Primary network interface details with IP address and MAC address

  - **Interface Name:** Network interface identifier (e.g., “bnxt0”)
  - **IP Address:** Server's network IP address (e.g., “192.168.116.111”)
  - **MAC Address:** Hardware MAC address (e.g., “7c:c2:55:e8:77:8c”)

.. figure:: _static/images/nodemanagement/Image_071b.png
   :width: 600


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

.. figure:: _static/images/nodemanagement/Image_072.png
   :width: 600


Power Monitoring
^^^^^^^^^^^^^^^^

**Real-time Power Metrics:** The Power section provides comprehensive power consumption monitoring and energy efficiency tracking.

**Power Consumption Metrics:**

- **Current:** Real-time current draw measurement (e.g., “0.34 A”)
- **Energy:** Cumulative energy consumption tracking (e.g., “15250.86 Wh (15.25 kWh)”)
- **Power:** Instantaneous power consumption (e.g., “38.53 W”)
- **Voltage:** Current voltage levels (e.g., “114.05 V”)

.. figure:: _static/images/nodemanagement/Image_073.png
   :width: 600




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

.. figure:: _static/images/nodemanagement/Image_074.png
   :width: 600



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

.. figure:: _static/images/nodemanagement/Image_075.png
   :width: 600



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

.. figure:: _static/images/nodemanagement/Image_076.png
   :width: 600



Node Console Management
~~~~~~~~~~~~~~~~~~~~~~~

Console Overview
^^^^^^^^^^^^^^^^

The Console tab provides direct access to the FreeBSD command-line interface for individual worker nodes, enabling administrators to perform advanced system administration tasks, troubleshooting, and direct system configuration through a web-based terminal interface.

**Console Interface Features:**

- **Web-based Terminal**: Browser-based access to the FreeBSD command line
- **Direct System Access**: Full command-line access to the underlying FreeBSD system
- **Real-time Interaction**: Live terminal session with immediate command execution
- **Administrative Control**: Complete system administration capabilities through CLI
- **Secure Access**: Password-protected console access with credential validation

Console Access and Authentication
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Accessing Node Console
""""""""""""""""""""""

**Console Navigation:**

1. **Node Selection**: Select the target worker node from the datacenter hierarchy
2. **Console Tab**: Click on the "Console" tab in the node management interface
3. **Console Interface**: The web-based console interface loads automatically
4. **Authentication Prompt**: System prompts for console access credentials


**Authentication Requirements:**

- **Console Access**: Requires valid system credentials for security
- **User Authentication**: Password-based authentication for console access
- **Session Management**: Secure session handling for terminal access
- **Credential Validation**: Real-time credential verification

Console Authentication Interface
""""""""""""""""""""""""""""""""

**Credentials Dialog:**

The console authentication interface provides secure access to the node's command-line interface:

**Authentication Components:**

- **Credentials Header**: "Credentials" dialog title
- **Password Field**: Secure password input field for user authentication
- **Send Credentials Button**: Submit authentication credentials to establish console session
- **Security Prompt**: Password-protected access to prevent unauthorized console access

**Authentication Process:**

1. **Access Console**: Navigate to the Console tab on the selected node
2. **Credentials Prompt**: System displays authentication dialog
3. **Enter Password**: Input the valid system password in the password field (Default password is "karios")
4. **Submit Credentials**: Click "Send credentials" to authenticate and establish console session
5. **Console Access**: Upon successful authentication, gain full console access

.. figure:: _static/images/node_console/node_console_authentication_prompt.png
   :alt: Node Console Authentication Prompt
   :width: 600

   Figure: Node Console Authentication Prompt

Console Operations and Commands
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

FreeBSD Command Line Access
"""""""""""""""""""""""""""

**System Administration Commands:**

Once authenticated, administrators have full access to FreeBSD system commands:

**System Monitoring:**

.. code-block:: bash

   # System status and resource monitoring
   top                    # Display running processes and system usage
   ps aux                 # List all running processes
   df -h                  # Display filesystem disk usage
   free -h                # Show memory usage statistics
   uptime                 # Display system uptime and load average

**Service Management:**

.. code-block:: bash

   # FreeBSD service management
   service -e             # List enabled services
   service <name> status  # Check service status
   service <name> start   # Start a service
   service <name> stop    # Stop a service
   service <name> restart # Restart a service

**Network Configuration:**

.. code-block:: bash

   # Network interface and connectivity
   ifconfig              # Display network interface configuration
   netstat -rn           # Show routing table
   ping <host>           # Test network connectivity
   sockstat -l           # Display listening sockets

**Log Analysis:**

.. code-block:: bash

   # System log examination
   tail -f /var/log/messages    # Monitor system messages in real-time
   grep "error" /var/log/messages # Search for errors in system logs
   dmesg                        # Display kernel boot messages
   logger "test message"        # Add custom message to system log

Advanced Console Operations
"""""""""""""""""""""""""""

**File System Operations:**

.. code-block:: bash

   # File and directory management
   ls -la                # List files with detailed information
   cd /path/to/directory # Change directory
   pwd                   # Display current directory
   mkdir directory_name  # Create new directory
   rm -rf directory      # Remove directory and contents

**System Configuration:**

.. code-block:: bash

   # System configuration files
   cat /etc/rc.conf      # View system startup configuration
   sysctl -a             # Display all system variables
   mount                 # Show mounted filesystems
   zpool status          # Check ZFS pool status (if applicable)

**Package Management:**

.. code-block:: bash

   # FreeBSD package management
   pkg info              # List installed packages
   pkg search <package>  # Search for packages
   pkg install <package> # Install new package
   pkg update            # Update package repository

**Process Management:**

.. code-block:: bash

   # Process control and monitoring
   killall <process>     # Kill processes by name
   kill -9 <pid>         # Force kill process by PID
   jobs                  # Display active jobs
   nohup <command> &     # Run command in background

Console Security and Best Practices
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Security Considerations
"""""""""""""""""""""""

**Console Access Security:**

- **Authentication Required**: All console access requires valid system credentials
- **Session Management**: Secure handling of console sessions and authentication
- **Command Logging**: System logs record console activity for audit purposes
- **Access Control**: Restrict console access to authorized administrators only
- **Session Timeout**: Implement appropriate session timeout policies

**Safe Console Practices:**

- **Command Verification**: Verify commands before execution, especially destructive operations
- **Backup Before Changes**: Create backups before making significant system modifications
- **Documentation**: Document important configuration changes and commands
- **Testing Environment**: Test critical changes in non-production environments first
- **Change Management**: Follow established change management procedures


Console Support and Documentation
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Getting Help
""""""""""""

**Console Documentation:**

- **FreeBSD Handbook**: Reference comprehensive FreeBSD documentation for command usage
- **Man Pages**: Use man pages within the console for detailed command documentation
- **System Help**: Access built-in help functions for commands and utilities
- **Community Resources**: Leverage FreeBSD community resources and forums

**Support Resources:**

- **Platform Documentation**: Refer to Karios platform documentation for integration guidance
- **Knowledge Base**: Access knowledge base articles for common console operations
- **Training Resources**: Utilize available training resources for FreeBSD administration

**Command Reference:**

.. code-block:: bash

   # Get help for any command
   man <command>         # Display manual page for command
   <command> --help      # Display command help (if available)
   which <command>       # Show path to command executable
   whereis <command>     # Locate command binary, source, and manual


ISO Management
~~~~~~~~~~~~~~

**ISO Operations:**

- **Download ISO:** Download ISO files using FQDN URL with appended ISO file path
- **Upload ISO:** Upload valid ISO files to the data center storage
- **RAW File Support:** Upload and manage RAW disk image files
- **File Selection:** Browse and select from available ISO and RAW files
- **Availability Tracking:** Real-time view of available ISO and RAW files

.. figure:: _static/images/nodemanagement/Image_077.png
   :width: 600



**ISO Management Features:**

- **Dual Upload Support:** Support for both ISO and RAW file formats
- **URL-based Downloads:** Download ISO files directly from FQDN URLs
- **File Browser Integration:** Integrated file selection interface
- **Availability Dropdown:** Dropdown menu displaying all available ISO and RAW files
- **Upload Status Monitoring:** Real-time upload progress and completion status
- **File Validation:** Automatic validation of uploaded ISO and RAW files

**ISO Management Interface:**

- **Download Section:** FQDN URL input field with download button for remote ISO retrieval

.. figure:: _static/images/nodemanagement/Image_078.png
   :width: 600

Please provide a valid FQDN url and click “Download”. The downloaded iso can be viewed in the Available ISOs section.

- **Upload Section:** File selection interface with upload button for local ISO/RAW files

.. figure:: _static/images/nodemanagement/Image_079.png
   :width: 600

Please select the appropriate ISO/RAW files from your system and click “Upload”. The uploaded file will be in the available ISO/Cloud images section.

- **Available Files Dropdown:** Comprehensive list of all available ISO and RAW files

.. figure:: _static/images/nodemanagement/Image_080.png
   :width: 600

- **Status Indicators:** Visual indicators for file availability and upload status
- **File Management Controls:** Direct access to file operations and management functions


**Supported File Types:**

- **ISO Files:** Standard ISO 9660 disk image files
- **RAW Files:** Raw disk image files and virtual machine disk formats
- **Validation:** Automatic file format validation during upload process


PCIe Devices 
~~~~~~~~~~~~~

Overview
^^^^^^^^^

The PCIe Devices interface allows you to view and manage all PCIe (Peripheral Component Interconnect Express) devices installed in your server. PCIe is the modern standard for connecting hardware components like graphics cards, network cards, and storage devices to your computer's motherboard.

Think of PCIe devices as the various pieces of hardware that plug into slots on your computer's motherboard to give it different capabilities - like adding graphics processing, network connectivity, or storage functions.

.. figure:: _static/images/nodemanagement/PCIE_tab.png
   :alt: PCIe Devices
   :width: 600

What is PCIe?
^^^^^^^^^^^^^

**PCIe Definition**
   PCIe stands for "Peripheral Component Interconnect Express." It's a high-speed connection standard that allows different hardware components to communicate with your computer's processor and memory.

**Why PCIe Matters**
   * **Speed**: Much faster than older connection types
   * **Flexibility**: Supports many different types of devices
   * **Expandability**: Allows you to add new capabilities to your server


Physical vs Virtual Functions
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

**Understanding PFs and VFs**

**Physical Functions (PFs)**
   * **Definition**: The actual, physical network ports on the hardware card
   * **Use**: Direct hardware access for maximum performance

**Virtual Functions (VFs)**
   * **Definition**: Software-created network interfaces that share the physical hardware
   * **Use**: Allows multiple virtual machines to share one physical network card


Virtual Function Management
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

**Creating Virtual Functions**

The interface allows you to create VFs (Virtual Functions) for SRIOV supported devices:

**Step 1: Identify Capable Devices**
   Look for devices showing "PFs" and "VFs" counters (like the X710 showing "2 PFs" and "4 VFs"). Click the device to expand details.

   .. figure:: _static/images/nodemanagement/PCIE_tab_with_VFs.png
         :alt: PCIe Devices with VFs
         :width: 600

**Step 2: Click Create VFs Button**
   Click the blue "Create VFs" button next to supported devices.

   .. figure:: _static/images/nodemanagement/PCIE_create_VFs_button.png
      :alt: Create VFs Button
      :width: 600

**Step 3: Configure Virtual Functions**
   A dialog box appears with the following options:

   .. figure:: _static/images/nodemanagement/PCIE_create_VFs_dialog.png
      :alt: Create VFs Dialog
      :width: 600

   * **Device Selection**: Shows the selected device (e.g., "ix1 - Ethernet Controller X710 for 10GbE SFP+")
   * **Number of Virtual Functions**: Enter how many VFs to create (e.g., 4)
   * **Information**: "Each virtual function will appear as a separate PCIe device"

**Step 4: Create VFs**
   Click "Create VFs" to generate the virtual functions.

   .. figure:: _static/images/nodemanagement/PCIE_create_VFs_confirm.png
      :alt: Confirm Create VFs
      :width: 600

**What Happens Next**
   * New virtual network interfaces are created
   * Each VF appears as a separate device in your system
   * Virtual machines can use these VFs for dedicated network access

**Virtual Function Details**

Once created, VFs appear in the "Virtual Functions" section:

.. figure:: _static/images/nodemanagement/PCIE_VFs_list.png
   :alt: Virtual Functions List
   :width: 600


**Device Categories and Filtering**

The interface provides filtering to help you find specific types of devices:

.. figure:: _static/images/nodemanagement/PCIE_filter_dropdown.png
   :alt: PCIe Device Filter
   :width: 600

**All Categories**
   Shows every PCIe device installed in the system, regardless of type.


.. figure:: _static/images/nodemanagement/PCIE_all_devices.png
   :alt: All PCIe Devices
   :width: 600

**Network**
   Displays only networking-related devices such as:
   * Ethernet controllers
   * Wireless network adapters
   * Network interface cards

   .. figure:: _static/images/nodemanagement/PCIE_network_devices.png
      :alt: Network PCIe Devices
      :width: 600

**Storage**
   Shows only storage-related devices such as:
   * NVMe SSDs
   * RAID controllers
   * Storage host adapters

   .. figure:: _static/images/nodemanagement/PCIE_storage_devices.png
      :alt: Storage PCIe Devices
      :width: 600

**GPU**
   Shows only graphics processing devices such as:
   * Dedicated graphics cards
   * Integrated graphics processors
   * GPU compute accelerators
   * Professional workstation graphics cards

   .. figure:: _static/images/nodemanagement/PCIE_gpu_devices.png
      :alt: GPU PCIe Devices
      :width: 600


Common Use Cases
^^^^^^^^^^^^^^^^

**Typical PCIe Device Scenarios**

**Storage Expansion**
   * **Scenario**: Need more or faster storage
   * **Solution**: Add NVMe PCIe SSDs for high-speed storage
   * **Benefit**: Much faster than traditional hard drives

**Network Performance**
   * **Scenario**: Need faster network connections
   * **Solution**: Install 10GbE or higher speed network cards
   * **Benefit**: Faster data transfer for server applications

**Virtualization**
   * **Scenario**: Multiple virtual machines need dedicated network access
   * **Solution**: Create Virtual Functions (VFs) on capable network cards
   * **Benefit**: Each VM gets its own virtual network interface

**Wireless Connectivity**
   * **Scenario**: Server needs Wi-Fi capabilities
   * **Solution**: Install PCIe wireless network adapter
   * **Benefit**: Wireless connectivity without external dongles


**Status Indicators**

**1 PF (Physical Function)**
   * **Meaning**: Device has 1 physical port/interface
   * **Color**: Blue text
   * **Usage**: Shows actual hardware capabilities

**4 VFs (Virtual Functions)**
   * **Meaning**: Device can create up to 4 virtual interfaces
   * **Color**: Green text
   * **Usage**: Indicates virtualization capabilities

**Create VFs Button**
   * **Appearance**: Blue button
   * **Function**: Allows creation of virtual functions
   * **Availability**: Only on SR-IOV capable devices

**Assignment Status**
   * **router-1**: Green text showing VF is assigned to a virtual machine
   * **Unassigned**: VF is available for use


Troubleshooting Common Issues
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

**Device Recognition Problems**

**Issue**: Device not appearing in list
   * **Cause**: Device not properly seated in PCIe slot
   * **Solution**: Check physical connection and reseat card

**Issue**: Device shows but no functions available
   * **Cause**: Driver not loaded or incompatible
   * **Solution**: Install proper device drivers

**Virtual Function Issues**

**Issue**: Cannot create VFs
   * **Cause**: Device doesn't support SR-IOV
   * **Solution**: Verify device specifications for SR-IOV support

**Issue**: VFs not appearing after creation
   * **Cause**: Insufficient system resources or BIOS settings
   * **Solution**: Check BIOS for virtualization settings



Node Storage Management
~~~~~~~~~~~~~~~~~~~~~~~

**Storage Management Overview:** The Storage tab provides comprehensive ZFS storage management capabilities at the node level, enabling administrators to create and manage storage pools, datasets, and volumes directly on individual servers.

**ZFS (Zettabyte File System)** A next-generation file system and logical volume manager originally developed by Sun Microsystems for Solaris, now widely used on FreeBSD and other operating systems. ZFS combines traditional file system functionality with volume management, providing data integrity, compression, deduplication, snapshots, and RAID-like functionality in a single integrated solution.

**Storage Management Interface:** The Storage Management interface offers three primary functions accessible through the top action bar:

- **Create Pool:** Create new ZFS storage pools with configurable RAID levels
- **Create Datastore:** Create new datastores for virtual machine storage
- **Storage Pools Dropdown:** Select and manage existing storage pools

.. figure:: _static/images/storage/image_001.png
   :align: center

.. tip::

   **Pool (ZFS Pool/zpool)** The top-level storage container in ZFS that consists of one or more virtual devices (vdevs) made up of physical storage devices. A pool aggregates storage capacity and provides the foundation for all ZFS file systems, volumes, and datasets. Pools can be expanded by adding more vdevs and provide redundancy through various RAID-like configurations.

   **Dataset** A generic term in ZFS that refers to any of the following: file systems, volumes, clones, or snapshots. More commonly, it refers to a ZFS file system - a mountable unit of storage within a pool that can have its own properties, quotas, and snapshots. Datasets are hierarchical and can contain other datasets.

Storage Pool Management
^^^^^^^^^^^^^^^^^^^^^^^

**ZFS Storage Pool Overview:** The Storage Pools section displays comprehensive information about existing ZFS pools on the worker node:

**Pool Information Display:**

- **Pool Name:** ZFS pool identifier (e.g., “zroot”)
- **Pool Size:** Total pool capacity (e.g., “920G”)
- **Pool State:** Current operational status (e.g., “ONLINE”)
- **Storage Utilization:** Visual progress bar showing allocated vs. free space
- **Capacity Details:** Specific capacity information (e.g., “Free: 848G, Allocated: 71.6G”)

.. figure:: _static/images/storage/image_002.png
   :align: center


**Pool Health Monitoring:**

- **State Indicators:** Real-time pool health status (ONLINE)
- **Capacity Monitoring:** Visual and numerical capacity utilization tracking


**ZFS ARC Memory Management**

ARC (Adaptive Replacement Cache) is ZFS's in-memory caching system. It keeps frequently accessed data and metadata in RAM, improving read performance and reducing disk I/O. The **ARC Memory Management** section shows:
- **Available:** Free memory remaining on the node.
- **Current:** The ARC size currently allocated.
- **Recommended:** A suggested ARC allocation, based on system resources.


**Adjust ARC Memory:**

- **Modify the Current value** to the desired cache size.
   - You can increase it for more aggressive caching.
   - Or decrease it to free RAM for virtual machines and other workloads.
- To save the settings, click “apply” . Changes apply dynamically

.. figure:: _static/images/storage/adjust_arc_memory_management.png
   :align: center



**Impact of Adjustments**

**Increasing ARC**

- **Pros:** Higher cache hit rates, improved read performance, reduced latency on repeated operations.
- **Cons:** Less memory left for VMs or applications; risk of memory pressure if set too high.

**Decreasing ARC**

- **Pros:** Frees RAM for VMs and services, preventing out-of-memory scenarios.
- **Cons:** Lower cache hit rates, more disk access, possible performance dips for repeated reads.

**Disk Management**

**Physical Disk Information:** The Disks section provides detailed information about physical storage devices within the pool:

**Disk Status Display:**

- **Disk Identifier:** Physical disk designation (e.g., “nda1p3”)
- **Disk State:** Current operational status (e.g., “ONLINE”)
- **Disk Performance:** Read, write, and checksum statistics

**Disk Health Monitoring:**

- **Performance Tracking:** Monitor disk I/O performance and statistics
- **Error Detection:** Track and report disk errors and failures
- **Health Status:** Visual indicators for disk health and reliability
- **Predictive Maintenance:** Early warning indicators for disk replacement

Storage Pool Operations
^^^^^^^^^^^^^^^^^^^^^^^
**Pool Management Actions:** The Storage Pool interface provides four primary operational buttons:

**Purpose**

Create a new ZFS dataset within an existing storage pool for file storage and organization.

**Functionality**

Datasets allow you to create structured storage areas inside a pool. They can be managed independently with properties such as quotas, compression, and optional encryption.


**Organization**

Datasets are organized hierarchically (like directories) under the pool name.

for example:
zroot/mydataset

**Usage**

Ideal for organizing file-based storage into logical, isolated datasets.

- **Steps to create a dataset:**

   - **Step 1:** Please click on "Create dataset" on any of the available pools (e.g., zroot)
   - **Step 2:** Please provide an appropriate dataset name(e.g., dataset-1)
   - **Step 3:** Enable encryption if required and provide a passphrase (min 8 characters)
   - **Step 4:** Click "Create"

.. figure:: _static/images/storage/image_003.png
   :align: center


.. tip:: ZFS Encryption
   Provides data-at-rest protection by encrypting datasets at the storage level, ensuring that sensitive data remains unreadable even if physical drives are compromised, stolen, or improperly disposed of. This native encryption feature supports regulatory compliance requirements (HIPAA, PCI-DSS, GDPR) while maintaining high performance through hardware acceleration and granular control over different datasets based on security requirements.


**View Datasets:**

- **Purpose:** Display and manage existing datasets within the pool
- **Functionality:** Comprehensive dataset viewing and management
- **Dataset Information:** Usage statistics, compression settings, and configurations
- **Filter Options:** Filter datasets by type (All Types, Filesystem, Volume, Snapshot

Click on "View datasets" to display and manage your datasets within the pool.

.. figure:: _static/images/storage/image_004.png
   :align: center

**Create Zvol:**

- **Purpose:** Create ZFS volumes for block storage

.. tip:: Block Level Storage
   Refers to a data storage method where data is stored and accessed in fixed-size blocks (typically 512 bytes to several KB), with each block having a unique address that the operating system can directly access.

- **Functionality:** Block-level storage for virtual machines and applications
- **Configuration:** Specify volume name and size with unit selection (GB, TB)
- **Usage:** Ideal for virtual machine storage and database applications

Provide an appropriate name for the zvol and select “Create Zvol”

.. figure:: _static/images/storage/image_005.png
   :align: center


**Delete Pool:**

- **Purpose:** Remove storage pools from the system
- **Functionality:** Complete pool deletion with data removal
- **Safety:** Confirmation required before permanent deletion
- **Impact:** Permanent removal of all pool data and configurations

Please navigate to the appropriate pool and select "Delete Pool" 

**Warning:** Performing this action will delete all the datasets, volumes, snapshots and it cannot reversed. 

.. figure:: _static/images/storage/image_006.png
   :align: center

ZFS Pool Creation
"""""""""""""""""
**Create ZPool Interface:** The Create ZPool dialog provides comprehensive options for creating new ZFS storage pools:

**Pool Configuration Options:**

- **Pool Name:** Specify unique pool identifier
- **RAID Type Selection:** Choose from multiple RAID configurations:
  - **raidz1:** Single parity RAID-Z (similar to RAID 5)
  - **raidz2:** Double parity RAID-Z (similar to RAID 6)
  - **raidz3:** Triple parity RAID-Z (maximum fault tolerance)
  - **mirror:** Mirrored configuration (similar to RAID 1)
  - **striped:** Striped configuration (similar to RAID 0)

**Disk Selection:**

- **Available Disks:** Display of available physical disks for pool creation
- **Disk Status:** Real-time availability status of storage devices
- **Disk Validation:** Verification of disk suitability for pool creation
- **No Disks Available:** Clear indication when no disks are available for pool creation


**Steps to create a zpool:**

- **Step 1:** Provide an appropriate pool name
- **Step 2:** Select the desired RAID type and available disks based on the RAID type.
- **Step 3:** Click “Create ZPool” to provision the ZFS pool.

.. figure:: _static/images/storage/image_007.png
   :align: center


.. tip:: RAID-Z Levels

   - **RAID-Z1** A ZFS implementation similar to RAID-5, using single-parity protection across multiple drives (minimum 3 drives). Can tolerate the failure of one drive while maintaining data integrity, providing a balance between storage capacity and redundancy.
   - **RAID-Z2** A ZFS implementation similar to RAID-6, using double-parity protection across multiple drives (minimum 4 drives). Can tolerate the failure of up to two drives simultaneously, offering higher redundancy than RAID-Z1 at the cost of additional storage overhead.
   - **RAID-Z3** A ZFS implementation using triple-parity protection across multiple drives (minimum 5 drives). Can tolerate the failure of up to three drives simultaneously, providing the highest level of redundancy in the RAID-Z family, ideal for large storage arrays where maximum data protection is critical.
   - **Mirror** A ZFS configuration similar to RAID-1, where data is duplicated across two or more drives. Provides excellent read performance and can tolerate the failure of all but one drive in the mirror group, offering the fastest rebuild times but using 50% or more of available storage capacity for redundancy.
   - **Striped** A ZFS configuration similar to RAID-0, where data is distributed across multiple drives without any redundancy. Provides maximum storage capacity and improved performance through parallel I/O operations, but offers no fault tolerance - the failure of any single drive results in complete data loss.


Datastore Management
""""""""""""""""""""
**Create Datastore Interface:** The Create Datastore dialog enables creation of datastores for virtual machine storage:

.. tip:: Datastore

   A logical storage container that abstracts and manages underlying physical storage resources (hard drives, SSDs, storage arrays) into a unified pool of storage capacity.

**Datastore Configuration:**

- **Datastore Name:** Specify unique datastore identifier

.. tip:: Datastore name 
   - Logical identifiers assigned to datastores for easy identification and management within storage systems.

- **Pool Selection:** Choose from available ZFS pools (e.g., “zroot”)
- **Storage Integration:** Integration with existing storage pools
- **VM Storage:** Optimized for virtual machine storage requirements

**Datastore Benefits:**

- **VM Integration:** Seamless integration with virtual machine storage
- **Performance:** Optimized for virtualization workloads
- **Management:** Simplified virtual machine storage management
- **Flexibility:** Easy expansion and modification of storage allocation

**Steps to create a datastore:**

- **Step 1:** Provide an appropriate name
- **Step 2:** Select the pool from the available list
- **Step 3:** click "Create Datastore"

.. figure:: _static/images/storage/image_008.png
   :align: center

Dataset Management
""""""""""""""""""

**Dataset Overview:** The View Datasets interface provides comprehensive dataset management capabilities:

**Dataset Information Display:**

- **Dataset Name:** Hierarchical dataset naming (e.g., “zroot”, “zroot/Load-test-1-disk-1”)
- **Usage Statistics:** Detailed usage information (Used, Available, Mount point)
- **Compression Settings:** ZFS compression configuration (lz4 ON/OFF)
- **Deduplication Settings:** Data deduplication configuration (ON/OFF)

.. figure:: _static/images/storage/image_009.png
   :align: center

**Dataset Types and Filtering:**

- **All Types:** Display all dataset types in unified view
- **Filesystem:** File-based datasets for traditional file storage
- **Volume:** Block-based datasets for virtual machine storage
- **Snapshot:** Point-in-time snapshots for data protection

.. figure:: _static/images/storage/image_010.png
   :align: center

**Dataset Operations:**

- **Snapshot Creation:** Create point-in-time snapshots with custom naming

.. tip:: Snapshot
   A read-only, point-in-time copy of a ZFS dataset or zvol.

**Steps to create a snapshot:**

- **Step 1:** navigate to a particular dataset or zvol
- **Step 2:** Give an appropriate name
- **Step 3:** Click on the green icon to take a snapshot.

.. figure:: _static/images/storage/image_011.png
   :align: center

**Dataset Deletion:** Remove datasets with confirmation prompts

.. figure:: _static/images/storage/image_012.png
   :align: center

- **Snapshot Management:** Manage snapshot lifecycle and retention
- **Hierarchical Organization:** Organized dataset structure with parent-child relationships

ZFS Advanced Features
^^^^^^^^^^^^^^^^^^^^^
**Compression Management:**

- **Compression Algorithm:** lz4 compression for space efficiency
- **Compression Status:** Real-time compression status indicators (ON/OFF)
- **Space Savings:** Automatic space savings through compression
- **Performance Impact:** Minimal performance impact with lz4 compression

**Deduplication Management:**

- **Deduplication Status:** Real-time deduplication status monitoring
- **Space Optimization:** Automatic duplicate data removal
- **Resource Usage:** Monitor deduplication resource consumption
- **Performance Considerations:** Balance between space savings and performance

**Snapshot Management:**

- **Snapshot Creation:** Create instant point-in-time snapshots
- **Snapshot Naming:** Custom snapshot naming with timestamps
- **Snapshot Types:** Different snapshot types for various use cases
- **Snapshot Retention:** Automated snapshot retention policies


Node Monitoring
~~~~~~~~~~~~~~~

**Monitoring Overview:** The Monitoring tab provides comprehensive real-time performance monitoring and historical analysis for individual worker nodes, enabling administrators to track system performance, identify trends, and optimize resource utilization.

**Monitoring Interface:** The monitoring interface features a time-based performance dashboard with configurable time ranges and multiple performance metrics displayed in detailed graphical format.

Time Range Selection
^^^^^^^^^^^^^^^^^^^^

**Time Range Controls:** The monitoring interface provides flexible time range selection for performance analysis:

**Available Time Ranges:**

**Last 1h:** Real-time monitoring for the past hour (default selection)
**Last 30m:** Short-term monitoring for the past 30 minutes
**Last 15m:** Immediate monitoring for the past 15 minutes
**Last 5m:** Real-time monitoring for the past 5 minutes
**Last 1m:** Live monitoring for the past minute

**Time Range Features:**

- **Active Selection:** Currently selected time range highlighted in blue
- **Flexible Analysis:** Choose appropriate time ranges for different analysis needs
- **Historical Data:** Access historical performance data for trend analysis
- **Real-time Updates:** Continuous data updates for live monitoring

.. figure:: _static/images/power-monitoring/image_001.png
   :align: center

CPU Usage Monitoring
^^^^^^^^^^^^^^^^^^^^

**CPU Performance Graph:** The CPU Usage (%) graph provides detailed real-time monitoring of processor utilization:

**CPU Metrics Display:**

- **Y-Axis Scale:** CPU percentage scale from 0% to 22% (dynamically adjusted)
- **Time-based X-Axis:** Detailed timestamp display with precise time intervals
- **Performance Visualization:** Red line graph showing CPU usage patterns over time
- **Usage Patterns:** Visual representation of CPU load variations and spikes

**CPU Monitoring Features:**

- **Real-time Updates:** Continuous CPU usage monitoring with live data
- **Performance Spikes:** Visual identification of CPU usage spikes and patterns
- **Load Analysis:** Detailed analysis of CPU load distribution over time
- **Resource Planning:** Data for capacity planning and resource optimization

**CPU Graph Details:**

- **Graph Color:** Red line graph for clear CPU usage visualization
- **Time Precision:** Detailed timestamps showing minute-by-minute data
- **Performance Ranges:** Dynamic scaling showing usage from baseline to peak levels
- **Trend Analysis:** Historical CPU usage trends for performance optimization

.. figure:: _static/images/power-monitoring/image_002.png
   :align: center

Memory Usage Monitoring
^^^^^^^^^^^^^^^^^^^^^^^

**Memory Performance Graph:** The Memory Usage (%) graph provides comprehensive memory utilization monitoring:

**Memory Metrics Display:**

**Y-Axis Scale:** Memory percentage scale from 0% to 27% (dynamically adjusted)
**Stable Usage Pattern:** Blue line graph showing consistent memory usage
**Usage Consistency:** Visual representation of stable memory consumption
**Current Usage:** Real-time memory usage percentage display

**Memory Monitoring Features:**

- **Interactive Tooltips:** Hover tooltips showing precise memory usage data
- **Timestamp Information:** Detailed timestamp display (e.g., “Time: 11:03:52 AM”)
- **Usage Percentage:** Specific memory usage percentage (e.g., “Memory Usage: 22.35%”)
- **Trend Visualization:** Blue line graph for clear memory usage patterns

**Memory Graph Characteristics:**

- **Stability Indicators:** Visual representation of memory usage stability
- **Usage Patterns:** Identification of memory usage patterns and trends
- **Resource Monitoring:** Continuous memory resource utilization tracking
- **Capacity Analysis:** Memory capacity utilization and availability assessment

.. figure:: _static/images/power-monitoring/image_003.png
   :align: center

Storage Usage Monitoring
^^^^^^^^^^^^^^^^^^^^^^^^

**Storage Performance Graph:** The Storage Usage (%) graph monitors storage utilization and capacity:

**Storage Metrics Display:**

- **Y-Axis Scale:** Storage percentage scale from 0% to 6% (dynamically adjusted)
- **Low Usage Visualization:** Green line graph showing minimal storage usage
- **Usage Stability:** Consistent low storage utilization patterns
- **Capacity Monitoring:** Real-time storage capacity utilization tracking

**Storage Monitoring Features:**

- **Interactive Data Points:** Clickable data points with detailed information
- **Timestamp Display:** Precise timestamp information (e.g., “Time: 11:12:26 AM”)
- **Usage Percentage:** Specific storage usage percentage (e.g., “Storage Usage: 1.05%”)
- **Trend Analysis:** Long-term storage usage trend monitoring

**Storage Graph Characteristics:**

- **Green Visualization:** Green line graph for storage usage representation
- **Low Utilization:** Visual indication of efficient storage utilization
- **Capacity Planning:** Data for storage capacity planning and expansion
- **Performance Baseline:** Baseline storage performance monitoring

.. figure:: _static/images/power-monitoring/image_004.png
   :align: center


Performance Analytics
^^^^^^^^^^^^^^^^^^^^^

**Multi-Metric Analysis:** The monitoring interface provides comprehensive performance analytics across multiple system resources:

**Cross-Resource Correlation:**

- **CPU vs Memory:** Correlation analysis between CPU and memory usage
- **Resource Efficiency:** Analysis of overall system resource efficiency
- **Performance Patterns:** Identification of performance patterns across metrics
- **System Optimization:** Data-driven insights for system optimization

**Performance Insights:**

- **Usage Patterns:** Detailed analysis of resource usage patterns
- **Peak Performance:** Identification of peak performance periods
- **Resource Bottlenecks:** Early identification of potential resource bottlenecks
- **Optimization Opportunities:** Data-driven optimization recommendations

Historical Performance Analysis
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

**Time-Based Analysis:** The monitoring system provides comprehensive historical performance analysis:

**Historical Data Features:**

- **Time Series Data:** Continuous time series data collection and analysis
- **Trend Identification:** Long-term trend analysis for performance optimization
- **Pattern Recognition:** Automatic pattern recognition for performance insights
- **Comparative Analysis:** Compare performance across different time periods

**Performance Reporting:**

- **Real-time Dashboards:** Live performance dashboards with real-time updates
- **Historical Reports:** Detailed historical performance reports and analysis
- **Trend Analysis:** Long-term performance trend analysis and forecasting
- **Capacity Planning:** Performance data for infrastructure capacity planning

Node Power Management
~~~~~~~~~~~~~~~~~~~~~

**Power Management Overview:** The Power tab provides comprehensive power monitoring and management capabilities for individual worker nodes, enabling administrators to track power consumption, optimize energy efficiency, and manage power profiles for optimal performance and cost savings.

**Power Interface Features:** The Power management interface offers dual view modes and comprehensive power analytics:

- **View Mode Selection:** Switch between “Power Metrics” and “Power Monitoring” views
- **Time Range Controls:** Flexible time range selection for power analysis
- **Real-time Monitoring:** Live power consumption tracking and visualization
- **Power Profile Management:** Configure and optimize power profiles for different workloads

Power Metrics View
^^^^^^^^^^^^^^^^^^
**Power Metrics Dashboard:** The Power Metrics view provides detailed real-time power consumption monitoring with comprehensive electrical measurements:

**Power Consumption Graph:** The Power (W) graph displays instantaneous power consumption over time:

**Power Monitoring Features:**

- **Y-Axis Scale:** Dynamic power scale from 0W to 133W (adjustable based on consumption)
- **Real-time Visualization:** Green area chart showing power consumption patterns
- **Power Fluctuations:** Visual representation of power usage variations and spikes
- **Time-based Analysis:** Detailed timestamp tracking for power consumption trends


**Voltage Monitoring:** The Voltage (V) graph provides electrical voltage monitoring:

**Voltage Characteristics:**

- **Stable Voltage Display:** Orange line graph showing consistent voltage levels
- **Voltage Range:** Monitoring voltage from 0V to 119V range
- **Interactive Tooltips:** Hover tooltips showing precise voltage measurements
- **Voltage Stability:** Visual indication of voltage stability (e.g., “Voltage: 113.36V” at “Time: 11:20:42 AM”)

**Current Monitoring:** The Current (A) graph tracks electrical current consumption:

**Current Measurement Features:**

- **Current Range:** Monitoring current from 0A to 6A range
- **Current Stability:** Red line graph showing consistent current draw
- **Real-time Updates:** Live current measurement with tooltip information
- **Current Precision:** Detailed current measurements (e.g., “Current: 1.00A” at “Time: 11:16:33 AM”)``

**Energy Consumption Tracking:** The Energy (kWh) graph provides cumulative energy consumption monitoring:

**Energy Tracking Features:**

- **Cumulative Energy:** Blue area chart showing total energy consumption over time
- **Energy Scale:** Large scale energy tracking (e.g., 0 to 30831 kWh)
- **Energy Tooltips:** Detailed energy consumption data (e.g., “Energy: 30760.09 kWh” at “Time: 11:10:37 AM”)
- **Long-term Analysis:** Historical energy consumption tracking for cost analysis

Power Monitoring View
^^^^^^^^^^^^^^^^^^^^^

**Power Monitoring Dashboard:** The Power Monitoring view provides comprehensive power analytics and management capabilities:

**View Mode Selection:** Toggle between different power monitoring views:

- **Power Metrics:** Real-time electrical measurements and graphs
- **Power Monitoring:** Comprehensive power analytics and CPU core monitoring

**Power Supply Unit Data:** The Power Supply Unit Data section displays detailed PSU information:

**PSU Information Display:**

**PSU Details:** Complete PSU specifications including model, current, power, and voltage ratings

- **PSU Model:** Power supply model information (e.g., “SS Gemini 900A”)
- **Electrical Specifications:** Current rating (77.5 A), power rating (900 W), voltage (12 V)
- **Network Integration:** Node IP address association (e.g., “192.168.116.111”)
- **Efficiency Rating:** 80 Plus certification and rating (e.g., “80 Plus: 90, 80 Plus Rating: Platinum”)
- **Management Actions:** Edit and delete PSU configuration options

.. figure:: _static/images/power-management/image_001.png
   :align: center

To add a new power supply unit data:


**Add Power Supply Configuration:**

**To add a power supply to your system, provide the following information:**

**Required Fields:**

- **Power Supply Name:** Enter a descriptive name for the power supply unit
- **Current (A):** Specify the current rating in amperes
- **Power (W):** Enter the power rating in watts
- **Voltage (V):** Specify the voltage rating in volts
- **By Pass Rating:** Enter the bypass power rating
- **Status:** Set the current operational status of the power supply

**Step: Complete Configuration** Click **Add** to save the power supply configuration, or **Cancel** to abort the setup

.. figure:: _static/images/power-management/image_002.png
   :align: center

Server Power Metrics
^^^^^^^^^^^^^^^^^^^^

**Comprehensive Power Analytics:** The Server Power Metrics section provides detailed power consumption analysis and CPU core monitoring

**Core Usage Monitoring:** Individual CPU core usage tracking with color-coded visualization:

**CPU Core Performance:**

- **32-Core Monitoring:** Individual monitoring of all CPU cores (Core 0 through Core 31)
- **Usage Percentage:** Real-time usage percentage for each core
- **Color-coded Display:** Visual color coding for different usage levels:
- **Green:** Low to moderate usage (0% to ~20%)
- **Orange:** Moderate to high usage (~21% to ~50%)
- **Red:** High usage (100% indicates full utilization)
- **Color Graduation:** Progressive color changes based on usage intensity

**Core Usage Examples:**

- **Core 5:** 100% utilization (displayed in red)
- **Core 20:** 31.58% utilization (displayed in orange)
- **Core 21:** 16.67% utilization (displayed in green)
- **Idle Cores:** 0% utilization (displayed in light green)

.. figure:: _static/images/power-management/image_003.png
   :align: center

System Resource Summary
^^^^^^^^^^^^^^^^^^^^^^^

**Resource Utilization Overview:** The system provides a comprehensive summary of overall resource utilization:

**Resource Metrics:**

- **CPU Usage:** Overall CPU utilization percentage (e.g., “4.86%”)
- **Memory Usage:** System memory consumption (e.g., “22.31%”)
- **Storage Usage:** Storage capacity utilization (e.g., “13.38%”)
- **Workload Efficiency:** Overall system efficiency rating (e.g., “88%”)
- **Power Profile Management:** Intelligent power profile recommendations and management:

**Power Profile Features:**

- **Profile Recommendation:** AI-driven power profile recommendations (e.g., “Balanced”)
- **Profile Description:** Detailed profile descriptions (e.g., “Mixed workload - maintain responsiveness”)
- **Profile Selection:** Multiple power profile options:
   - **Performance:** Maximum performance for demanding workloads
   - **Balanced:** Optimal balance between performance and power efficiency
   - **Power Saving:** Maximum power efficiency for light workloads

Power Profile Configuration
^^^^^^^^^^^^^^^^^^^^^^^^^^^

**Power Profile Settings:** The Set Power-Profile section enables dynamic power profile management:

**Profile Selection Options:**

- **Performance Profile:** Optimized for maximum computational performance
- **Balanced Profile:** Balanced performance and power efficiency
- **Power Saving Profile:** Optimized for minimum power consumption

**Current Power Configuration:**

- **Current Profile:** Currently active power profile (e.g., “Power Saving”)
- **Profile Editor:** Edit button for custom power profile configuration
- **Profile Validation:** Check mark and X buttons for profile confirmation


Frequency Management
^^^^^^^^^^^^^^^^^^^^

**CPU Frequency Control:** The system provides detailed CPU frequency monitoring and management:

**Frequency Information:**

- **Current Frequency:** Real-time CPU frequency (e.g., “1500 MHz”)

- **Suggested Frequency:** System-recommended frequency for optimal performance (e.g., “2400 MHz”)

**Frequency Optimization:** Automatic frequency recommendations based on workload analysis

**Dynamic Scaling:** Real-time frequency adjustments based on power profile and workload demands

**Frequency Management Benefits:**

- **Performance Optimization:** Optimal frequency selection for workload requirements
- **Power Efficiency:** Frequency scaling for power consumption optimization
- **Thermal Management:** Frequency control for thermal management
- **Workload Adaptation:** Dynamic frequency adjustment based on workload characteristics

Power Management Best Practices
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

**Effective Power Management**

- **Profile Selection:** Choose appropriate power profiles based on workload characteristics
- **Monitoring:** Regular monitoring of power consumption and efficiency metrics
- **Optimization:** Use power recommendations for optimal system configuration
- **Frequency Management:** Leverage frequency scaling for performance and efficiency balance

**Power Efficiency Optimization**

- **Workload Analysis:** Analyze workload patterns for optimal power profile selection
- **Resource Utilization:** Monitor resource utilization for power efficiency opportunities
- **Profile Tuning:** Fine-tune power profiles based on specific workload requirements
- **Energy Cost Management:** Use power monitoring for energy cost optimization and budgeting


Network Management
~~~~~~~~~~~~~~~~~~

**Network Overview:** The Network tab provides comprehensive network interface and switch management for individual worker nodes, enabling administrators to configure network connectivity, manage virtual switches, and monitor network interface status across the cluster infrastructure.

**Network Interface Management:** The network management interface features dedicated sections for interface monitoring and switch configuration, providing granular control over network connectivity and virtual network topology.

   .. figure:: _static/images/networking/Image-node-001.png
      :width: 600

Network Interface Configuration
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

**Interface Overview:** The Network Management - Interface section displays all available network interfaces for the selected worker node:

**Available Network Interfaces:**

- Primary network interface with active switch association

- Secondary network interface without switch association

- Additional network interface available for configuration
   
   .. figure:: _static/images/networking/Image-node-002.png
      :width: 600

**Interface Information Display:**

- **Interface Name:** Clear identification of each network interface (e.g., bnxt0, bnxt1, ue0)

- **Switch Assignment:** Associated switch name display (e.g., “Switch: default”)

- **Status Badges:** Color-coded status indicators for quick assessment

- **Association Status:** Clear indication of switch association or availability

**Interface Configuration Options:**

- **Switch Association:** Ability to associate interfaces with virtual switches

- **Network Type:** Public/Private network classification management

- **Configuration Access:** Direct access to detailed interface settings

Virtual Switch Management
^^^^^^^^^^^^^^^^^^^^^^^^^

**Switch Overview:** The Network Management - Switches section provides comprehensive virtual switch management and configuration:

**Virtual Switch Display:**

- **Switch Listing:** Complete inventory of configured virtual switches

- **Interface Association:** Clear display of associated network interfaces

- **Status Monitoring:** Real-time switch operational status

- **Configuration Access:** Direct access to switch configuration options

**Switch Configuration Features:**

- **Switch Creation:** “Create Switch” button for new virtual switch deployment
- **Switch Deletion:** Red delete button for switch removal
- **Interface Assignment:** Management of interface-to-switch assignments

Switch Creation and Configuration
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
**Create Switch Interface:** The Create Switch modal provides comprehensive switch creation and configuration options:

**Switch Creation Form:**

- **Switch Name Input:** Text field for custom switch name entry

- **Interface Selection:** Dropdown menu for interface assignment

- **Creation Controls:** Cancel and Create Switch action buttons

   .. figure:: _static/images/networking/Image-node-004.png
      :width: 600

**Switch Creation Process:**

- **Name Assignment:** Enter descriptive switch name in the text field

- **Interface Selection:** Choose target interface from dropdown menu

- **Configuration Review:** Verify switch configuration parameters

- **Switch Creation:** Click “Create Switch” button to deploy new switch

- **Status Verification:** Confirm successful switch creation and activation

   .. figure:: _static/images/networking/Image-node-003.png
      :width: 600 

The switch management interface displays all configured virtual switches.


Network Configuration Best Practices
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

- **Interface Configuration:**
   - **Naming Conventions:** Use descriptive names for switches and interfaces
   - **Association Management:** Maintain clear interface-to-switch relationships

- **Switch Management:**
   - **Strategic Planning:** Plan virtual switch topology for optimal performance
   - **Resource Allocation:** Allocate interfaces efficiently across switches
   - **Status Monitoring:** Regular monitoring of switch operational status

- **Network Security:**
   - **Access Control:** Implement appropriate network access controls
   - **Traffic Monitoring:** Monitor network traffic for security threats
   - **Configuration Validation:** Validate network configuration changes


Firewall Management
~~~~~~~~~~~~~~~~~~~

**Overview:** The Firewall tab provides comprehensive packet filter (PF) rule management for individual worker nodes, enabling administrators to configure network security policies, manage traffic filtering rules, and maintain system security through advanced firewall configuration.

**Firewall Rule Management:** The firewall interface features a code-based rule editor with syntax highlighting, real-time validation, and safety mechanisms to prevent system lockout through configuration errors.

   .. figure:: _static/images/networking/Image-pf-002.png
      :width: 600 

Packet Filter Rules Interface
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

**PF Firewall Rules**

**Connection Protection Rules**

This PF rule acts as a security guard for your server, preventing connection flooding and brute-force attacks. It works by implementing multiple security mechanisms:

**Limiting Connections**
   Restricts the number of simultaneous connections and rate of new connection attempts from any single IP address

**Overload Protection**
   When configured limits are exceeded, the rule aggressively blocks attackers by dropping their connections and terminating existing ones using a pre-defined "bruteforce" action block

**Attack Mitigation**
   Designed to stop malicious actors from overwhelming your server with connection requests while minimizing disruption to legitimate users


**Configuration Requirements**

Proper configuration is crucial for rule effectiveness:

**Critical Components:**

- Connection limit thresholds appropriate for your environment
- Rate limiting parameters for new connection attempts
- Bruteforce overload block configuration
- Timeout values for blocked connections

**Best Practices:**

- Test configuration changes in a controlled environment
- Monitor logs to ensure legitimate traffic isn't blocked
- Adjust thresholds based on actual traffic patterns
- Document configuration changes for future reference

.. warning::
   **Configuration Impact**
   Improper PF rule configuration can block legitimate traffic or fail to protect against attacks. Always validate settings before applying to production systems.

**PF Rules Display:** The Packet Filter Rules section provides a comprehensive view of all active firewall rules.

**Rule Configuration Display:**

   - **Line Numbers:** Sequential line numbering for easy rule reference and navigation
   - **Syntax Highlighting:** Color-coded syntax highlighting for different rule components
   - **Rule Structure:** Clear display of rule syntax with proper formatting
   - **Code Editor:** Full-featured code editor with firewall rule editing capabilities

**Advanced Configuration Warning:**

   - **Security Notice:** Prominent warning about advanced configuration complexity
   - **Risk Assessment:** Clear indication of potential security vulnerabilities
   - **Expertise Requirement:** Emphasis on required expertise for rule modification
   - **System Lockout Prevention:** Warning about potential system access issues



Firewall Rule Components
^^^^^^^^^^^^^^^^^^^^^^^^

**Rule Structure Analysis:** The firewall rules are organized in a structured format with specific components.

**Interface Configuration:**

   - **External Interface:** Definition for external network interface
   - **Interface Assignment:** Clear association between logical and physical interfaces
   - **Network Boundary:** Definition of network perimeter and access points
   - **Traffic Direction:** Inbound and outbound traffic handling specifications

**Policy Configuration:**

   - **Block Policy:** Set block-policy return for default blocking behavior
   - **Fragment Handling:** Fragment reassemble for packet processing
   - **Skip Interface:** Loopback interface exclusion
   - **Default Actions:** Comprehensive default policy configuration


**Traffic Filtering Rules**

**Rule Types and Functions:** The firewall configuration includes multiple rule types for comprehensive traffic control.

**Pass Rules Configuration:**

   - **Quick Rules**
   - **Protocol-Specific Rules**
   - **State Maintenance:** Automatic connection state tracking for established connections
   - **Direction Control:** Separate inbound and outbound traffic rule definitions

**Block Rules Implementation:**

   - **Default Block:** For comprehensive inbound traffic blocking
   - **Selective Blocking:** For controlled outbound access
   - **Anti-Spoof:** For IP spoofing prevention
   - **Security Enforcement:** Comprehensive blocking with exception-based access

**Service Access Rules:**

   **Port-Based Access Control:** The firewall configuration includes specific port access rules.
   
   **SSH Access Control:**
      - **SSH Port**
      - **Connection Flags:** Proper TCP connection flag handling for secure connections
      - **State Tracking:** Automatic connection state maintenance for SSH sessions
      - **Access Scope:** Controlled SSH access from authorized sources
   **Multi-Service Access:**
      - **Port Range:** {9090, 9100, 3000, 80, 443, 8080:8084, 5001, 6900:7000, 5432, 9592, 9595, 9694}
      - **Service Portfolio:** Comprehensive port access for multiple services and applications
      - **State Management:** Automatic connection state tracking for all services


**Simple vs Advanced Mode**

The interface provides two operational modes:

* **Simple Mode**: Quick and easy firewall rules for most common needs
* **Advanced Mode**: Full PF configuration capabilities for complex scenarios

.. figure:: _static/images/networking/firewall_simple.png
   :alt: Firewall Simple vs Advanced Mode
   :width: 600

Packet Filter Management - Simple Mode
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The Simple Mode interface provides a user-friendly way to configure FreeBSD Packet Filter (PF) rules through an intuitive drag-and-drop interface. This mode is designed for quick and easy firewall rule creation without requiring deep knowledge of PF syntax.

**Interface Components**

**Existing Packet Filters Section**

The left panel displays currently configured packet filter elements organized by type:

* **Variables**: Network interface definitions and other variables
* **Set Options**: Firewall behavior configuration options  
* **Rules**: Pass/block rule definitions
* **Tables**: Address groupings for rule references
* **Anchors**: NAT/RDR anchor definitions

.. figure:: _static/images/networking/firewall_existing_rules.png
   :alt: Existing Packet Filters
   :width: 600


**Adding New Packet Filter Rules**

**Select Rule Type**

Choose from the available rule types:

* **Variables** - Define network interfaces and other variables
* **Set Options** - Configure firewall behavior options
* **Tables** - Define address tables for grouping
* **Rules** - Define pass/block rules
* **Anchors** - Define NAT/RDR anchors
* **Anchor Templates** - Predefined service configurations

**Rule Configuration Options**

**Variables**

Configure network interface definitions and custom variables:

* **Variable Name**: Define the variable identifier (e.g., ``ext_if``)
* **Value**: Set the variable value (e.g., ``igb0``)


.. figure:: _static/images/networking/firewall_add_variable.png
   :alt: Add Variable
   :width: 600

**Set Options**

Configure firewall behavior settings:

* **Option Name**: Select from available options (e.g., ``block-policy``)
* **Value**: Choose the appropriate value from dropdown

.. figure:: _static/images/networking/firewall_set_options.png
   :alt: Set Options
   :width: 600

**Tables**

Define address groups for use in rules:

* **Table Name**: Spplified rule creation fecify table identifier (e.g., ``trusted_nets``)
* **Properties**: Optional table properties
* **Entries**: Comma-separated list of addresses/networks (e.g., ``192.168.1.0/24, 10.0.0.0/8``)

.. figure:: _static/images/networking/firewall_add_table.png
   :alt: Add Table
   :width: 600

**Rules**

Create pass/block rules with comprehensive options:

**Rule Creation Mode**: Choose between Custom or Quick Toggle

* **Custom**: Full manual rule configuration
* **Quick Toggle**: Simplified rule creation for common services

.. figure:: _static/images/networking/firewall_add_rule.png
   :alt: Add Rule
   :width: 600

**Basic Rule Configuration**:

* **Action**: pass, block, or reject
* **Direction**: in, out, or any
* **Address Family**: inet, inet6, or any
* **Interface**: Select network interface
* **Protocol**: TCP, UDP, ICMP, or any
* **Source/Destination**: Define source and destination criteria
* **Port**: Specify port ranges
* **State**: Connection state handling

**Quick Toggle Services**:

* **FTP** (21): File Transfer Protocol
* **SSH** (22): Secure Shell access

.. figure:: _static/images/networking/firewall_quick_toggle.png
   :alt: Quick Toggle Services
   :width: 600

**Anchors**

Define NAT/RDR anchor points:

* **Anchor Type**: NAT Anchor or RDR Anchor
* **Anchor Name**: Identifier for the anchor (e.g., ``ftp-proxy/*``)

.. figure:: _static/images/networking/firewall_add_anchor.png
   :alt: Add Anchor
   :width: 600

**Anchor Templates**

Select from predefined service configurations:

* **FTP Proxy** (2121): FTP through proxy configuration
* **ICMP** (N/A): Ping and network diagnostics

.. figure:: _static/images/networking/firewall_add_anchor_template.png
   :alt: Add Anchor Template
   :width: 600

**Configuration Process**

**Step-by-Step Rule Creation**

1. **Select Rule Type**: Choose the appropriate rule category from the dropdown
2. **Configure Parameters**: Fill in the required configuration fields based on rule type
3. **Add Rule**: Click the relevant "Add" button (Add Variable, Add Table, Add Rule, etc.)
4. **Drag and Drop**: The new rule appears in the left panel where you can drag it to reorder priority

.. figure:: _static/images/networking/firewall_drag_drop.png
   :alt: Drag and Drop Rule
   :width: 600

5. **Save Changes**: Click **"Save Changes"** to apply the configuration

.. figure:: _static/images/networking/firewall_save_changes.png
   :alt: Save Changes
   :width: 600

**Configuration Validation and Application**

When you click **"Save Changes"**:

1. **Syntax Check**: The system validates PF rule syntax
2. **60-Second Timer**: If syntax is valid, a 60-second confirmation timer begins
3. **Confirmation Required**: You must confirm the changes within 60 seconds
4. **Automatic Rollback**: If not confirmed, changes are automatically reverted
5. **Rule Application**: Upon confirmation, the new PF configuration is saved and applied

.. warning::
   Always ensure you have alternative access to the system before applying firewall changes. The 60-second confirmation window provides a safety mechanism to prevent lockouts.


**Advanced Features**

When Simple Mode limitations are reached, Advanced Mode provides:

* Complex rule matching criteria
* Advanced NAT/RDR configurations  
* Queue management and traffic shaping
* Custom macro definitions
* Raw PF rule syntax editing

Switch to Advanced Mode when you need capabilities beyond the simplified interface options.

Use the **"Need more options? Switch to Advanced Mode"** link or **"Advanced"** button at the top to access additional configuration options when Simple Mode doesn't provide sufficient flexibility.  


Rule Editing and Modification - Advanced Mode
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

**Interactive Rule Editor:** The firewall interface provides comprehensive rule editing capabilities.

**Code Editor Features:**

- **Syntax Highlighting:** Color-coded syntax for different rule components

- **Line Numbering:** Sequential line numbers for easy reference

- **Real-time Validation:** Live syntax validation during rule editing

- **Error Detection:** Automatic detection of syntax errors and misconfigurations

**Rule Modification Process:**

- **Direct Editing:** Click-to-edit functionality for individual rules

.. figure:: _static/images/user-guide/firewall_rule_editing.png
   :alt: Firewall Direct Editing
   :width: 600

- **Syntax Validation:** Real-time syntax checking during modification

Type the firewall rules in the code editor and click "save" button. The system will automatically validate the syntax and highlight any errors.

.. figure:: _static/images/user-guide/firewall_syntax_confirmation.png
   :alt: Firewall Syntax Validation
   :width: 600

.. figure:: _static/images/user-guide/firewall_syntax_confirmation2.png
   :alt: Firewall Syntax Validation
   :width: 600

- **Change Tracking:** Visual indication of modified rules and changes

- **Preview Mode:** Rule validation before applying changes


Change Confirmation System Safety Mechanism:
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The firewall system includes a comprehensive safety mechanism to prevent system lockout.

- **Confirmation Timer System:**

- **60-Second Timer:** Changes will revert in 60 seconds countdown display

- **Auto-Revert:** Automatic reversion to previous configuration if not confirmed

- **Safety Window:** 60-second window for testing and validation

- **Change Persistence:** Manual confirmation required for permanent changes

**Confirmation Process:**

- **Rule Modification:** Edit firewall rules using the code editor

- **Timer Activation:** 60-second countdown timer begins automatically

- **Testing Period:** Test connectivity and system access during timer period

- **Confirmation Action:** Click “Confirm Changes” to make changes permanent

.. figure:: _static/images/user-guide/firewall_confirm_changes.png
   :alt: Confirm Changes
   :width: 600

**Safety Controls:**

- **Cancel Option:** Cancel button to abort changes before confirmation

- **Confirm Changes:** Green “Confirm Changes” button for permanent application

- **Timer Display:** Real-time countdown showing remaining confirmation time

- **Revert Warning:** Clear indication of automatic reversion behavior

Security Considerations:
^^^^^^^^^^^^^^^^^^^^^^^^

- **Expertise Requirement:** Advanced PF configuration requires specialized knowledge

- **Risk Assessment:** Incorrect rules can create security vulnerabilities

- **System Access:** Improper configuration can result in system lockout

- **Best Practices:** Follow established firewall configuration best practices


Security Center Walkthrough
~~~~~~~~~~~~~~~~~~~~~~~~~~~

The Security Center provides a centralized interface for managing and monitoring your infrastructure's security posture. This walkthrough will guide you through the key features and functionalities available in the Security Center.

Accessing the Security Center
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Navigate to the Security Center to begin security monitoring and management.

Security Center Navigation
""""""""""""""""""""""""""
   - Navigate to the "Security" tab on any node in the node's main menu
   - The below image clearly indicates where to find the 'Security' tab on the interface.

   .. figure:: _static/images/security/security_tab_pointer_new.png
      :width: 600
      :alt: Security Tab Pointer

      Figure 1: Security Tab Pointer

Overview Dashboard
^^^^^^^^^^^^^^^^^^

The Security Centre Overview Dashboard displays a real-time snapshot of your security posture with key metrics and status indicators.

Security Dashboard Interface
""""""""""""""""""""""""""""
   - The Security Centre Overview Dashboard displays a real-time snapshot of your security posture
   - Key metrics include risk percentage, system status, last scan status and top risk category
   - The below image clearly shows where to find 'Scan' Button

   .. figure:: _static/images/security/security_scan_pointer_new.png
      :width: 600
      :alt: Security Scan Button

      Figure 2: Security Scan Button

Initiating Security Scans
"""""""""""""""""""""""""
   - Click the 'Scan' button to initiate a new security scan
   - The system will perform vulnerability assessment and risk analysis
   - Scan results will be displayed in real-time on the dashboard

Compliance Score
""""""""""""""""

- **How this score is calculated:**
  - The CAT I / CAT II / CAT III counts directly drive this compliance score — each issue reduces the score based on severity and total volume.

- **CAT I (Critical):**
  - Largest impact; each lowers compliance by ~1.5–2 points.

- **CAT II (High/Medium):**
  - Moderate impact; each lowers compliance by ~0.25–0.60 point.

- **CAT III (Low):**
  - Smallest impact; each lowers compliance by ~0.1–0.2 points.

- **Volume Factor:**
  - More total findings → each new one counts a bit more (up to ~30% extra impact).

- **Calculation:**
  - Compliance = 100 – (Weighted Findings × Volume Factor ÷ 10)
  - Final score is clamped to 0–100. If no findings → 100% compliance.

- **Score Ranges:**

  * - **≥50% — Compliant:** 
    - System is in acceptable state.
  * - **30–49% — Partially Compliant:** 
    - Gaps exist, needs attention.
  * - **<30% — Non-Compliant:** 
    - System at risk, immediate action required.   


Security Vulnerability Management
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Access the Vulnerability Management section to view and manage identified vulnerabilities across your infrastructure.

Vulnerability Assessment Interface
""""""""""""""""""""""""""""""""""
   - Access the Vulnerability Management section to view and manage identified vulnerabilities
   - Use filters to sort vulnerabilities by severity
   - Scroll Down to view detailed vulnerabilities information along with remediation options
   - Please click on the vulnerability to know more information about it

   .. figure:: _static/images/security/security_vuln_info_new.png
      :width: 600
      :alt: Vulnerability Information

      Figure 3: Vulnerability Information

Vulnerability Details and Information
"""""""""""""""""""""""""""""""""""""
   - Click on any vulnerability to access detailed information
   - A Pop up for the Vulnerability will look like this, it will contain a bit more information about the vulnerability and relevant links

   .. figure:: _static/images/security/security_vuln_popup_new.png
      :width: 600
      :alt: Vulnerability Popup

      Figure 4: Vulnerability Popup

   - The vulnerability popup contains:
     - Detailed vulnerability description
     - Risk assessment information
     - Relevant security links and references
     - Potential impact analysis

Remediation Actions
^^^^^^^^^^^^^^^^^^^

The Remediation Actions section allows you to initiate automated fixes for identified security issues.

Automated Remediation Interface
"""""""""""""""""""""""""""""""
   - The Remediation Actions section allows you to initiate automated fixes for identified issues
   - Where to find the remediation option (if there are any vulnerabilities to remediate)

   .. note::
      One-click Remediation is available for very few vulnerabilities at this point to make sure that it does not hamper the system functionality.

   .. figure:: _static/images/security/security_vuln_remediation_pointer_section_new.png
      :width: 600
      :alt: Vulnerability Remediation Pointer

      Figure 5: Vulnerability Remediation Pointer

Remediation Process
"""""""""""""""""""
   - Review available remediation options for identified vulnerabilities
   - Select appropriate remediation actions based on risk assessment
   - Monitor remediation progress and validate fixes
   - Verify system functionality after remediation

Recommendation Process
""""""""""""""""""""""  
   - Safety-First Remediation - All XCCDF rules include automated checks with manual remediation for high-risk changes that could cause system lockout (SSH, PAM, firewall modifications).
   - Industry Standard Compliance - Rules follow CIS FreeBSD 14 Benchmark v1.0.1 with proper CVE identifiers, CVSS scores, and NIST 800-53 control mappings for enterprise compliance frameworks.
   - Service Continuity Protection - Remediation scripts avoid automatic service restarts and include clear warnings about potential disruption to critical services like SSH and databases.
   - Operational Documentation - Each rule includes comprehensive warning, remediation, and recommendation sections with specific manual steps for safe implementation in production environments.

   .. figure:: _static/images/security/recommendation_pointer_new.png
      :width: 600
      :alt: Vulnerability Recommendation Pointer

      Figure 6: Vulnerability Recommendation Pointer

Recommendation Pop-up
"""""""""""""""""""""
   - Click on the 'Recommendation' button to view detailed recommendation information
   - The recommendation pop-up contains:
     - Detailed recommendation description
     - Risk assessment information
     - Potential impact analysis
     - Manual remediation steps

   .. figure:: _static/images/security/recommendation_popup_new.png
      :width: 600
      :alt: Vulnerability Recommendation Popup

      Figure 7: Vulnerability Recommendation Popup

Scan History and Reporting
^^^^^^^^^^^^^^^^^^^^^^^^^^

The Scan History section provides a log of all security scans performed with detailed reporting capabilities.

Security Scan History Navigation
""""""""""""""""""""""""""""""""
   - The Scan History section provides a log of all security scans performed
   - Review past scan results and reports
   - Please click on the 'Metrics' button beside the 'Scan' button to navigate to Security Scan History Page

   .. figure:: _static/images/security/security_navigate_to_history_page_new.png
      :width: 600
      :alt: Security Scan History Pointer

      Figure 8: Security Scan History Pointer

Security Scan History Dashboard
"""""""""""""""""""""""""""""""
   - The Security Scan History Page provides a metrics dashboard for previous scans performed
   - Review historical reports in html and PDF formats
   - You can find the previous scan details, Compliance Score from earlier scan and other additional details in this Security Scan History Page

   .. figure:: _static/images/security/security_history_page_new.png
      :width: 600
      :alt: Security History Page

      Figure 9: Security History Page

Security Report Generation
""""""""""""""""""""""""""
   - The below image clearly indicates where to find the PDF & HTML report download options under the Scan History section

   .. figure:: _static/images/security/security_report_pointer_new.png
      :width: 600
      :alt: Security Report Pointer

      Figure 10: Security Report Pointer

Security Report Content
"""""""""""""""""""""""
   - Once downloaded, the security report will contain detailed information of all the vulnerabilities identified in the scan
   - It also contains System information on which scan was performed such as OS version, architecture, kernel version, and other relevant details

   .. figure:: _static/images/security/security_report_content_new.png
      :width: 600
      :alt: Security Report Content

      Figure 11: Security Report Content

**Security Report Components**

The security report includes:

- **Vulnerability Details**: Complete list of identified security issues
- **System Information**: OS version, architecture, kernel version
- **Risk Assessment**: Severity ratings and impact analysis
- **Remediation Recommendations**: Suggested fixes and security improvements
- **Scan Metadata**: Timestamp, scan duration, and coverage information

Best Practices for Security Management
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Security Monitoring Guidelines
""""""""""""""""""""""""""""""

**Regular Security Scanning**
   - Schedule regular security scans to maintain current security posture
   - Monitor scan results and track security trends over time
   - Address high-priority vulnerabilities promptly

**Vulnerability Assessment**
   - Review vulnerability details thoroughly before taking action
   - Assess potential impact on system functionality
   - Plan remediation activities during appropriate maintenance windows

**Report Management**
   - Download and archive security reports for compliance purposes
   - Share reports with relevant stakeholders and security teams
   - Track remediation progress using historical scan data

Security Configuration Management
"""""""""""""""""""""""""""""""""

**Remediation Planning**
   - Prioritize vulnerabilities based on risk assessment
   - Test remediation actions in development environments first
   - Document all security configuration changes

**System Monitoring**
   - Monitor system performance after applying security fixes
   - Verify that remediation actions do not impact system functionality
   - Maintain audit trails of all security-related changes

.. important::
   Always test security remediation actions in a controlled environment before applying them to production systems to ensure system stability and functionality.

Node Log Management
~~~~~~~~~~~~~~~~~~~

**Log Overview:** The Logs tab provides comprehensive system log monitoring and analysis for individual worker nodes, featuring real-time log streaming, filtering capabilities, and log export functionality for troubleshooting and system analysis.

**Log Viewer Interface:** The Log Viewer displays system logs in a structured format with filtering options, search capabilities, and export tools for efficient log management and analysis.

   .. figure:: _static/images/networking/Image-node-Log-001.png
      :width: 600 

Log Viewer Dashboard
^^^^^^^^^^^^^^^^^^^^

**Log Display Interface:** The Log Viewer provides a comprehensive log monitoring interface.

**Log Table Structure:**

**Date Column:** Log entry date display (Jul 17 format)

**Time Column:** Precise timestamp display (18:35:12 format)

**Level Column:** Log severity level classification

**Message Column:** Detailed log message content

**Log Entry Examples:**

**System Messages:** “syslogd: last message repeated 3 times”

**Application Errors:** “my_app[5139]: Failed to convert str to int”

**Network Events:** “dhclient[17655]: send_packet: No buffer space available”

**Kernel Messages:** “kernel: 310.534325 [4335] netmap_transmit vlan113 full hwcur 0 hwtail 0 qlen 1023”

Log Filtering and Search
^^^^^^^^^^^^^^^^^^^^^^^^

**Advanced Log Filtering:** The Log Viewer provides comprehensive filtering and search capabilities.

**Level Filtering:**

- **Select Level Dropdown:** Filter logs by severity level

- **Available Levels:** Info, Error, Debug classification

- **Default Selection:** “Select Level” for all log entries

- **Dynamic Filtering:** Real-time log filtering based on selected level

**Content Search:**

- **Search Field:** “Search logs” text input for content filtering

- **Real-time Search:** Live filtering of log entries based on search terms

- **Message Content:** Search through log message content

- **Flexible Matching:** Partial and full text search capabilities

   .. figure:: _static/images/networking/Image-node-Log-002.png
      :width: 600 

Log Export and Management
^^^^^^^^^^^^^^^^^^^^^^^^^

**Log Export Functionality:** The Log Viewer provides log export capabilities:

**Export Options:**

- **Export Logs Button:** Blue “Export Logs” button for log data export

- **Data Format:** Structured log data export capabilities

- **Historical Data:** Export of filtered or complete log datasets

**Log Management Features:**

- **Real-time Updates:** Live log streaming and real-time updates

- **Historical Access:** Access to historical log entries

- **Filtering Export:** Export filtered log data based on search criteria

- **Batch Processing:** Efficient handling of large log volumes

FreeBSD Debug Framework
~~~~~~~~~~~~~~~~~~~~~~~~

Overview
^^^^^^^^^

The FreeBSD Debug Framework provides comprehensive system diagnostic capabilities through both REST API and command-line interfaces. This unified framework enables administrators to collect, analyze, and export system diagnostics from FreeBSD environments efficiently.

The framework enables you to:

* Run system diagnostic tools
* Collect their outputs in organized directories
* Generate and download consolidated PDF reports
* Manage outputs automatically with cleanup policies
* Access diagnostics through both API and CLI interfaces

This simplifies debugging workflows by providing consistent interfaces for system analysis and reporting.

Key Features
^^^^^^^^^^^^^

**System Integration**

* **Run System Tools**: Execute FreeBSD diagnostic tools (``fstat``, ``vmstat``, ``ktrace``, ``tcpdump``)
* **Parameterized Execution**: Supply parameters like interface, PID, command, interval, or count
* **Batch Execution**: Run all tools simultaneously with tool-specific parameters
* **Process Discovery**: Retrieve running processes to identify PIDs for tracing tools

**Output Management**

* **Organized Storage**: Tool outputs saved in timestamped directories
* **PDF Report Generation**: Consolidate results into comprehensive reports
* **Automatic Cleanup**: Results older than 24 hours deleted hourly
* **File Management**: Automatic cleanup of temporary trace files

**Documentation and Usability**

* **Interactive API Documentation**: Swagger UI available at ``/swagger/``
* **CLI Menu System**: User-friendly command-line interface with searchable tool selection
* **Error Handling**: Robust timeout and error management
* **Extensible Architecture**: Easy addition of new diagnostic tools


Command-Line Interface
^^^^^^^^^^^^^^^^^^^^^^

The FreeBSD Debugging Framework CLI provides an interactive menu-driven interface for system diagnostics.

**Starting the CLI**

Execute the debugging framework::

   ./freebsd-debug

**Interactive Menu System**

The CLI presents a main menu with the following options:

.. code-block:: text

   FreeBSD Performance Debug Framework
   ==================================
   ? Choose an option:  [Run Tool, Run All Tools, Generate PDF Report, Exit]

Menu Options
^^^^^^^^^^^^

**Run Tool**
   Select and execute a single diagnostic tool with interactive parameter input.

.. figure:: _static/images/debug/cli_run_tool.png
   :width: 600
   :alt: CLI Run Tool

**Run All Tools**  
   Execute all supported diagnostic tools sequentially with default or prompted parameters.

**Prerequisites**
   Configure all the required parameters for each tool to execute all tools successfully.
   Click on "Execute All" to run all the tools sequentially.

.. figure:: _static/images/debug/cli_run_all_tools.png
   :width: 600
   :alt: CLI Run All Tools

**Generate PDF Report**
   Create a consolidated PDF report from previously collected diagnostic outputs.

.. figure:: _static/images/debug/cli_generate_report.png
   :width: 600
   :alt: CLI Generate Report

**Exit**
   Terminate the debugging framework.

CLI Features
^^^^^^^^^^^^^

**Tool Selection**

* **Searchable Interface**: Use ``promptui`` for intuitive tool selection
* **Tool Descriptions**: Each tool includes descriptive information
* **Parameter Prompting**: Interactive input for required tool parameters

**Output Organization**

* **Timestamped Directories**: Results stored in ``/tmp/freebsd-debug/<timestamp>/``
* **Individual Files**: Each tool's output saved in separate text files
* **PDF Reports**: Generated in the same directory with system information and clickable table of contents

**Error Handling**

* **Command Timeouts**: Prevent infinite hangs (10 second default timeout)
* **Graceful Errors**: Errors displayed without crashing the application
* **Automatic Cleanup**: Raw trace files automatically removed after processing

Example CLI Workflow

Complete diagnostic collection and reporting workflow:

1. **Start the Framework**::

      ./freebsd-debug

2. **Execute All Tools**:
   
   Select "Run All Tools" from the menu::

      > Run All Tools
      Running fstat...
      Running netstat-s...  
      Running tcpdump...
      ...
      Outputs saved in: /tmp/freebsd-debug/2025-09-19T12-45-30Z/

3. **Generate PDF Report**:
   
   Select "Generate PDF Report"::

      > Generate PDF Report
      Report generated: /tmp/freebsd-debug/2025-09-19T12-45-30Z/report-2025-09-19T12-45-30Z.pdf

4. **Access Results**:
   
   Navigate to the output directory::

      cd /tmp/freebsd-debug/2025-09-19T12-45-30Z/
      ls -la

Diagnostic Tools
^^^^^^^^^^^^^^^^^

The framework includes a comprehensive set of FreeBSD diagnostic tools:

**System Information**

.. list-table:: 
   :header-rows: 1
   :widths: 20 30 50

   * - Tool
     - Purpose  
     - Key Parameters
   * - ``fstat``
     - File descriptor usage
     - Process ID, user
   * - ``vmstat``
     - Virtual memory statistics
     - Interval, count
   * - ``iostat``
     - I/O statistics
     - Interval, count, devices

**Network Diagnostics**

.. list-table:: 
   :header-rows: 1
   :widths: 20 30 50

   * - Tool
     - Purpose
     - Key Parameters  
   * - ``netstat``
     - Network connections and statistics
     - Protocol, interface
   * - ``tcpdump``
     - Network packet capture
     - Interface, filter, count
   * - ``sockstat``
     - Socket information
     - Protocol, process

**Process and Kernel Analysis**

.. list-table::
   :header-rows: 1
   :widths: 20 30 50

   * - Tool
     - Purpose
     - Key Parameters
   * - ``ktrace``
     - Kernel call tracing  
     - Command, process ID, trace type
   * - ``ps``
     - Process information
     - Format options, sorting
   * - ``top``
     - Real-time process monitoring
     - Update interval, process count

**Storage Analysis**

.. list-table::
   :header-rows: 1
   :widths: 20 30 50

   * - Tool
     - Purpose
     - Key Parameters
   * - ``zpool iostat``
     - ZFS pool I/O statistics
     - Pool name, interval, count
   * - ``zfs list``
     - ZFS filesystem information
     - Dataset types, properties
   * - ``gstat``
     - GEOM storage statistics
     - Interval, batch mode


Output Management
^^^^^^^^^^^^^^^^^^

**Directory Structure**

All diagnostic outputs are organized in timestamped directories::

   /tmp/freebsd-debug/
   ├── 2025-09-19T12-45-30Z/
   │   ├── fstat-output.txt
   │   ├── netstat-output.txt
   │   ├── tcpdump-output.txt
   │   ├── ktrace-output.txt
   │   └── report-2025-09-19T12-45-30Z.pdf
   └── 2025-09-19T14-20-15Z/
       └── ...

**PDF Report Structure**

Generated PDF reports include:

**System Information Section**
   * Hardware configuration
   * Kernel version and build information  
   * Memory configuration
   * Network interface details

**Table of Contents**
   * Clickable links to each diagnostic section
   * Tool execution timestamps
   * Output file references

**Diagnostic Outputs**
   * Individual sections for each executed tool
   * Formatted command outputs
   * Error messages and warnings

**Appendices**
   * Raw data files location
   * Tool parameter summaries
   * System state at collection time

Automatic Cleanup
^^^^^^^^^^^^^^^^^

The framework implements automatic cleanup policies:

* **Retention Period**: 24 hours for diagnostic outputs
* **Cleanup Frequency**: Hourly cleanup process  
* **Cleanup Scope**: Complete directory removal including PDF reports
* **Protection**: Active diagnostic sessions protected from cleanup

.. warning::
   Diagnostic outputs are automatically deleted after 24 hours. Archive important reports before the retention period expires.

Configuration and Extensibility
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

**Customizing Output Locations**

Default output directory can be configured::

   export FREEBSD_DEBUG_DIR="/var/log/diagnostics"

**PDF Report Customization**

Report generation supports customization:

* **Custom Headers**: Organization branding and contact information
* **Section Filtering**: Include/exclude specific diagnostic outputs  
* **Format Options**: Page layout and styling preferences


Common Issues
^^^^^^^^^^^^^^

**Permission Errors**

Some diagnostic tools require elevated privileges::

   # Run as root or with sudo
   sudo ./freebsd-debug

Alternatively, configure appropriate permissions for specific tools.

**Tool Timeouts**

Increase timeout values for long-running diagnostics::

   export FREEBSD_DEBUG_TIMEOUT=60

**Network Interface Issues**

Verify interface names before using network diagnostic tools::

   ifconfig -a

**Storage Access Problems**

Ensure ZFS pools are accessible for storage diagnostics::

   zpool status

**API Connection Issues**

Verify API service status and network connectivity::

   curl -X GET http://localhost:8080/api/v1/debug/tools

**Log Analysis**

Check system logs for diagnostic framework errors::

   tail -f /var/log/messages
   journalctl -f -u freebsd-debug

Performance Considerations
^^^^^^^^^^^^^^^^^^^^^^^^^^

**Resource Usage**

* **CPU Impact**: Diagnostic tools may consume significant CPU resources
* **Disk Space**: Large diagnostic outputs require adequate storage
* **Network Bandwidth**: Network capture tools generate substantial data
* **Memory Usage**: PDF generation requires additional memory

**Optimization Strategies**

* **Selective Execution**: Run only required diagnostic tools
* **Parameter Tuning**: Adjust collection intervals and durations
* **Scheduled Collection**: Use cron for off-peak diagnostic collection
* **Storage Management**: Implement custom cleanup policies for long-term retention

Best Practices
^^^^^^^^^^^^^^^

**Diagnostic Collection**

* **Baseline Establishment**: Collect diagnostics during normal operation
* **Problem Reproduction**: Capture diagnostics during issue occurrence
* **Comprehensive Coverage**: Use "Run All Tools" for unknown issues
* **Targeted Analysis**: Select specific tools for known problem areas

**Report Management**

* **Immediate Analysis**: Review reports promptly due to 24-hour retention
* **Archive Important Data**: Save critical diagnostics to permanent storage  
* **Documentation**: Include problem descriptions with diagnostic reports
* **Sharing**: Use PDF reports for collaboration with support teams

Security Considerations
^^^^^^^^^^^^^^^^^^^^^^^

* **Sensitive Data**: Review outputs for confidential information before sharing
* **Access Control**: Restrict access to diagnostic framework and outputs
* **Network Captures**: Be cautious with tcpdump outputs containing sensitive traffic
* **Process Information**: Process lists may reveal sensitive application details


.. seealso::
   
   **FreeBSD Documentation**
      * `FreeBSD Debugging <https://docs.freebsd.org/en/books/developers-handbook/kerneldebug/>`_

   **Diagnostic Tools Documentation**
      * ``man fstat`` - File descriptor diagnostics
      * ``man tcpdump`` - Network packet capture
      * ``man ktrace`` - Kernel tracing utility


Support Bundle Collection Instructions
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The support bundle tool collects system logs and diagnostic information, encrypts them, and packages them into a .7z archive for analysis by the support team.

**When to Use**

Run this tool when requested by support for:

* Troubleshooting system issues
* Diagnostic analysis
* System health evaluation
* Performance problem investigation

Collection Process
^^^^^^^^^^^^^^^^^^^

How to Generate a Support Bundle from UI

1. **Navigate to Support Bundle**

   * Click on the "Support Bundle" tab in the main navigation menu

   .. figure:: _static/images/support-bundle/support-bundle-tab.png
      :width: 600
      :alt: Support Bundle Tab

2. **Review the Information**

   * Read the description: "Collects system logs and diagnostic information, encrypts them, and packages them into a .7z archive for analysis by the support team"
   * Check the "When to use" scenarios to confirm this matches your needs:

     * Troubleshooting system issues
     * Diagnostic analysis
     * System health evaluation
     * Performance problem investigation

3. **Generate the Bundle**

   * Click the blue "Generate Bundle" button

   .. figure:: _static/images/support-bundle/support-bundle-generate-button.png
      :width: 600
      :alt: Generate Bundle Button

4. **Wait for Processing**

   * The system will collect logs and diagnostic data
   * Package everything into an encrypted .7z archive
   * This may take a few minutes depending on system size

5. **Download the Bundle**

   * Once complete, download the generated .7z file
   * This encrypted archive can be shared with the support team for analysis


Generate Support Bundle via Command Line   

1. Connect to the Console

Use SSH or direct console access to log in to your FreeBSD machine.

.. code-block:: bash

   ssh admin@your-freebsd-machine

.. tip::
   Ensure you have administrative privileges before proceeding with support bundle collection.

2. Navigate to the Tool Location

Change directory to where the support_bundle binary is placed:

.. code-block:: bash

   cd /path/to/support_bundle

.. note::
   Replace ``/path/to/support_bundle`` with the actual installation path on your system.

3. Run the Support Bundle Tool

Execute the tool:

.. code-block:: bash

   ./support_bundle

When prompted, enter a password to encrypt the archive.

.. important::
   Remember this password—you will need to share it with support for archive decryption.

.. warning::
   Choose a strong password for the archive encryption. This password protects sensitive system information during transmission.

4. Verify the Archive

After completion, check that the archive was created:

.. code-block:: bash

   ls -l support_bundle.7z

Expected output should show the created archive file with its size and timestamp.

5. Share the Archive

Send the ``support_bundle.7z`` file and the password to the support team via the provided support email for further analysis.


Email Template
^^^^^^^^^^^^^^^

Use the following template when submitting your support bundle:

**Subject Line:**

.. code-block:: text

   Subject: Support Bundle for Analysis

**Email Body:**

.. code-block:: text

   Attached is the support_bundle.7z file collected from our FreeBSD system.
   Password for the archive: [your password]
   
   Please let us know if you need further information.

Security Considerations
^^^^^^^^^^^^^^^^^^^^^^^

**Password Protection**
    The archive is encrypted to protect sensitive system information during transmission

**Secure Transmission**
    Only send the support bundle through official support channels

**Password Sharing**
    Share the archive password through a separate, secure communication channel when possible

**Data Contents**
    The bundle may contain sensitive system logs and configuration information


Troubleshooting Collection Issues
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

**Permission Denied**
    Ensure you have execute permissions on the support_bundle binary:

    .. code-block:: bash

       chmod +x support_bundle

**Binary Not Found**
    Verify the correct path to the support_bundle tool:

    .. code-block:: bash

       find / -name "support_bundle" -type f 2>/dev/null

**Insufficient Disk Space**
    Check available disk space before running the tool:

    .. code-block:: bash

       df -h

    .. note::
       The support bundle may require significant temporary disk space during collection and compression.

**Collection Timeout**
    If the collection process appears to hang:

    * Wait for completion (large systems may take several minutes)
    * Check system load with ``top`` or ``htop``
    * Verify no other intensive processes are running

Archive Information
^^^^^^^^^^^^^^^^^^^^

**File Format**
    The output file uses 7-Zip compression format (``.7z``) for optimal compression ratio

**Contents**
    The archive typically includes:

    * System logs (``/var/log/*``)
    * Configuration files (sanitized)
    * Hardware information
    * Network configuration
    * Process information
    * Performance metrics

**Encryption**
    AES-256 encryption protects the archive contents during transmission

.. tip::
   The support bundle tool automatically excludes sensitive files like private keys and passwords from the collection process.


Virtual Machine Management
--------------------------

VM Creation Overview
~~~~~~~~~~~~~~~~~~~~

The "Setup VM" button provides access to virtual machine creation with two distinct deployment methods:

- **Standard VM Setup**: Traditional virtual machine configuration for FreeBSD, Windows 10, and Ubuntu
- **Cloud-Init Setup**: Automated VM deployment with cloud-init support for FreeBSD and Ubuntu

.. figure:: _static/images/vmcreation/vmsetup.png
   :width: 600

Standard VM Setup
~~~~~~~~~~~~~~~~~

**VM Configuration Process**

1. **Setup Method Selection**: Choose "Standard VM Setup" from the available options
2. **Server Selection**: Select the target server from available configured servers
3. **Basic Configuration**: Configure fundamental VM parameters
4. **Resource Allocation**: Set CPU, memory, and storage resources
5. **Network Configuration**: Configure network connectivity
6. **VM Creation**: Finalize and create the virtual machine

.. figure:: _static/images/vmcreation/Image_112.png
   :width: 600

**Basic VM Configuration**

- **VM Name**: Specify a unique name for the virtual machine
- **Loader Configuration**: Select the appropriate boot loader for the operating system
- **Operating System**: Choose from supported OS options (FreeBSD, Windows 10, Ubuntu Linux)

.. figure:: _static/images/vmcreation/Image_113.png
   :width: 600

**Resource Allocation**

Configure virtual machine resources based on requirements:

- **CPU Cores**: Select number of CPU cores from available range
- **Memory**: Allocate RAM from available server memory
- **CPU Sockets**: Configure CPU socket topology

.. figure:: _static/images/vmcreation/Image_114.png
   :width: 600

**Storage Configuration**

- **Storage Pool**: Select from available storage pools
- **Disk Size**: Specify virtual disk size based on requirements

.. figure:: _static/images/vmcreation/Image_115.png
   :width: 600

**Network Configuration**

- **Network Switch**: Select virtual network switch
- **Network Driver**: Choose network driver type for optimal performance
- **Network Adapter**: Configure virtual network adapter settings

.. figure:: _static/images/vmcreation/Image_116.png
   :width: 600

Windows Virtual Machine Installation Guide
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Prerequisites
^^^^^^^^^^^^^^

.. important::
   KARIOS currently supports Windows 10 only. 

Before proceeding with the installation, ensure you have:

- **Windows 10 ISO file** - Downloaded from Microsoft or uploaded to the system
- **VirtIO drivers** - Required for optimal performance and hardware compatibility

Installation Steps
^^^^^^^^^^^^^^^^^^

**Step 1: Prerequisites & ISO Management**: Configure installation media and drivers

* **Windows ISO Selection**: Choose your uploaded Windows 10 ISO file or download from Microsoft
* **VirtIO Drivers**: Select or upload the VirtIO driver package
* **Installation Method**: Choose between:

  * Upload existing ISO files
  * Download Windows 10 directly from Microsoft

* **Validation**: System verifies ISO compatibility and driver availability

**Step 2: VM Details**: Configure basic virtual machine settings

* **Server**: Select target server (e.g., DEL-R10-Z7-PHX-0998)
* **VM Name**: Enter descriptive name for the virtual machine
* **Loader**: Set to UEFI (required for Windows 10)
* **Operating System**: Automatically set to Windows 10

.. figure:: _static/images/vmcreation/create_windows_vm.png
   :width: 600
   :alt: Windows VM Basic Configuration

   Figure: Windows VM Basic Configuration

**Step 3: Hardware Configuration**: Allocate CPU and memory resources

* **CPU Sockets**: Configure based on available resources
* **CPU Cores**: Assign processor cores (minimum 2 recommended)
* **Memory (RAM)**: Allocate system memory (minimum 4GB for Windows 10)
* **Resource Validation**: System checks available resources against allocation

.. figure:: _static/images/vmcreation/windows_vm_hardware_configuration.png
   :width: 600
   :alt: Windows VM Hardware Configuration

   Figure: Windows VM Hardware Configuration

**Step 4: Storage Configuration**: Configure virtual disk settings

* **ZPool**: Select storage pool with adequate free space
* **Disk Size**: Set virtual disk size (minimum 20GB for Windows 10)
* **Storage Type**: Automatically optimized for Windows workloads
* **Performance**: VirtIO storage drivers for enhanced I/O performance

.. figure:: _static/images/vmcreation/windows_vm_storage_configuration.png
   :width: 600
   :alt: Windows VM Storage Configuration

   Figure: Windows VM Storage Configuration

**Step 5: Network Configuration**: Setup network connectivity

* **Network Driver**: Select virtio-net for optimal performance
* **Virtual Switch**: Choose appropriate network segment
* **Network Profile**: Configure based on intended use case

.. figure:: _static/images/vmcreation/windows_vm_network_configuration.png
   :width: 600
   :alt: Windows VM Network Configuration

   Figure: Windows VM Network Configuration

**Step 6: Review & Installation**: Finalize and Access VM

* **Attach Drive**: Attach Windows 10 ISO as mentioned below

.. figure:: _static/images/vmcreation/windows_vm_attach_iso.png
   :width: 600
   :alt: Attach Windows ISO

   Figure: Attach Windows ISO


* **Select VM configurations on the drive selection popup**

.. figure:: _static/images/vmcreation/windows_vm_attach_iso_popup.png
   :width: 600
   :alt: Attach Windows ISO Popup

   Figure: Attach Windows ISO Popup


* **Select ISO and Attach**: Choose Windows 10 ISO and click "Attach"

.. figure:: _static/images/vmcreation/windows_vm_iso_to_attach.png
   :width: 600
   :alt: Windows ISO Attached

   Figure: Windows ISO Attached

* **View Attached Drives**: Confirm ISO is attached in VM configuration Visually

.. figure:: _static/images/vmcreation/windows_vm_attached_iso_view.png
   :width: 600
   :alt: Attached ISO View

   Figure: Attached ISO View

Post-Creation Steps
^^^^^^^^^^^^^^^^^^^

1. **Power On**: Start the virtual machine

.. figure:: _static/images/vmcreation/windows_vm_power_on.png
   :width: 600
   :alt: Power On Windows VM

   Figure: Power On Windows VM

2. **Windows Installation**: Follow standard Windows 10 setup process
3. **VirtIO Driver Installation**: Install drivers during or after Windows setup
4. **System Updates**: Apply Windows updates and configure as needed

.. note::
   * Only Windows 10 is currently supported
   * UEFI loader is required for proper Windows 10 functionality
   * VirtIO drivers are essential for optimal performance
   * Minimum system requirements: 2 CPU cores, 4GB RAM, 20GB storage


Cloud-Init VM Setup
~~~~~~~~~~~~~~~~~~~

**Cloud-Init Overview**

Cloud-Init setup provides automated VM deployment with pre-configuration capabilities, supporting:

- **FreeBSD**: Automated FreeBSD deployment with cloud-init
- **Ubuntu**: Automated Ubuntu deployment with cloud-init integration

.. note::

   Please upload and download a raw image (``.raw``) if it is not available during the setup. To do this, navigate to the node-level ISO section in the interface.

**Cloud-Init Configuration Process**

1. **Setup Method Selection**: Choose "Cloud-Init Setup" from available options

.. figure:: _static/images/vmcreation/choose_cloudinit.png
   :width: 600
   :alt: Cloud-Init Setup Selection

2. **Server Selection**: Select target server for VM deployment
3. **Basic VM Configuration**: Configure VM name, loader, and OS
4. **Resource Allocation**: Set CPU, memory, and storage parameters
5. **User Account Setup**: Configure initial user account and authentication
6. **Network Configuration**: Set network parameters (DHCP or static)
7. **VM Creation**: Deploy the cloud-init enabled virtual machine


.. figure:: _static/images/vmcreation/Image_118.png
   :width: 600
   :alt: Cloud-Init Basic Configuration


**VM Basic Configuration**
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

**Step 1: Select Server and Basic VM Details**

- **Server Selection**: Choose the target server for VM deployment.
- **VM Name**: Enter a unique name for your virtual machine.
- **Operating System**: Select the desired OS (FreeBSD or Ubuntu).

.. note::
   Cloud-Init setup only supports raw disk images (``.raw`` format).

.. figure:: _static/images/vmcreation/Image_118.png
   :width: 600
   :alt: Cloud-Init Basic Configuration

**Step 2: Storage and Network Configuration**

- **Storage Pool**: Select the storage pool for the VM's disk.
- **Disk Size**: Specify the size of the virtual disk.
- **Network Switch**: Choose the network switch for VM connectivity.

.. figure:: _static/images/vmcreation/Image_119.png
   :width: 600
   :alt: Cloud-Init Storage and Network Configuration

**Step 3: Hardware Configuration**

- **CPU Cores**: Allocate the number of CPU cores.
- **Memory**: Set the amount of RAM for the VM.

.. figure:: _static/images/vmcreation/Image_120.png
   :width: 600
   :alt: Cloud-Init Hardware Configuration






**User Account Configuration**

Cloud-Init VMs require initial user account setup:

- **Username**: Primary user account for the VM
- **Password**: Secure password for user account authentication
- **SSH Public Key (Optional)**: Add SSH public key for passwordless authentication

.. figure:: _static/images/vmcreation/Image_121.png
   :width: 600

SSH Key Authentication (Enhanced Security)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

For enhanced security, configure SSH key authentication for your virtual machines.

**SSH Key Format**

- Provide your SSH public key in standard format (e.g., ``ssh-rsa``, ``ssh-ed25519``).
- Paste the public key directly into the VM setup form or upload as required.

**Key Benefits**

- Enables passwordless authentication for secure remote access.
- Reduces risk of brute-force password attacks.
- Simplifies automation and remote management.

**Multiple Keys Support**

- You may specify multiple SSH public keys for a VM.
- Each key grants access to authorized users.

**Key Management**

- SSH keys are managed centrally via the Karios interface.
- Administrators can add, remove, or update authorized keys for each VM.
- Regularly review and rotate SSH keys for optimal security.

.. note::

   Always keep your private SSH keys secure and never share them. 
   Only authorized public keys should be added to the VM configuration.

**Network Configuration Options**

**DHCP Configuration (Default)**:
- Automatic IP address assignment
- Dynamic network configuration
- Simplified setup process

**Static IP Configuration**:
- Static IP Address: Manually specify IP address
- Subnet Mask: Configure network subnet mask
- Domain Name: Set domain name for the VM

.. figure:: _static/images/vmcreation/Image_122.png
   :width: 600
   :alt: Network Configuration Options

Security Best Practices
~~~~~~~~~~~~~~~~~~~~~~~

The system provides security recommendations to ensure safe and reliable VM operations:

- **Strong Passwords**: Use complex passwords with a mix of uppercase, lowercase, numbers, and special characters.
- **SSH Key Authentication**: Prefer SSH keys over passwords for VM access; they offer enhanced security and reduce brute-force risks.
- **Password Disabling**: When SSH keys are configured, consider disabling password authentication for remote access.
- **Network Security**: Apply appropriate network security policies, such as firewalls and VLAN segmentation, to protect VM traffic.

VM Deployment Process
~~~~~~~~~~~~~~~~~~~~~

Pre-Deployment Validation
^^^^^^^^^^^^^^^^^^^^^^^^^

Before creating a VM, the system performs several validation checks:

- **Network Switch Availability**: Ensure a virtual switch exists and is ready to attach to the VM's NIC (see Networking → Switches → Create).
- **OS ISO Availability**: Confirm the required installation ISO is present and attachable. If missing, upload or download the ISO from Node → ISOs.
- **Resource Availability**: Verify sufficient CPU, memory, and storage capacity on the target node.
- **Configuration Validity**: Validate all VM parameters (vCPU, memory, disk, NIC) for compatibility with the selected node.

VM Creation Process
^^^^^^^^^^^^^^^^^^^

The VM creation workflow includes:

1. **Configuration Review**: Review all VM settings before proceeding.
2. **Resource Reservation**: Reserve the specified resources on the target server.
3. **VM Instantiation**: Create the virtual machine with the chosen configuration.
4. **OS Installation**: Install the operating system (automatic for cloud-init setups).
5. **Initial Configuration**: Apply initial configuration settings, such as user accounts and network parameters.
6. **Service Startup**: Start VM services and validate basic functionality.

Post-Creation Verification
^^^^^^^^^^^^^^^^^^^^^^^^^^

After VM creation, perform the following checks:

- **VM Status**: Confirm the VM is running and accessible via the management interface.
- **Network Connectivity**: Test network connectivity and verify correct configuration.
- **User Access**: Ensure user accounts and authentication methods (password or SSH key) are working.
- **Service Functionality**: Validate that all required services within the VM are operational.

VM Lifecycle Management
~~~~~~~~~~~~~~~~~~~~~~~

**VM Management Interface**

Once a VM is created, the VM management interface provides comprehensive control through several key sections:

Click on the icon highlighted below to navigate to the VM management interface. All created VMs will be listed here.

.. figure:: _static/images/vmcreation/navigate_to_vms.png
   :width: 600
   :alt: VM Management Interface Overview

- **Hardware Tab**: Configure VM hardware specifications and resources
- **Console Tab**: Direct console access to the virtual machine
- **Snapshots Tab**: Create and manage VM snapshots
- **Activity Logs Tab**: View VM operation history and logs

.. figure:: _static/images/vmcreation/Image_123.png
   :width: 600
   :alt: VM Management Interface

**VM Hardware Configuration**

The Hardware tab allows dynamic modification of VM specifications:

- **VM Details Configuration**: Adjust CPU and memory allocation

.. figure:: _static/images/vmcreation/Image_124.png
   :width: 600
   :alt: VM Hardware Configuration

- **CD/DVD Drive Management**: Attach ISO images for installation or boot

.. figure:: _static/images/vmcreation/Image_125.png
   :width: 600
   :alt: VM Hardware Configuration

- **Network Switch Management**: Configure network interfaces and switches

.. figure:: _static/images/vmcreation/Image_126.png
   :width: 600
   :alt: VM Hardware Configuration

.. figure:: _static/images/vmcreation/Image_127.png
   :width: 600
   :alt: VM Hardware Configuration

**Update: Modify existing network configurations**

.. figure:: _static/images/vmcreation/update_vm_configs.png
   :width: 600
   :alt: VM Network Configuration Update

.. figure:: _static/images/vmcreation/Image_128.png
   :width: 600
   :alt: VM Hardware Configuration


- **Virtual Disk Management**: Attach virtual disks

.. figure:: _static/images/vmcreation/Image_129.png
   :width: 600
   :alt: VM Hardware Configuration

**Attach Only Disk**: 

.. figure:: _static/images/vmcreation/attach_only_disk.png
   :width: 600
   :alt: VM Hardware Configuration

.. figure:: _static/images/vmcreation/Image_130.png
   :width: 600
   :alt: VM Hardware Configuration

**Reassign**: Remove the virtual disk from the current vm and assign it to some other available vm in the node.

.. figure:: _static/images/vmcreation/Image_131.png
   :width: 600

**Delete**: Delete the unused disk permanently

.. figure:: _static/images/vmcreation/vm_delete_unused_disk.png
   :width: 600
   :alt: VM Hardware Configuration

**Attach PCIe Device**: Attach PCIe devices like GPU and NIC to the VM. Click on the "Attach" button to attach the PCIe device.

.. figure:: _static/images/vmcreation/attach_pcie_device.png
   :width: 600
   :alt: Attach PCIe Device

Select the PCIe devices to attach to the VM and click on the "Attach Devices" button.

.. figure:: _static/images/vmcreation/select_pcie_device.png
   :width: 600
   :alt: Select PCIe Device

Confirm the PCIe devices to be attached to the VM. Click on the "Attach Devices" button to proceed. 

.. figure:: _static/images/vmcreation/confirm_pcie_device.png
   :width: 600
   :alt: Confirm PCIe Device

Attached devices will be listed in the Hardware tab.

.. figure:: _static/images/vmcreation/attached_pcie_device.png
   :width: 600
   :alt: Attached PCIe Device

**Detach PCIe Device**: Detach the PCIe devices from the VM. Click on the "detach" button to detach the PCIe device.

.. figure:: _static/images/vmcreation/detach_pcie_device_popup.png
   :width: 600
   :alt: Detach PCIe Device

.. figure:: _static/images/vmcreation/detach_pcie_device_confirmation.png
   :width: 600
   :alt: Detach PCIe Device

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

VM Console Access
~~~~~~~~~~~~~~~~~

The Console tab provides direct browser-based access to the VM's operating system:

- **Direct Console Access**: Interact with the VM through a web-based console interface
- **Remote Management**: Perform administrative tasks and troubleshooting directly from your browser

.. figure:: _static/images/vmcreation/Image_132.png
   :width: 600

VM Snapshot Management
~~~~~~~~~~~~~~~~~~~~~~

The Snapshots tab enables comprehensive snapshot operations:

- **Snapshot Creation**: Create point-in-time snapshots of the VM state

.. figure:: _static/images/vmcreation/Image_133.png
   :width: 600

- **Snapshot Rollback**: Restore the VM to a previous snapshot

.. figure:: _static/images/vmcreation/vm_snapshot_rollback.png
   :width: 600

- **Snapshot Management**: View, delete, and organize existing snapshots
- **Snapshot Scheduling**: Configure automated snapshot creation for regular backups

VM Bhyve Logs
~~~~~~~~~~~~~~

The Bhyve Logs tab provides comprehensive access to virtual machine hypervisor logs:

- **Real-time Log Monitoring**: View live bhyve hypervisor logs with automatic updates

.. figure:: _static/images/vmcreation/vm_bhyve_logs.png
   :width: 600
   :alt: VM Bhyve Logs


- **Log Entry Details**: Each log entry displays timestamp and detailed system messages
- **VM Initialization Tracking**: Monitor VM startup sequence including:
  
  * MAC address generation
  * Boot loader initialization  
  * CPU and memory allocation
  * Network bridge configuration
  * UUID assignment and debug mode status
  * Primary disk attachment

- **Log Refresh Control**: Manual refresh capability to update log entries on demand
- **Total Log Count Display**: Shows complete number of log entries (e.g., "Total logs: 24")
- **Chronological Log Organization**: Entries numbered sequentially with precise timestamps
- **System Event Correlation**: Track VM state changes and correlate with system events
- **Troubleshooting Support**: Detailed logging for diagnosing VM startup and operational issues

The Bhyve Logs interface provides essential diagnostic information for understanding VM behavior, troubleshooting boot issues, and monitoring hypervisor-level operations during virtual machine lifecycle management.

VM Monitoring
~~~~~~~~~~~~~

Monitor VM performance and health using built-in tools:

- **Resource Usage**: Track CPU, memory, and storage utilization
- **Network Traffic**: Monitor network performance and connectivity
- **System Logs**: Access VM system logs and error messages via the Activity Logs tab

VM Maintenance
~~~~~~~~~~~~~~

Perform regular maintenance operations to ensure optimal VM performance:

- **Updates**: Apply operating system and application updates
- **Backups**: Create regular VM backups for disaster recovery
- **Security Patches**: Apply security updates and patches promptly
- **Configuration Changes**: Modify VM settings through the Hardware tab as needed
- **Hardware Modifications**: Dynamically adjust CPU, memory, storage, and network configurations

VM Console Access
~~~~~~~~~~~~~~~~~

The Console tab provides direct browser-based access to the VM's operating system:

- **Direct Console Access**: Interact with the VM through a web-based console interface
- **Remote Management**: Perform administrative tasks and troubleshooting directly from your browser

VM Snapshot Management
~~~~~~~~~~~~~~~~~~~~~~

The Snapshots tab enables comprehensive snapshot operations:

- **Snapshot Creation**: Create point-in-time snapshots of the VM state
- **Snapshot Rollback**: Restore the VM to a previous snapshot
- **Snapshot Management**: View, delete, and organize existing snapshots
- **Snapshot Scheduling**: Configure automated snapshot creation for regular backups

VM Monitoring
~~~~~~~~~~~~~

Monitor VM performance and health using built-in tools:

- **Resource Usage**: Track CPU, memory, and storage utilization
- **Network Traffic**: Monitor network performance and connectivity
- **System Logs**: Access VM system logs and error messages via the Activity Logs tab

VM Maintenance
~~~~~~~~~~~~~~

Perform regular maintenance operations to ensure optimal VM performance:

- **Updates**: Apply operating system and application updates
- **Backups**: Create regular VM backups for disaster recovery
- **Security Patches**: Apply security updates and patches promptly
- **Configuration Changes**: Modify VM settings through the Hardware tab as needed
- **Hardware Modifications**: Dynamically adjust CPU, memory, storage, and network configurations

PCIe Device Passthrough - GPU and NIC Passthrough
--------------------------------------------------

Overview
~~~~~~~~~

PCIe passthrough allows virtual machines to directly access physical hardware devices, providing near-native performance for graphics cards, network interfaces, and other PCIe devices. Karios implements PCIe passthrough through FreeBSD's bhyve hypervisor with IOMMU support, enabling dedicated hardware access for virtualized workloads.

**Performance Requirements**

* **GPU Workloads**: Machine learning, AI training, graphics rendering, and cryptocurrency mining require direct GPU access for optimal performance
* **Network Performance**: High-throughput networking applications benefit from dedicated NIC access, bypassing virtualization overhead
* **Real-time Applications**: Time-sensitive workloads need direct hardware access to minimize latency

**Enterprise Use Cases**

* **GPU Compute Clusters**: Dedicated GPU resources for computational workloads
* **VDI (Virtual Desktop Infrastructure)**: Graphics acceleration for virtual desktops
* **Network Function Virtualization (NFV)**: Dedicated network interfaces for virtual network appliances
* **Development and Testing**: Isolated hardware access for driver development and testing

**Hardware Isolation**

* **Security**: Physical isolation between VMs at the hardware level
* **Resource Allocation**: Guaranteed hardware resources without sharing
* **Compliance**: Meeting regulatory requirements for hardware isolation

GPU Passthrough
~~~~~~~~~~~~~~~~

GPU passthrough provides virtual machines with direct access to graphics processing units, enabling near-native performance for GPU-accelerated applications.


Hardware Requirements
^^^^^^^^^^^^^^^^^^^^^^

* **IOMMU Support**: Intel VT-d or AMD-Vi enabled in BIOS/UEFI
* **Multiple GPUs**: Host system requires at least one GPU for console access (or integrated graphics)
* **Compatible GPU**: Modern GPUs with UEFI support (NVIDIA, AMD, Intel Arc)
* **Sufficient PCIe Lanes**: Adequate bandwidth for GPU operation

System Requirements
^^^^^^^^^^^^^^^^^^^

* **FreeBSD with bhyve**: IOMMU-enabled kernel
* **Sufficient RAM**: Additional memory overhead for VM and GPU operations
* **Power Supply**: Adequate power for additional GPU hardware

GPU Passthrough Use Cases
~~~~~~~~~~~~~~~~~~~~~~~~~

Graphics and Rendering
^^^^^^^^^^^^^^^^^^^^^^^

* **CAD Workstations**: Professional graphics applications requiring GPU acceleration
* **Gaming VMs**: Near-native gaming performance in virtualized environments
* **Video Processing**: Hardware-accelerated video encoding and transcoding

Scientific Computing
^^^^^^^^^^^^^^^^^^^^^

* **CUDA Applications**: Direct access to NVIDIA CUDA cores
* **OpenCL Workloads**: Cross-platform parallel computing
* **Simulation Software**: GPU-accelerated scientific simulations

NIC Passthrough
~~~~~~~~~~~~~~~~

Network Interface Card (NIC) passthrough provides virtual machines with dedicated network hardware access, enabling high-performance networking applications.

Benefits of NIC Passthrough
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

**Performance Advantages**

* **Reduced Latency**: Elimination of virtualization network stack overhead
* **Higher Throughput**: Direct access to full network interface bandwidth
* **CPU Efficiency**: Reduced host CPU usage for network processing
* **Hardware Offloading**: Access to NIC hardware acceleration features

**Advanced Features**

* **SR-IOV Support**: Single Root I/O Virtualization for multiple VMs
* **DPDK Applications**: Data Plane Development Kit compatibility
* **Network Function Virtualization**: Dedicated interfaces for virtual appliances
* **Quality of Service**: Hardware-level traffic management


NIC Passthrough Use Cases
~~~~~~~~~~~~~~~~~~~~~~~~~

Network Appliances
^^^^^^^^^^^^^^^^^^^

* **Firewalls**: Dedicated interfaces for security appliances
* **Load Balancers**: High-performance traffic distribution
* **VPN Gateways**: Hardware-accelerated encryption processing
* **Network Monitoring**: Dedicated capture interfaces for analysis tools

High-Performance Applications
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

* **High-Frequency Trading**: Ultra-low latency network access
* **Real-time Communications**: Dedicated bandwidth for VoIP/video systems
* **Database Clusters**: Direct network access for distributed databases
* **Storage Networks**: Dedicated interfaces for SAN/NAS access

Development and Testing
^^^^^^^^^^^^^^^^^^^^^^^

* **Network Driver Development**: Direct hardware access for testing
* **Protocol Testing**: Isolated network environments
* **Performance Benchmarking**: Accurate network performance measurement

**Best Practices**

Hardware Planning
~~~~~~~~~~~~~~~~~

Device Allocation
^^^^^^^^^^^^^^^^^

* **Reserve Host Resources**: Ensure host system retains necessary devices
* **IOMMU Groups**: Understand PCIe device grouping limitations
* **Power and Cooling**: Account for additional hardware power requirements
* **PCIe Lane Distribution**: Optimize bandwidth allocation across devices

VM Resource Planning
^^^^^^^^^^^^^^^^^^^^

* **Memory Allocation**: Provide sufficient RAM for GPU/NIC operations
* **CPU Assignment**: Allocate appropriate CPU cores for device-intensive workloads
* **Storage Performance**: Ensure storage subsystem can support additional I/O

Security Considerations
~~~~~~~~~~~~~~~~~~~~~~~

Access Control
^^^^^^^^^^^^^^

* **Device Ownership**: Clearly define which VMs own which devices
* **Physical Security**: Secure physical access to passthrough-capable hardware
* **Firmware Updates**: Maintain current firmware on passthrough devices

Isolation Verification
^^^^^^^^^^^^^^^^^^^^^^

* **IOMMU Validation**: Verify proper hardware isolation
* **Cross-VM Communication**: Ensure devices cannot access other VM memory
* **Host Protection**: Confirm host system stability with device assignments

Troubleshooting
~~~~~~~~~~~~~~~~

IOMMU Problems
^^^^^^^^^^^^^^

* **IOMMU Not Enabled**: Verify BIOS/UEFI and FreeBSD configuration
* **Grouping Issues**: Check IOMMU group assignments with ``pciconf -lv``
* **Device Conflicts**: Ensure devices aren't bound to host drivers

Device Recognition
^^^^^^^^^^^^^^^^^^

* **Driver Issues**: Install appropriate drivers in guest VM
* **Firmware Compatibility**: Ensure device firmware supports passthrough
* **Resource Conflicts**: Check for PCIe resource allocation problems

Performance Issues
^^^^^^^^^^^^^^^^^^

* **Bandwidth Limitations**: Verify adequate PCIe lane allocation
* **Memory Mapping**: Ensure proper IOMMU page table configuration
* **Interrupt Handling**: Check MSI/MSI-X interrupt configuration

Monitoring and Maintenance
~~~~~~~~~~~~~~~~~~~~~~~~~~

Device Health
^^^^^^^^^^^^^

* **Temperature Monitoring**: Track GPU/device temperatures
* **Performance Metrics**: Monitor throughput and latency
* **Error Logging**: Review system logs for hardware issues

System Impact
^^^^^^^^^^^^^

* **Host Performance**: Monitor impact on host system resources
* **VM Performance**: Track guest VM performance metrics
* **Network Utilization**: Monitor bandwidth usage and efficiency



.. seealso::
   
   **FreeBSD Documentation**
      * `FreeBSD Virtualization with bhyve <https://docs.freebsd.org/en/books/handbook/virtualization/>`_
   
   **Hardware Specifications**
      * `AMD-Vi Specification <https://www.amd.com/system/files/TechDocs/34434.pdf>`_


Virtual Machine CLI Commands
----------------------------

VM Creation and Configuration
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Basic VM Creation
^^^^^^^^^^^^^^^^^

.. code-block:: bash

   # Create a new virtual machine
   vm create -t template_name vm_name


VM Management Operations
~~~~~~~~~~~~~~~~~~~~~~~~~

Starting and Stopping VMs
^^^^^^^^^^^^^^^^^^^^^^^^^

.. code-block:: bash

   # Start a virtual machine
   vm start vm_name

   # Start VM with specific boot options
   vm start -B "-s 31,lpc -l com1,stdio" vm_name

   # Stop a virtual machine
   vm stop vm_name

   # Force stop (power off)
   vm poweroff vm_name

   # Restart a virtual machine
   vm restart vm_name

VM Status and Information
^^^^^^^^^^^^^^^^^^^^^^^^^

.. code-block:: bash

   # List all virtual machines
   vm list

   # Show detailed VM information
   vm info vm_name

   # Show VM configuration
   vm config vm_name

   # Show VM console output
   vm console vm_name

Resource Management
~~~~~~~~~~~~~~~~~~~

CPU and Memory Management
^^^^^^^^^^^^^^^^^^^^^^^^^

.. code-block:: bash

   # Modify VM CPU count
   vm config vm_name cpu=8

   # Adjust VM memory
   vm config vm_name memory=16G

   # Configure CPU affinity
   vm config vm_name cpuset=0,1,2,3


Network Configuration
~~~~~~~~~~~~~~~~~~~~~~

Virtual Switch Operations
^^^^^^^^^^^^^^^^^^^^^^^^^

.. code-block:: bash

   # Create virtual switch
   vm switch create switch_name

   # Add interface to switch
   vm switch add switch_name em0

   # Remove interface from switch
   vm switch remove switch_name em0

   # List virtual switches
   vm switch list

   # Show switch details
   vm switch info switch_name

Template Management
~~~~~~~~~~~~~~~~~~~~

Creating and Managing Templates
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. code-block:: bash

   # Create a template from an existing VM config
   cp /zroot/vm/vm_name/vm.conf /vm/.templates/template_name.conf

   # List available templates
   ls /vm/.templates/

   # Show template details
   cat /vm/.templates/template_name.conf

   # Delete a template
   rm /vm/.templates/template_name.conf

   # Create a VM from a template
   vm create -t template_name new_vm_name


VM Console and Access
~~~~~~~~~~~~~~~~~~~~~

Console Management
^^^^^^^^^^^^^^^^^^

.. code-block:: bash

   # Connect to VM console
   vm console vm_name

   # Disconnect from console
   # Press Ctrl+] to exit console

   # Enable VNC for VM
   vm config vm_name vnc=on

   # Set VNC port
   vm config vm_name vnc_port=5900

   # Set VNC password
   vm config vm_name vnc_password=secure_password


VM Monitoring and Logs
~~~~~~~~~~~~~~~~~~~~~~

Performance Monitoring
^^^^^^^^^^^^^^^^^^^^^^

.. code-block:: bash


   # Monitor overall system resource usage
   top -a

   # Show CPU usage per core
   top -P

   # Monitor disk I/O statistics
   iostat -x 1

   # Show live disk statistics per device
   gstat

   # Display network statistics (interfaces)
   netstat -i

   # Show protocol-level network statistics
   netstat -s

   # View specific VM process resource usage
   ps aux | grep bhyve


.. note::
   Replace ``vm_name``, ``template_name``, and other variables with actual values specific to your environment.

.. warning::
   Some operations like PCI passthrough require specific hardware support and configuration.

.. tip::
   Use ``vm help command_name`` to get detailed information about any specific command and its options.


VLAN Interface Configuration
----------------------------

Creating VLAN Interfaces
~~~~~~~~~~~~~~~~~~~~~~~~

.. code-block:: bash

   # Create VLAN interfaces
   ifconfig vlan102 create vlan 102 vlandev vtnet0
   ifconfig vlan103 create vlan 103 vlandev vtnet0

Assigning IP Addresses
~~~~~~~~~~~~~~~~~~~~~~

.. code-block:: bash

   # Assign IP addresses and bring interfaces up
   ifconfig vlan102 inet 10.1.102.3/24 up
   ifconfig vlan103 inet 10.1.103.3/24 up

Making Configuration Persistent
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. code-block:: bash

   # Make VLAN configuration persistent across reboots
   sysrc cloned_interfaces+="vlan102 vlan103"
   sysrc ifconfig_vlan102="inet 10.1.102.3/24"
   sysrc ifconfig_vlan103="inet 10.1.103.3/24"

.. note::
   VLAN configuration will be automatically applied on system boot after making it persistent with ``sysrc`` commands.

.. tip::
   Verify VLAN interface status with ``ifconfig vlan102`` and ``ifconfig vlan103`` after configuration.


ZFS CLI Commands
----------------

Pool Related Commands
~~~~~~~~~~~~~~~~~~~~~

.. list-table::
   :widths: 70 30
   :header-rows: 1

   * - Command
     - Description
   * - ``zpool create datapool c0t0d0``
     - Create a basic pool named datapool
   * - ``zpool create -f datapool c0t0d0``
     - Force the creation of a pool
   * - ``zpool create -m /data datapool c0t0d0``
     - Create a pool with a different mount point than the default
   * - ``zpool create datapool raidz c3t0d0 c3t1d0 c3t2d0``
     - Create RAID-Z vdev pool
   * - ``zpool add datapool raidz c4t0d0 c4t1d0 c4t2d0``
     - Add RAID-Z vdev to pool datapool
   * - ``zpool create datapool raidz1 c0t0d0 c0t1d0 c0t2d0 c0t3d0 c0t4d0 c0t5d0``
     - Create RAID-Z1 pool
   * - ``zpool create datapool raidz2 c0t0d0 c0t1d0 c0t2d0 c0t3d0 c0t4d0 c0t5d0``
     - Create RAID-Z2 pool
   * - ``zpool create datapool mirror c0t0d0 c0t5d0``
     - Mirror c0t0d0 to c0t5d0
   * - ``zpool create datapool mirror c0t0d0 c0t5d0 mirror c0t2d0 c0t4d0``
     - disk c0t0d0 is mirrored with c0t5d0 and disk c0t2d0 is mirrored with c0t4d0
   * - ``zpool add datapool mirror c3t0d0 c3t1d0``
     - Add new mirrored vdev to datapool
   * - ``zpool add datapool spare c1t3d0``
     - Add spare device c1t3d0 to the datapool
   * - ``zpool create -n geekpool c1t3d0``
     - Do a dry run on pool creation

Show File System Info
~~~~~~~~~~~~~~~~~~~~~

.. list-table::
   :widths: 50 50
   :header-rows: 1

   * - Command
     - Description
   * - ``zfs list``
     - List all ZFS file system
   * - ``zfs get all datapool``
     - List all properties of a ZFS file system

Mount/Umount Related Commands
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. list-table::
   :widths: 50 50
   :header-rows: 1

   * - Command
     - Description
   * - ``zfs set mountpoint=/data datapool/fs1``
     - Set the mount-point of file system fs1 to /data
   * - ``zfs mount datapool/fs1``
     - Mount fs1 file system
   * - ``zfs umount datapool/fs1``
     - Umount ZFS file system fs1
   * - ``zfs mount -a``
     - Mount all ZFS file systems
   * - ``zfs umount -a``
     - Umount all ZFS file systems

Import/Export Commands
~~~~~~~~~~~~~~~~~~~~~~

.. list-table::
   :widths: 50 50
   :header-rows: 1

   * - Command
     - Description
   * - ``zpool import``
     - List pools available for import
   * - ``zpool import -a``
     - Imports all pools found in the search directories
   * - ``zpool import -d``
     - To search for pools with block devices not located in /dev/dsk
   * - ``zpool import -d /zfs datapool``
     - Search for a pool with block devices created in /zfs
   * - ``zpool import oldpool newpool``
     - Import a pool originally named oldpool under new name newpool
   * - ``zpool import 3987837483``
     - Import pool using pool ID
   * - ``zpool export datapool``
     - Deport a ZFS pool named datapool
   * - ``zpool export -f datapool``
     - Force the unmount and deport of a ZFS pool

Clone Commands
~~~~~~~~~~~~~~

.. list-table::
   :widths: 50 50
   :header-rows: 1

   * - Command
     - Description
   * - ``zfs clone datapool/fs1@10jan2014 /clones/fs1``
     - Clone an existing snapshot
   * - ``zfs destroy datapool/fs1@10jan2014``
     - Destroy clone

Show Pool Information
~~~~~~~~~~~~~~~~~~~~~

.. list-table::
   :widths: 50 50
   :header-rows: 1

   * - Command
     - Description
   * - ``zpool status -x``
     - Show pool status
   * - ``zpool status -v datapool``
     - Show individual pool status in verbose mode
   * - ``zpool list``
     - Show all the pools
   * - ``zpool list -o name,size``
     - Show particular properties of all the pools (here, name and size)
   * - ``zpool list -Ho name``
     - Show all pools without headers and columns

File-system/Volume Related Commands
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. list-table::
   :widths: 50 50
   :header-rows: 1

   * - Command
     - Description
   * - ``zfs create datapool/fs1``
     - Create file-system fs1 under datapool
   * - ``zfs create -V 1gb datapool/vol01``
     - Create 1 GB volume (Block device) in datapool
   * - ``zfs destroy -r datapool``
     - destroy datapool and all datasets under it
   * - ``zfs destroy -fr datapool/data``
     - destroy file-system or volume (data) and all related snapshots

Set ZFS File System Properties
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. list-table::
   :widths: 70 30
   :header-rows: 1

   * - Command
     - Description
   * - ``zfs set quota=1G datapool/fs1``
     - Set quota of 1 GB on filesystem fs1
   * - ``zfs set reservation=1G datapool/fs1``
     - Set Reservation of 1 GB on filesystem fs1
   * - ``zfs set mountpoint=legacy datapool/fs1``
     - Disable ZFS auto mounting and enable mounting through /etc/vfstab
   * - ``zfs set sharenfs=on datapool/fs1``
     - Share fs1 as NFS
   * - ``zfs set compression=on datapool/fs1``
     - Enable compression on fs1
   * - ``zfs set recordsize=[size] pool/dataset/name``
     - Set Dataset Record Size (Size should be a value like 16k, 128k, or 1M etc.)
   * - ``zfs get recordsize pool/dataset/name``
     - Get Dataset Record Size

ZFS I/O Performance
~~~~~~~~~~~~~~~~~~~~

.. list-table::
   :widths: 50 50
   :header-rows: 1

   * - Command
     - Description
   * - ``zpool iostat 2``
     - Display ZFS I/O Statistics every 2 seconds
   * - ``zpool iostat -v 2``
     - Display detailed ZFS I/O statistics every 2 seconds

ZFS Maintenance Commands
~~~~~~~~~~~~~~~~~~~~~~~~

.. list-table::
   :widths: 50 50
   :header-rows: 1

   * - Command
     - Description
   * - ``zpool scrub datapool``
     - Run scrub on all file systems under data pool
   * - ``zpool offline -t datapool c0t0d0``
     - Temporarily offline a disk (until next reboot)
   * - ``zpool online``
     - Online a disk to clear error count
   * - ``zpool clear``
     - Clear error count without a need to the disk

Snapshot Commands
~~~~~~~~~~~~~~~~~~

.. list-table::
   :widths: 70 30
   :header-rows: 1

   * - Command
     - Description
   * - ``zfs snapshot datapool/fs1@12jan2014``
     - Create a snapshot named 12jan2014 of the fs1 filesystem
   * - ``zfs list -t snapshot``
     - List snapshots
   * - ``zfs rollback -r datapool/fs1@10jan2014``
     - Roll back to 10jan2014 (recursively destroy intermediate snapshots)
   * - ``zfs rollback -rf datapool/fs1@10jan2014``
     - Roll back must and force unmount and remount
   * - ``zfs destroy datapool/fs1@10jan2014``
     - Destroy snapshot created earlier
   * - ``zfs send datapool/fs1@oct2013 > /geekpool/fs1/oct2013.bak``
     - Take a backup of ZFS snapshot locally
   * - ``zfs receive anotherpool/fs1 < /geekpool/fs1/oct2013.bak``
     - Restore from the snapshot backup backup taken
   * - ``zfs send datapool/fs1@oct2013 | zfs receive anotherpool/fs1``
     - Combine the send and receive operation
   * - ``zfs send datapool/fs1@oct2013 | ssh node02 "zfs receive testpool/testfs"``
     - Send the snapshot to a remote system node02

Firewall CLI Commands
----------------------

.. note::
   For comprehensive pfctl administration details, refer to the `FreeBSD pfctl documentation <https://docs.freebsd.org/en/books/handbook/firewalls/>`_.

General Commands
~~~~~~~~~~~~~~~~

.. list-table::
   :widths: 50 50
   :header-rows: 1

   * - Command
     - Description
   * - ``pfctl -e``
     - Enable PF
   * - ``pfctl -d``
     - Disable PF
   * - ``pfctl -q``
     - Only print errors and warnings
   * - ``pfctl -v``
     - Produce more verbose output

Loading Rules
~~~~~~~~~~~~~

.. list-table::
   :widths: 50 50
   :header-rows: 1

   * - Command
     - Description
   * - ``pfctl -f /etc/pf.conf``
     - Load the pf.conf file
   * - ``pfctl -nf /etc/pf.conf``
     - Parse the file, but don't load it
   * - ``pfctl -Nf /etc/pf.conf``
     - Load only the NAT rules from the file
   * - ``pfctl -Rf /etc/pf.conf``
     - Load only the filter rules from the file

Flushing Rules
~~~~~~~~~~~~~~

.. list-table::
   :widths: 70 30
   :header-rows: 1

   * - Command
     - Description
   * - ``pfctl -F nat``
     - Flush the NAT rules
   * - ``pfctl -F queue``
     - Flush the queue rules
   * - ``pfctl -F rules``
     - Flush the filter rules
   * - ``pfctl -F states``
     - Flush the state table (connections)
   * - ``pfctl -F info``
     - Flush the filter information (counters)
   * - ``pfctl -F osfp``
     - Flush the passive operating system fingerprints
   * - ``pfctl -F all``
     - Flush everything

Showing Information
~~~~~~~~~~~~~~~~~~~

.. list-table::
   :widths: 70 30
   :header-rows: 1

   * - Command
     - Description
   * - ``pfctl -s nat``
     - Show the currently loaded NAT rules
   * - ``pfctl -s queue``
     - Show the currently loaded queue rules
   * - ``pfctl -s rules``
     - Show the currently loaded filter rules
   * - ``pfctl -s states``
     - Show the contents of the state table
   * - ``pfctl -s info``
     - Show filter information (statistics and counters)
   * - ``pfctl -s labels``
     - Show per-rule statistics (bytes, packets, etc.) of filter rules with labels
   * - ``pfctl -s timeouts``
     - Show the current global timeouts
   * - ``pfctl -s memory``
     - Show the current pool memory hard limits
   * - ``pfctl -s osfp``
     - Show the list of operating system fingerprints
   * - ``pfctl -s all``
     - Show everything


Debugging
~~~~~~~~~

.. list-table::
   :widths: 70 30
   :header-rows: 1

   * - Command
     - Description
   * - ``pfctl -s rules -vv``
     - Show filter rules with very verbose output
   * - ``pfctl -vf /etc/pf.conf``
     - Load /etc/pf.conf verbosely, showing rule numbers as loaded
   * - ``pfctl -x loud``
     - Set the debug level to loud

Statistics
~~~~~~~~~~~

.. list-table::
   :widths: 70 30
   :header-rows: 1

   * - Command
     - Description
   * - ``pfctl -s info``
     - Show information and statistics
   * - ``pfctl -s labels``
     - Show per-rule statistics for rules that have labels
   * - ``pfctl -s states``
     - Show state table
   * - ``pfctl -s states | grep 192.168.1.1``
     - Show state table for a specific IP

Tables
~~~~~~

.. list-table::
   :widths: 70 30
   :header-rows: 1

   * - Command
     - Description
   * - ``pfctl -t tablename -T show``
     - Show contents of specified table
   * - ``pfctl -t tablename -T add 1.2.3.4``
     - Add address to table
   * - ``pfctl -t tablename -T delete 1.2.3.4``
     - Delete address from table
   * - ``pfctl -t tablename -T flush``
     - Remove all addresses from table
   * - ``pfctl -t tablename -T kill``
     - Delete the table entirely
   * - ``pfctl -t tablename -T load -f filename``
     - Load addresses into table from file
   * - ``pfctl -t tablename -T test 1.2.3.4``
     - Test if address is in table


Common Usage Examples
~~~~~~~~~~~~~~~~~~~~~

.. list-table::
   :widths: 70 30
   :header-rows: 1

   * - Command
     - Description
   * - ``pfctl -sa | head -30``
     - Show first 30 lines of everything
   * - ``pfctl -s states | head -20``
     - Show first 20 active connections
   * - ``pfctl -s states -v | grep -v ESTABLISHED``
     - Show active connections, verbose, without established
   * - ``pfctl -k 192.168.1.1``
     - Kill all states for IP 192.168.1.1
   * - ``pfctl -K 192.168.1.1``
     - Kill and prevent future connections for IP
   * - ``pfctl -z``
     - Clear per-rule statistics

Network Traffic Monitoring
~~~~~~~~~~~~~~~~~~~~~~~~~~

.. list-table::
   :widths: 70 30
   :header-rows: 1

   * - Command
     - Description
   * - ``tcpdump -n -e -ttt -r /var/log/pflog``
     - Read pflog file
   * - ``tcpdump -n -e -ttt -i pflog0``
     - Monitor pflog in real-time
   * - ``tcpdump -n -e -ttt -i pflog0 host 192.168.1.1``
     - Monitor pflog for specific host


Storage and File Sharing CLI Commands
--------------------------------------

.. note::
   For comprehensive storage system administration, refer to the respective official documentation for each technology.

MooseFS Commands
~~~~~~~~~~~~~~~~~

MooseFS Master Server
^^^^^^^^^^^^^^^^^^^^^^

.. list-table::
   :widths: 70 30
   :header-rows: 1

   * - Command
     - Description
   * - ``mfsmaster``
     - Start MooseFS master server
   * - ``mfsmaster stop``
     - Stop MooseFS master server
   * - ``mfsmaster restart``
     - Restart MooseFS master server
   * - ``mfsmaster reload``
     - Reload MooseFS master configuration
   * - ``mfsmaster test``
     - Test MooseFS master configuration
  

MooseFS Chunk Server
^^^^^^^^^^^^^^^^^^^^^

.. list-table::
   :widths: 70 30
   :header-rows: 1

   * - Command
     - Description
   * - ``mfschunkserver start``
     - Start MooseFS chunk server
   * - ``mfschunkserver stop``
     - Stop MooseFS chunk server
   * - ``mfschunkserver restart``
     - Restart MooseFS chunk server
   * - ``mfschunkserver reload``
     - Reload chunk server configuration

MooseFS Client Tools
^^^^^^^^^^^^^^^^^^^^^

.. list-table::
   :widths: 70 30
   :header-rows: 1

   * - Command
     - Description
   * - ``mfsmount /mnt/mfs -H mfsmaster``
     - Mount MooseFS filesystem
   * - ``mfsgetgoal /path/to/file``
     - Show file replication goal
   * - ``mfssetgoal 3 /path/to/file``
     - Set file replication goal to 3
   * - ``mfsgettrashtime /path/to/file``
     - Show file trash time
   * - ``mfssettrashtime 86400 /path/to/file``
     - Set trash time to 24 hours
   * - ``mfscheckfile /path/to/file``
     - Check file chunks
   * - ``mfsfileinfo /path/to/file``
     - Show detailed file information
   * - ``mfsdirinfo /path/to/directory``
     - Show directory information
   * - ``mfsfilepaths /path/to/file``
     - Show file chunk locations


NFS Commands
~~~~~~~~~~~~

NFS Server Management
^^^^^^^^^^^^^^^^^^^^^

.. list-table::
   :widths: 70 30
   :header-rows: 1

   * - Command
     - Description
   * - ``service nfsd start``
     - Start NFS daemon
   * - ``service nfsd stop``
     - Stop NFS daemon
   * - ``service mountd start``
     - Start mount daemon
   * - ``service rpcbind start``
     - Start RPC bind daemon (required)
   * - ``kill -HUP $(cat /var/run/mountd.pid)``
     - Re-read /etc/exports file
   * - ``showmount -e localhost``
     - Show exports on local server
   * - ``showmount -a``
     - Show all active mounts
   * - ``nfsstat -s``
     - Show NFS server statistics

NFS Client Management
^^^^^^^^^^^^^^^^^^^^^

.. list-table::
   :widths: 70 30
   :header-rows: 1

   * - Command
     - Description
   * - ``mount -t nfs server:/path/to/share /mnt/nfs``
     - Mount NFS share
   * - ``mount -t nfs -o nfsv4 server:/path /mnt/nfs4``
     - Mount NFSv4 share
   * - ``umount /mnt/nfs``
     - Unmount NFS share
   * - ``showmount -e nfs-server``
     - Show available exports on server
   * - ``nfsstat -c``
     - Show NFS client statistics
   * - ``rpcinfo -p nfs-server``
     - Show RPC services on server


SeaweedFS Commands
~~~~~~~~~~~~~~~~~~~

SeaweedFS Master
^^^^^^^^^^^^^^^^^

.. list-table::
   :widths: 70 30
   :header-rows: 1

   * - Command
     - Description
   * - ``weed master -port=9333``
     - Start SeaweedFS master server
   * - ``weed master -mdir=/tmp/mdata``
     - Start master with custom data directory
   * - ``weed master -peers=master1:9333,master2:9333``
     - Start master with peers for HA

SeaweedFS Volume Server
^^^^^^^^^^^^^^^^^^^^^^^

.. list-table::
   :widths: 70 30
   :header-rows: 1

   * - Command
     - Description
   * - ``weed volume -port=8080 -dir=/tmp/vol``
     - Start volume server
   * - ``weed volume -mserver=localhost:9333``
     - Start volume server with custom master
   * - ``weed volume -max=5 -dir=/tmp/vol``
     - Start volume server with max 5 volumes

SeaweedFS Client Operations
^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. list-table::
   :widths: 70 30
   :header-rows: 1

   * - Command
     - Description
   * - ``weed upload -server=localhost:9333 file.txt``
     - Upload file to SeaweedFS
   * - ``weed download -server=localhost:9333 3,01637037d6``
     - Download file by file ID
   * - ``weed mount -filer=localhost:8888 /mnt/seaweed``
     - Mount SeaweedFS as filesystem
   * - ``weed filer -master=localhost:9333``
     - Start filer server
   * - ``weed s3 -filer=localhost:8888``
     - Start S3 API gateway


iSCSI Commands
~~~~~~~~~~~~~~~

iSCSI Target Management
^^^^^^^^^^^^^^^^^^^^^^^

.. list-table::
   :widths: 70 30
   :header-rows: 1

   * - Command
     - Description
   * - ``ctladm devlist``
     - List iSCSI devices
   * - ``ctladm create -b block -o file=/path/to/disk.img``
     - Create iSCSI target from file
   * - ``ctladm remove -b block -l 0``
     - Remove iSCSI target
   * - ``ctladm port -l``
     - List iSCSI ports
   * - ``ctladm lunlist``
     - List LUNs
   * - ``service ctld start``
     - Start iSCSI target daemon
   * - ``service ctld stop``
     - Stop iSCSI target daemon

iSCSI Initiator Management
^^^^^^^^^^^^^^^^^^^^^^^^^^

.. list-table::
   :widths: 70 30
   :header-rows: 1

   * - Command
     - Description
   * - ``iscontrol -d -t target-name -p target-portal``
     - Discover iSCSI targets
   * - ``iscsictl -A -t target-name -p portal-address``
     - Add iSCSI target
   * - ``iscsictl -R -t target-name``
     - Remove iSCSI target
   * - ``iscsictl -L``
     - List configured targets
   * - ``camcontrol devlist``
     - List SCSI devices (including iSCSI)
   * - ``service iscsid start``
     - Start iSCSI initiator daemon

SMB/CIFS Commands
~~~~~~~~~~~~~~~~~

Samba Server Management
^^^^^^^^^^^^^^^^^^^^^^^

.. list-table::
   :widths: 70 30
   :header-rows: 1

   * - Command
     - Description
   * - ``service samba_server start``
     - Start Samba server
   * - ``service samba_server stop``
     - Stop Samba server
   * - ``testparm``
     - Test Samba configuration
   * - ``testparm -s``
     - Show Samba configuration summary
   * - ``smbclient -L //server -U username``
     - List shares on server
   * - ``smbpasswd -a username``
     - Add Samba user
   * - ``smbstatus``
     - Show Samba server status
   * - ``smbcontrol all reload-config``
     - Reload Samba configuration

Samba Client Operations
^^^^^^^^^^^^^^^^^^^^^^^

.. list-table::
   :widths: 70 30
   :header-rows: 1

   * - Command
     - Description
   * - ``mount -t cifs //server/share /mnt/smb -o username=user``
     - Mount SMB share
   * - ``smbclient //server/share -U username``
     - Connect to SMB share interactively
   * - ``smbget -R smb://server/share``
     - Download files recursively
   * - ``umount /mnt/smb``
     - Unmount SMB share
   * - ``smbcacls //server/share filename``
     - Show ACLs for file

S3 Commands
~~~~~~~~~~~

AWS CLI Commands
^^^^^^^^^^^^^^^^

.. list-table::
   :widths: 70 30
   :header-rows: 1

   * - Command
     - Description
   * - ``aws s3 ls``
     - List S3 buckets
   * - ``aws s3 ls s3://bucket-name``
     - List objects in bucket
   * - ``aws s3 cp file.txt s3://bucket/file.txt``
     - Upload file to S3
   * - ``aws s3 cp s3://bucket/file.txt file.txt``
     - Download file from S3
   * - ``aws s3 sync /local/path s3://bucket/path``
     - Sync local directory to S3
   * - ``aws s3 mb s3://new-bucket``
     - Create new bucket
   * - ``aws s3 rb s3://bucket-name``
     - Delete empty bucket
   * - ``aws s3 rm s3://bucket/file.txt``
     - Delete file from S3


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
   
   .. code-block:: text
   
      Content-Type: application/json

   Prepare JSON body with login credentials:
   
   .. code-block:: json
   
      {
        "username": "your_username",
        "password": "your_password"
      }

   .. figure:: _static/images/user-guide/Image_137.png
      :width: 600      

3. **Retrieve Access Token**

   - Send the login request
   - The response will contain an access token
   - Copy the access token from the response body

   .. figure:: _static/images/user-guide/Image_138.png
      :width: 600    

4. **Prepare API Request in Postman**

   - Create a new request for your desired API endpoint
   - Go to the "Authorization" tab
   - Select "Bearer Token" as the authorization type
   - Paste the copied access token in the token field

   .. figure:: _static/images/user-guide/Image_139.png
      :width: 600    

5. **Configure API Request**

   - Set the appropriate HTTP method (GET, POST, PUT, DELETE)
   - Enter the complete API endpoint URL
   - Add any required headers
   - Prepare request body if needed (for POST/PUT requests)

   .. figure:: _static/images/user-guide/Image_140.png
      :width: 600    

6. **Send the Request**

   - Click "Send" to execute the API call
   - Review the response status and body

   .. figure:: _static/images/user-guide/Image_141.png
      :width: 600    

Swagger API Documentation Guide
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

**Overview**

The Karios platform provides a comprehensive RESTful API interface accessible through Swagger UI, enabling developers and administrators to interact with all platform features programmatically.

**Step-by-Step API Access Guide**

**Step 1: Access Swagger Endpoint**

The Swagger UI provides an interactive interface for exploring and testing the Karios API.

Navigate to Swagger Interface:

.. code-block:: text

   http://192.168.116.132:8080/swagger/index.html

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

   .. figure:: _static/images/user-guide/Image_142.png
      :width: 600       

2. **Execute the Login Request**

   - Click "Try it out" button on the login endpoint
   - Enter Request Body with your credentials:

   .. figure:: _static/images/user-guide/Image_143.png
      :width: 600   

   .. code-block:: json

      {
        "username": "admin",
        "password": "admin"
      }

   - Click "Execute" to send the login request
   
   .. figure:: _static/images/user-guide/Image_144.png
      :width: 600     

   - Review the Response in the response section

   .. figure:: _static/images/user-guide/Image_145.png
      :width: 600   

**Step 3: Configure Bearer Token Authorization**

1. **Locate the Authorization Section**

   - Find the "Authorize" button at the top of the Swagger interface
   - Click the "Authorize" button to open the authorization dialog

   .. figure:: _static/images/user-guide/Image_146.png
      :width: 600   

2. **Configure Bearer Token Authentication**

   - Select "Bearer Auth" section
   - Enter the Bearer Token:

   .. figure:: _static/images/user-guide/Image_147.png
      :width: 600   

   .. code-block:: text

      Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...

   - Click "Authorize" to save the configuration

   .. figure:: _static/images/user-guide/Image_148.png
    :width: 600   

   .. figure:: _static/images/user-guide/Image_149.png
      :width: 600   


**Step 4: Test API Endpoints**

With authentication configured, you can now test all available API endpoints:

1. **Select an Endpoint**: Choose the desired API endpoint from the list
2. **Review Endpoint Information**: HTTP Method, URL Path, Parameters, Request Body, Response Codes
3. **Click "Try it out"**: This enables the interactive testing interface

   .. figure:: _static/images/user-guide/Image_151.png
      :width: 600   


4. **Configure Request Parameters**: Fill in required path variables, query parameters, request body


5. **Execute the Request**: Click the "Execute" button

   .. figure:: _static/images/user-guide/Image_152.png
      :width: 600   

   .. figure:: _static/images/user-guide/Image_153.png
      :width: 600   

**Best Practices**

- Always use HTTPS for API calls
- Keep access tokens confidential
- Refresh tokens as per the system's security policy
- Handle authentication errors gracefully
- Validate response status codes

Response Information
~~~~~~~~~~~~~~~~~~~~

- **Response Code**: HTTP status code (e.g., 200, 201, 400, 401, 404, 500)
- **Response Body**: JSON response data returned by the server
- **Response Headers**: HTTP headers included in the response
- **Request URL**: The actual URL that was called
- **Request Duration**: Time taken to complete the request

Common Response Codes
~~~~~~~~~~~~~~~~~~~~~

- **200 OK**: Request successful
- **201 Created**: Resource created successfully
- **400 Bad Request**: Invalid request format
- **401 Unauthorized**: Authentication required or token expired
- **403 Forbidden**: Insufficient permissions
- **404 Not Found**: Resource not found
- **500 Internal Server Error**: Server error


