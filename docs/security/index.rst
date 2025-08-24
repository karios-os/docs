================
Karios Security
================

.. contents:: Table of Contents
   :depth: 3
   :local:

Overview
========

Karios Security provides comprehensive security management and threat protection for your hyper-converged infrastructure. This integrated security solution delivers advanced vulnerability scanning, compliance monitoring, and automated remediation specifically designed for FreeBSD-based bare metal and virtualized environments. Built around the KariOS SHIELD scanning platform with the KariOS Enhanced v1.1.0 engine, it offers security assessment and management capabilities.

**SCAP Alignment (OVAL/XCCDF):**

Karios evaluates systems using **XCCDF profiles** that drive **OVAL** checks for Karios Custom Security Profiles. The engine executes SCAP-style evaluations (pass/fail/error/not-checked), records compliance status and rule counts per run, and generates HTML/PDF reports.  

* **Current release:** SCAP content execution and profile-based evaluation (OVAL + XCCDF).  

**Key Features:**

* **Comprehensive Vulnerability Scanning:** Vulnerability detection using proprietary and public CVE databases
* **Security Dashboard:** Centralized security posture monitoring and risk assessment
* **Compliance Management:** **SCAP-aligned** compliance monitoring and gap analysis (OVAL/XCCDF-driven)
* **Automated Remediation:** Limited automated fixes for FreeBSD benchmark violations (expanding in future releases)
* **Threat Intelligence Integration:** Continuous threat landscape monitoring and analysis
* **Historical Tracking:** Security trends and improvement metrics over time

Security Center Dashboard
=========================
The Security Center serves as the central hub for managing and monitoring your infrastructure's security posture. It provides real-time visibility into vulnerabilities, compliance status, and remediation efforts.


Default View - Real-Time Security Snapshot
-------------------------------------------

The Security Center provides a centralized real-time view of your infrastructure's security posture. The dashboard is divided into three main panels:



**Left Panel - Risk Summary:**

Displays critical security metrics at a glance:

.. list-table::
   :widths: 30 70
   :header-rows: 1

   * - Field
     - Description
   * - Risk Percentage
     - Current security risk as a percentage (lower values indicate better security)
   * - System Status
     - Overall system health status based on latest scan results (e.g., "Needs Attention")

**Center Panel - System Information:**

Provides detailed system and scanning engine information:

.. list-table::
   :widths: 30 70
   :header-rows: 1

   * - Field
     - Description
   * - Scan Engine Version
     - Current scanning engine version (KariOS Enhanced v1.1.0)
   * - Last Scan Status
     - Completion status of most recent scan (COMPLETED/FAILED)
   * - Top Risk Category
     - Primary vulnerability category contributing to current risk
   * - Newest CVE
     - Most recently detected CVE identifier
   * - Last Remediation
     - Time elapsed since last vulnerability remediation

**Right Panel - Vulnerability Breakdown:**

Shows vulnerability distribution by category:

.. list-table::
   :widths: 20 80
   :header-rows: 1

   * - Category
     - Description
   * - CAT I
     - Critical vulnerabilities with high impact and immediate attention required
   * - CAT II
     - High severity issues requiring prompt attention
   * - CAT III
     - Medium - Low priority or informational issues for future consideration
   * - Total
     - Complete count of all identified vulnerabilities

Vulnerability Management
========================

Vulnerability Classification and Tracking
------------------------------------------

**Vulnerability Information Display:**

.. list-table::
   :widths: 25 75
   :header-rows: 1

   * - Field
     - Description
   * - Internal ID
     - Tracker ID for each vulnerability/misconfiguration
   * - Type
     - Vulnerability (or) Misconfiguration
   * - Title  
     - Vulnerability (or) Misconfiguration information
   * - Description
     - Detailed explanation of the issue
   * - Rationale
     - Explanation of the issue and its impact
   * - CVE-ID
     - Common Vulnerabilities and Exposures identifier 
   * - CWE-ID
     - Common Weakness Enumeration identifier 
   * - CVSS Score
     - Severity score from 0.0 to 10.0
   * - Severity Level
     - Critical, High, Medium, or Low classification
   * - Remediate
     - Remediation to fix the vulnerability


