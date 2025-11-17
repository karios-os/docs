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

.. note::

   Please setup the technitium DHCP and DNS server before proceeding with the Kubernetes installation.
   Refer to `Technitium DHCP and DNS Setup <https://docs.karios.ai/technitium/index.html>`_ documentation for detailed instructions.

Sidero Kubernetes Overview
--------------------------

Sidero is a bare-metal provisioning system designed specifically for Kubernetes clusters. Built on Talos Linux, Sidero provides a GitOps-driven approach to managing bare-metal Kubernetes infrastructure with enterprise-grade security and immutable operating system principles.

**Key Features:**

* Immutable infrastructure with Talos Linux
* GitOps-based cluster lifecycle management  
* Secure by default with no SSH access required
* Automated bare-metal provisioning
* Integration with Cluster API for declarative cluster management

**Overview:**

Sidero simplifies the complexity of bare-metal Kubernetes deployments by providing automated discovery, provisioning, and lifecycle management of physical servers. The platform uses a **management cluster** that orchestrates deployment and management of workload clusters across your bare-metal infrastructure.

OmniServer Deployment
--------------------------

**Step 1.1.1: Create OmniServer VM**

- Click **Setup Kubernetes** in the Karios UI.

.. figure:: _static/images/omni/om-1.png
   :alt: Setup Kubernetes Button
   :width: 600

**Step 1.1.2: Setup Keycloak**

- Click **Keycloak** in the UI.

.. figure:: _static/images/omni/om-2.png
   :alt: Setup Keycloak Button
   :width: 600

- This creates a **Keycloak instance** in a FreeBSD jail.  
- Wait for the Keycloak jail to finish creation.

.. figure:: _static/images/omni/om-3.png
   :alt: Keycloak Setup Complete
   :width: 600

.. note::
   Keycloak is an open-source identity and access management solution.  
   It provides single sign-on (SSO), user federation, identity brokering, and social login.  
   In Sidero, Keycloak manages authentication and authorization for Kubernetes clusters.

   Default credentials:  
   - **Master realm** → ``admin / adminadmin``  
   - **Omni realm** → ``user@karios.ai / Omni12345``


**Step 1.1.3: Upload TLS Certificate and Key**

- Click **Upload Certificates** in the UI.

.. figure:: _static/images/omni/om-4.png
   :alt: Upload Certificates Button
   :width: 600

- Upload the **wildcard TLS certificate and key** for your domain.

.. figure:: _static/images/omni/om-5.png
   :alt: TLS Certificate Upload
   :width: 600

.. note::
   TLS secures communication between Sidero components and Kubernetes clusters.  
   Ensure the certificate covers ``omni.<basedomain>``.  
   Combine the CA bundle and certificate into one file before upload.

**Step 1.1.4: Setup OmniServer VM**

- Click **Setup Omni Server**.  
- Enter OmniServer VM details (username and password).  
- Attach an **Ubuntu cloud image (.img)**.  

.. figure:: _static/images/omni/om-6.png
   :alt: Setup Omni Server Button
   :width: 600

.. note::
   The Ubuntu image must already be uploaded to the **Control Center** in the Karios UI.

- Select **Server**, **Storage**, and **Network switch**.  
- Enter VM specs **CPU's, Memory(GB), Disk Size(GB)** and click **Save**.

.. figure:: _static/images/omni/om-7.png
   :alt: OmniServer VM Config
   :width: 600

**Step 1.1.5: Access the OmniServer Dashboard**

- Once created, access the OmniServer dashboard at:

  ``https://omni.<basedomain>``

- You will be redirected to the Keycloak login page for the **omni realm**.

.. figure:: _static/images/omni/om-9.png
   :alt: Omni Dashboard
   :width: 600

.. figure:: _static/images/omni/om-10.png
   :alt: Keycloak Login
   :width: 600

- After login, you will be redirected to the **OmniServer Dashboard**.

.. note::
   Use credentials: ``user@<basedomain> / Omni12345``

Cluster Installation
--------------------------

**Step 1.2.1: Download the ISO**

- In OmniServer dashboard, click **Download ISO**.  

.. figure:: _static/images/omni/omd-1.png
   :alt: Generate ISO
   :width: 600

- Select ISO type, Talos version, and click **Generate ISO**.

.. figure:: _static/images/omni/omd-2.png
   :alt: Generate ISO
   :width: 600

.. note::
   For demos, use ISO type: ``amd64-iso``.  
   please use v1.11.1 of Talos.
   For VM clusters, add the following kernel argument to avoid ``kexec`` issues:  
   ``sysctl.kernel.kexec_load_disabled=1``

**Step 1.2.2: Upload the ISO in Karios UI**

