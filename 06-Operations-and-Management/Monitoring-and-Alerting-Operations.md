# Royal Technology Solutions

# Monitoring and Alerting Operations



## Overview



This document defines the monitoring and alerting operations framework for the Royal Technology Solutions hybrid infrastructure environment.



The purpose of operational monitoring is to maintain visibility into infrastructure health, network activity, security events, application availability, database performance, and cloud resources.



Monitoring provides the information required to identify abnormal conditions, investigate events, respond to incidents, and maintain service availability.



\---



# Monitoring Architecture



The monitoring architecture collects information from infrastructure and security systems.



```text

&#x20;                   Production Environment

&#x20;                           |

&#x20;       -------------------------------------------

&#x20;       |                  |                      |

&#x20;    Network            Servers                AWS Cloud

&#x20;       |                  |                      |

&#x20;   pfSense             Windows               EC2 / RDS

&#x20;       |                Linux                    |

&#x20;       |                  |                      |

&#x20;       ----------- Monitoring Sources -----------

&#x20;                           |

&#x20;                           |

&#x20;                      Log Collection

&#x20;                           |

&#x20;                           |

&#x20;                   Security Monitoring

&#x20;                           |

&#x20;                           |

&#x20;                      Alert Analysis

&#x20;                           |

&#x20;                           |

&#x20;                   Administrator Review

&#x20;                           |

&#x20;                           |

&#x20;                   Incident Response

Monitoring Objectives



The primary objectives are:



Detect infrastructure failures

Identify security events

Monitor system availability

Detect abnormal network activity

Monitor database health

Track cloud infrastructure health

Identify resource utilization issues

Support troubleshooting

Support incident response

Maintain operational visibility

Monitoring Domains



Monitoring is divided into several operational domains.



Domain	Monitoring Focus

Network	Connectivity, routing, firewall activity

Security	Intrusion detection and security events

Servers	Availability, CPU, memory, disk, services

Database	Availability, performance, connections

Cloud	EC2, RDS, networking, security

Backup	Job success, recovery points, capacity

Applications	Availability and service health

Network Monitoring



Network infrastructure represents a foundational monitoring domain.



Systems include:



pfSense

Routers

Layer 3 switches

Access switches

VPN services

DNS infrastructure

DHCP infrastructure



Monitoring should identify:



Interface failures

Connectivity loss

Routing problems

VPN failures

DHCP failures

DNS failures

Unusual traffic

Firewall events

pfSense Monitoring



pfSense provides the primary network security and gateway functions.



Operational monitoring should include:



Interface status

WAN connectivity

LAN connectivity

VPN status

Firewall events

NAT activity

DHCP services

DNS services

System resource utilization



Important firewall events should be reviewed when investigating connectivity or security incidents.



IDS Monitoring

Snort



IDS01 provides network intrusion detection through Snort.



Operational monitoring should include:



Snort service status

Detection engine status

Rule loading

Alert generation

Network interface availability

Log generation



Validation command:



sudo systemctl status snort



Configuration testing:



sudo snort -T -c /etc/snort/snort.conf



A failure of the Snort service should be treated as a monitoring visibility issue and investigated promptly.



Server Monitoring



Windows and Linux systems should be monitored for operational health.



Monitoring areas include:



CPU utilization

Memory utilization

Disk utilization

Network connectivity

Service availability

Operating system events

Security events

Update status



Critical infrastructure includes:



Domain controllers

DNS servers

DHCP servers

File servers

Web servers

Application servers

Database servers

IDS systems

Windows Server Monitoring



Windows Server 2025 systems should be monitored for:



System availability

Event Viewer errors

Service failures

Disk capacity

CPU utilization

Memory utilization

Network connectivity

Active Directory health

DNS functionality



Important events should be reviewed when services fail or abnormal behavior is detected.



Active Directory Monitoring



Identity infrastructure is critical because many systems depend on authentication and directory services.



Monitoring should include:



Domain controller availability

Active Directory services

DNS functionality

Replication health

Authentication failures

Account lockouts

Group Policy processing

Security events



Repeated authentication failures or unusual account activity should be investigated.



Database Monitoring



RoyalDB is a critical application dependency.



PostgreSQL monitoring should include:



Database availability

Connection status

CPU utilization

Memory utilization

Storage capacity

Connection counts

Query performance

Error logs

Backup status



Database monitoring should also identify conditions that could affect application availability.



RoyalDB Security Monitoring



Database security events should be reviewed for:



Failed authentication attempts

Unexpected administrative activity

Permission changes

Role changes

Unusual connection activity

Unexpected schema changes



Configured database roles include:



royaldb\_dba

royaldb\_tech

royaldb\_readonly



Changes to privileged database roles should be documented and reviewed.



AWS Monitoring



AWS resources require continuous operational visibility.



The Royal Technology Solutions AWS environment includes:



VPC

Public subnets

Private subnets

EC2 web servers

Amazon RDS PostgreSQL

Security Groups

IAM resources



Monitoring should include:



Instance availability

Network connectivity

Database availability

Resource utilization

Security events

Configuration changes

EC2 Monitoring



EC2 instances should be monitored for:



Instance status

CPU utilization

Network activity

Disk utilization where applicable

Application availability

Operating system health



Unexpected instance failures should trigger investigation and recovery procedures.



RDS Monitoring



The RoyalDB AWS deployment uses Amazon RDS PostgreSQL.



Monitoring areas include:



Database availability

CPU utilization

Storage utilization

Database connections

Performance metrics

Backup status

Maintenance events



The RDS deployment should remain protected within the private network architecture.



Backup Monitoring



Backup monitoring ensures that recovery capabilities remain available.



Backup systems include:



Veeam

PostgreSQL backups

pfSense configuration backups

AWS RDS recovery capabilities



Monitoring should identify:



Failed backup jobs

Missed backup schedules

Insufficient storage

Corrupted recovery points

Retention issues



A successful backup process should be periodically validated through restoration testing.



Alert Classification



Alerts should be categorized according to operational impact.



Severity	Description

Critical	Major outage or significant security event

High	Serious service degradation or security concern

Medium	Moderate operational or security issue

Low	Informational or minor event



Severity should be determined using business impact, security risk, and affected systems.



Alert Response Process



The alert response lifecycle is:



Alert Generated

&#x20;     |

&#x20;     |

Alert Review

&#x20;     |

&#x20;     |

Determine Severity

&#x20;     |

&#x20;     |

Investigate

&#x20;     |

&#x20;     |

Contain / Remediate

&#x20;     |

&#x20;     |

Validate

&#x20;     |

&#x20;     |

Close

&#x20;     |

&#x20;     |

Document

Critical Alerts



Examples of critical alerts include:



Firewall failure

VPN failure affecting business connectivity

Domain controller failure

RoyalDB outage

Multiple server failures

Confirmed intrusion

Ransomware indicators

Loss of critical backup capability



Critical events should receive immediate administrative attention.



High-Priority Alerts



Examples include:



Repeated authentication failures

High disk utilization

Significant database performance degradation

Snort detection alerts

Failed backup jobs

Unexpected firewall rule changes

Unauthorized configuration changes



These events should be investigated promptly.



Medium and Low Alerts



Medium and low priority events may include:



Resource utilization warnings

Non-critical service interruptions

Informational security events

Routine maintenance notifications

Non-critical configuration changes



These events should be reviewed according to operational schedules.



Alert Investigation



Alert investigation should establish:



What happened?

When did it happen?

Which system was affected?

What caused the event?

Is the event still occurring?

Is there a security impact?

What corrective action is required?

Does the event require escalation?



Investigation results should be documented.



Security Alert Correlation



Security events may originate from multiple systems.



Example:



pfSense Firewall Event

&#x20;       |

&#x20;       |

Snort Alert

&#x20;       |

&#x20;       |

Windows Security Event

&#x20;       |

&#x20;       |

AWS Security Event

&#x20;       |

&#x20;       |

Administrator Investigation



Correlating events from multiple sources can provide better visibility into an incident.



Logging Strategy



Important infrastructure systems should generate operational and security logs.



Potential sources include:



pfSense

Snort

Windows Server

Linux

PostgreSQL

AWS

Veeam

Security tools



Logs should be retained according to operational and security requirements.



Centralized Logging



The long-term architecture includes centralized log collection.



Potential platform:



Splunk



Future centralized logging can provide:



Searchable security events

Correlation

Dashboards

Alerting

Incident investigation

Operational reporting



Until centralized logging is fully deployed, individual system logs remain important sources of operational evidence.



Monitoring Dashboards



Future monitoring dashboards should provide visibility into:



Infrastructure

Server availability

CPU

Memory

Storage

Network status

Security

IDS alerts

Firewall events

Authentication failures

Vulnerability findings

Cloud

EC2 status

RDS health

Network activity

Security events

Backup

Backup success

Failed jobs

Recovery point availability

Availability Monitoring



Availability monitoring should identify systems that are:



Offline

Unreachable

Experiencing service failures

Experiencing repeated interruptions



Availability checks should be performed for critical infrastructure services.



Performance Monitoring



Performance monitoring should track:



CPU utilization

Memory utilization

Disk utilization

Network utilization

Database performance

Application response



Performance trends can help identify problems before they result in service outages.



Capacity Monitoring



Capacity monitoring helps identify resource constraints.



Areas include:



Storage capacity

Memory capacity

CPU capacity

Network capacity

Database storage

Backup repository capacity

AWS resource utilization



Capacity trends should be reviewed during operational planning.



Monitoring Maintenance



Monitoring systems require maintenance themselves.



Maintenance activities include:



Updating monitoring software

Updating Snort rules

Reviewing alert thresholds

Removing obsolete alerts

Validating log collection

Testing notification mechanisms

Reviewing monitoring coverage



Monitoring failures should be treated as operational incidents because they reduce visibility.



Alert Fatigue Management



Excessive alerts can reduce the effectiveness of monitoring.



To reduce alert fatigue:



Remove unnecessary alerts

Tune thresholds

Group related events

Prioritize critical events

Review recurring alerts

Document alert suppression



Alert tuning should not eliminate meaningful security or availability events.



Monitoring Escalation



Events should be escalated when:



Multiple systems are affected

A critical service is unavailable

Security compromise is suspected

Data integrity may be affected

Recovery requires additional administrators

Business operations are significantly impacted



Escalation procedures should identify the appropriate technical and management resources.



Incident Integration



Monitoring and alerting are closely connected to incident response.



The relationship is:



Monitoring

&#x20;   |

&#x20;   v

Alert

&#x20;   |

&#x20;   v

Investigation

&#x20;   |

&#x20;   v

Incident Identification

&#x20;   |

&#x20;   v

Incident Response

&#x20;   |

&#x20;   v

Recovery

&#x20;   |

&#x20;   v

Validation

&#x20;   |

&#x20;   v

Lessons Learned

Operational Metrics



Future monitoring metrics may include:



System availability percentage

Number of critical alerts

Number of security alerts

Mean time to acknowledge

Mean time to resolve

Backup success rate

Patch compliance

Vulnerability remediation time

Monitoring coverage



These metrics can support future operational dashboards.



Monitoring Documentation



Monitoring records should include:



Date and time

System affected

Alert type

Severity

Investigation results

Corrective action

Resolution

Administrator

Follow-up requirements



Documentation provides historical information for troubleshooting and continuous improvement.



Monitoring Validation



Monitoring systems should be periodically tested.



Testing should include:



Snort service validation

Firewall log validation

Server log validation

Database log validation

Backup alert validation

AWS monitoring validation

Notification testing



A monitoring system should not be considered reliable without periodic validation.



Operational Review



Monitoring results should be reviewed regularly.



Operational reviews may include:



Critical alerts

Repeated failures

Security events

Backup status

Patch status

Capacity trends

Vulnerability findings

Availability trends



Review findings should be used to identify corrective actions and infrastructure improvements.



Monitoring Status

Capability	Status

Network Monitoring	Implemented

Firewall Monitoring	Implemented

IDS Monitoring	Implemented

Server Monitoring	Implemented

Database Monitoring	Implemented

AWS Monitoring	Implemented

Backup Monitoring	Implemented

Centralized SIEM	Planned

Monitoring Dashboards	Planned

Automated Alert Response	Planned

Future Enhancements



Planned improvements include:



Centralized SIEM deployment

Automated alert notifications

Security event correlation

Infrastructure dashboards

Automated health checks

Expanded cloud monitoring

Automated incident workflows

Long-term operational metrics

Conclusion



The Royal Technology Solutions monitoring and alerting operations framework provides a structured approach to maintaining visibility across the hybrid infrastructure environment.



Monitoring covers network infrastructure, servers, RoyalDB, AWS resources, security systems, and backup operations.



The next stage of development will focus on centralized logging, dashboards, automation, and expanded operational analytics.