Metrics View - Scan History & Trends
-------------------------------------

Access detailed metrics and historical analysis by clicking the Metrics dropdown, providing comprehensive security posture tracking over time.

**Security Scan History:**

Track and analyze vulnerability trends across multiple scans with historical data showing vulnerability counts by category over time.

**Previous Scan Details:**

.. list-table::
   :widths: 30 70
   :header-rows: 1

   * - Field
     - Description
   * - Scan ID
     - Unique identifier for each scan  
   * - Date & Target
     - Timestamp and target of the scan
   * - Status
     - Completion status (COMPLETED/FAILED)
   * - Risk Score
     - Risk score calculated from scan findings
   * - Vulnerabilities
     - Total vulnerabilities found during the scan
   * - Duration
     - Time taken to complete the scan
   * - Reports
     - Links to detailed HTML/PDF reports for the scan          

**Recent Changes:**

Monitor security posture changes between scans:

.. list-table::
   :widths: 30 70
   :header-rows: 1

   * - Field
     - Description
   * - New Vulnerabilities
     - Number of new issues detected compared to last scan
   * - Resolved Issues
     - Number of previously identified issues now resolved
   * - Improving Controls
     - Security controls showing improvement in current scan
   * - Declining Controls
     - Security controls showing degradation since last scan

Vulnerability Scanning
======================

Scan Types and Execution
------------------------

KariOS SHIELD provides one scan option currently, the Default Scan covering all the critical security checks in a SCAP Compliant Process:

Default Scan (Current)
^^^^^^^^^^^^^^^^^^^^^^

* **Duration:** 3-5 minutes
* **Coverage:** Most critical security items
* **Scope:** Packages, kernel configurations, basic file permissions
* **Use Case:** Rapid security assessment and regular monitoring

Scan Process and Components
---------------------------

**What Gets Checked:**

.. list-table::
   :widths: 30 70
   :header-rows: 1

   * - Component
     - Description
   * - System Packages
     - Installed software versions and known vulnerabilities
   * - Kernel Configuration
     - Security-related kernel parameters and loaded modules
   * - File Permissions
     - Basic system file and directory access controls
   * - User Accounts
     - Account security, privileges, and authentication settings
   * - Security Policies
     - System security policy compliance and configurations

**Behind-the-Scenes Process:**

Pre-Scan Setup
^^^^^^^^^^^^^^

* No Pre Scan Setup is required, The initial Karios installation takes care of the prerequisites, you already get a custom SCAP Profile ready and loaded, which is run during your every scan.
* When it Comes to OVAL Database, The SCAP Profile is used to load the OVAL Database, which contains the vulnerability definitions and checks present on host's machine


CVE Matching
^^^^^^^^^^^^

* All findings compared against updated CVE database
* Matches recorded with metadata (CVE ID, severity, exploitability)
* Vulnerability classifications assigned based on database lookups

Scoring & Reporting
^^^^^^^^^^^^^^^^^^^

* Risk Score calculated based on findings and severity
* Scan results, scores, and logs saved to database
* Results displayed in Security tab interface

Scanning Engine
^^^^^^^^^^^^^^^^

* **Update Schedule:** Next version release scheduled shortly
* **Capabilities:** Comprehensive vulnerability detection and assessment
* **Database:** Maintains proprietary vulnerability database with public CVE integration

Database Management
^^^^^^^^^^^^^^^^^^^

* **Proprietary Database:** Karios maintains specialized vulnerability database
* **Public CVE Integration:** Regular synchronization with public CVE databases
* **Update Frequency:** Regular intervals for database synchronization
* **Coverage:** Comprehensive vulnerability signatures and definitions

CVE Tracking
^^^^^^^^^^^^

