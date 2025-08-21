===================
Integrated Firewall
===================

.. contents:: Table of Contents
   :depth: 3
   :local:

Overview
========

Karios implements a comprehensive integrated firewall solution based on FreeBSD's Packet Filter (PF), delivering enterprise-grade network security with advanced traffic filtering, Network Address Translation (NAT) capabilities, and intelligent traffic redirection. The firewall is seamlessly integrated into the Karios platform architecture, providing customizable security policies that can be tailored to meet specific organizational and regulatory requirements.

**Key Benefits:**

* **Enterprise-Grade Security:** Packet filtering with stateful inspection
* **High Performance:** Optimized for high-throughput environments with minimal latency
* **Scalable Architecture:** Modular design supporting complex network topologies
* **Unified Management:** Single-pane-of-glass management interface
* **Compliance Ready:** Supports various regulatory compliance frameworks

Firewall Architecture
=====================

FreeBSD PF Foundation
---------------------

The integrated firewall leverages FreeBSD's Packet Filter (PF), a robust and battle-tested firewall framework originally developed by OpenBSD. PF provides a solid foundation for implementing sophisticated network security policies at both host and gateway levels.

**Core PF Architecture Components:**

**Stateful Packet Filtering**

* Maintains connection state information for TCP, UDP, and ICMP protocols
* Tracks connection establishment, data transfer, and termination phases
* Automatically permits return traffic for established connections
* Provides protection against connection hijacking and session-based attacks
* Implements adaptive timeout mechanisms for different connection states

**NAT Support**

* Comprehensive Network Address Translation for IPv4 and IPv6
* Source NAT (SNAT) for outbound traffic masquerading
* Destination NAT (DNAT) for inbound service exposure
* Port Address Translation (PAT) for efficient IP address utilization
* Bidirectional NAT for complex routing scenarios

**Traffic Shaping and Quality of Service (QoS)**

* Bandwidth allocation and rate limiting capabilities
* Priority-based traffic queuing and scheduling
* Burst handling and traffic smoothing mechanisms
* Application-aware traffic classification

**Redirection & Port Forwarding**

* Transparent traffic redirection without client configuration
* Advanced port forwarding with protocol-specific handling
* Service load balancing across multiple backend servers

**Table Support**

* Efficient IP address and network range management
* Dynamic table updates without rule recompilation
* Memory-optimized storage for large IP lists
* Support for persistent and temporary table entries
* Integration with external threat intelligence feeds

**Anchors**

* Modular rule organization and management
* Hierarchical rule structure for complex policies
* Runtime rule loading and modification
* Policy inheritance and override mechanisms
* Performance optimization through rule grouping

**Scrubbing and Packet Normalization**

* Fragment reassembly and validation
* TCP flag normalization and invalid flag removal
* TTL (Time To Live) enforcement and adjustment
* Protection against protocol-based evasion techniques

**Logging & Monitoring**

* Comprehensive packet logging with pflog interface
* Integration with system logging infrastructure
* Real-time traffic analysis and reporting
* Security event correlation and alerting
* Performance metrics and statistics collection

Firewall Components
-------------------

**Packet Filter**

The Packet Filter module serves as the core component responsible for processing firewall rules and filtering network traffic. It operates at the kernel level for maximum performance, evaluating packets against defined rulesets, tracking connection states, applying NAT transformations, and enforcing security policies.

.. list-table:: Key Features
   :widths: 30 70
   :header-rows: 1

   * - Feature
     - Description
   * - High-performance Processing
     - Zero-copy mechanisms for packet processing
   * - Multi-threaded Architecture
     - SMP (Symmetric Multi-Processing) system support
   * - Hardware Acceleration
     - Support for cryptographic operations
   * - Memory-mapped I/O
     - Reduced system call overhead
   * - Interrupt Coalescing
     - Improved network performance

**State Table**

The State Table in PF maintains detailed information about active network connections, enabling the firewall to recognize and permit return traffic without re-evaluating rules for every packet.

