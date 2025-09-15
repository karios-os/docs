Kubernetes on Karios
====================

Introduction
------------

Kubernetes infrastructure doesn't have to be painful. Traditional approaches to spinning up clusters, managing complex dashboards, and debugging failures can feel like solving a puzzle with missing pieces. Karios transforms this experience by making Kubernetes infrastructure modular, swappable, and refreshingly simple.

Built like a stack of building blocks on the robust FreeBSD foundation, Karios lets you define your requirements, ship your configuration, and you're done. Need to spin up a new Kubernetes cluster? The process becomes straightforward and repeatable. Adding specialized workloads like GPU-intensive applications? Simply select the appropriate node type and assign it instantly.

The FreeBSD foundation provides significant performance advantages, delivering faster throughput for critical network and storage operations that are essential for modern Kubernetes workloads. This performance edge becomes particularly important in high-throughput scenarios and data-intensive applications.

Karios supports any version of Kubernetes with both virtual machine and bare metal worker deployments. The platform's intelligent filtering model enables you to select hypervisor nodes based on specific criteria—whether you need to optimize for power efficiency, cost, performance, or GPU capabilities. You can even mix different hardware types within the same cluster without compatibility issues or downtime.

One of the most compelling advantages is Karios' ability to easily deploy single-node Kubernetes clusters at the edge. This capability proves invaluable for remote datacenter scenarios where you need Kubernetes orchestration capabilities but have limited infrastructure resources. Instead of complex multi-node deployments, you can quickly establish lightweight Kubernetes clusters that serve your edge computing requirements with minimal overhead.

Whether you're deploying enterprise-scale multi-node clusters or lightweight edge installations, Karios eliminates the traditional pain points of Kubernetes infrastructure management, making virtualized infrastructure a stackable, manageable experience.

Sidero Kubernetes
-----------------

Sidero is a bare-metal provisioning system designed specifically for Kubernetes clusters. Built on Talos Linux, Sidero provides a GitOps-driven approach to managing bare-metal Kubernetes infrastructure with enterprise-grade security and immutable operating system principles.

**Key Features:**

* Immutable infrastructure with Talos Linux
* GitOps-based cluster lifecycle management
* Secure by default with no SSH access required
* Automated bare-metal provisioning
* Integration with Cluster API for declarative cluster management

**Overview:**

Sidero simplifies the complexity of bare-metal Kubernetes deployments by providing automated discovery, provisioning, and lifecycle management of physical servers. The platform uses a control plane approach where a management cluster orchestrates the deployment and management of workload clusters across your bare-metal infrastructure.

1. OmniServer Deployment Steps
------------------------------

**Step 1.1: Creating OmniServer VM**

- Click on the **Setup Kubernetes** button in the Karios UI.

.. image:: _static/images/omni/om-1.png
   :alt: Setup Kubernetes Button


**Step 1.2: Setup Keycloak**

- Click on the **Keycloak** button in the UI.

.. image:: _static/images/omni/om-2.png
   :alt: Setup Keycloak Button

- This creates a **Keycloak instance** in a FreeBSD jail.  
- Wait for the Keycloak jail to be created.

.. note::
   Keycloak is an open-source identity and access management solution.  
   It provides single sign-on (SSO), user federation, identity brokering, and social login.  
   In Sidero, Keycloak manages authentication and authorization for Kubernetes clusters.

   Default credentials:  
   - **Master realm** → ``admin / adminadmin``  
   - **Omni realm** → ``user@karios.ai / Omni12345``

.. image:: _static/images/omni/om-3.png
   :alt: Keycloak Setup Complete


**Step 1.3: Upload TLS Certificate and Key**

- Click on the **Upload Certificates** button in the UI.

.. image:: _static/images/omni/om-4.png
   :alt: Upload Certificates Button

- Upload the **wildcard TLS certificate and key** for your domain.

.. note::
   The TLS certificate secures communication between Sidero components and the Kubernetes clusters.  
   Use a **wildcard certificate** to cover all subdomains. and also combine the ca bundle and the certificate in one file.

.. image:: _static/images/omni/om-5.png
   :alt: TLS Certificate Upload


**Step 1.4: Create OmniServer VM**

- Click on the **Setup Omni Server** button in the UI.  
- Enter OmniServer VM details (username and password).  
- Attach an **Ubuntu cloud image (.img)**.

.. note::
   The Ubuntu image must already be uploaded to the **Control Center** in the Karios UI.

.. image:: _static/images/omni/om-6.png
   :alt: Setup Omni Server Button

- Select server, storage, and network switch.  
- Enter VM specs (**CPU, memory, disk**) and click **Save**.

.. image:: _static/images/omni/om-7.png
   :alt: OmniServer VM Config


