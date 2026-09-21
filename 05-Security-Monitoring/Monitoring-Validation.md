\# Royal Technology Solutions

\# Security Monitoring Validation Documentation



\## Overview



This document validates the security monitoring components implemented within the Royal Technology Solutions hybrid infrastructure environment.



Validation focuses on confirming that security controls are deployed, operational, and integrated across on-premises infrastructure and AWS cloud resources.



\---



\# Security Validation Architecture



The monitoring workflow:



```text

&#x20;                   Internet



&#x20;                      |



&#x20;               pfSense Firewall



&#x20;                      |



&#x20;       --------------------------------



&#x20;       |                              |



&#x20;  On-Premises                    AWS Cloud



&#x20;       |                              |



&#x20;    IDS01                        Security Groups



&#x20;       |



&#x20;    Snort IDS



&#x20;       |



&#x20;Security Monitoring



&#x20;       |



&#x20;      SIEM



```



\---



\# Firewall Validation



\## pfSense Security Validation



Validated functions:



| Component | Status |

|---|---|

| Firewall Rules | Complete |

| Network Segmentation | Complete |

| VPN Configuration | Complete |

| Traffic Filtering | Complete |



Validation activities:



\- Confirm firewall rule processing

\- Verify allowed and denied traffic flows

\- Validate internal network communication

\- Confirm VPN security controls



\---



\# IDS Validation



\## Snort IDS



System:



```

Hostname: IDS01

Operating System: Ubuntu Server XFCE

IP Address: 192.168.2.12



```



Validated components:



| Component | Status |

|---|---|

| IDS Host Deployment | Complete |

| Snort Installation | Complete |

| Network Monitoring | Complete |

| Alert Generation | Complete |



Validation commands:



```bash

sudo systemctl status snort



```



Configuration testing:



```bash

sudo snort -T -c /etc/snort/snort.conf



```



Expected results:



\- Snort service running

\- Configuration loads successfully

\- Detection rules available

\- Network traffic monitored



\---



\# Vulnerability Management Validation



Security assessment tools:



| Tool | Purpose | Status |

|---|---|---|

| Nessus | Vulnerability scanning | Planned |

| Qualys VMDR | Asset vulnerability management | Planned |

| OpenVAS | Security assessment | Planned |



Validation objectives:



\- Identify vulnerable systems

\- Review security configurations

\- Track remediation activities

\- Maintain security visibility



\---



\# AWS Security Validation



\## AWS Infrastructure Controls



Validated components:



| Component | Status |

|---|---|

| VPC Network Isolation | Complete |

| Security Groups | Complete |

| Private RDS Deployment | Complete |

| IAM Controls | Complete |



Validation activities:



\- Confirm public and private subnet separation

\- Verify security group restrictions

\- Validate database private connectivity

\- Review IAM permissions



\---



\# RoyalDB Security Validation



\## PostgreSQL Security Controls



Database:



```

RoyalDB

PostgreSQL 18.6



```



Security validation:



| Control | Status |

|---|---|

| Role-Based Access Control | Complete |

| Least Privilege Permissions | Complete |

| Database Constraints | Complete |

| Backup Planning | Complete |



Configured roles:



```

royaldb\_dba



royaldb\_tech



royaldb\_readonly



```



Validation objectives:



\- Confirm authorized access

\- Prevent unnecessary privileges

\- Protect database integrity

\- Maintain operational security



\---



\# Logging and Monitoring Validation



Central monitoring goals:



\- Collect security events

\- Review alerts

\- Investigate suspicious activity

\- Support incident response



Potential integrations:



```

pfSense Logs

&#x20;     |

&#x20;     |

Snort Alerts

&#x20;     |

&#x20;     |

Server Events

&#x20;     |

&#x20;     |

AWS Security Logs

&#x20;     |

&#x20;     |

Splunk SIEM



```

\---



\# Security Testing Checklist



| Test | Status |

|---|---|

| Firewall Rules Tested | Complete |

| IDS Deployment Verified | Complete |

| AWS Network Security Verified | Complete |

| Database Security Verified | Complete |

| Monitoring Architecture Documented | Complete |



\---



\# Future Improvements



Planned enhancements:



\- Deploy centralized SIEM platform

\- Automate security alert response

\- Add vulnerability scanning schedules

\- Create security dashboards

\- Develop incident response procedures



\---



\# Security Monitoring Status



| Component | Status |

|---|---|

| IDS Architecture | Complete |

| Security Tools Documentation | Complete |

| Monitoring Validation | Complete |

| Security Operations Framework | In Progress |

