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
-----------------------

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

.. image:: _static/images/omni/om-1.png
:alt: Setup Kubernetes Button

**Step 1.1.2: Setup Keycloak**

- Click **Keycloak** in the UI.

.. image:: _static/images/omni/om-2.png
:alt: Setup Keycloak Button

- This creates a **Keycloak instance** in a FreeBSD jail.
- Wait for the Keycloak jail to finish creation.

.. note::
Keycloak is an open-source identity and access management solution.
It provides single sign-on (SSO), user federation, identity brokering, and social login.
In Sidero, Keycloak manages authentication and authorization for Kubernetes clusters.

Default credentials:
- **Master realm** → ``admin / adminadmin``
- **Omni realm** → ``user@karios.ai / Omni12345``

.. image:: _static/images/omni/om-3.png
:alt: Keycloak Setup Complete

**Step 1.1.3: Upload TLS Certificate and Key**

- Click **Upload Certificates** in the UI.

.. image:: _static/images/omni/om-4.png
:alt: Upload Certificates Button

- Upload the **wildcard TLS certificate and key** for your domain.

.. note::
TLS secures communication between Sidero components and Kubernetes clusters.
Ensure the certificate covers ``omni.<basedomain>``.
Combine the CA bundle and certificate into one file before upload.

.. image:: _static/images/omni/om-5.png
:alt: TLS Certificate Upload

**Step 1.1.4: Setup OmniServer VM**

- Click **Setup Omni Server**.
- Enter OmniServer VM details (username and password).
- Attach an **Ubuntu cloud image (.img)**.

.. note::
The Ubuntu image must already be uploaded to the **Control Center** in the Karios UI.

.. image:: _static/images/omni/om-6.png
:alt: Setup Omni Server Button

- Select **Server**, **Storage**, and **Network switch**.
- Enter VM specs (**CPU, memory, disk**) and click **Save**.

.. image:: _static/images/omni/om-7.png
:alt: OmniServer VM Config

**Step 1.1.5: Access the OmniServer Dashboard**

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

Cluster Installation
--------------------------

**Step 1.2.1: Download the ISO**

- In OmniServer dashboard, click **Download ISO**.
- Select ISO type, Talos version, and click **Generate ISO**.

.. note::
For demos, use ISO type: ``amd64-iso``.
For VM clusters, add the following kernel argument to avoid ``kexec`` issues:
``sysctl.kernel.kexec_load_disabled=1``

.. image:: _static/images/omni/omd-1.png
:alt: Generate ISO
.. image:: _static/images/omni/omd-2.png
:alt: Generate ISO

**Step 1.2.2: Upload the ISO in Karios UI**

- Navigate to: **Control Center → ISO tab**.
- Click **Choose File**, select the ISO, then **Upload**.

.. note::
The uploaded ISO will appear under **Available ISOs**.
Refer to the Upload ISO section in Karios documentation for details.

**Step 1.2.3: Create Cluster Machines in Karios UI**

- Click **Setup Kubernetes**.
- Enter cluster details and select the uploaded ISO.

.. note::
Use the prefix ``om`` in the cluster name to identify Omni clusters.

.. image:: _static/images/omni/om-12.png
:alt: Cluster Details

- Select server, storage pool, and network switch.
- Enter VM specs and click **Update**.
- Use the "+" button to add multiple VMs.
- Click **Omni VMs** to create the machines.
- Start all VMs from the Karios UI.

.. image:: _static/images/omni/om-13.png
:alt: Add VM Config
.. image:: _static/images/omni/om-14.png
:alt: Omni VM Creation
.. image:: _static/images/omni/omd-3.png
:alt: Omni VM Creation

**Step 1.2.4: VM Discovery in OmniServer Dashboard**

- Power on the VMs.
- They will appear under the **Machines** tab.

.. image:: _static/images/omni/om-15.png
:alt: Machines Tab

**Step 1.2.5: Create the Cluster in OmniServer Dashboard**

- Go to **Clusters → Create Cluster**.
- Enter cluster name, select Talos version, and pool configuration.
- Assign roles: **CP0 (control plane)**, **W0 (worker)**.

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

**Step 1.2.6: Monitor Cluster Installation**

- In **Clusters**, click the cluster name.
- Monitor installation progress.

.. image:: _static/images/omni/om-19.png
:alt: Cluster Installation Progress

- When complete, the cluster status changes to **Ready** and nodes show **Running**.