**Step 1.5: Access the OmniServer Dashboard**

- Once created, access the OmniServer dashboard at:

  ``https://omni.<basedomain>``

- You will be redirected to the Keycloak login page for the **omni realm**.

.. note::
   Use credentials: ``user@karios.ai / Omni12345``

.. image:: _static/images/omni/om-9.png
   :alt: Omni Dashboard
.. image:: _static/images/omni/om-10.png
   :alt: Keycloak Login

- After login, you will be redirected to the **OmniServer Dashboard**.


2. Cluster Installation Steps
-----------------------------

**Step 2.1: Download the ISO**

- In the OmniServer dashboard, click **Download ISO**.  
- Select ISO type, Talos version, and click **Generate ISO**.

.. note::
   For this demo, use ISO type: ``amd64-iso``.

.. image:: _static/images/omni/omd-1.png
   :alt: Generate ISO

.. image:: _static/images/omni/omd-2.png
   :alt: Generate ISO

**Step 2.2: Upload the ISO in Karios UI**

- In the Karios UI → **Control Center → ISO tab**.  
- Click **Choose File**, select the ISO, then **Upload**.

.. note::
   Refer the Upload ISO section in the Karios documentation for detailed steps.
   The uploaded ISO will appear under **Available ISO's**.



**Step 2.3: Create Cluster Machines in Karios UI**

- Click on **Setup Kubernetes**.  
- Enter cluster details and select the uploaded ISO.

.. note::
   Use prefix ``om`` in the cluster name to identify Omni clusters.

.. image:: _static/images/omni/om-12.png
   :alt: Cluster Details

- Select server, storage pool, and network switch.  
- Enter VM specs and click **Update**.  
- Use the "+" button to add multiple VMs.  
- Click on **Omni VMs** to create the machines.
- After creation start all the vms from the Karios UI.

.. image:: _static/images/omni/om-13.png
   :alt: Add VM Config
.. image:: _static/images/omni/om-14.png
   :alt: Omni VM Creation

.. image:: _static/images/omni/omd-3.png
   :alt: Omni VM Creation

**Step 2.4: VM Discovery in OmniServer Dashboard**

- Power on the VMs.  
- They will appear under the **Machines** tab in the dashboard.

.. image:: _static/images/omni/om-15.png
   :alt: Machines Tab


**Step 2.5: Create the Cluster in OmniServer Dashboard**

- Go to the **Clusters** tab → **Create Cluster**.  
- Enter cluster name, select Talos version, pool configuration.  
- Assign roles to machines: **CP0 (control plane)**, **W0 (worker)**.

.. note::
   Minimum requirements:  
   - 1 control plane node (CP0)  
   - 1 worker node (W0)

.. image:: _static/images/omni/om-16.png
   :alt: Create Cluster Button
.. image:: _static/images/omni/om-17.png
   :alt: Cluster Role Assignment
.. image:: _static/images/omni/om-18.png
   :alt: Cluster Role Assignment

**Step 2.6: Monitor Cluster Installation**

- In the **Clusters** tab, click on the cluster name.  
- View details and monitor installation progress.

.. image:: _static/images/omni/om-19.png
   :alt: Cluster Installation Progress

- Once installation completes, status of the cluster changes to **Ready** and nodes show **Running** status.


.. note::
   The installation process may take several minutes.  
   and might have to reboot the vms manually from the Karios UI if they are stuck in provisioning state.

- you can download the kubeconfig file from the OmniServer dashboard to access the Kubernetes cluster.

.. image:: _static/images/omni/om-20.png
   :alt: Cluster Ready





OpenShift on Karios
-------------------

Red Hat OpenShift is an enterprise Kubernetes platform that provides developer and operational tooling on top of Kubernetes. OpenShift adds enhanced security, monitoring, logging, and developer experience features while maintaining full Kubernetes API compatibility.

**Key Features:**

* Enterprise-grade security and compliance
* Integrated developer tools and workflows
* Built-in monitoring and logging stack
* Web console and CLI management tools
* Support for hybrid and multi-cloud deployments



1. Creating the OpenShift Cluster
-----------------------------------------

**Step 1.1: Creating the cluster machine in Karios UI**

- Click on the **Setup Kubernetes** button in the Karios UI.

.. image:: _static/images/UbuntuKubernetes/ubuntu-1.png
   :alt: Setup Kubernetes Button


.. image:: _static/images/openshift/op-2.png
   :alt: Setup Kubernetes Button


**Step 1.2: Enter the Cluster Details**

- **Cluster name**: Enter a DNS-compliant name (e.g., ``op-test``).

.. note::
   The ``op`` prefix is added to make the cluster name unique. ``op`` defines openshift.



.. image:: _static/images/openshift/op-3.png
   :alt: Attach Ubuntu Image