- Navigate to: **Control Center → ISO tab**.  
- Click **Choose File**, select the ISO, then **Upload**.

.. note::
   The uploaded ISO will appear under **Available ISOs**.  
   Refer to the Upload ISO section in Karios documentation for details.

**Step 1.2.3: Create Cluster Machines in Karios UI**

- Click **Setup Kubernetes**. 
- Click on **OmniServer** 

.. figure:: _static/images/omni/om-1.png
   :alt: Cluster Deta
   :width: 600

- Enter cluster details and select the uploaded ISO.

.. figure:: _static/images/omni/om-12.png
   :alt: Cluster Details
   :width: 600

.. note::
   Use the prefix ``om`` in the cluster name to identify Omni clusters.

- Select **Server**, **Storage Pool**, and **Network Switch**.  
- Enter VM specs **CPU's, Memory(GB), Disk Size(GB)** and click **Update**.

.. figure:: _static/images/omni/om-13.png
   :alt: Add VM Config
   :width: 600

- Use the "+" button to add multiple VMs.  
- Click **Omni VMs** to create the machines.  

.. figure:: _static/images/omni/om-14.png
   :alt: Omni VM Creation
   :width: 600

- Start all VMs from the Karios UI.

.. figure:: _static/images/omni/omd-3.png
   :alt: Omni VM Creation
   :width: 600

**Step 1.2.4: VM Discovery in OmniServer Dashboard**

- Power on the VMs.  
- They will appear under the **Machines** tab.

.. figure:: _static/images/omni/om-15.png
   :alt: Machines Tab
   :width: 600

**Step 1.2.5: Create the Cluster in OmniServer Dashboard**

- Click on the **Clusters** tab.

.. figure:: _static/images/omni/om-16.png
   :alt: Create Cluster Button
   :width: 600

- Click on **Create Cluster**.

.. figure:: _static/images/omni/om-17.png
   :alt: Cluster Role Assignment
   :width: 600

- Enter **cluster name**, **select Talos version**, and **machine set configuration**. 

.. figure:: _static/images/omni/omd-4.png
   :alt: Cluster Details
   :width: 600

..note::
  Select the same Talos version used to generate the ISO.
  Machine Set is a grouping of machines that are managed together. Select the different machine sets based on the roles you want to assign to the machines.

- Assign roles: **CP0 (control plane)**, **W0 (worker)**.

.. figure:: _static/images/omni/om-18.png
   :alt: Cluster Role Assignment
   :width: 600

.. note::
   Minimum requirements:  
   - 1 control plane node (CP0)  
   - 1 worker node (W0)


**Step 1.2.6: Monitor Cluster Installation**

- In **Clusters**, click the cluster name.  
- Monitor installation progress.

.. figure:: _static/images/omni/om-19.png
   :alt: Cluster Installation Progress
   :width: 600

- When complete, the cluster status changes to **Ready** and nodes show **Running**.

.. note::
   Installation may take several minutes.  
   If VMs are stuck in provisioning, reboot them from the Karios UI.  
   Download the ``kubeconfig`` file from OmniServer dashboard to access the cluster.

.. figure:: _static/images/omni/om-20.png
   :alt: Cluster Ready
   :width: 600


Manual Removal of Keycloak Jail Deployment
-----------------------------------------------

Overview
--------

**Keycloak** is an open-source identity and access management (IAM) solution.  
It provides authentication, authorization, and user management capabilities for applications and services.  

In the context of **OmniServer (SideroLabs Omni Dashboard)**, Keycloak is used as the **authentication and identity provider**.  
It ensures secure login, centralized user control.

When OmniServer is uninstalled or removed from a node, the Keycloak jail is **not automatically removed**. 

Therefore, Keycloak needs to be removed manually from the node.

Removal Procedure
-----------------

To manually remove the Keycloak jail, follow these steps:

Step 1.3.1 Click on the **Control Center** in the Karios UI. under the **Devices** section,  you can find the **Device IP** of the node. 

.. figure:: _static/images/omni/keycloak.png
   :alt: Device IP
   :width: 600

Step 1.3.2 Using the Terminal, SSH into the node using the Device IP.

.. code-block:: bash

   ssh root@<Device-IP>
   # Example:
   ssh root@192.168.1.100
   # Password: karios12345

Step 1.3.3 Remove the Keycloak Jail

. **Run the following commands in sequence:**

.. code-block:: bash

   jls
   jail -R karios-keycloak
   zfs umount -f zroot/jails/karios-keycloak
   zfs destroy -r zroot/jails/karios-keycloak

Command Explanation
-------------------
- ``jls``  
  Lists all running jails on the system. Confirm that the ``karios-keycloak`` jail is present.