.. note::
Installation may take several minutes.
If VMs are stuck in provisioning, reboot them from the Karios UI.
Download the ``kubeconfig`` file from OmniServer dashboard to access the cluster.

.. image:: _static/images/omni/om-20.png
:alt: Cluster Ready

Creating the OpenShift Cluster
----------------------------------

**Step 2.1.1: Create the Cluster Machine in Karios UI**

- Click **Setup Kubernetes** in the Karios UI.

.. image:: _static/images/UbuntuKubernetes/ubuntu-1.png
:alt: Setup Kubernetes Button

.. image:: _static/images/openshift/op-2.png
:alt: Setup Kubernetes Button

**Step 2.1.2: Enter the Cluster Details**

- **Cluster name**: Enter a DNS-compliant name (e.g., ``op-test``).

.. note::
The ``op`` prefix is recommended to uniquely identify OpenShift clusters.

.. image:: _static/images/openshift/op-3.png
:alt: Cluster Details

**Step 2.1.3: Add Control Plane Nodes**

- Click **Add Control Plane**.

.. image:: _static/images/openshift/op-4.png
:alt: Control Plane Config

- Select the server and configure VM specs (CPU, memory, disk).

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
- Use the "+" button to add more control plane nodes.

.. image:: _static/images/openshift/op-6.png
:alt: Control Plane Config

**Step 2.1.4: Add Worker Nodes**

- Click **Add Worker Node**.

.. image:: _static/images/openshift/op-7.png
:alt: Worker Node Config

- Select the server and configure VM specs.

.. note::
Minimum requirements:
- 4 vCPUs
- 4 GB memory
- 80 GB disk space

Recommended: At least **1 worker node**.
Worker nodes can be an even or odd number depending on workload needs.

.. image:: _static/images/openshift/op-8.png
:alt: Worker Node Config

- Click **Save**.
- Use the "+" button to add additional worker nodes.

**Step 2.1.5: Configure HAProxy**

During cluster configuration, you will see the **HAProxy Setup** option.

.. image:: _static/images/openshift/op-9.png
:alt: HAProxy Setup

- **Setup HAProxy (checkbox)**:
Selecting this enables HAProxy for your cluster.

.. note::
Enabling HAProxy creates **two HAProxy instances** in FreeBSD jails.
These handle load balancing between control plane nodes in high-availability setups.

- For **high availability deployments**, ensure the HAProxy option is **checked**.
- For test or single-node clusters, HAProxy can remain unchecked.

- Once configuration is complete, click **Create OpenShift Cluster** to finalize deployment.

OpenShift Overview
--------------------------------

OpenShift on Karios combines the **operational simplicity of Karios infrastructure management** with the **enterprise capabilities of OpenShift**.
This provides a powerful foundation for containerized application development and deployment, offering both the flexibility of Kubernetes and the operational maturity expected in enterprise environments.

The platform includes integrated CI/CD capabilities, service mesh options, and comprehensive security policies, enabling organizations to adopt cloud-native practices while maintaining governance and compliance requirements.

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

**Step 2.3.2.1: Navigate to Red Hat Console**

- Go to: https://console.redhat.com/openshift/create/datacenter

**Step 2.3.2.2: Authentication**

- Log in with your **Red Hat credentials**.

.. warning::
Ensure your account has the required permissions to create OpenShift clusters.

**Step 2.3.2.3: Platform Selection**

- Select **"Platform agnostic (x86_64)"**.

.. image:: _static/images/openshift/Redhat-4.png
:alt: Platform Agnostic Selection

**Step 2.3.2.4: Installation Method**

- Select **"Interactive"** (guided setup).

.. image:: _static/images/openshift/Redhat-5.png
:alt: Interactive Installation Selection

**Step 2.3.2.5: Configure Cluster Details**

- Fill out the installer form:

* Cluster name: e.g., ``op-test1``
* Base domain: e.g., ``karios.ai``
* OpenShift version: e.g., 4.19.6
* CPU architecture: ``x86_64``

.. image:: _static/images/openshift/Redhat-6.png
:alt: Cluster Details

.. important::
The cluster name must follow DNS requirements. See:
`DNS requirements documentation <https://docs.redhat.com/en/documentation/openshift_container_platform/4.19/html/installing_an_on-premise_cluster_with_the_agent-based_installer/preparing-to-install-with-agent-based-installer#agent-install-dns-none_preparing-to-install-with-agent-based-installer>`_

**Step 2.3.2.6: Configure Additional Settings**

- Platform: **No platform integration**
- Control Plane: **3 nodes (HA)**
- Networking: **Static IP, bridges, and bonds**