**Step 1.2: Add Control Plane Nodes**

- Click on **Add Control Plane**.

.. image:: _static/images/openshift/op-4.png
   :alt: Control Plane Config

- Select the server and VM specs (CPU, memory, disk).

.. note::
   Minimum requirements:  
   - 4 vCPUs  
   - 4 GB memory  
   - 80 GB disk space  

   Recommended: **3 control plane nodes** for high availability.  
   Control plane nodes must be **odd in number** to avoid split-brain issues.


.. image:: _static/images/openshift/op-5.png
   :alt: Control Plane Config

- Click **Save** to confirm configuration.  
- Use the "+" button to add more nodes.

.. image::  _static/images/openshift/op-6.png
   :alt: Control Plane Config

**Step 1.3: Add Worker Nodes**

- Click on **Add Worker Node**.  

.. image:: _static/images/openshift/op-7.png
   :alt: Control Plane Config

- Select server and VM specs.

.. note::
   Minimum requirements:  
   - 4 vCPUs  
   - 4 GB memory  
   - 80 GB disk space  

.. image:: _static/images/openshift/op-8.png
   :alt: Control Plane Config

.. note::
   Recommended: At least **1 worker node**.  
   The number of worker nodes can be even or odd, depending on requirements.

- Click **Save**.  
- Use the "+" button to add more worker nodes.

**Step 1.4: Add Haproxies**
During the cluster configuration process, you will see an option for **HAProxy Setup**.

.. image:: _static/images/openshift/op-9.png
   :alt: HAProxy Setup in Karios

- **Setup HAProxy (checkbox)**:  
  Selecting this option will enable HAProxy for your cluster.  

.. note::
   Enabling HAProxy will create **two HAProxy instances** in FreeBSD jails.  
   These are required for **OpenShift cluster creation** and are used to handle load balancing between the control plane nodes in a high availability (HA) configuration.

- If you want to proceed with a highly available deployment, ensure this box is **checked**.
- If HAProxy is not needed (for example, in test or single-node setups), you may leave it unchecked.

Once the configuration is complete, click on **Create OpenShift Cluster** to finalize the deployment.



**Overview:**

OpenShift on Karios combines the operational simplicity of Karios infrastructure management with the comprehensive platform capabilities of OpenShift. This combination provides organizations with a powerful foundation for containerized application development and deployment, offering both the flexibility of Kubernetes and the operational maturity expected in enterprise environments.

The platform includes integrated CI/CD capabilities, service mesh options, and comprehensive security policies that help organizations adopt cloud-native practices while maintaining governance and compliance requirements.

OpenShift without DHCP
~~~~~~~~~~~~~~~~~~~~~~~

For enterprise environments requiring static networking and full control over network configuration, OpenShift can be deployed on Karios using static IP addressing instead of DHCP. This approach provides enhanced security, predictable networking, and integration with existing enterprise network infrastructure.

Prerequisites
^^^^^^^^^^^^^

Before beginning the installation, ensure you have:

* Valid Red Hat account with OpenShift subscription
* Karios infrastructure with designated nodes for OpenShift deployment
* Static IP address plan including DNS, gateway, and subnet configuration
* SSH public key for cluster access and troubleshooting

Step 1: Navigate to Red Hat Console
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

First, you'll need to access the Red Hat OpenShift console to begin the installation process.

**Action:** Navigate to https://console.redhat.com/openshift/create/datacenter

Step 2: Authentication
^^^^^^^^^^^^^^^^^^^^^^

You'll need to authenticate with your Red Hat credentials to proceed.

**Action:** Login with your **Red Hat credentials**

.. warning::
   Make sure you have a valid Red Hat account with the necessary permissions to create OpenShift clusters.

Step 3: Platform Selection
^^^^^^^^^^^^^^^^^^^^^^^^^^

Choose the appropriate platform architecture for your Karios installation.

**Action:** Select **"Platform agnostic (x86_64)"**

This option provides the flexibility needed for Karios deployments across different infrastructure environments.

.. image:: _static/images/openshift/Redhat-4.png
   :alt: Platform Agnostic Selection

Step 4: Installation Method
^^^^^^^^^^^^^^^^^^^^^^^^^^^

Choose your preferred installation method for the OpenShift cluster.

**Action:** Select **"Interactive"**

The interactive installation method provides a guided setup process that's perfect for getting started with OpenShift on Karios.

.. image:: _static/images/openshift/Redhat-5.png
   :alt: Interactive Installation Selection

Step 5: Configure Cluster Details
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

You'll now see the "Install OpenShift with the Assisted Installer" form. Fill out the cluster details section:

**Required Configuration:**