.. list-table:: State Management Features
   :widths: 30 70
   :header-rows: 1

   * - Feature
     - Description
   * - Connection Tracking
     - State tracking for TCP, UDP, ICMP, and other protocols
   * - Adaptive Timeouts
     - Timeout mechanisms based on connection characteristics
   * - Memory Efficiency
     - Efficient state storage with automatic cleanup
   * - State Synchronization
     - Support for high-availability deployments
   * - Rate Limiting
     - Connection rate limiting and resource protection

**NAT**

Handles all Network Address Translation operations, enabling private IP addresses to communicate with external networks by intelligently rewriting packet headers.

.. list-table:: NAT Engine Capabilities
   :widths: 30 70
   :header-rows: 1

   * - Capability
     - Description
   * - Dynamic Port Allocation
     - Automatic port allocation with collision detection
   * - Session Persistence
     - Maintains session consistency for applications
   * - Protocol-specific NAT
     - Special handling for FTP, SIP, H.323, etc.
   * - Hairpin NAT
     - Support for internal-to-internal communications

**Traffic Redirection (RDR)**

RDR (Redirect) functionality allows incoming traffic to be seamlessly redirected from one IP address and port combination to another.

.. list-table:: RDR Advanced Features
   :widths: 30 70
   :header-rows: 1

   * - Feature
     - Description
   * - Health Monitoring
     - Automatic failover with backend monitoring
   * - Load Balancing
     - Weighted round-robin distribution
   * - Session Affinity
     - Maintain session persistence
   * - Geographic Balancing
     - Location-based load distribution
   * - Real-time Monitoring
     - Live backend server status tracking

**Logging System**

The PF Logging System provides comprehensive insight into firewall activity by capturing packets that match rules configured with the log keyword.

.. list-table:: Logging Capabilities
   :widths: 30 70
   :header-rows: 1

   * - Capability
     - Description
   * - Selective Logging
     - Granular control over logged events
   * - High-performance
     - Minimal performance impact
   * - SIEM Integration
     - Support for Security Information and Event Management
   * - Log Management
     - Rotation and archival policies
   * - Real-time Analysis
     - Live log analysis and alerting

Firewall Configuration
======================

Rule Management
---------------

Network administrators have complete control over firewall rules through an intuitive yet powerful rule management system. The system supports complex rule hierarchies, policy inheritance, and real-time rule modification without service interruption.

**Rule Types:**

.. list-table::
   :widths: 20 80
   :header-rows: 1

   * - Rule Type
     - Description
   * - Filter Rules
     - Determine whether traffic should be allowed or blocked based on comprehensive matching criteria
   * - NAT Rules
     - Define how network addresses should be translated for communication between networks
   * - RDR Rules
     - Handle traffic redirection and port forwarding for seamless service access
   * - Scrub Rules
     - Perform packet normalization and security hardening against evasion techniques

**Rule Configuration Format:**

.. code-block:: none

   General Format:
   action direction [log] on interface proto protocol from source to destination [port port_number] [flags] [state]

**Rule Components:**

.. list-table:: Actions
   :widths: 20 80
   :header-rows: 1

   * - Action
     - Description
   * - pass
     - Allow traffic to proceed
   * - block
     - Silently drop traffic
   * - reject
     - Drop traffic and send rejection response
   * - rdr
     - Redirect traffic to different destination

.. list-table:: Direction Options
   :widths: 20 80
   :header-rows: 1

   * - Direction
     - Description
   * - in
     - Incoming traffic
   * - out
     - Outgoing traffic

.. list-table:: Interface Types
   :widths: 30 70
   :header-rows: 1

   * - Interface Type
     - Examples
   * - Physical
     - em0, igb0
   * - Virtual
     - vlan1, tun0
   * - Groups
     - Interface groups for simplified management

**Common Rule Examples:**