.. image:: _static/images/openshift/Redhat-7.png
:alt: Additional Settings

**Step 2.3.2.7: Configure Static Networking**

- Use **Form view**.
- Example:
* Subnet: ``192.168.116.0/24``
* Gateway: ``192.168.116.253``
* DNS: ``192.168.116.240``

.. image:: _static/images/openshift/Redhat-8.png
:alt: Static Network Configuration

**Step 2.3.2.8: Map Hosts (MAC to IP)**

- Host 1 → 58:9c:fc:01:72:82 → 192.168.116.60
- Host 2 → 58:9c:fc:0e:32:8b → 192.168.116.61
- Host 3 → 58:9c:fc:06:38:a0 → 192.168.116.62
- Host 4 → 58:9c:fc:0c:b0:e1 → 192.168.116.63

.. image:: _static/images/openshift/op-10.png
:alt: Host-Specific Config

.. important::
After modifying network settings, regenerate the Discovery ISO.

**Step 2.3.2.9: Generate Discovery ISO**

- Select **Full image file - self-contained ISO**.
- Paste SSH public key.
- Click **Generate Discovery ISO**.

.. image:: _static/images/openshift/op-12.png
:alt: Generate Discovery ISO

**Step 2.3.2.10: Download ISO in Karios UI**

- Copy wget link from Red Hat console.
- In **Karios → Control Center → ISO tab**, paste link.
- Click **Download**.

.. image:: _static/images/openshift/op-13.png
:alt: Download Discovery ISO

**Step 2.3.2.11: Attach ISO and Boot Nodes**

- Attach ISO to nodes.
- Ensure ISO is primary boot device.
- Power on nodes.

.. image:: _static/images/openshift/op-14.png
:alt: Attach ISO to Nodes

**Step 2.3.2.12: Node Discovery**

- Nodes boot into CoreOS Live.
- Static IPs are applied.
- Nodes appear in OpenShift console.

.. image:: _static/images/openshift/Redhat-10.png
:alt: Node Discovery

**Step 2.3.2.13: Configure Storage**

- Assign persistent volumes.

.. image:: _static/images/openshift/Redhat-11.png
:alt: Storage Configuration

**Step 2.3.2.14: Networking**

- Select **User-Managed Networking** (required).

.. image:: _static/images/openshift/Redhat-13a.png
:alt: Networking Settings

**Step 2.3.2.15: Review and Create**

- Review all configurations.
- Click **Create**.

**Step 2.3.2.16: Monitor Installation**

- Track progress in OpenShift console.
- Configure external load balancers after completion.

.. image:: _static/images/openshift/Redhat-14.png
:alt: Installation Complete

.. image:: _static/images/openshift/Redhat-17.png
:alt: Post Installation

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


Open Source Kubernetes on Ubuntu with Karios
----------------------------------------------


Open source Kubernetes provides the foundational container orchestration platform without vendor-specific additions. Running Kubernetes on **Ubuntu** through Karios gives you complete control over your cluster configuration while benefiting from Ubuntu’s extensive package ecosystem and long-term support options.

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

- Click **Setup Kubernetes** in the Karios UI.

.. image:: _static/images/UbuntuKubernetes/ubuntu-1.png
:alt: Setup Kubernetes Button

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

.. image:: _static/images/UbuntuKubernetes/ubuntu-2.png
:alt: Attach Ubuntu Image

**Step 3.1.3: Add a Bootstrap Node**

- Click **Add Control Node**.

.. image:: _static/images/UbuntuKubernetes/ubuntu-3.png
:alt: Bootstrap Node Config

- Select server, CPU, memory, and disk size.

.. note::
Minimum requirements for the bootstrap/control node:
- 4 vCPUs
- 4 GB memory
- 80 GB disk space

- Optionally, enable tech stack components such as:
- **Prometheus & Grafana** (monitoring)
- **ArgoCD** (GitOps workflows)

.. image:: _static/images/UbuntuKubernetes/ubuntu3a.png
:alt: Bootstrap Node Config

**Step 3.1.4: Add Control Plane Nodes**

- Click **Add Control Plane**.

.. image:: _static/images/UbuntuKubernetes/ubuntu-4.png
:alt: Control Plane Config

- Select server and configure CPU, memory, and disk size.

.. note::
Minimum requirements per control plane node:
- 4 vCPUs
- 4 GB memory
- 80 GB disk space

Recommended: **3 control plane nodes** for high availability.
Control plane nodes must be **odd in number** to prevent split-brain.