* **Cluster name**: Enter a DNS-compliant name (e.g., "op-test1")
* **Base domain**: Enter your domain (e.g., "karios.ai")
* **OpenShift version**: Select appropriate version (e.g., OpenShift 4.19.6)
* **CPU architecture**: Keep as x86_64

.. image:: _static/images/openshift/Redhat-6.png
   :alt: Cluster Details Configuration

.. important::
   The cluster name must follow DNS naming requirements. See the `DNS requirements documentation <https://docs.redhat.com/en/documentation/openshift_container_platform/4.19/html/installing_an_on-premise_cluster_with_the_agent-based_installer/preparing-to-install-with-agent-based-installer#agent-install-dns-none_preparing-to-install-with-agent-based-installer>`_ for detailed guidelines.

Step 6: Configure Additional Settings
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Continue configuring the cluster with these important settings:

**Platform Integration:**

* Keep **"No platform integration"** selected

**Control Plane Configuration:**

* Number of control plane nodes: **"3 (highly available cluster)"**


**Network Configuration:**

* Hosts' network configuration: Select **"Static IP, bridges, and bonds"**


.. image:: _static/images/openshift/Redhat-7.png
   :alt: Additional Cluster Settings

**Optional Settings:**

* Leave "Edit pull secret" unchecked (unless you need custom registries)
* Leave "Include custom manifests" unchecked (unless you need advanced configuration)
* Disk encryption toggles can be left as default (off) or enabled based on security requirements




Step 7: Proceed to Network Configuration
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

After configuring all the cluster details:

**Action:** Click the **"Next"** button to proceed to Static network configurations

This will take you to the next phase where you'll configure the specific network settings for your Karios infrastructure.

Step 8: Configure Static Network Settings
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

You'll now see the "Static network configurations" page. Configure the network settings as follows:

**Configuration Method:**

* Keep **"Form view"** selected (recommended for basic configurations)
* Note: YAML view is available for advanced configurations if needed


.. image:: _static/images/openshift/Redhat-8.png
   :alt: Static Network Configuration

**Network-wide Configurations:**

* **Networking stack type**: Select "IPv4" (recommended)
* **Use VLAN**: Leave unchecked (unless your network requires VLAN tagging)

**DNS Configuration:**

* **DNS**: Enter your DNS server IP (e.g., "192.168.116.240")

**IPv4 Network Settings:**


.. image:: _static/images/openshift/Redhat-9.png
   :alt: IPv4 Network Settings

* **Subnet**: Configure your network range (e.g., "192.168.116.0 / 24")
* This will show the available IP range (192.168.116.0 - 192.168.116.255)
* **Default gateway**: Enter your gateway IP (e.g., "192.168.116.253")

.. note::
   Ensure your DNS server, subnet, and gateway addresses are correctly configured for your Karios infrastructure. These settings will be applied to all cluster nodes during host discovery.

Step 9: Configure Host-Specific Network Settings
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Now configure the MAC to IP mapping for each host in your cluster. You'll see the "Host specific configurations" section:

**MAC to IP Mapping Configuration:**

For each host (Host 1, Host 2, Host 3, Host 4), configure the MAC address to IP address mapping:

* **Host 1**: MAC 58:9c:fc:01:72:82 → IP 192.168.116.60
* **Host 2**: MAC 58:9c:fc:0e:32:8b → IP 192.168.116.61
* **Host 3**: MAC 58:9c:fc:06:38:a0 → IP 192.168.116.62
* **Host 4**: MAC 58:9c:fc:0c:b0:e1 → IP 192.168.116.63

.. image:: _static/images/openshift/op-10.png
   :alt: Host Specific Network Configuration


**How to Configure:**

* Click on each host to expand its configuration options
* Enter the MAC address of each Karios node
* Assign a static IP address within your configured subnet range
* Ensure IP addresses don't conflict with your gateway or DNS server

.. important::
   After making network configuration changes, you'll need to regenerate the Discovery ISO in the 'Host discovery' step for new hosts to use these configurations.

Step 10: Complete Network Configuration
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

After configuring all host-specific network mappings:

**Action:** Click the **"Next"** button to proceed to the Operators selection

This will advance you to the next phase where you can select additional OpenShift operators for your cluster.

Step 11: Select OpenShift Operators
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

You'll now see the "Operators" selection page where you can choose additional OpenShift operators to install with your cluster:

**Available Operator Bundles:**

* **Virtualization**: Run virtual machines alongside containers on one platform
* **OpenShift AI**: Train, serve, monitor and manage AI/ML models and applications using GPUs

**Single Operators:**

* Expandable section showing 22 individual operators available
* Currently showing "0 selected" - choose operators based on your requirements

**Selection Options:**