- ``jail -R karios-keycloak``  
  Removes the running jail instance named ``karios-keycloak``.

- ``zfs umount -f zroot/jails/karios-keycloak``  
  Forcefully unmounts the ZFS dataset associated with the jail.

- ``zfs destroy -r zroot/jails/karios-keycloak``  
  Recursively destroys the dataset and all of its child datasets, permanently removing the jail's data.

Post-Removal Notes
------------------

- After performing these steps, the Keycloak jail and its associated datasets are fully removed.  
- Any configurations, users, or authentication data stored in this jail are **not recoverable** unless previously backed up.  
- If OmniServer or other services were relying on Keycloak, ensure that an **alternative identity provider** is configured to avoid authentication issues.



OpenShift Overview
--------------------------------

OpenShift on Karios combines the **operational simplicity of Karios infrastructure management** with the **enterprise capabilities of OpenShift**.  
This provides a powerful foundation for containerized application development and deployment, offering both the flexibility of Kubernetes and the operational maturity expected in enterprise environments.

The platform includes integrated CI/CD capabilities, service mesh options, and comprehensive security policies, enabling organizations to adopt cloud-native practices while maintaining governance and compliance requirements.  

Creating the OpenShift Cluster
----------------------------------

**Step 2.1.1: Create the Cluster Machine in Karios UI**

- Click **Setup Kubernetes** in the Karios UI.

.. figure:: _static/images/openshift/op-1.png
   :alt: Setup Kubernetes Button
   :width: 600

- Select **OpenShift**.

.. figure:: _static/images/openshift/op-2.png
   :alt: Setup Kubernetes Button
   :width: 600

**Step 2.1.2: Enter the Cluster Details**

- **Cluster name**: Enter a DNS-compliant name (e.g., ``op-test``).

.. note::
   The ``op`` prefix is recommended to uniquely identify OpenShift clusters.  

.. figure:: _static/images/openshift/op-3.png
   :alt: Cluster Details
   :width: 600

**Step 2.1.3: Add Control Plane Nodes**

- Click **Add Control Plane**.  

- Select the server and configure VM specs **CPU's**, **Memory(GB)** , **Disk Size(GB)**.

- Click **Save** to confirm configuration. 

.. figure:: _static/images/openshift/op-4.png
   :alt: Control Plane Config
   :width: 600

.. note::
   Minimum requirements:  
   - 4 vCPUs  
   - 4 GB memory  
   - 80 GB disk space  

   Recommended: **3 control plane nodes** for high availability.  
   Control plane nodes must be **odd in number** to avoid split-brain issues.  

- Use the "+" button to add more control plane nodes. 

.. figure:: _static/images/openshift/op-5.png
   :alt: Control Plane Config
   :width: 600
 

**Step 2.1.4: Add Worker Nodes**

- Click **Add Worker Node**.  

.. figure:: _static/images/openshift/op-6.png
   :alt: Control Plane Config
   :width: 600

_ Select the **Server** , **Storage Pool** , and **Network Switch**._

- Select the server and configure VM specs **CPU's**, **Memory(GB)** , **Disk Size(GB)**.

.. figure:: _static/images/openshift/op-7.png
   :alt: Worker Node Config
   :width: 600

.. note::
   Minimum requirements:  
   - 4 vCPUs  
   - 4 GB memory  
   - 80 GB disk space  

   Recommended: At least **1 worker node**.  
   Worker nodes can be an even or odd number depending on workload needs.  

- Click **Save**.  
- Use the "+" button to add additional worker nodes.  

.. figure:: _static/images/openshift/op-8.png
   :alt: Worker Node Config
   :width: 600

**Step 2.1.5: Configure HAProxy**

During cluster configuration, you will see the **HAProxy Setup** option.

- **Setup HAProxy (checkbox)**:  
  Selecting this enables HAProxy for your cluster. 

.. figure:: _static/images/openshift/op-9.png
   :alt: HAProxy Setup
   :width: 600

.. note::
   Enabling HAProxy creates **two HAProxy instances** in FreeBSD jails.  
   These handle load balancing between control plane nodes in high-availability setups.  

- For **high availability deployments**, ensure the HAProxy option is **checked**.  
- For test or single-node clusters, HAProxy can remain unchecked.  

- Once configuration is complete, click **Create OpenShift Cluster** to finalize deployment.  

OpenShift Without DHCP
--------------------------

For enterprise environments requiring **static networking** and full control over network configuration, OpenShift can be deployed on Karios without DHCP. This approach provides enhanced security, predictable networking, and better integration with enterprise networks.

Prerequisites
~~~~~~~~~~~~~~~~~~~

