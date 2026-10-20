# Royal Technology Solutions

# Security Monitoring Validation Documentation

## Overview

This document validates the security monitoring components implemented within the Royal Technology Solutions hybrid infrastructure environment.

Validation focuses on confirming that security controls are deployed, operational, and integrated across on-premises infrastructure and AWS cloud resources.

---

# Security Validation Architecture

The monitoring workflow:

```text
                    Internet
                       |
                       v
                pfSense Firewall
                       |
          +------------+------------+
          |                         |
          v                         v
     On-Premises                 AWS Cloud
          |                         |
          v                         v
        IDS01                 Security Groups
          |
          v
       Snort IDS
          |
          v
  Security Monitoring
          |
          v
         SIEM
```

Firewall Validation
pfSense Security Validation
Validated Functions
Component	Status
Firewall Rules	Complete
Network Segmentation	Complete
VPN Configuration	Complete
Traffic Filtering	Complete


Validation Activities
- Confirm firewall rule processing
- Verify allowed and denied traffic flows
- Validate internal network communication
- Confirm VPN security controls
IDS Validation
Snort IDS
System
Hostname: IDS01
Operating System: Ubuntu Server XFCE
IP Address: 192.168.2.12

Validated Components
Component	Status
IDS Host Deployment	Complete
Snort Installation	Complete
Network Monitoring	Complete
Alert Generation	Complete


Validation Commands
Check the Snort service:
sudo systemctl status snort

Test the Snort configuration:
sudo snort -T -c /etc/snort/snort.conf

Expected Results
- Snort service running
- Configuration loads successfully
- Detection rules available
- Network traffic monitored
Vulnerability Management Validation
Security Assessment Tools
Tool	Purpose	Status
Nessus	Vulnerability scanning	Planned
Qualys VMDR	Asset vulnerability management	Planned
OpenVAS	Security assessment	Planned


Validation Objectives
- Identify vulnerable systems
- Review security configurations
- Track remediation activities
- Maintain security visibility
The vulnerability-management tooling remains a planned enhancement to the security operations framework.
AWS Security Validation
AWS Infrastructure Controls
Validated Components
Component	Status
VPC Network Isolation	Complete
Security Groups	Complete
Private RDS Deployment	Complete
IAM Controls	Complete


Validation Activities
- Confirm public and private subnet separation
- Verify security group restrictions
- Validate database private connectivity
- Review IAM permissions
RoyalDB Security Validation
PostgreSQL Security Controls
Database
RoyalDB
PostgreSQL 18.6

Security Validation
Control	Status
Role-Based Access Control	Complete
Least Privilege Permissions	Complete
Database Constraints	Complete
Backup Planning	Complete


Configured Roles
royaldb_dba
royaldb_tech
royaldb_readonly

Validation Objectives
- Confirm authorized access
- Prevent unnecessary privileges
- Protect database integrity
- Maintain operational security
Logging and Monitoring Validation
Central Monitoring Goals
- Collect security events
- Review alerts
- Investigate suspicious activity
- Support incident response
Potential Monitoring Integration

```
pfSense Logs
      |
      v
Snort Alerts
      |
      v
Server Events
      |
      v
AWS Security Logs
      |
      v
Splunk SIEM
```

These integrations represent the broader monitoring architecture and potential centralized security operations workflow.
Security Testing Checklist
Test	Status
Firewall Rules Tested	Complete
IDS Deployment Verified	Complete
AWS Network Security Verified	Complete
Database Security Verified	Complete
Monitoring Architecture Documented	Complete


Future Improvements
Planned enhancements include:
- Deploy centralized SIEM platform
- Automate security alert response
- Add vulnerability scanning schedules
- Create security dashboards
- Develop incident response procedures
Security Monitoring Status
Component	Status
IDS Architecture	Complete
Security Tools Documentation	Complete
Monitoring Validation	Complete
Security Operations Framework	In Progress


Final Status
OPERATIONAL / IN PROGRESS
The core security monitoring architecture has been deployed and validated across the Royal Technology Solutions hybrid infrastructure.
The environment currently provides:
- pfSense firewall validation
- Snort IDS monitoring
- AWS security controls
- RoyalDB security controls
- Security monitoring architecture
- Defined logging and monitoring objectives
The broader Security Operations Framework remains In Progress as planned enhancements such as centralized SIEM integration, automated alert response, vulnerability scanning, dashboards, and expanded incident response capabilities are developed.