* Check the boxes for any operators you want to install
* Use the search bar to find specific operators
* Note preview status (Technology Preview, Developer Preview) for some operators
* You can expand "Single Operators" to see the full list of 22 available operators

**Common Operators for Karios Deployments:**

* Select operators based on your specific use case requirements
* Consider storage, monitoring, and networking operators as needed
* Operators can also be installed after cluster deployment if needed

.. note::
   Choose only the operators you need for your initial deployment. Additional operators can be installed later through the OpenShift console or OperatorHub.

.. image:: _static/images/openshift/op-11.png
   :alt: Host Specific Network Configuration

Step 12: Continue to Host Discovery
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

After selecting your desired operators:

**Action:** Click the **"Next"** button to proceed to Host discovery

This will take you to the host discovery phase where you'll generate the Discovery ISO and configure your Karios nodes for the cluster.

Step 13: Generate Discovery ISO
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

You'll now see the "Add hosts" dialog for generating the Discovery ISO. This ISO will be used to boot your Karios nodes and register them with the cluster:

**Provisioning Type:**

* Keep **"Full image file - Download a self-contained ISO"** selected

**SSH Public Key Configuration:**

* Paste your SSH public key into the text field
* This allows you to SSH into the nodes during installation and troubleshooting
* Example shown: A typical RSA public key starting with "ssh-rsa" and ending with "openshift@bastion.karios.ai"

**Optional Settings:**

* **Show proxy settings**: Check if your hosts are behind a firewall requiring proxy configuration
* **Configure cluster-wide trusted certificates**: Check if your cluster needs to trust additional certificates (e.g., for container registries)

**Generate the ISO:**

* After configuring all settings, click **"Generate Discovery ISO"**
* The system will create a custom ISO with your network configurations and SSH key

.. warning::
   Make sure to add your SSH public key before generating the ISO. This is essential for accessing and troubleshooting your Karios nodes during the installation process.

.. image:: _static/images/openshift/op-12.png
   :alt: Generate Discovery ISO

Step 14: Download Discovery ISO
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

After generating the Discovery ISO, you'll need to download it to deploy on your Karios nodes:

**Download Options:**

* **Direct Download**: Click the download button to get the ISO file directly
* **wget Command**: Copy the provided wget command for automated downloads
* The wget link allows you to download the ISO directly to your Karios nodes or management system

**Using the wget Command:**

* Copy the full wget command provided in the interface
* Run it on your target system to download the Discovery ISO
* This is particularly useful for automated deployments or remote systems

.. tip::
   Once you have the Discovery ISO, you can boot your Karios nodes from it. The nodes will automatically register with the cluster and appear in the Host discovery interface for further configuration
   
.. image:: _static/images/openshift/op-13.png
   :alt: Download Discovery ISO

Step 15: Download ISO in Karios UI
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Now switch to your Karios management interface to download the Discovery ISO to your infrastructure:

**Navigate to ISO Management:**

* In the Karios UI, go to the **"ISO"** tab in your Control Center
* You'll see the "Download" and "Upload ISO" sections

**Download the Discovery ISO:**

* In the **"Download"** section, paste the wget URL you copied from the Red Hat console
* Example format: "3GNZPDjmZfNDG3xf_jGK8zLBjlqglvvqfYAY/4.19/x86_64/full.iso"
* Click the **"Download"** button to fetch the ISO

**Verify Available ISOs:**

* After download, the Discovery ISO will appear in the "Available ISO's" section
* You'll see it listed alongside other ISOs in your Karios environment
* The ISO will be available for mounting to your virtual machines or physical nodes

.. note::
   The Karios UI provides seamless ISO management, allowing you to download the OpenShift Discovery ISO directly to your infrastructure without manual file transfers.

Step 16: Deploy Discovery ISO to Nodes
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

With the Discovery ISO now available in Karios, you can deploy it to your cluster nodes:

**Mount ISO to Nodes:**

* Use the Karios interface to mount the Discovery ISO to your target nodes
* The ISO can be mounted to both virtual machines and physical systems
* Configure nodes to boot from the mounted ISO

**Node Boot Process:**

* Nodes will boot from the Discovery ISO with the pre-configured network settings
* The static IP configurations you set earlier will be automatically applied
* Nodes will register with the OpenShift cluster automatically

.. tip::
   Return to the Red Hat OpenShift console to monitor node discovery and continue with the remaining cluster configuration steps.

Step 17: Attach ISO to OpenShift Nodes
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Now attach the downloaded Discovery ISO to your designated OpenShift nodes and power them on:

**ISO Attachment Process:**

* In the Karios interface, navigate to your OpenShift nodes (the 4 nodes you configured earlier)
* For each node, attach the Discovery ISO from the "Available ISO's" list
* Ensure the ISO is set as the primary boot device
* Configure the boot order to prioritize CD/DVD/ISO boot

