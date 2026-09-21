\# Royal Technology Solutions

\# Disaster Recovery Plan



\## Overview



This document defines the disaster recovery strategy for the Royal Technology Solutions hybrid infrastructure environment.



The purpose of the disaster recovery plan is to provide a structured process for responding to infrastructure failures, data loss, security incidents, cloud service disruptions, and other events that could affect the availability of business services.



The plan covers the on-premises infrastructure, network security systems, RoyalDB, and AWS cloud resources.



\---



\# Disaster Recovery Objectives



The primary objectives are:



\- Protect critical business data

\- Restore essential services

\- Minimize service interruption

\- Maintain secure recovery procedures

\- Validate recovered systems before returning them to production

\- Provide documented recovery procedures for administrators



\---



\# Recovery Architecture



The recovery process follows a controlled lifecycle:



```text

&#x20;               Disaster / Failure

&#x20;                      |

&#x20;                      |

&#x20;                 Detection

&#x20;                      |

&#x20;                      |

&#x20;                 Assessment

&#x20;                      |

&#x20;                      |

&#x20;                  Isolation

&#x20;                      |

&#x20;                      |

&#x20;                 Recovery

&#x20;                      |

&#x20;                      |

&#x20;                 Validation

&#x20;                      |

&#x20;                      |

&#x20;               Return to Service

&#x20;                      |

&#x20;                      |

&#x20;                Documentation

Disaster Scenarios



The environment must be prepared for several types of incidents.



Scenario	Potential Impact

Server Failure	Service interruption

VM Corruption	Application or infrastructure outage

Database Failure	Data availability loss

Network Failure	Loss of connectivity

Firewall Failure	Network security disruption

Storage Failure	Data loss or service interruption

Malware Incident	System compromise

Ransomware Incident	Data and system availability loss

AWS Service Disruption	Cloud application interruption

Accidental Deletion	Data or configuration loss

Disaster Recovery Priorities



Recovery should follow business and infrastructure dependencies.



Priority 1 — Network and Security



Critical services:



pfSense firewall

VPN connectivity

Network routing

DNS infrastructure

DHCP services



These services provide the foundation required for other systems to communicate.



Priority 2 — Identity Services



Critical services:



Active Directory

Domain controllers

Authentication

Group Policy

DNS integration



Identity services must be restored before dependent systems are fully returned to operation.



Priority 3 — Database Services



Critical service:



RoyalDB PostgreSQL



Recovery objectives:



Restore database availability

Validate schema

Validate data

Verify constraints

Verify sequences

Verify roles and permissions

Priority 4 — Application and File Services



Services include:



File servers

Web servers

Application servers

FTP services

Print services



These systems can be restored after the supporting network, identity, and database services are available.



Priority 5 — Security Monitoring



Services include:



IDS01

Snort IDS

Security monitoring

Centralized logging



Security monitoring should be restored as soon as practical so recovered infrastructure can be monitored during the return-to-service process.



Recovery Roles



Disaster recovery responsibilities should be assigned according to the affected system.



Responsibility	Primary Function

Infrastructure Administrator	Server and virtualization recovery

Network Administrator	Network and firewall recovery

Database Administrator	RoyalDB recovery

Cloud Administrator	AWS resource recovery

Security Administrator	Security validation and incident investigation



In smaller environments, multiple responsibilities may be performed by the same administrator.



On-Premises Recovery



The on-premises recovery process uses virtualization backups and configuration backups.



Primary recovery technologies include:



Veeam

VirtualBox

VMware

Windows Server recovery

PostgreSQL backups

pfSense configuration backups



Recovery process:



Failed System

&#x20;    |

Determine Cause

&#x20;    |

Isolate System

&#x20;    |

Identify Recovery Point

&#x20;    |

Restore System

&#x20;    |

Validate Configuration

&#x20;    |

Test Connectivity

&#x20;    |

Return to Service

Windows Server Recovery



Windows Server systems may include:



Domain controllers

DNS servers

DHCP servers

File servers

Web servers

Application servers



Recovery activities may include:



Identify the failed server.

Determine whether the failure is hardware, software, or data related.

Select an appropriate recovery point.

Restore the virtual machine or required system components.

Verify network configuration.

Verify DNS functionality.

Verify Active Directory functionality when applicable.

Test dependent services.

Document the recovery.

RoyalDB Disaster Recovery



RoyalDB is a critical application dependency.



Recovery process:



RoyalDB Failure

&#x20;     |

&#x20;     |

Identify Recovery Point

&#x20;     |

&#x20;     |

Restore PostgreSQL

&#x20;     |

&#x20;     |

Validate Schema

&#x20;     |

&#x20;     |

Validate Data

&#x20;     |

&#x20;     |

Validate Constraints

&#x20;     |

&#x20;     |

Validate Roles

&#x20;     |

&#x20;     |

Test Connectivity

&#x20;     |

&#x20;     |

Return to Service



Validation should include:



Tables

Primary keys

Foreign keys

Unique constraints

Sequences

Roles

Permissions

Expected data

AWS Recovery



AWS resources are incorporated into the disaster recovery strategy.



Protected services include:



Amazon VPC

EC2 web servers

Amazon RDS PostgreSQL

Security Groups

IAM configuration



AWS recovery activities may include:



Restoring RDS from a recovery point

Restoring EC2 resources

Rebuilding infrastructure from documented configuration

Restoring required security group rules

Validating private subnet connectivity

Testing application access

RoyalDB AWS Recovery



The AWS RoyalDB environment uses Amazon RDS PostgreSQL within private subnets.



Recovery validation should confirm:



RDS Availability

&#x20;      |

Private Connectivity

&#x20;      |

Database Availability

&#x20;      |

Schema Validation

&#x20;      |

Data Validation

&#x20;      |

Security Validation

&#x20;      |

Application Connectivity



The database should not be exposed directly to the public Internet during recovery.



pfSense Recovery



pfSense represents a critical network dependency.



Recovery actions include:



Deploy replacement firewall hardware or virtual machine.

Restore the latest known-good configuration.

Verify interface assignments.

Verify firewall rules.

Verify NAT configuration.

Verify DHCP configuration.

Verify DNS configuration.

Verify VPN configuration.

Test internal connectivity.

Test external connectivity.



The firewall should not be considered recovered until security rules and connectivity have been validated.



Security Incident Recovery



A security incident requires a different recovery process than a normal hardware failure.



The basic process is:



Security Event

&#x20;     |

&#x20;     |

Identify Affected Systems

&#x20;     |

&#x20;     |

Isolate Systems

&#x20;     |

&#x20;     |

Preserve Evidence

&#x20;     |

&#x20;     |

Investigate

&#x20;     |

&#x20;     |

Eradicate Threat

&#x20;     |

&#x20;     |

Restore Known-Good Systems

&#x20;     |

&#x20;     |

Validate Security

&#x20;     |

&#x20;     |

Return to Service



Systems suspected of compromise should not immediately be restored without determining whether the recovery point is trustworthy.



Ransomware Recovery



For a ransomware event:



Isolate affected systems.

Disable compromised accounts when appropriate.

Preserve relevant logs and evidence.

Identify the scope of the incident.

Determine whether backup systems were affected.

Identify a known-good recovery point.

Restore systems in a controlled environment.

Apply security updates.

Reset affected credentials.

Validate systems.

Return services to production in stages.



Backup systems should be protected from unauthorized modification to reduce the possibility of simultaneous compromise.



Recovery Validation



Recovered systems must be validated before returning to production.



Validation includes:



Infrastructure

Server starts successfully

Network configuration is correct

DNS resolution works

Required services are running

Database

PostgreSQL starts successfully

Tables are present

Data is accessible

Constraints are intact

Roles and permissions are correct

Network

Routing functions correctly

Firewall rules are active

VPN connectivity works

Required ports are accessible

Security

Security controls are active

IDS monitoring is operational

Logs are being generated

Administrative access is restricted

Recovery Testing



Disaster recovery procedures should be tested periodically.



Testing should include:



File restoration

VM restoration

Database restoration

Firewall configuration restoration

AWS recovery procedures

Network connectivity validation



Test results should be documented.



Example:



Test	Result	Notes

VM Restore	Pending	Recovery exercise

Database Restore	Pending	Recovery exercise

File Restore	Pending	Recovery exercise

pfSense Restore	Pending	Configuration recovery

AWS RDS Recovery	Pending	Cloud recovery exercise

Recovery Time Objective



The Recovery Time Objective (RTO) defines the target time required to restore a service.



Initial planning target:



RTO = 4 hours



Actual recovery times should be measured during recovery testing and adjusted according to business requirements.



Recovery Point Objective



The Recovery Point Objective (RPO) defines the maximum acceptable amount of data loss.



Initial planning target:



RPO = 24 hours



Critical services such as RoyalDB may require a shorter RPO depending on business requirements.



Communication During Recovery



During a major incident, recovery activities should be documented and communicated to appropriate stakeholders.



Communication should include:



Incident identification

Affected services

Current recovery status

Expected service impact

Recovery progress

Validation results

Return-to-service confirmation

Recovery Documentation



Each major recovery event should document:



Date and time

Affected systems

Incident type

Recovery point used

Recovery actions

Validation performed

Service restoration time

Problems encountered

Corrective actions

Lessons learned



This documentation supports future recovery improvements.



Disaster Recovery Status

Capability	Status

Backup Strategy	Complete

Recovery Procedures	Documented

RoyalDB Recovery	Documented

AWS Recovery	Documented

pfSense Recovery	Documented

Security Incident Recovery	Documented

Recovery Testing	Planned

Formal DR Exercise	Planned

Future Enhancements



Planned improvements include:



Formal disaster recovery exercises

Measured RTO and RPO values

Off-site recovery infrastructure

Immutable backup storage

Automated infrastructure recovery

Cloud-based recovery environments

Recovery runbooks for individual services

Regular disaster recovery testing

Conclusion



The Royal Technology Solutions disaster recovery plan provides a structured framework for recovering critical infrastructure across the hybrid environment.



The strategy integrates on-premises virtualization, Veeam backups, PostgreSQL recovery, pfSense configuration recovery, and AWS recovery capabilities.



Future disaster recovery development will focus on measured recovery performance, formal testing, immutable backups, and increasingly automated recovery procedures.