* **CVE Integration:** Comprehensive Common Vulnerabilities and Exposures tracking
* **CVSS Scoring:** Common Vulnerability Scoring System implementation
* **Severity Classification:** Standardized critical, high, medium, low severity levels
* **Status Monitoring:** Active vulnerability status tracking and updates

Risk Assessment and Scoring
---------------------------

**Risk Score Calculation:** The Risk Score provides a comprehensive assessment of system vulnerability based on:

* **Number of Security Findings:** Total count of identified vulnerabilities
* **Severity Weighting:** Critical, High, Medium, Low severity impact factors
* **Exploitability:** Whether vulnerabilities are actively exploitable
* **Patch Availability:** Missing patches for known vulnerabilities

**Compliance Score:** Reflects system adherence to security hardening and configuration best practices:

* **CIS FreeBSD Compliance:** Alignment with Center for Internet Security standards
* **Configuration Assessment:** System settings and security controls evaluation
* **Best Practices:** Implementation of recommended security configurations

Compliance Management
=====================

**Compliance Monitoring:**

* **Current Status:** Real-time compliance status (e.g., C - CRITICAL)
* **Historical Tracking:** Previous compliance status and trend analysis

Remediation Management
======================

Current Remediation Capabilities
---------------------------------

.. important::
 * Karios Security includes safe, guided remediation for a curated set of FreeBSD hardening checks. Each action is pre-checked, executed, and verified.

 * User-in-control workflow: fixes are manually triggered from the UI, show a clear preview of changes, and produce an audit trail so you stay fully in control.

 * Built to grow: the remediation framework is ready for broader coverage as new fix packs are validated and released.
 
 * Current status: coverage is purposefully limited today to the most reliable, high-confidence items—by design—while we expand safely and progressively.

**Current Remediation Scope:**

* **FreeBSD Benchmark Checks:** System-level fixes for CIS FreeBSD standard violations
* **Configuration Corrections:** Adjusting permissions, disabling unsafe services
* **File Permission Fixes:** Correcting overly permissive file and directory access

Remediation Process
-------------------

**How Remediation Works:**

#. **Vulnerability Assessment:** Identify vulnerabilities with available automated fixes
#. **Manual Trigger:** User must manually initiate remediation via UI throught the 'Remediate' button.
#. **Fix Execution:** System applies predefined fixes
#. **System Changes:** Updates may include file modifications, permission adjustments, service configurations
#. **Verification:** Automatic verification step confirms issue resolution
#. **Status Update:** Finding marked as remediated, compliance score updated

**Remediation Types:**

* **Automatic Fixes:** Limited automated vulnerability remediation for supported issues
* **Step-by-Step Guides:** Detailed manual remediation instructions
* **Verification:** Automated verification of successful remediation
* **Tracking:** Complete remediation progress and completion monitoring

Future Remediation Enhancements
--------------------------------

**Planned Expansions:**

* **Package Updates:** Automated security patch installation
* **Advanced Configuration:** Enhanced system hardening automation
* **Custom Remediation:** User-defined remediation scripts
* **Orchestrated Remediation:** Multi-system coordinated remediation
* **Rollback Capabilities:** Safe remediation rollback functionality

Security Scanning Operations
============================

Scan Results and Details
------------------------

**Detailed Scan Information:**

* **Scan Time:** Precise scan execution timestamp
* **Initiator:** Scan trigger source (System/User initiated)
* **Risk Score:** Calculated risk score from scan results
* **Vulnerability Count:** Total number of vulnerabilities discovered

Report Generation
-----------------

**Available Report Formats:**

* **HTML Reports:** Interactive web-based detailed reports
* **PDF Reports:** Printable PDF documentation for offline use
* **Export Options:** Report download for external analysis and archiving
* **Report Contents:** Comprehensive vulnerability data, compliance assessment, and remediation recommendations

Scan Execution Explained
------------------------