Before starting installation, ensure you have:

* Valid Red Hat account with OpenShift subscription  
* Karios infrastructure with designated nodes for OpenShift  
* Static IP addressing plan including DNS, gateway, and subnet configuration  
* SSH public key for cluster access and troubleshooting  

Installation Steps
~~~~~~~~~~~~~~~~~~~~~~~~

**Step 2.2.1: Navigate to Red Hat Console**

- Go to: https://console.redhat.com/openshift/create/datacenter  

**Step 2.2.2: Authentication**

- Log in with your **Red Hat credentials**.  

.. warning::
   Ensure your account has the required permissions to create OpenShift clusters.  

**Step 2.2.3: Platform Selection**

- Select **"Platform agnostic (x86_64)"**.  

.. figure:: _static/images/openshift/Redhat-4.png
   :alt: Platform Agnostic Selection
   :width: 600

**Step 2.2.4: Installation Method**

- Select **"Interactive"** (guided setup).  

.. figure:: _static/images/openshift/Redhat-5.png
   :alt: Interactive Installation Selection
   :width: 600

**Step 2.2.5: Configure Cluster Details**

- Fill out the installer form:  

  * Cluster name: e.g., ``op-test1``  
  * Base domain: e.g., ``karios.ai``  
  * OpenShift version: e.g., 4.19.6  
  * CPU architecture: ``x86_64``  

.. figure:: _static/images/openshift/Redhat-6.png
   :alt: Cluster Details
   :width: 600

.. important::
   The cluster name must follow DNS requirements. See:  
   `DNS requirements documentation <https://docs.redhat.com/en/documentation/openshift_container_platform/4.19/html/installing_an_on-premise_cluster_with_the_agent-based_installer/preparing-to-install-with-agent-based-installer#agent-install-dns-none_preparing-to-install-with-agent-based-installer>`_

**Step 2.2.6: Configure Additional Settings**

- Platform: **No platform integration**  
- Control Plane: **3 nodes (HA)**  
- Networking: **Static IP, bridges, and bonds**  

.. figure:: _static/images/openshift/Redhat-7.png
   :alt: Additional Settings
   :width: 600

**Step 2.2.7: Configure Static Networking**

- Use **Form view**.  
- Example:  
  * Subnet: ``192.168.116.0/24``  
  * Gateway: ``192.168.116.253``  
  * DNS: ``192.168.116.240``  

.. figure:: _static/images/openshift/Redhat-8.png
   :alt: Static Network Configuration
   :width: 600

**Step 2.2.8: Map Hosts (MAC to IP)**

- Host 1 → 58:9c:fc:01:4f:a1 → 192.168.116.30
- Host 2 → 58:9c:fc:0f:66:4c → 192.168.116.31
- Host 3 → 58:9c:fc:0e:6f:55 → 192.168.116.32
- Host 4 → 58:9c:fc:08:2e:26 → 192.168.116.36
- Host 5 → 58:9c:fc:0e:00:09 → 192.168.116.39  

.. figure:: _static/images/openshift/op-10.png
   :alt: Host-Specific Config
   :width: 600

.. important::
   After modifying network settings, regenerate the Discovery ISO.  

**Step 2.2.9: Generate Discovery ISO**

- Select **Full image file - self-contained ISO**.  
- Paste SSH public key.  
- Click **Generate Discovery ISO**.  

.. figure:: _static/images/openshift/op-12.png
   :alt: Generate Discovery ISO
   :width: 600

**Step 2.2.10: Download ISO in Karios UI**

- Copy wget link from Red Hat console. 

.. figure:: _static/images/openshift/op-13.png
   :alt: Download Discovery ISO
   :width: 600

- In **Karios → Control Center → ISO tab**, paste link.  
- Click **Download**.  



**Step 2.2.11: Attach ISO and Boot Nodes**

- Click on the Vm. 

.. figure:: _static/images/openshift/op-14.png
   :alt: Download Discovery ISO
   :width: 600

- Attach ISO to nodes. 

.. figure:: _static/images/openshift/op-15.png
   :alt: Download Discovery ISO
   :width: 600

.. figure:: _static/images/openshift/Redhat-12.png
   :alt: Download Discovery ISO
   :width: 600

- Ensure ISO is primary boot device.  
- Power on nodes.  

.. figure:: _static/images/openshift/op-14.png
   :alt: Attach ISO to Nodes
   :width: 600

**Step 2.2.12: Node Discovery**

- Go Back to the OpenShift Console page and wait for the nodes to show up.
- Nodes boot into CoreOS Live.  
- Static IPs are applied.  
- Nodes appear in OpenShift console.  

