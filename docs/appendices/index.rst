Appendices
==========

Common Installation Issues
~~~~~~~~~~~~~~~~~~~~~~~~~~

If you encounter problems during installation:

**Hardware Compatibility**
   Verify that your hardware meets all requirements and is on the compatibility list.

**Installation Media**
   Ensure installation media is not corrupted by verifying checksums and creating fresh installation media if necessary.

**Network Configuration**
   Check network settings, connectivity, and DNS resolution during the bootstrap phase.

**Storage Issues**
   Verify storage hardware is properly connected, functional, and has sufficient capacity.

**Access and Permissions Issues**
   Review privilege escalation settings, user permissions, and script execution policies.


Obtaining UI Password from the CLI
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

1. **SSH Access to Node**

   Access your node via command line using SSH:

   .. code-block:: bash

      ssh root@192.168.xxx.xxx

   Password: ``your-root-password``

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

**Access Considerations**

- **Principle of Least Privilege**: Request only the minimum permissions necessary for job functions
- **Regular Access Review**: Periodically review and validate user access permissions
- **Policy Compliance**: Follow organizational access policies for account management
- **Administrative Coordination**: Coordinate with system administrators 