When you start a scan in Karios, the system doesn’t build everything from scratch. Instead, it uses a **pre-downloaded Security Profile** that was installed during setup. This profile contains all the **OVAL databases** and **rules** needed to check your system. Think of it as a ready-made checklist that Karios always has on hand.

**Step-by-Step Process:**

**Security Profile Loaded**

- The system loads the pre-installed profile, which includes OVAL rules and definitions.
- These rules describe what “secure” looks like and what needs to be checked.

**Plugins Scanned**
- The scanner runs through different plugins.
- Each plugin is a group of checks focusing on a specific area (e.g., packages, kernel settings, file permissions).
- Together, the plugins ensure complete system coverage.

**Findings Generated**

- After running the checks, the system compares your machine against the OVAL rules.  
- If something fails a rule, it is recorded as a **finding**.  
- Findings include details such as severity, affected component, and the reason for failure.

**Security Report Created**

- Once all plugins finish, the findings are collected into a **security report**.  
- The report shows which checks passed or failed.  
- It also assigns risk levels and highlights areas that need attention.

**In Simple Terms**

- **Click Scan → Karios loads security rules → runs grouped checks (plugins) → records failures → produces a clear report.**

Security Insights and Analysis
==============================

Performance Metrics and Improvements
------------------------------------

**Security Improvement Tracking:**

* **Risk Mitigation:** Quantifiable security posture improvements
* **Trend Analysis:** Historical security improvement tracking
* **Baseline Comparison:** Security metrics compared to established baselines

**Historical Analysis:**

* **Risk Score Trends:** Long-term risk score analysis and trending
* **Vulnerability Trends:** Tracking vulnerability discovery and remediation over time
* **Compliance History:** Historical compliance status and improvement tracking
* **Change Analytics:** Analysis of security changes and their impacts


Common Vulnerability Patterns
-----------------------------

**Vulnerability Type Analysis:**

* **Top Risk Categories:** Most prevalent risk categories (e.g., CAT II)
* **Common Vulnerability Types:** Frequent vulnerability classifications (e.g., KERNEL, NETWORK)
* **System Areas:** Most vulnerable system components and services
* **Remediation Patterns:** Common approaches and success rates for remediation

Advanced Security Features
==========================

Real-Time Security Monitoring
-----------------------------

**Continuous Monitoring Capabilities:**

* **Live Status Updates:** Real-time security status monitoring and dashboard updates post scans
* **Status Indicators:** Visual security status indicators and risk level displays

Integration and Extensibility
-----------------------------

**Current Integration:**

* **Dashboard Integration:** Seamless integration with Karios main dashboard
* **Database Integration:** Centralized vulnerability and compliance data storage

API Endpoints
=============

All endpoints are grouped under ``/api/v1/security`` unless noted. Each endpoint maps to a backend service that performs permission checks, validates input, and returns structured JSON.

Dashboard
---------

.. list-table::
   :widths: 40 10 50
   :header-rows: 1

   * - Endpoint
     - Method
     - Description
   * - ``/api/v1/security/{scan_target}/dashboard/score-panel-new``
     - GET
     - Returns the top-line security panel (risk %, compliance, counts) for the latest scan.
   * - ``/api/v1/security/{scan_target}/dashboard/cat-analysis``
     - GET
     - Returns CAT I/II/III breakdown and pass/fail stats.
   * - ``/api/v1/security/{scan_target}/dashboard/risk-trend?days={n}``
     - GET
     - Returns risk score trend data over the past ``n`` days (default example: 90).
   * - ``/api/v1/security/{scan_target}/dashboard/recent-scan-stats``
     - GET
     - Returns recent-scan summary (duration, findings, status) for quick at-a-glance metrics.

Vulnerabilities
---------------

.. list-table::
   :widths: 40 10 50
   :header-rows: 1

   * - Endpoint
     - Method
     - Description
   * - ``/api/v1/security/vulnerabilities?page={p}&limit={n}&severity={S}&severity={S2}``
     - GET
     - Lists vulnerabilities with pagination and optional multi-value ``severity`` filters (e.g., ``MEDIUM``, ``LOW``).