.. figure:: _static/images/openshift/Redhat-10.png
   :alt: Node Discovery
   :width: 600

.. note::
   It might take few minutes for the nodes to appear.

**Step 2.2.13: Configure Storage**

- Assign persistent volumes.  

.. figure:: _static/images/openshift/Redhat-11.png
   :alt: Storage Configuration
   :width: 600

**Step 2.2.14: Networking**

- Select **User-Managed Networking** (required).  

.. figure:: _static/images/openshift/Redhat-13a.png
   :alt: Networking Settings
   :width: 600

**Step 2.2.15: Review and Create**

- Review all configurations.  
- Click **Install cluster**.

.. figure:: _static/images/openshift/Redhat-14.png
   :alt: Installation Complete
   :width: 600

**Step 2.2.16: Monitor Installation**

- Track progress in OpenShift console.  
- Configure external load balancers after completion.  

.. figure:: _static/images/openshift/Redhat-17.png
   :alt: Post Installation
   :width: 600

Configuration Summary
-------------------------

**Completed Configuration:**

* Cluster details set  
* Static networking configured  
* Nodes discovered and validated  
* User-managed networking enabled  

**Key Benefits:**

* Custom load balancer support  
* Full control over networking  
* Seamless enterprise integration  

**Deployment Ready:**

Your OpenShift cluster on Karios is now ready for production workloads.


Open Source Kubernetes Overview
-------------------------------


Open source Kubernetes provides the foundational container orchestration platform without vendor-specific additions. Running Kubernetes on **Ubuntu** through Karios gives you complete control over your cluster configuration while benefiting from Ubuntu's extensive package ecosystem and long-term support options.

**Key Features:**

* Pure upstream Kubernetes experience  
* Full customization and configuration control  
* Ubuntu LTS support and security updates  
* Extensive community ecosystem and tooling  
* Cost-effective solution for diverse workloads  

**Overview:**

This deployment option offers maximum flexibility for organizations that want to build their Kubernetes infrastructure using open source components. By leveraging Ubuntu as the base operating system within Karios, you gain access to a mature Linux distribution with comprehensive hardware support and a rich ecosystem of tools and packages.

This approach is ideal for organizations that prefer to implement their own operational tooling around Kubernetes or have specific compliance requirements that benefit from a fully open source stack. The combination provides **enterprise-ready infrastructure capabilities** while maintaining **transparency and control** over the technology stack.

Create the Ubuntu Kubernetes Cluster
----------------------------------------

**Step 3.1.1: Create the Cluster Machine in Karios UI**

- Click **Setup Kubernetes** in the Karios UI, and Select **Ubuntu**.

.. figure:: _static/images/UbuntuKubernetes/ubuntu-1.png
   :alt: Setup Kubernetes Button
   :width: 600

**Step 3.1.2: Enter Cluster Details**

- **Cluster name**: Enter a DNS-compliant name (e.g., ``ub-test1``).  

.. note::
   The ``ub`` prefix helps uniquely identify Ubuntu-based clusters.  

- **Username and password**: Enter credentials for SSH access.  

.. note::
   Avoid using reserved usernames like **root** or **admin**.  

- **Attach the image**: Select an **Ubuntu cloud image (.img)**.  

.. note::
   The Ubuntu image must be uploaded to the **Control Center** in Karios beforehand.  

.. figure:: _static/images/UbuntuKubernetes/ubuntu-3.png
   :alt: Attach Ubuntu Image
   :width: 600

**Step 3.1.3: Add a Bootstrap Node**

- Click **Add Control Node**.  

.. figure:: _static/images/UbuntuKubernetes/ubuntu-3.png
   :alt: Bootstrap Node Config
   :width: 600

.. note::
   In many setups, the bootstrap node is also the master node. This means it not only helps other nodes join the cluster but also takes on the responsibility of controlling and managing cluster operations like scheduling, orchestration, and resource allocation.


- Select **Server**, **CPU's**, **Memory(GB)**, and **Disk Size(GB)**.  

.. note::
   Minimum requirements for the bootstrap/control node:  
   - 4 vCPUs  
   - 4 GB memory  
   - 80 GB disk space  

- Optionally, enable tech stack components such as:  
   - **Prometheus & Grafana** (monitoring)  
   - **ArgoCD** (GitOps workflows)  

.. figure:: _static/images/UbuntuKubernetes/ubuntu3a.png
   :alt: Bootstrap Node Config
   :width: 600

**Step 3.1.4: Add Control Plane Nodes**

- Click **Add Control Plane**.  

.. figure:: _static/images/UbuntuKubernetes/ubuntu-4.png
   :alt: Control Plane Config
   :width: 600

