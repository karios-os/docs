PF Documentation
================

What is PF (Packet Filter)?
---------------------------

Think of a firewall like a security guard at the entrance of a building (your network). It checks every visitor (data packet) to decide who gets in or out based on rules you set. PF (Packet Filter) is a powerful and flexible firewall used on systems like FreeBSD to:

* Protect your computer or network from hackers
* Control which websites or services your network can access
* Hide your private network behind a single public IP address (like a phone number for your network)
* Prioritize important traffic, like video calls, over less urgent downloads

PF, short for Packet Filter, is a stateful firewall originally developed for OpenBSD and later ported to FreeBSD, among other systems. It enables administrators to filter network traffic, perform NAT, shape bandwidth, prioritize packets, and more.

Key Features
~~~~~~~~~~~~

**Stateful filtering**
    Tracks connection states automatically (e.g., TCP session states)

**Network Address Translation (NAT)**
    Allows private networks to share a public IP

**Traffic normalization and scrub**
    Cleans malformed packets and reassembles fragments

**Tables**
    Maintain sets of addresses for efficient matching (e.g., blacklists)

**Logging**
    Via pflog, PF can log per-rule packet activity for auditing and troubleshooting

**Optimization**
    PF internally optimizes rule lookup for performance

**Key Terms Explained**

**Stateful Filtering**
    PF remembers connections, like knowing someone who entered your building so they can leave without being checked again

**NAT (Network Address Translation)**
    Lets multiple devices share one public IP address, like a single phone number for an entire office

**Scrub**
    Fixes messy or broken data packets to keep your network running smoothly

**Tables**
    Lists of IP addresses (like a guest list) that PF can quickly check to block or allow traffic

PF History & Evolution
~~~~~~~~~~~~~~~~~~~~~~

* PF was introduced in December 2001 in OpenBSD 3.0, replacing IPFilter due to licensing issues
* The initial implementation was by Hartmeier; later enhancements were led by Henning Brauer and Ryan McBride
* PF is now a component not just of OpenBSD but also FreeBSD, NetBSD, DragonFlyBSD, and more

PF: High-Level Architecture
---------------------------

**Kernel Module**
    Handles packet inspection and filtering at OS level

**User Tool (pfctl)**
    Used to control the firewall—start/stop/status/etc.

**Ruleset File (/etc/pf.conf)**
    Plain-text configuration file defining macros, tables, filter rules, and options

Enabling PF on FreeBSD
~~~~~~~~~~~~~~~~~~~~~~

To activate PF at boot and enable logging:

.. code-block:: bash

   sysrc pf_enable="YES"
   sysrc pf_rules="/etc/pf.conf"
   sysrc pflog_enable="YES"
   sysrc pflog_logfile="/var/log/pflog"
   service pf start

.. note::
   These commands ensure PF runs on startup, uses /etc/pf.conf, and logs events to /var/log/pflog

PF Rule Processing Order & Syntax
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

PF processes configuration statements in this sequence:

.. code-block:: text

   [Packet Arrives] → [Options] → [Scrub (Clean Packet)] → [Queueing (Prioritize)] → [Translation (NAT)] → [Filtering (Allow/Block)] → [Packet Allowed or Blocked]

**Options**
    Sets the overall behavior, like what to do with blocked packets

**Scrub**
    Cleans up messy packets

**Queueing**
    Decides which traffic gets priority (e.g., video calls over downloads)

**Translation**
    Rewrites packet addresses (e.g., NAT for private IPs)

**Filtering**
    Decides whether to allow or block the packet based on your rules

**quick directive**
    Stops rule processing upon match, even if later rules would apply

**Default "last match wins"**
    Without quick, PF evaluates all rules, and the last matching one determines action

pfctl Command Summary
^^^^^^^^^^^^^^^^^^^^^^

**Enabling and Disabling PF**

.. code-block:: bash

   pfctl -e        # Enable PF
   pfctl -d        # Disable PF

Loading/Reloading Rulesets
^^^^^^^^^^^^^^^^^^^^^^^^^^