.. code-block:: none

   # Allow all outgoing traffic with state tracking
   pass out on em0 from any to any keep state

   # Block all incoming traffic by default
   block in all

   # Allow SSH access from specific IP range
   pass in on em0 proto tcp from 192.168.1.0/24 to any port 22 keep state

   # Redirect HTTP traffic to internal server
   rdr on em0 proto tcp from any to 203.0.113.10 port 80 -> 192.168.1.10 port 8080

   # Log all dropped packets for security analysis
   block log all

   # Allow HTTPS with stateful inspection
   pass in on em0 proto tcp from any to any port 443 keep state

   # Allow DNS queries with UDP and TCP support
   pass out on em0 proto udp from any to any port 53 keep state
   pass out on em0 proto tcp from any to any port 53 keep state

   # Block and log suspicious port scanning attempts
   block log quick on em0 proto tcp from any to any port 1:1023 flags S/SA

   # Allow VPN traffic (OpenVPN)
   pass in on em0 proto udp from any to any port 1194 keep state
   pass in on em0 proto tcp from any to any port 1194 keep state

Policy Management
-----------------

**Security Policies:**

**Default Policies**

System-wide default security policies establish the baseline security posture for the entire network infrastructure.

.. list-table:: Policy Components
   :widths: 30 70
   :header-rows: 1

   * - Component
     - Description
   * - Deny-all Inbound
     - Default deny policy with explicit allow rules
   * - Allow-all Outbound
     - Default allow policy with restriction exceptions
   * - State Tracking
     - Automatic tracking for established connections
   * - Default Timeouts
     - Connection-type specific timeout values
   * - Fallback Rules
     - Rules for unmatched traffic scenarios

**Custom Policies**

User-defined security policies allow organizations to implement specific security requirements.

.. list-table:: Custom Policy Features
   :widths: 30 70
   :header-rows: 1

   * - Feature
     - Description
   * - Application Control
     - Application-specific traffic management
   * - Time-based Access
     - Schedule-based access restrictions
   * - User/Group Policies
     - Identity-based access control
   * - Geographic Controls
     - Location-based access restrictions
   * - Protocol Enhancements
     - Protocol-specific security features

NAT Configuration
=================

Network Address Translation
---------------------------

The comprehensive NAT functionality integrated with FreeBSD PF provides sophisticated address translation capabilities essential for modern network architectures.

**NAT Types:**

**Source NAT (SNAT)**

Source NAT rewrites the source IP address of outbound traffic, typically replacing private IP addresses with public IP addresses.

.. code-block:: none

   # Basic SNAT for internet access
   nat on em0 from 192.168.1.0/24 to any -> (em0)

   # SNAT with specific public IP
   nat on em0 from 192.168.1.0/24 to any -> 203.0.113.10

   # SNAT with port range specification
   nat on em0 from 192.168.1.0/24 to any port 1024:65535 -> (em0) port 10000:20000

**Destination NAT (DNAT)**

Destination NAT modifies the destination IP address of incoming traffic, redirecting it to internal servers or services.

.. code-block:: none

   # Basic port forwarding
   rdr on em0 proto tcp from any to 203.0.113.10 port 80 -> 192.168.1.10 port 8080

   # Multiple service redirection
   rdr on em0 proto tcp from any to 203.0.113.10 port { 80, 443 } -> 192.168.1.10

   # Load balancing with round-robin
   rdr on em0 proto tcp from any to 203.0.113.10 port 80 -> { 192.168.1.10, 192.168.1.11, 192.168.1.12 } round-robin

**Bidirectional NAT**

Performs both Source NAT and Destination NAT simultaneously for seamless bidirectional communication.

**Port Address Translation (PAT)**

Maps multiple private IP addresses to a single public IP by assigning unique port numbers to each session.

.. code-block:: none

   # PAT with automatic port assignment
   nat on em0 from 192.168.0.0/16 to any -> (em0)

   # PAT with specific port ranges
   nat on em0 from 192.168.1.0/24 to any -> (em0) port 20000:30000
   nat on em0 from 192.168.2.0/24 to any -> (em0) port 30001:40000