.. note::
   Control plane nodes manage the Kubernetes cluster state and handle API requests.  
   For high availability, it is recommended to have multiple control plane nodes.

- Select **Server**, **CPU's**, **Memory(GB)**, and **Disk Size(GB)**. 

.. note::
   Minimum requirements per control plane node:  
   - 4 vCPUs  
   - 4 GB memory  
   - 80 GB disk space  

   Recommended: **3 control plane nodes** for high availability.  
   Control plane nodes must be **odd in number** to prevent split-brain.  

.. figure:: _static/images/UbuntuKubernetes/ubuntu-5.png
   :alt: Control Plane Config
   :width: 600

- Save the configuration and add more nodes as required.  

.. figure:: _static/images/UbuntuKubernetes/ubuntu-6.png
   :alt: Control Plane Config
   :width: 600

**Step 3.1.5: Add Worker Nodes**

- Click **Add Worker Node**.  

.. figure:: _static/images/UbuntuKubernetes/ubuntu-7.png
   :alt: Worker Node Config
   :width: 600

.. note::
   Worker nodes run the applications and workloads in the cluster.

- Select **Server** and configure VM specs.  

.. note::
   Minimum requirements per worker node:  
   - 4 vCPUs  
   - 4 GB memory  
   - 80 GB disk space  

   Recommended: At least **1 worker node**.  

.. figure:: _static/images/UbuntuKubernetes/ubuntu-8.png
   :alt: Worker Node Config
   :width: 600

- Save and add more workers as needed.  

**Step 3.1.6: Wait for cluster VMs to be ready**
- Wait for the cluster Vm's to be ready for the cluster.

.. note::
   It may take several minutes for all VMs to be ready in the cluster.
   Once the Vm's are ready the job status button disappears from the Karios UI.

**Step 3.1.7: Verify Cluster High Availability**
If high availability was configured with multiple control plane nodes, verify the setup:

.. code-block:: bash

   sudo k8s status
   sudo k8s kubectl get nodes

Example output:

.. code-block:: none

   steve@ub-joec2-controlplane:~$ sudo k8s status
   cluster status:           ready
   control plane nodes:      192.168.116.27:6400 (voter), 192.168.116.19:6400 (voter), 192.168.116.39:6400 (voter)
   high availability:        yes
   datastore:                etcd
   network:                  enabled
   dns:                      enabled at 10.152.183.94
   ingress:                  enabled
   load-balancer:            disabled
   local-storage:            enabled at /var/snap/k8s/common/rawfile-storage
   gateway                   enabled
   
.. note::
   With multiple control plane nodes, the cluster now shows "high availability: yes" and lists all control plane nodes as voters.

Accessing the Tech Stack
----------------------------

3.2.1 Prometheus and Grafana
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

**Step 3.2.1.1: Verify Deployment**

.. code-block:: bash

   sudo k8s kubectl get pods -n observability
   sudo k8s kubectl get svc -n observability

Example output:

.. code-block:: none

   steve@ub-joec2-controlplane:~$ sudo k8s kubectl get pods -n observability
   NAME                                                     READY   STATUS    RESTARTS      AGE
   alertmanager-prometheus-kube-prometheus-alertmanager-0   2/2     Running   0             46m
   prometheus-grafana-674cf8cb44-kfck6                      3/3     Running   0             46m
   prometheus-kube-prometheus-operator-6694cc948f-8f5bc     1/1     Running   0             46m
   prometheus-kube-state-metrics-7c5fb9d798-f5z4d           1/1     Running   0             46m
   prometheus-prometheus-kube-prometheus-prometheus-0       2/2     Running   0             46m
   prometheus-prometheus-node-exporter-fpnpj                1/1     Running   0             16m
   prometheus-prometheus-node-exporter-k96s8                1/1     Running   0             46m
   prometheus-prometheus-node-exporter-rkh45                1/1     Running   0             6m31s
   prometheus-prometheus-node-exporter-w2g4r                1/1     Running   0             5m45s
   
   steve@ub-joec2-controlplane:~$ sudo k8s kubectl get svc -n observability
   NAME                                      TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)                         AGE
   alertmanager-operated                     ClusterIP   None             <none>        9093/TCP,9094/TCP,9094/UDP      46m
   prometheus-grafana                        NodePort    10.152.183.19    <none>        80:30091/TCP                    46m
   prometheus-kube-prometheus-alertmanager   ClusterIP   10.152.183.125   <none>        9093/TCP,8080/TCP               46m
   prometheus-kube-prometheus-operator       ClusterIP   10.152.183.199   <none>        443/TCP                         46m
   prometheus-kube-prometheus-prometheus     NodePort    10.152.183.58    <none>        9090:30090/TCP,8080:31198/TCP   46m
   prometheus-kube-state-metrics             ClusterIP   10.152.183.72    <none>        8080/TCP                        46m
   prometheus-operated                       ClusterIP   None             <none>        9090/TCP                        46m
   prometheus-prometheus-node-exporter       ClusterIP   10.152.183.196   <none>        9100/TCP                        46m