.. image:: _static/images/UbuntuKubernetes/ubuntu-5.png
:alt: Control Plane Config

- Save the configuration and add more nodes as required.

.. image:: _static/images/UbuntuKubernetes/ubuntu-6.png
:alt: Control Plane Config

**Step 3.1.5: Add Worker Nodes**

- Click **Add Worker Node**.

.. image:: _static/images/UbuntuKubernetes/ubuntu-7.png
:alt: Worker Node Config

- Select server and configure VM specs.

.. note::
Minimum requirements per worker node:
- 4 vCPUs
- 4 GB memory
- 80 GB disk space

Recommended: At least **1 worker node**.

.. image:: _static/images/UbuntuKubernetes/ubuntu-8.png
:alt: Worker Node Config

- Save and add more workers as needed.

SSH and Join VMs to the Cluster
-----------------------------------

**Step 3.2.1: SSH into the Bootstrap Node**

.. code-block:: bash

ssh <username>@<bootstrap-node-ip>

**Step 3.2.2: Check Cluster Status**

.. code-block:: bash

sudo k8s status

.. image:: _static/images/UbuntuKubernetes/ubuntu-9.png
:alt: Kubernetes Status

**Step 3.2.3: Get Join Token for Control Nodes**

.. code-block:: bash

sudo k8s get-join-token <vmname>

**Step 3.2.4–3.2.6: Join Control Plane Nodes**

- SSH into each control plane node:

.. code-block:: bash

ssh <username>@<control-plane-ip>

- Join the cluster:

.. code-block:: bash

sudo k8s join-cluster --token <token>

Repeat for all control plane nodes.

.. image:: _static/images/UbuntuKubernetes/ubuntu-10.png
:alt: Control Plane Join

**Step 3.2.7: Get Join Token for Worker Nodes**

.. code-block:: bash

sudo k8s get-join-token <vmname> --worker

.. image:: _static/images/UbuntuKubernetes/ubuntu-11.png
:alt: Worker Join Token

**Step 3.2.8–3.2.9: Join Worker Nodes**

- SSH into each worker node:

.. code-block:: bash

ssh <username>@<worker-node-ip>

- Join the cluster:

.. code-block:: bash

sudo k8s join-cluster <token>

Repeat for all worker nodes.

**Step 3.2.10: Verify Cluster High Availability**

.. code-block:: bash

sudo k8s status

.. image:: _static/images/UbuntuKubernetes/ubuntu-13.png
:alt: HA Cluster Status

Accessing the Tech Stack
----------------------------

3.3.1 Prometheus and Grafana
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

**Step 3.3.1.1: Verify Deployment**

.. code-block:: bash

sudo k8s kubectl get pods -n observability
sudo k8s kubectl get svc -n observability

.. image:: _static/images/UbuntuKubernetes/ubuntu-14.png
:alt: Observability Namespace

.. note::
- Namespace: ``observability``
- Grafana → port ``30090``
- Prometheus → port ``30091``

**Step 3.3.1.2: Access Grafana Dashboard**

.. code-block:: none

http://<node-ip>:30090
http://<fqdn>:30090

**Step 3.3.1.3: Access Prometheus Dashboard**

.. code-block:: none

http://<node-ip>:30091
http://<fqdn>:30091

3.3.2 ArgoCD
~~~~~~~~~~~~

**Step 3.3.2.1: Verify Deployment**

.. code-block:: bash

sudo k8s kubectl get pods -n argocd
sudo k8s kubectl get svc -n argocd

.. image:: _static/images/UbuntuKubernetes/ubuntu-15.png
:alt: ArgoCD Namespace

.. note::
- Namespace: ``argocd``
- Dashboard → port ``31800``

**Step 3.3.2.2: Access ArgoCD Dashboard**

.. code-block:: none

http://<node-ip>:31800
http://<fqdn>:31800

Next Steps
--------------

After selecting and deploying your preferred Kubernetes distribution, consider the following operational aspects:

* **Monitoring and Observability**: Implement comprehensive monitoring solutions for both the Karios infrastructure and Kubernetes workloads
* **Backup and Disaster Recovery**: Establish backup procedures for both cluster state and persistent data
* **Security Hardening**: Apply security best practices specific to your chosen Kubernetes distribution
* **Day-2 Operations**: Plan for ongoing maintenance, updates, and scaling operations

For additional support and advanced configuration options, refer to the respective documentation for your chosen Kubernetes distribution and consult the Karios operational guides.