NAT Pool Management
-------------------

**Address Pool Configuration:**

.. list-table:: Pool Types
   :widths: 20 80
   :header-rows: 1

   * - Pool Type
     - Features
   * - Static Pools
     - Fixed address mappings, predictable assignments, session persistence
   * - Dynamic Pools
     - Automatic assignment, efficient utilization, overflow handling
   * - Failover Pools
     - Backup pools, automatic activation, health monitoring

Scrub Rules
===========

Scrub Rules in PF perform critical packet normalization functions, adjusting and validating incoming packets to eliminate ambiguities and defend against sophisticated evasion techniques.

**Key Features of Scrub Rules:**

.. list-table::
   :widths: 30 70
   :header-rows: 1

   * - Feature
     - Description
   * - Packet Normalization
     - Rewrites packets to standardized format
   * - Fragment Reassembly
     - Reassembles fragmented IP packets
   * - Invalid Flag Removal
     - Clears illegal TCP flag combinations
   * - Timeout Enforcement
     - Sets limits on packet retention

**Scrub Rule Examples:**

.. code-block:: none

   # Basic packet scrubbing for all traffic
   scrub in all

   # Comprehensive scrubbing with fragment reassembly
   scrub in all fragment reassemble

   # Remove Don't Fragment bit to prevent PMTU attacks
   scrub in all no-df

   # Limit TCP Maximum Segment Size
   scrub on em0 all max-mss 1400

   # Enforce minimum TTL to prevent spoofing
   scrub in all min-ttl 32

   # Advanced scrubbing with multiple options
   scrub in on em0 all fragment reassemble no-df max-mss 1460 min-ttl 64

Traffic Redirection (RDR)
=========================

RDR Configuration
-----------------

Traffic redirection and port forwarding capabilities using FreeBSD PF provide sophisticated traffic management for complex network topologies.

**Redirection Types:**

**Port Forwarding**

Forward specific ports from external interfaces to internal servers.

.. code-block:: none

   # Forward HTTP traffic to internal web server
   rdr on em0 proto tcp from any to any port 80 -> 192.168.1.10 port 8080

   # Forward multiple ports to same server
   rdr on em0 proto tcp from any to any port { 80, 443 } -> 192.168.1.10

   # Forward with source IP restriction
   rdr on em0 proto tcp from 203.0.113.0/24 to any port 22 -> 192.168.1.100 port 22

**Load Balancing**

Distribute traffic across multiple backend servers.

.. code-block:: none

   # Round-robin load balancing
   rdr on em0 proto tcp from any to any port 80 -> { 192.168.1.10, 192.168.1.11, 192.168.1.12 } round-robin

   # Weighted load balancing
   rdr on em0 proto tcp from any to any port 80 -> { 192.168.1.10 weight 3, 192.168.1.11 weight 2, 192.168.1.12 weight 1 }

   # Sticky sessions with source hashing
   rdr on em0 proto tcp from any to any port 80 -> { 192.168.1.10, 192.168.1.11, 192.168.1.12 } source-hash

Firewall Customization
======================

User-Defined Rules
------------------

Network administrators can fully customize firewall behavior through comprehensive rule customization capabilities.

**Advanced Rule Features:**

.. list-table::
   :widths: 30 70
   :header-rows: 1

   * - Feature
     - Description
   * - Complex Matching
     - IP ranges, port combinations, protocol attributes
   * - Custom Actions
     - Traffic handling, packet tagging, queue assignment
   * - Rule Ordering
     - Precedence control, quick rules, conditional application
   * - Validation
     - Syntax checking, error detection, correction suggestions

Advanced Configuration
----------------------

**Advanced Features:**

**Traffic Shaping**

Comprehensive bandwidth management and Quality of Service implementation.

* Hierarchical Fair Service Curve (HFSC) algorithm
* Class-based queueing with priority scheduling
* Bandwidth allocation and rate limiting
* Burst handling and traffic smoothing
* Real-time traffic analysis and adjustment