.. image:: _static/images/openshift/op-14.png
   :alt: Attach ISO to Nodes

.. image:: _static/images/openshift/op-15.png
   :alt: attach ISO to Nodes

.. image:: _static/images/openshift/Redhat-12.png
   :alt: attach ISO to Nodes

**Start the Machines:**

* **Power on all 4 OpenShift nodes** simultaneously or in sequence
* Nodes should correspond to your configured hosts:
  
  * Host 1: IP 192.168.116.60
  * Host 2: IP 192.168.116.61
  * Host 3: IP 192.168.116.62
  * Host 4: IP 192.168.116.63

* Monitor the boot process to ensure nodes boot from the Discovery ISO

**Expected Boot Behavior:**

* Nodes will boot into the Red Hat CoreOS Live environment
* Network configuration will be automatically applied based on MAC addresses
* Nodes will attempt to contact the OpenShift Assisted Installer service
* Discovery agents will register the nodes with your cluster

.. warning::
   Ensure the Discovery ISO is set as the primary boot device. The nodes need to boot from the ISO to join the OpenShift cluster discovery process.

Step 18: Wait for Node Discovery
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Return to the OpenShift console and monitor the Host discovery section. Your nodes should start appearing as they boot from the Discovery ISO:

**Expected Node Appearance:**

* Nodes will appear with hostnames like **"control1.upi.karios.ai.karios.ai"**
* Each node will show **"Auto-assign"** role initially
* Status will progress to **"Ready"** with green checkmarks
* Discovery timestamp will show when each node registered

**Node Details to Verify:**

* **CPU Count**: Should show 4 cores per node (as shown in example)
* **Memory**: 16.00 GiB per node (minimum requirement met)
* **Total Storage**: 130.08 GB available per node
* **Network Configuration**: Verify nodes are using your static IP assignments

**Host Inventory Management:**

* Use checkboxes to select nodes for bulk actions if needed
* Click on individual nodes to view detailed hardware information
* Monitor the "Discovered on" timestamps to track registration progress

**Wait for All Nodes:**

* Wait until all your expected nodes appear in the Host Inventory
* Ensure all nodes show **"Ready"** status
* Verify hardware requirements are met for all nodes
* Check the "Run workloads on control plane nodes" toggle if needed

.. note::
   If nodes don't appear, check the "Information & Troubleshooting" section for minimum hardware requirements and VM reboot configuration guidance.

.. image:: _static/images/openshift/Redhat-10.png
   :alt: Node Discovery

Step 19: Proceed to Storage Configuration
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Once all nodes are discovered and showing "Ready" status:

**Action:** Click the **"Next"** button to proceed to Storage configuration

This will take you to the storage configuration phase where you can set up persistent storage for your OpenShift cluster.

.. tip::
   Your Karios nodes have successfully registered with OpenShift and are ready for cluster deployment. The static network configuration is working correctly.

.. image:: _static/images/openshift/Redhat-11.png
   :alt: Storage Configuration

Step 20: Configure Networking Settings
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

After completing the Storage configuration, you'll reach the Networking section. Configure the network management settings for your cluster:

**Network Management Selection:**

* Select **"User-Managed Networking"** (this is crucial for load balancer configuration)
* Do NOT select "Cluster-Managed Networking" - this limits your flexibility

**Why User-Managed Networking:**

* Allows you to add custom load balancers after installation
* Provides full control over network configuration
* Essential for enterprise Karios deployments with external load balancing
* Enables integration with existing network infrastructure

.. image:: _static/images/openshift/Redhat-13a.png
   :alt: User-Managed Networking Selection

**Additional Network Configuration:**

* The system will reference your earlier static IP configuration
* DHCP or static IP addresses, Load balancers, Network ports, and DNS settings are managed externally
* **Use advanced networking**: Leave unchecked unless you need custom CIDR ranges

**SSH Key Configuration:**

* Keep **"Use the same host discovery SSH key"** checked
* This maintains consistent SSH access across the cluster

.. warning::
   User-Managed Networking is essential for Karios deployments where you plan to implement external load balancers or integrate with existing network infrastructure.

Step 21: Proceed to Review and Create
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

After configuring User-Managed Networking:

**Action:** Click the **"Next"** button to proceed to Review and create

This will take you to the final review phase where you can validate all configurations before starting the cluster installation.

Step 22: Complete OpenShift Installation
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

With all configurations complete, finalize your OpenShift installation:

* **Review and deploy** - Final review and cluster installation initiation
* **Installation monitoring** - Track cluster deployment progress
* **Post-installation configuration** - Add load balancers and additional services
* **Cluster validation** - Verify successful OpenShift deployment on Karios