.. code-block:: bash

   pfctl -f /etc/pf.conf        # Load rules from file
   pfctl -n -f /etc/pf.conf     # Test rules (syntax only, do not apply)
   pfctl -nf /etc/pf.conf       # Another way to test syntax

Checking PF Status
^^^^^^^^^^^^^^^^^^^

.. code-block:: bash

   pfctl -s info    # General PF info
   pfctl -s rules   # Current firewall rules
   pfctl -s nat     # NAT rules
   pfctl -s state   # Active state entries (connections)
   pfctl -s queue   # ALTQ traffic shaping queues
   pfctl -sr        # Rules in compact form
   pfctl -vv -sr    # Verbose rule details

Flushing/Resetting
^^^^^^^^^^^^^^^^^^

.. code-block:: bash

   pfctl -F all      # Flush all rules, NAT, states, tables, queues
   pfctl -F rules    # Flush firewall rules only
   pfctl -F nat      # Flush NAT rules
   pfctl -F state    # Clear state table
   pfctl -F tables   # Clear all tables
   pfctl -F queue    # Clear all queues

Table Management (Dynamic IP Lists)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. code-block:: bash

   pfctl -T show -t blocked_ips                      # View table contents
   pfctl -T add -t blocked_ips 192.168.1.100         # Add IP
   pfctl -T delete -t blocked_ips 192.168.1.100      # Remove IP
   pfctl -T flush -t blocked_ips                     # Clear table

Logging & Debugging
^^^^^^^^^^^^^^^^^^^^^

.. code-block:: bash

   pfctl -x loud           # Enable verbose logging
   pfctl -s log            # View logged packets
   tcpdump -i pflog0       # Real-time monitoring of PF logs

pf.conf File Anatomy
~~~~~~~~~~~~~~~~~~~~~

The ruleset file (``/etc/pf.conf``) is divided into key sections:

1. Macros
^^^^^^^^^

Used to define variables:

.. code-block:: 

   ext_if = "igb0"
   services = "{ ssh, http, https }"

2. Tables
^^^^^^^^^

Efficient IP lists:

.. code-block::

   table <blocked> persist

3. Options
^^^^^^^^^^

Set default behavior:

.. code-block:: 

   set block-policy drop
   set loginterface $ext_if

4. Filter Rules
^^^^^^^^^^^^^^^

.. code-block:: 

   block all
   pass out all keep state
   pass in on $ext_if proto tcp from any to any port 22 keep state

Basic "Default Deny" Setup
^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. code-block:: 

   set skip on lo
   block all
   pass out inet proto tcp from any to any port { 80 443 } keep state

.. tip::
   This configuration provides a secure default-deny stance while allowing essential outbound web traffic.

Managing ICMP Traffic in PF
~~~~~~~~~~~~~~~~~~~~~~~~~~~

What is ICMP?
^^^^^^^^^^^^^

The Internet Control Message Protocol (ICMP) is vital for network diagnostics. Tools like ping and traceroute use it to:

* Report unreachable destinations
* Discover path MTU
* Confirm whether hosts are reachable

However, allowing all ICMP traffic can pose security risks, as attackers may exploit ICMP to:

* Map out your network
* Launch denial-of-service or spoofing attacks

Basic Secure ICMP Rules
^^^^^^^^^^^^^^^^^^^^^^^

To allow outbound ICMP for local diagnostics but block unsolicited external probes:

.. code-block:: 

   pass inet proto icmp from $ext_if to any keep state
   pass inet proto icmp from any to $ext_if keep state

.. warning::
   Unrestricted ICMP access can expose your network to reconnaissance attacks. Always implement appropriate filtering rules.

Overview of pf.conf Usage in the Application (Karios)
-----------------------------------------------------

Why PF Matters for Karios
~~~~~~~~~~~~~~~~~~~~~~~~~~

PF ensures Karios only allows trusted traffic, like customer visits to your web app, while blocking hackers or malicious requests. It also:

* Hides your internal network using NAT
* Prioritizes important traffic, like API calls over background tasks

Key Features in Karios's PF Setup
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

**External Interface**
    Karios uses a network interface (like igb0) to talk to the internet. PF rules are tied to this interface

**SSH Access**
    Allows secure remote login for admins, but only on port 22

**Web Services**
    Opens ports like 80 (HTTP) and 443 (HTTPS) for web dashboards or APIs

**VXLAN (Virtual Networking)**
    Supports virtual networks, like connecting multiple servers securely

**Anti-Spoofing**
    Blocks fake traffic pretending to come from your network

**Blacklisting**
    Stops known bad IPs (e.g., hackers trying to brute-force your SSH)

Configuration Concepts
~~~~~~~~~~~~~~~~~~~~~~

Our application uses Packet Filter (PF) as a host-based firewall, primarily to control and secure network traffic for a server or appliance. The configuration ensures both tight inbound control and essential service accessibility, with attention to anti-spoofing, NAT, and layered ICMP/TCP/UDP filtering.

1. External Interface Declaration
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Each config declares an ``ext_if`` variable (external interface). This improves portability and simplifies interface-based rules:

.. code-block:: 

   ext_if = "interface-name"

Basic Defaults and Optimizations
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Rules begin with best-practice global options:

* **Block policy**: either return or drop (depending on config)
* **Scrubbing**: enabled to normalize and reassemble fragmented packets
* **Loopback traffic**: excluded via ``set skip on lo``
* **TCP timeout and OS fingerprinting**: performance and security optimized

SSH Access
^^^^^^^^^^^

Inbound SSH is permitted using:

.. code-block:: 

   pass in proto tcp from any to any port ssh keep state

.. note::
   This allows secure remote administration.

Web & App Services (HTTP, HTTPS, etc.)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

A defined set of TCP ports is opened to the world for accessing:

* Web interfaces (standard and custom HTTP/S)
* Admin panels or dashboards
* APIs and microservices
* Database ports for external or internal DB access

These port ranges include both:

* **Standard ports**: HTTP, HTTPS, FTP
* **Custom ranges**: likely for proprietary services, internal dashboards, developer tools

.. note::
   The exact ports are generalized but serve app-layer services crucial to the application stack.

Example ports: ``{ 80, 443, 8080, ... }``

UDP Traffic
^^^^^^^^^^^^

A single UDP port (commonly used for encapsulation protocols like VXLAN) is allowed, indicating:

* Use of VXLAN-based tunneling or overlay networking
* Possibly container networking or virtualized infrastructure

.. code-block:: 

   pass proto udp to port <port>

VXLAN Tunnel ICMP
^^^^^^^^^^^^^^^^^^

Separate rules for allowing ICMP over VXLAN interfaces signal:

* Health checks or keep alives over virtual networking layers
* Secure and monitorable overlay networking

.. code-block:: 

   pass in  quick on vxlan proto icmp
   pass out quick on vxlan proto icmp

Outbound Rules
^^^^^^^^^^^^^^

Outbound traffic is generally open with keep state, which:

* Allows connections initiated by the system (e.g., API calls, updates)
* Tracks session state for connection security

Anti-Spoofing
~~~~~~~~~~~~~~

Used in all samples:

.. code-block:: 

   antispoof for $ext_if inet

.. important::
   This prevents IP spoofing by validating that incoming packets claiming to originate from internal addresses are not entering from the outside.

NAT & Port Redirection (Advanced Sample)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

One of the configs introduces:

* **NAT rules** to translate internal IPs to the external interface IP
* **Port redirection** for FTP traffic to a proxy
* **Anchor usage** for modular rule insertion (ftp-proxy/)
* **Include temp config files** to extend or toggle features dynamically

This implies:

* Some services may operate behind NAT
* FTP services are wrapped or filtered for security
* Modular, reloadable configs are used for maintenance or toggles

Blacklisting and Blocking
~~~~~~~~~~~~~~~~~~~~~~~~~