Scans
-----

.. list-table::
   :widths: 40 10 50
   :header-rows: 1

   * - Endpoint
     - Method
     - Description
   * - ``/api/v1/security/{scan_target}/scan/execute``
     - POST
     - Triggers a scan execution for the target. See request body below.
   * - ``/api/v1/security/{scan_target}/scans?page={p}&limit={n}&sort=scan_date&order=desc``
     - GET
     - Returns historical scan runs for the target with pagination and sorting.

Reports
-------

.. list-table::
   :widths: 40 10 50
   :header-rows: 1

   * - Endpoint
     - Method
     - Description
   * - ``/api/v1/reports/{scan_id}/download?format=pdf``
     - GET
     - Downloads a report for the specified scan in the requested format (e.g., ``pdf``). *(Note: base URL may differ from security service.)*

Remediation (Limited / Controlled)
----------------------------------

.. list-table::
   :widths: 40 10 50
   :header-rows: 1

   * - Endpoint
     - Method
     - Description
   * - ``/api/v1/{scan_target}/remediation/vulnerability/{cve}/remediate``
     - POST
     - Attempts a controlled remediation for a specific CVE (scope is intentionally very limited; primarily FreeBSD benchmark fixes).

Notes
-----

- **Auth**: Most endpoints require a Bearer token (e.g., ``Authorization: Bearer <token>``).
- **Variables**: Replace ``{scan_target}`` with your target identifier; replace ``{scan_id}`` with a scan run ID.
- **Safety**: Remediation is **intentionally restricted** and requires explicit user action.

Future Enhancements and Roadmap
===============================

Planned Security Features
-------------------------

**Upcoming Capabilities:**

* **Deep Scan Implementation:** Complete deep scanning capabilities for comprehensive analysis
* **Enhanced Remediation:** Expanded automated remediation coverage beyond current FreeBSD benchmarks
* **Automated Scheduling:** Scheduled automatic security scans with configurable intervals
* **Advanced Analytics:** Machine learning-based threat detection and pattern analysis
* **Extended Remediation:** Package updates, advanced configuration automation, and custom scripts

Version Roadmap
---------------

**Development Schedule:**

* **Update Schedule:** Regular security engine updates and database synchronization
* **Feature Additions:** Continuous security capability improvements and new functionality

**Integration Expansion:**

* **Compliance Frameworks:** Additional compliance standard support beyond CIS FreeBSD
* **API Development:** Enhanced API capabilities for external tool integration
* **Custom Plugin Support:** Framework for custom security check development

Best Practices and Recommendations
===================================

Security Scanning Best Practices
---------------------------------

**Recommended Scan Schedule:**

* **Regular Quick Scans:** Daily or weekly quick scans for continuous monitoring
* **Periodic Full Scans:** Monthly comprehensive scans for complete assessment
* **Post-Change Scans:** Immediate scans after system changes or updates
* **Compliance Scans:** Quarterly scans for compliance reporting requirements

Remediation Best Practices
--------------------------

**Current Limitations Awareness:**

* **Limited Scope:** Please understand that the current remediation covers only few vulnerabilities and possible misconfigurations
* **Documentation:** Maintain records of all remediation activities

**Future Preparation:**

* **Remediation Planning:** Prepare remediation procedures for expanded capabilities
* **Change Management:** Establish change management processes for automated remediation
* **Rollback Procedures:** Develop rollback procedures for remediation failures
* **Monitoring Integration:** Plan integration with existing monitoring and alerting systems

Conclusion
==========

Karios Security provides a robust foundation for infrastructure security management with its comprehensive vulnerability scanning, compliance monitoring, and limited automated remediation capabilities. While current remediation features are focused on FreeBSD benchmark compliance, the platform's architecture supports significant expansion of security capabilities. The combination of real-time monitoring, detailed reporting, and integration with the broader Karios platform makes it an essential component for maintaining secure hyper-converged infrastructure deployments.