.. image:: _static/images/openshift/Redhat-14.png
   :alt: User-Managed Networking Selection



**Congratulations!** You have successfully configured OpenShift installation on your Karios infrastructure with static networking, discovered nodes, and user-managed networking for flexible load balancer integration.

.. image:: _static/images/openshift/Redhat-17.png
   :alt: User-Managed Networking Selection

Configuration Summary
^^^^^^^^^^^^^^^^^^^^^

**Completed Configuration**
   You have successfully configured cluster details, static networking, operators, node discovery, and networking settings with user-managed networking for maximum flexibility.

**Key Benefits**
   User-managed networking allows you to implement custom load balancers, integrate with existing network infrastructure, and maintain full control over your Karios OpenShift deployment.

**Ready for Deployment**
   Your cluster is now configured and ready for final review and installation, with the flexibility to add external load balancers post-installation.

**Cluster Installation Steps:**

.. note::
   The above detailed steps provide comprehensive guidance for deploying OpenShift on Karios with static networking configuration, eliminating DHCP dependencies for enterprise environments.

Open Source Kubernetes on Ubuntu with Karios
---------------------------------------------

Open source Kubernetes provides the foundational container orchestration platform without vendor-specific additions. Running Kubernetes on Ubuntu through Karios gives you complete control over your cluster configuration while benefiting from Ubuntu's extensive package ecosystem and long-term support options.

**Key Features:**

* Pure upstream Kubernetes experience
* Full customization and configuration control
* Ubuntu LTS support and security updates
* Extensive community ecosystem and tooling
* Cost-effective solution for diverse workloads

**Overview:**

This deployment option offers maximum flexibility for organizations that want to build their Kubernetes infrastructure using open source components. By leveraging Ubuntu as the base operating system within Karios, you gain access to a mature Linux distribution with comprehensive hardware support and a rich ecosystem of tools and packages.

This approach is ideal for organizations that prefer to implement their own operational tooling around Kubernetes or have specific compliance requirements that benefit from a fully open source stack. The combination provides enterprise-ready infrastructure capabilities while maintaining complete transparency and control over the entire technology stack.

**Cluster Installation Steps:**

This guide provides the steps for deploying a **high availability Kubernetes cluster on Ubuntu** through **Karios**.

1. Creating the Ubuntu Kubernetes Cluster
-----------------------------------------

**Step 1.1: Creating the cluster machine in Karios UI**

- Click on the **Setup Kubernetes** button in the Karios UI.

.. image:: _static/images/UbuntuKubernetes/ubuntu-1.png
   :alt: Setup Kubernetes Button

**Step 1.2: Enter the Cluster Details**

- **Cluster name**: Enter a DNS-compliant name (e.g., ``ub-test1``).

.. note::
   The ``ub`` prefix is added to make the cluster name unique. ``ub`` defines Ubuntu.

- **Enter the username and password** for the cluster.

.. note::
   These credentials are used to SSH into the VMs.  
   Avoid using **root** or **admin** as the username.

- **Attach the image** to the cluster.

.. note::
   The image should be an **Ubuntu cloud image (.img)**.  
   The image must be uploaded to the Control Center in the Karios UI beforehand.

.. image:: _static/images/UbuntuKubernetes/ubuntu-2.png
   :alt: Attach Ubuntu Image

**Step 1.3: Add a Bootstrap Node**

- Click on the **Add Control Node** button.

.. image:: _static/images/UbuntuKubernetes/ubuntu-3.png
   :alt: Bootstrap Node Config

- Select the server to add the Kubernetes VM.
- Select the CPU, memory, and disk size.

.. note::
   Minimum requirements for the control node:  
   - 4 vCPUs  
   - 4 GB memory  
   - 80 GB disk space



- Optionally, choose additional tech stack components.

.. note::
   Supported tech stack includes:  
   - Prometheus & Grafana (for monitoring)  
   - ArgoCD (for GitOps)

.. note::
   - **Prometheus & Grafana**: Collect and visualize cluster metrics.  
   - **ArgoCD**: Manage the Kubernetes cluster via GitOps workflows.

- Click **Save** to confirm bootstrap node configuration.

.. image:: _static/images/UbuntuKubernetes/ubuntu3a.png
   :alt: Bootstrap Node Config


**Step 1.4: Add Control Plane Nodes**

- Click on **Add Control Plane**.

.. image:: _static/images/UbuntuKubernetes/ubuntu-4.png
   :alt: Control Plane Config

- Select the server and VM specs (CPU, memory, disk).

.. note::
   Minimum requirements:  
   - 4 vCPUs  
   - 4 GB memory  
   - 80 GB disk space  

   Recommended: **3 control plane nodes** for high availability.  
   Control plane nodes must be **odd in number** to avoid split-brain issues.