.. note::
   - Namespace: ``observability``  
   - Grafana → port ``30091``  
   - Prometheus → port ``30090``  

**Step 3.2.1.2: Access Grafana Dashboard**

.. code-block:: none

   http://<node-ip>:30090
   http://<fqdn>:30090

**Step 3.2.1.3: Access Prometheus Dashboard**

.. code-block:: none

   http://<node-ip>:30091
   http://<fqdn>:30091

.. note::
   you can access the dashboards using the bootstrap/control plane node IP or any worker node IP.
   The default credentials for Grafana are:
   - User: ``admin``
   - Password: ``prom-operator``

3.3.2 ArgoCD
~~~~~~~~~~~~

**Step 3.3.2.1: Verify Deployment**

.. code-block:: bash

   sudo k8s kubectl get pods -n argocd
   sudo k8s kubectl get svc -n argocd

.. figure:: _static/images/UbuntuKubernetes/ubuntu-15.png
   :alt: ArgoCD Namespace
   :width: 600

.. note::
   - Namespace: ``argocd``  
   - Dashboard → port ``31800``  

**Step 3.3.2.2: Access ArgoCD Dashboard**

.. code-block:: none

   http://<node-ip>:31800
   http://<fqdn>:31800

.. note::
   you can access the dashboard using the bootstrap/control plane node IP or any worker node IP.


Create the K3s Cluster
=============================

4.0 About K3s (Lightweight Kubernetes)
----------------------------------------

K3s is a fully certified CNCF Kubernetes distribution designed to be:

* **Lightweight** - optimized for edge, resource-constrained, and embedded environments  
* **Easy to install** - a single binary under 100MB  
* **High availability capable** using an external datastore  
* **Secure** - packaged with minimal dependencies and reduced attack surface  
* **Fast to bootstrap** - reduced Kubernetes components and simplified architecture  

Key internal differences from traditional Kubernetes:

* Uses **containerd** by default (Docker not needed)  
* Uses a **single process** model (k3s server / k3s agent)  
* Provides a built-in **service load balancer**, **local storage provider**, and **Traefik ingress**  
* Supports **SQLite** on non-HA clusters, and **etcd / MySQL / Postgres** for HA mode  
* Ideal for:  
  * Edge devices  
  * Branch locations  
  * Lightweight virtual machines  
  * Fast CI testing labs  

.. note::
   K3s is not a “reduced feature” Kubernetes. It is a **complete Kubernetes** distribution with optimizations that make it lighter, simpler, and easier to operate.

----------------------------------------
4.1 Create the K3s Cluster
----------------------------------------

4.1.1 Create the Cluster Machine in Karios UI
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- Click **Setup Kubernetes** in the Karios UI, and select **K3s**.

.. figure:: _static/images/k3s/K3sFirstpage.png
   :alt: Setup Kubernetes Button
   :width: 600


4.1.2 Enter Cluster Details
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- **Cluster name**: Enter a DNS-compliant name (e.g., ``k3s-test1``).

.. note::
   Using the ``k3s`` prefix helps identify lightweight clusters.

- **Username and password**: Specify credentials for SSH login.

.. note::
   Avoid reserved usernames such as ``root`` or ``admin``.

- **Attach the image**: Select a **K3s-ready cloud image (.img)**.

.. note::
   The image must first be uploaded to the **Control Center** in Karios.

.. figure:: _static/images/k3s/K3sCluster1.png
   :alt: Setup Kubernetes Button
   :width: 600

4.1.3 Add a Bootstrap Node
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- Click **Add Control Node**.
image 
.. note::
   The first K3s control node acts as the **primary server** and initializes the cluster.

- Select **Server**, **CPU**, **Memory**, and **Disk**.

.. note::
   Minimum recommended for K3s server:
   
   - 2-4 vCPUs  
   - 2-4 GB memory  
   - 40-80 GB disk space  

- Optional stack components:

  - **Prometheus & Grafana**  
  - **ArgoCD**

.. figure:: _static/images/k3s/K3sCluster2.png
   :alt: Setup Kubernetes Button
   :width: 600


4.1.4 Add Additional Server Nodes (K3s Control Plane)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- Click **Add Control Plane**.

.. figure:: _static/images/k3s/K3sCluster3.png
   :alt: Setup Kubernetes Button
   :width: 600