**Connection Limits**

Implement connection rate limiting and resource protection.

.. code-block:: none

   # Limit concurrent connections per source IP
   pass in on em0 proto tcp from any to any port 80 keep state (max-src-conn 10)

   # Limit new connections per second
   pass in on em0 proto tcp from any to any port 80 keep state (max-src-conn-rate 5/1)

   # Limit states per source
   pass in on em0 proto tcp from any to any port 80 keep state (max-src-states 50)

Monitoring and Logging
======================

Firewall Monitoring
-------------------

Real-time firewall monitoring capabilities provide comprehensive visibility into network traffic patterns.

.. list-table:: Monitoring Features
   :widths: 30 70
   :header-rows: 1

   * - Feature
     - Description
   * - Connection Tracking
     - Real-time monitoring of active connections
   * - Bandwidth Monitoring
     - Traffic bandwidth utilization analysis
   * - State Table Monitoring
     - State table utilization and performance

Logging and Analysis
--------------------

Comprehensive logging and analysis capabilities using FreeBSD's advanced logging infrastructure.

.. list-table:: Logging Options
   :widths: 30 70
   :header-rows: 1

   * - Log Type
     - Description
   * - Packet Logging
     - Selective packet capture and analysis
   * - Connection Logging
     - Session establishment and termination tracking
   * - Rule Logging
     - Rule match logging and performance metrics
   * - Security Logging
     - Security event logging and correlation

**Log Analysis:**

* **Traffic Analysis:** Network traffic pattern analysis and statistics
* **Performance Analysis:** Firewall performance monitoring and optimization
* **Reporting:** Security reports, compliance auditing, executive dashboards

Integration with Karios Network
===============================

Network Component Integration
-----------------------------

The integrated firewall seamlessly integrates with all Karios network components.

**Integration Features:**

**VLAN Support in PF Rule Set**

FreeBSD's PF natively supports VLAN interfaces, enabling administrators to define and enforce filtering rules based on virtual network segmentation.

.. list-table:: VLAN Integration Features
   :widths: 30 70
   :header-rows: 1

   * - Feature
     - Description
   * - Per-VLAN Policies
     - VLAN-specific security policies
   * - Inter-VLAN Control
     - Communication control between VLANs
   * - Access Restrictions
     - VLAN-specific access controls
   * - Microsegmentation
     - Fine-grained network isolation
   * - Multi-tenant Support
     - Isolated tenant environments

**VXLAN and EVPN Support**

PF can filter traffic on VXLAN interfaces, allowing rule enforcement on encapsulated overlay traffic.

.. list-table:: VXLAN Integration Capabilities
   :widths: 30 70
   :header-rows: 1

   * - Capability
     - Description
   * - Tunnel Filtering
     - VXLAN tunnel traffic filtering
   * - VTEP Security
     - VTEP-level policy enforcement
   * - Overlay Controls
     - Overlay network security
   * - Underlay Protection
     - Underlay traffic security
   * - EVPN Security
     - Control-plane protection

Centralized Management
----------------------

**Management Integration:**

* **Unified Interface:** Single-pane-of-glass management for network and firewall operations
* **Policy Synchronization:** Automated policy synchronization across all components
* **Centralized Logging:** Unified logging infrastructure for comprehensive visibility

Conclusion
==========

The Karios Integrated Firewall represents a comprehensive enterprise-grade security solution that combines the power and flexibility of FreeBSD's Packet Filter with modern network security requirements. Through its sophisticated architecture, comprehensive feature set, and seamless integration with the Karios platform, organizations can implement robust network security policies that protect against evolving threats while maintaining optimal performance and usability.

The firewall's modular design, extensive customization capabilities, and centralized management interface make it an ideal solution for organizations of all sizes, from small businesses to large enterprises with complex network infrastructures. With its emphasis on performance, scalability, and security, the Karios Integrated Firewall provides the foundation for a secure and efficient network environment.
