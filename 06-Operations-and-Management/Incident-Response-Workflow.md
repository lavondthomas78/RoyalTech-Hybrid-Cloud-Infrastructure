# Royal Technology Solutions

# Incident Response Workflow



## Overview



This document defines the incident response workflow for the Royal Technology Solutions hybrid infrastructure environment.



The purpose of incident response is to provide a structured process for identifying, analyzing, containing, eliminating, and recovering from security and operational incidents.



The workflow applies to on-premises infrastructure, network security systems, RoyalDB, AWS resources, endpoints, servers, and monitoring systems.



\---



# Incident Response Objectives



The primary objectives are:



\- Detect incidents quickly

\- Limit operational and security impact

\- Protect organizational data

\- Preserve relevant evidence

\- Contain affected systems

\- Remove threats and restore secure operation

\- Validate recovered systems

\- Document incidents and corrective actions

\- Improve security controls after incidents



\---



# Incident Response Lifecycle



The incident response process follows a structured lifecycle:



```text

&#x20;                   Detection

&#x20;                      |

&#x20;                      |

&#x20;                    Triage

&#x20;                      |

&#x20;                      |

&#x20;                Investigation

&#x20;                      |

&#x20;                      |

&#x20;                   Containment

&#x20;                      |

&#x20;                      |

&#x20;                 Eradication

&#x20;                      |

&#x20;                      |

&#x20;                   Recovery

&#x20;                      |

&#x20;                      |

&#x20;                  Validation

&#x20;                      |

&#x20;                      |

&#x20;                Closure

&#x20;                      |

&#x20;                      |

&#x20;               Lessons Learned

Incident Categories



Incidents may be classified into several categories.



Category	Examples

Security Incident	Unauthorized access, malware, intrusion

Network Incident	Firewall failure, routing failure, VPN outage

Server Incident	Server failure, service outage

Database Incident	Database corruption, unauthorized database activity

Cloud Incident	AWS service failure, unauthorized cloud activity

Backup Incident	Failed backups, unavailable recovery points

Identity Incident	Account compromise, authentication abuse

Availability Incident	Service outage or significant degradation

Incident Severity



Incidents should be classified according to impact.



Severity	Description

Critical	Major security event or widespread service outage

High	Significant security or operational impact

Medium	Limited security or service impact

Low	Minor or informational event



Severity should be evaluated based on:



Number of affected systems

Data sensitivity

Business impact

Security implications

Duration

Scope of the event

Incident Detection



Incidents may be detected through multiple sources.



Detection sources include:



Snort IDS

pfSense firewall logs

Windows event logs

Linux system logs

PostgreSQL logs

AWS monitoring

Backup alerts

Vulnerability scanners

Administrator observation

User reports



Detection sources should be reviewed as part of normal monitoring operations.



Initial Triage



When an alert or incident is identified, the administrator should determine:



What happened?

When did it happen?

Which systems are affected?

Is the event still occurring?

Is there evidence of unauthorized access?

Is sensitive data potentially affected?

Is the event operational, security-related, or both?

What immediate action is required?



The initial assessment determines the appropriate response path.



Incident Identification



An event becomes an incident when investigation determines that it represents a security, availability, integrity, or operational issue requiring response.



Examples:



Repeated Authentication Failures

&#x20;           |

&#x20;           v

&#x20;      Investigation

&#x20;           |

&#x20;           v

&#x20;  Possible Account Compromise

&#x20;           |

&#x20;           v

&#x20;       Security Incident

Evidence Preservation



When a security incident is suspected, relevant evidence should be preserved before making unnecessary changes.



Potential evidence includes:



Firewall logs

IDS alerts

Windows event logs

Linux logs

PostgreSQL logs

AWS logs

Authentication records

System timestamps

Configuration changes



Evidence should be preserved in a manner that supports later investigation.



Containment



Containment is used to prevent an incident from spreading or causing additional damage.



Potential containment actions include:



Isolating affected systems

Blocking malicious network traffic

Disabling compromised accounts

Removing systems from affected network segments

Restricting firewall access

Disconnecting compromised hosts when appropriate



Containment decisions should consider the potential impact of disrupting business services.



Network Containment



Network containment may use:



pfSense firewall rules

VLAN segmentation

ACL controls

VPN restrictions

Security group changes

Host isolation



Example:



Suspected Compromised Host

&#x20;         |

&#x20;         v

&#x20;    Identify Host

&#x20;         |

&#x20;         v

&#x20;   Isolate Network

&#x20;         |

&#x20;         v

&#x20;   Preserve Evidence

&#x20;         |

&#x20;         v

&#x20;     Investigate

Endpoint and Server Containment



Affected servers may include:



Domain controllers

File servers

Web servers

Application servers

Database servers

IDS systems



Containment may involve:



Network isolation

Account restriction

Service shutdown

Access control changes

Snapshot or backup preservation



Critical systems should not be shut down without considering dependencies and evidence requirements.



Identity Incident Response



Identity-related incidents may include:



Compromised credentials

Suspicious authentication

Account lockouts

Privilege escalation

Unauthorized administrator activity



Response actions may include:



Identify affected account.

Review authentication activity.

Determine affected systems.

Restrict or disable the account when appropriate.

Reset credentials.

Review group membership.

Review privileged access.

Validate account security.

Monitor for continued activity.

Database Incident Response



RoyalDB contains operational information supporting the Royal Technology Solutions service-ticketing architecture.



Database incidents may include:



Unauthorized access

Suspicious queries

Permission changes

Schema modifications

Data corruption

Database availability failures



Response actions include:



Review authentication logs

Identify affected accounts

Review role permissions

Preserve database logs

Determine scope

Protect database integrity

Restore from a known-good recovery point when required

RoyalDB Role Security



Configured database roles include:



royaldb\_dba

royaldb\_tech

royaldb\_readonly



During an incident, administrators should determine whether any privileged roles or permissions were modified.



Particular attention should be given to:



Administrative roles

Permission changes

Unexpected account creation

Unauthorized schema changes

Unexpected data modification

AWS Incident Response



AWS incidents may involve:



EC2 instances

Amazon RDS PostgreSQL

Security Groups

IAM

VPC resources



Potential response actions include:



Restricting security group access

Reviewing IAM activity

Isolating affected EC2 instances

Reviewing cloud logs

Preserving affected resources

Restoring services from known-good recovery points



AWS incidents should be evaluated within the organization's shared responsibility model.



Ransomware Response



Ransomware requires immediate containment and careful recovery.



Response process:



Ransomware Indicator

&#x20;       |

&#x20;       v

Identify Affected Systems

&#x20;       |

&#x20;       v

Isolate Systems

&#x20;       |

&#x20;       v

Protect Backup Infrastructure

&#x20;       |

&#x20;       v

Preserve Evidence

&#x20;       |

&#x20;       v

Determine Scope

&#x20;       |

&#x20;       v

Eradicate Threat

&#x20;       |

&#x20;       v

Restore Known-Good Systems

&#x20;       |

&#x20;       v

Validate Security

&#x20;       |

&#x20;       v

Return to Service



Recovery points should be evaluated to determine whether they were created before the compromise.



Malware Response



For suspected malware:



Identify the affected system.

Isolate the system.

Preserve relevant evidence.

Identify the malware or suspicious behavior when possible.

Determine whether additional systems are affected.

Remove the malicious software or rebuild the system.

Apply required security updates.

Reset affected credentials.

Restore required data.

Validate security controls.

Return the system to service.

Network Security Incident



Network security incidents may include:



Unauthorized traffic

Port scanning

Suspicious connections

Firewall rule violations

VPN abuse

Intrusion detection alerts



Investigation should correlate:



pfSense

&#x20;  |

&#x20;  +---- Firewall Events

&#x20;  |

Snort

&#x20;  |

&#x20;  +---- IDS Alerts

&#x20;  |

Servers

&#x20;  |

&#x20;  +---- Authentication / System Logs

&#x20;  |

AWS

&#x20;  |

&#x20;  +---- Cloud Security Events



Correlation may help determine the scope and timeline of an event.



Vulnerability-Driven Incidents



A vulnerability may become an incident when active exploitation or unauthorized activity is detected.



Response process:



Vulnerability Identified

&#x20;       |

&#x20;       v

Determine Exposure

&#x20;       |

&#x20;       v

Check for Exploitation

&#x20;       |

&#x20;       v

Contain if Necessary

&#x20;       |

&#x20;       v

Patch / Remediate

&#x20;       |

&#x20;       v

Validate

&#x20;       |

&#x20;       v

Monitor



Vulnerability management and incident response should operate together when exploitation is suspected.



Eradication



Eradication removes the underlying cause of the incident.



Potential actions include:



Removing malware

Removing unauthorized accounts

Revoking compromised credentials

Patching vulnerabilities

Removing malicious configurations

Rebuilding compromised systems

Correcting firewall rules

Correcting security group configurations



Systems should be validated before recovery.



Recovery



Recovery returns systems to normal operation.



Recovery may include:



Restoring virtual machines

Restoring databases

Restoring files

Restoring firewall configurations

Restoring AWS resources

Rebuilding compromised systems



Recovery should use known-good configurations and recovery points whenever possible.



Recovery Validation



Recovered systems must be validated before returning to production.



Validation includes:



Network

Connectivity

Routing

Firewall rules

VPN functionality

Infrastructure

Operating system health

Required services

DNS

Authentication

Database

PostgreSQL availability

RoyalDB schema

Data integrity

Roles and permissions

Security

IDS monitoring

Firewall monitoring

Logging

Access controls

Return to Service



Systems should return to production in controlled stages.



Example:



Recovered System

&#x20;      |

&#x20;      v

Security Validation

&#x20;      |

&#x20;      v

Functional Testing

&#x20;      |

&#x20;      v

Limited Production Access

&#x20;      |

&#x20;      v

Monitoring

&#x20;      |

&#x20;      v

Full Production Service



Critical systems should be monitored closely after restoration.



Incident Closure



An incident may be closed when:



The threat has been removed

Affected systems are recovered

Security controls are functioning

Required services are operational

Monitoring is active

Evidence has been preserved

Required documentation is complete



Closure should be approved according to organizational procedures.



Incident Documentation



Each incident should document:



Incident date and time

Detection source

Affected systems

Incident category

Severity

Initial findings

Containment actions

Investigation results

Eradication actions

Recovery actions

Validation results

Resolution time

Follow-up actions

Lessons Learned



After significant incidents, a post-incident review should identify:



What happened?

What caused the event?

What controls worked?

What controls failed?

What could have detected the event earlier?

What improvements are required?

What procedures should be updated?



Lessons learned should result in documented corrective actions.



Corrective Actions



Corrective actions may include:



Security configuration changes

Additional firewall rules

New IDS detection rules

Software patches

Account security improvements

Network segmentation changes

Backup improvements

Monitoring improvements

Staff security awareness activities



Corrective actions should be tracked until completed.



Incident Metrics



Future incident response metrics may include:



Mean time to detect

Mean time to acknowledge

Mean time to contain

Mean time to recover

Number of incidents

Number of recurring incidents

Security incidents by category

Incidents by severity

Corrective actions completed



These metrics can support future security and operational dashboards.



Incident Response Testing



The incident response process should be tested periodically.



Testing may include:



Tabletop exercises

Simulated security alerts

Account compromise scenarios

Malware scenarios

Ransomware exercises

Network outage scenarios

Database recovery exercises



Testing helps identify weaknesses before a real incident occurs.



Incident Response Integration



Incident response connects the major operational security functions:



Monitoring

&#x20;   |

&#x20;   v

Detection

&#x20;   |

&#x20;   v

Incident Response

&#x20;   |

&#x20;   v

Containment

&#x20;   |

&#x20;   v

Recovery

&#x20;   |

&#x20;   v

Backup / Disaster Recovery

&#x20;   |

&#x20;   v

Validation

&#x20;   |

&#x20;   v

Lessons Learned

&#x20;   |

&#x20;   v

Improved Security Controls



This creates a continuous improvement cycle across the infrastructure.



Incident Response Status

Capability	Status

Incident Classification	Documented

Incident Detection	Documented

Initial Triage	Documented

Evidence Preservation	Documented

Containment	Documented

Eradication	Documented

Recovery	Documented

Recovery Validation	Documented

Incident Closure	Documented

Lessons Learned	Documented

Incident Response Testing	Planned

Automated Response	Planned

Future Enhancements



Planned improvements include:



Formal incident response runbooks

Tabletop exercises

Automated security alert workflows

SIEM-based event correlation

Security orchestration and automation

Expanded threat intelligence integration

Formal incident reporting procedures

Regular incident response testing

Conclusion



The Royal Technology Solutions incident response workflow provides a structured process for responding to security and operational incidents across the hybrid infrastructure environment.



The workflow connects monitoring, detection, investigation, containment, eradication, recovery, validation, and continuous improvement.



Future development will focus on formal exercises, automation, centralized security event correlation, and expanded incident response runbooks.