.. image:: _static/images/UbuntuKubernetes/ubuntu-5.png
   :alt: Control Plane Config

- Click **Save** to confirm configuration.  
- Use the "+" button to add more nodes.

.. image:: _static/images/UbuntuKubernetes/ubuntu-6.png
   :alt: Control Plane Config

**Step 1.5: Add Worker Nodes**

- Click on **Add Worker Node**.  

.. image:: _static/images/UbuntuKubernetes/ubuntu-7.png
   :alt: Control Plane Config

- Select server and VM specs.

.. note::
   Minimum requirements:  
   - 4 vCPUs  
   - 4 GB memory  
   - 80 GB disk space  

.. image:: _static/images/UbuntuKubernetes/ubuntu-8.png
   :alt: Control Plane Config

.. note::
   Recommended: At least **1 worker node**.  
   The number of worker nodes can be even or odd, depending on requirements.

- Click **Save**.  
- Use the "+" button to add more worker nodes.



2. SSH and Joining VMs to the Cluster
-------------------------------------

**Step 2.1: SSH into the Bootstrap Node**

.. code-block:: bash

   ssh <username>@<bootstrap-node-ip>

**Step 2.2: Check Cluster Status**

.. code-block:: bash

   sudo k8s status


**Step 2.3: Get Join Token for Control Nodes**

.. code-block:: bash

   sudo k8s get-join-token <vmname>


.. image:: _static/images/UbuntuKubernetes/ubuntu-9.png
   :alt: Kubernetes Status

**Step 2.4–2.6: Join Control Plane Nodes**

- SSH into each control plane node:

.. code-block:: bash

   ssh <username>@<control-plane-ip>

- Join to cluster:

.. code-block:: bash

   sudo k8s join-cluster --token <token>



.. image:: _static/images/UbuntuKubernetes/ubuntu-10.png
   :alt: Kubernetes Status

Repeat for all control plane nodes.

**Step 2.7: Get Join Token for Worker Nodes**

.. code-block:: bash

   sudo k8s get-join-token <vmname> --worker

.. image:: _static/images/UbuntuKubernetes/ubuntu-11.png
   :alt: Worker Join Token

**Step 2.8–2.9: Join Worker Nodes**

- SSH into each worker node:

.. code-block:: bash

   ssh <username>@<worker-node-ip>

- Join to cluster:

.. code-block:: bash

   sudo k8s join-cluster <token>

Repeat for all worker nodes.

**Step 2.10: Verify Cluster High Availability**

.. code-block:: bash

   sudo k8s status

.. image:: _static/images/UbuntuKubernetes/ubuntu-13.png
   :alt: HA Cluster Status


3. Accessing the Tech Stack
---------------------------

3.1 Prometheus and Grafana
~~~~~~~~~~~~~~~~~~~~~~~~~~

**Step 3.1.1: Verify Deployment**

.. code-block:: bash

   sudo k8s kubectl get pods -n observability
   sudo k8s kubectl get svc -n observability

.. image:: _static/images/UbuntuKubernetes/ubuntu-14.png
   :alt: HA Cluster Status


.. note::
   - Namespace: ``observability``  
   - Grafana runs on port ``30090``  
   - Prometheus runs on port ``30091``


**Step 3.1.2: Access Grafana Dashboard**

.. code-block:: none

   http://<node-ip>:30090
   http://<fqdn>:30090


**Step 3.1.3: Access Prometheus Dashboard**

.. code-block:: none

   http://<node-ip>:30091
   http://<fqdn>:30091


3.2 ArgoCD
~~~~~~~~~~

**Step 3.2.1: Verify Deployment**

.. code-block:: bash

   sudo k8s kubectl get pods -n argocd
   sudo k8s kubectl get svc -n argocd

.. image:: _static/images/UbuntuKubernetes/ubuntu-15.png
   :alt: Grafana Dashboard

.. note::
   - Namespace: ``argocd``  
   - Dashboard runs on port ``31800``

**Step 3.2.2: Access ArgoCD Dashboard**

.. code-block:: none

   http://<node-ip>:31800
   http://<fqdn>:31800

Next Steps
----------

After selecting and deploying your preferred Kubernetes distribution, consider the following operational aspects:

* **Monitoring and Observability**: Implement comprehensive monitoring solutions for both the Karios infrastructure and Kubernetes workloads
* **Backup and Disaster Recovery**: Establish backup procedures for both cluster state and persistent data
* **Security Hardening**: Apply security best practices specific to your chosen Kubernetes distribution
* **Day-2 Operations**: Plan for ongoing maintenance, updates, and scaling operations

For additional support and advanced configuration options, refer to the respective documentation for your chosen Kubernetes distribution and consult the Karios operational guides.