.. note::
   K3s high availability requires **multiple server nodes** and an **external datastore**.

- Configure CPU, memory, and storage.

.. note::
   Recommended for HA:
   
   - 3 server nodes  
   - Odd number of nodes to prevent split-brain  
   - 2-4 vCPUs, 2-4 GB memory, 40-80 GB disk  


4.1.5 Add Worker Nodes
~~~~~~~~~~~~~~~~~~~~~~~~~~

- Click **Add Worker Node**.

.. figure:: _static/images/k3s/K3sCluster4.png
   :alt: Setup Kubernetes Button
   :width: 600

.. note::
   Worker nodes run the cluster workloads.

- Configure CPU, memory, disk size.

.. figure:: _static/images/k3s/K3sCluster6.png
   :alt: Setup Kubernetes Button
   :width: 600

.. note::
   Minimum per worker:

   - 2 vCPUs  
   - 2 GB RAM  
   - 40-80 GB storage  

.. figure:: _static/images/k3s/K3sCluster7.png
   :alt: Setup Kubernetes Button
   :width: 600


4.1.6 Wait for Cluster VMs to Become Ready
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- Wait for all VMs to be provisioned.
- Click the **Job Status** icon in the Karios UI to monitor progress.

image

.. note::
   When provisioning completes, the Job Status icon disappears.


4.1.7 Verify Cluster High Availability
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Run the following commands on the bootstrap server:

.. code-block:: bash

   sudo k3s kubectl get nodes
   sudo k3s kubectl get endpoints -A

Example output:

.. code-block:: none

   NAME           STATUS   ROLES                  AGE   VERSION
   k3s-srv1       Ready    control-plane,master   20m   v1.29.x
   k3s-srv2       Ready    control-plane,master   18m   v1.29.x
   k3s-srv3       Ready    control-plane,master   17m   v1.29.x
   k3s-worker1    Ready    <none>                 15m   v1.29.x

.. note::
   With three server nodes, K3s now operates in fully redundant HA mode.

----------------------------------------
4.2 Accessing the Tech Stack
----------------------------------------

4.2.1 Prometheus and Grafana
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

4.2.1.1 Verify Deployment
^^^^^^^^^^^^^^^^^^^^^^^^^^

.. code-block:: bash

   sudo k3s kubectl get pods -n observability
   sudo k3s kubectl get svc -n observability

Example:

.. code-block:: none

   prometheus-grafana              
   prometheus-kube-prometheus      

.. note::
   - Grafana → port ``30091``  
   - Prometheus → port ``30090``  


4.2.1.2 Access Grafana Dashboard
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. code-block:: none

   http://<node-ip>/grafana
   http://<fqdn>/grafana


4.2.1.3 Access Prometheus Dashboard
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. code-block:: none

   http://<node-ip>/prometheus
   http://<fqdn>/prometheus

.. note::
   Default Grafana credentials:
   
   - User: ``admin``  
   - Password: ``prom-operator``  


----------------------------------------
4.3 Next Steps
----------------------------------------

After deploying your K3s cluster, consider:

* **Monitoring and Observability**
* **Backup and Disaster Recovery**
* **Security Hardening**
* **Day-2 Operations and Upgrades**

For additional help, consult:

* **K3s Documentation** - https://docs.k3s.io  
* **Prometheus Documentation** - https://prometheus.io  
* **Grafana Documentation** - https://grafana.com  
* **ArgoCD Documentation** - https://argo-cd.readthedocs.io  



Next Steps
--------------

After selecting and deploying your preferred Kubernetes distribution, consider the following operational aspects:

* **Monitoring and Observability**: Implement comprehensive monitoring solutions for both the Karios infrastructure and Kubernetes workloads  
* **Backup and Disaster Recovery**: Establish backup procedures for both cluster state and persistent data  
* **Security Hardening**: Apply security best practices specific to your chosen Kubernetes distribution  
* **Day-2 Operations**: Plan for ongoing maintenance, updates, and scaling operations  

For additional support and advanced configuration options, refer to the respective documentation for your chosen Kubernetes distribution and consult the Karios operational guides.

- **Sidero Omni documentation**: https://docs.siderolabs.com/omni/overview/what-is-omni  
- **OpenShift documentation**: https://docs.openshift.com/container-platform/latest/welcome/index.html  
- **Ubuntu Kubernetes documentation**: https://documentation.ubuntu.com/canonical-kubernetes/latest/about/  
- **ArgoCD documentation**: https://argo-cd.readthedocs.io/en/stable/  
- **Prometheus documentation**: https://prometheus.io/docs/introduction/overview/  
- **Grafana documentation**: https://grafana.com/docs/grafana/latest/