Blacklists and tables are used to group blocked addresses. SSH brute-force protection is enforced via the ``<sshguard>`` table, blocking known bad actors:

.. code-block:: 

   block in quick from <sshguard> to any

Simple PF UI Examples and Explanations
--------------------------------------

.. note::
   Drag and drop functionality is available to move and order the rules. New added rules are highlighted. Select, Reset, Delete functionalities are also available for each rule line.

External Interface Configuration
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. code-block:: 

   ext_if="bge0"

.. tip::
   Defines the external interface variable (your network card that connects to the outside world). Without this, PF won't know which interface the rules apply to.

.. note::
   Interface names may vary: ``bge0``, ``igb1``, ``igc2`` depending on your hardware.

Global Set Options
~~~~~~~~~~~~~~~~~~~

**Block Policy Configuration**

.. code-block:: 

   set block-policy return
   set block-policy drop

**return**
    Send back an ICMP/RESET so the sender knows the packet was blocked

**drop**
    Silently discard the packet (looks like the machine doesn't exist)

.. tip::
   Use ``drop`` for stealth; use ``return`` for friendlier diagnostics.

**Traffic Scrubbing**

.. code-block:: 

   scrub in ... fragment reassemble

* Normalizes traffic, cleans oddities, and reassembles fragmented packets
* Prevents attackers from sneaking past firewall rules using fragmented packets

**Loopback Interface Skip**

.. code-block:: 

   set skip on lo

.. important::
   Skips filtering on the loopback interface (lo, 127.0.0.1). Ensures internal services can talk to each other freely.

**Ruleset Optimization**

.. code-block:: 

   set ruleset-optimization basic
   set ruleset-optimization normal

* Optimizes rule handling for speed
* PF processes rules faster but behavior doesn't change

**TCP Timeout Configuration**

.. code-block:: 

   set timeout { tcp.closing 60, tcp.established 7200 }

* Adjusts how long PF keeps TCP states open
* Helps free resources if connections die

**OS Fingerprinting**

.. code-block:: 

   set fingerprints "/etc/pf.os"

* Enables OS fingerprinting file
* Useful for detecting what OS a remote machine runs

Basic Traffic Rules
-------------------

ICMP Traffic
~~~~~~~~~~~~~

.. code-block:: 

   pass in quick on $ext_if proto icmp ...
   pass out quick on $ext_if proto icmp ...

* Allows ping requests (ICMP) in and out
* Needed for diagnostics (ping). If removed, pings won't work

Default Blocking
~~~~~~~~~~~~~~~~

.. code-block:: 

   block in all

.. warning::
   Default block for all incoming traffic. Ensures nothing enters unless explicitly allowed.

Outbound Connections
~~~~~~~~~~~~~~~~~~~~

.. code-block:: 

   pass out quick keep state

* Allows outbound connections and tracks them so replies are auto-allowed
* Without it, you couldn't browse the web or fetch updates

Anti-Spoofing Protection
~~~~~~~~~~~~~~~~~~~~~~~~

.. code-block:: 

   antispoof for $ext_if inet

* Drops packets pretending to come from your own interface/IP
* Prevents basic spoofing attacks

SSH Rules
---------

Basic SSH Access
~~~~~~~~~~~~~~~~

.. code-block:: 

   pass in inet proto tcp from any to any port ssh flags S/SA keep state
   pass in proto tcp from any to any port 22 keep state

* Opens SSH (port 22) for remote logins
* Without it, you couldn't SSH into the machine

.. warning::
   **Risk**: If left open to the world, bots will constantly try to brute-force login.

SSH Brute-Force Protection
~~~~~~~~~~~~~~~~~~~~~~~~~~

.. code-block:: 

   block in quick from <sshguard>

* Uses a dynamic table (``<sshguard>``) that lists attackers flagged by sshguard
* Helps block brute-force SSH attackers automatically

Application Ports
-----------------

**Common Port Examples**

**Web Services**
    * ``{80, 443}`` → Web (HTTP, HTTPS)

**Database**
    * ``5432`` → PostgreSQL database

**Remote Desktop**
    * ``5900:5910`` → VNC remote desktop range

**Web Applications**
    * ``8080:8086`` → Common for web apps/test servers
    * ``6900:7900`` → App services
    * ``3000`` → Development dashboards (Node apps)

**Monitoring**
    * ``9090, 9100`` → Monitoring tools (Prometheus, printers)

.. note::
   Each ``pass in proto tcp ...`` line opens those services. If included, anyone can connect from outside unless additional restrictions are added (like ``<trusted_nets>``).

UDP Rules
----------

VXLAN Support
~~~~~~~~~~~~~~

.. code-block:: 

   pass proto udp to port 4789

* Allows VXLAN encapsulation traffic (used for virtual networks)
* Needed for overlay networking. Without it, VXLAN tunnels break

VXLAN ICMP Rules
~~~~~~~~~~~~~~~~~

.. code-block:: 

   pass in quick on vxlan proto icmp
   pass out quick on vxlan proto icmp

* Allows pinging across VXLAN tunnels
* Needed for testing overlay connectivity

NAT / Redirect Rules
--------------------

Standard NAT Configuration
~~~~~~~~~~~~~~~~~~~~~~~~~~

.. code-block:: 

   nat on igc2 inet from !(igc2) -> (igc2:0)

* Standard NAT (masquerading). Makes internal traffic appear as if from firewall's IP
* Needed for LAN → Internet access

Port Redirection
~~~~~~~~~~~~~~~~~

.. code-block:: 

   rdr pass on igc2 proto tcp from any to any port ftp -> 127.0.0.1 port 8021

* Redirects FTP traffic to a local proxy on port 8021
* Used for secure FTP proxying

Tables
------

Trusted Networks
~~~~~~~~~~~~~~~~

.. code-block:: 

   table <trusted_nets> persist { 192.168.116.0/24 }

* Creates a whitelist of trusted networks
* Can be used in rules to allow access only from trusted IPs

Blacklist Table
~~~~~~~~~~~~~~~~

.. code-block:: 

   table <blacklist> persist { }

* Holds IPs you want permanently blocked
* Add IPs here to block bad actors

SSH Guard Table
~~~~~~~~~~~~~~~~

.. code-block:: 

   table <sshguard> persist

* Managed by sshguard. Stores attacking IPs automatically
* Works together with the ``block in quick from <sshguard>`` rule

Include Rules
~~~~~~~~~~~~~

Modular Configuration
^^^^^^^^^^^^^^^^^^^^^

.. code-block:: 

   include "/tmp/ftp-proxy_false.conf"
   include "/tmp/icmp.conf"

* Includes additional rules from other files
* Keeps configs modular and easier to manage

.. tip::
   Using include statements allows you to organize complex rulesets into manageable, purpose-specific files.

FAQ Section
-----------

**Q: Will PF block everything by default?**
    A: No, only if your config says ``block all``. You must explicitly define what to allow.

**Q: Does PF block traffic immediately after editing pf.conf?**
    A: No. You must reload with ``pfctl -f /etc/pf.conf``.

**Q: What is keep state?**
    A: It means PF remembers a connection, so return traffic is automatically allowed.

Common Mistakes & Gotchas
-------------------------

.. warning::
   **Common Configuration Errors:**

   * Forgetting to enable PF after editing ``/etc/pf.conf``
   * Locking yourself out by misconfiguring SSH access
   * Syntax errors in ``pf.conf`` that silently fail to load the rule set
   * Not using ``quick`` when needed (can lead to unexpected rule matches)
   * Forgetting to add ``keep state`` for stateful protocols like TCP

Additional References
---------------------

* `OpenBSD PF FAQ <https://www.openbsd.org/faq/pf/>`_
* `ZenArmor FreeBSD Firewall Configuration <https://www.zenarmor.com/docs/network-security-tutorials/freebsd-firewall-configuration-with-pf>`_