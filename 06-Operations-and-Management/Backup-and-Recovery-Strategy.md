# Royal Technology Solutions

# Backup and Recovery Strategy

## Overview

This document defines the backup and recovery strategy for the Royal Technology Solutions hybrid infrastructure environment.

The strategy is designed to protect critical infrastructure, application data, database services, security configurations, and cloud resources while providing a structured method for restoring services following hardware failure, software failure, accidental deletion, security incidents, or other operational disruptions.

The backup architecture supports both the on-premises environment and AWS cloud infrastructure.

---

# Backup Architecture

The backup strategy follows a layered approach:

```text
                    Production Environment
                             |
             +---------------+---------------+
             |               |               |
             v               v               v
       Windows Servers     RoyalDB         Network
             |               |               |
             |           PostgreSQL        pfSense
             |               |               |
             +---------------+---------------+
                             |
                             v
                    Backup Infrastructure
                             |
                             v
                           Veeam
                             |
                             v
                    Backup Repository
                             |
                             v
                    Recovery Validation
```

AWS resources use cloud-native resilience and backup capabilities where appropriate.
Protected Infrastructure
The following infrastructure components are considered part of the backup and recovery strategy:
Component	Protection Strategy
Windows Server VMs	Veeam / VM backup
Active Directory	System State / VM backup
DNS/DHCP Services	VM and configuration backup
File Servers	File and VM backup
Web Servers	VM and configuration backup
RoyalDB	PostgreSQL database backups
pfSense	Configuration backup
AWS RDS PostgreSQL	AWS managed backup capabilities
AWS EC2	Instance and volume protection
Security Configurations	Configuration documentation and backups


RoyalDB Backup Strategy
RoyalDB is a critical application database supporting the Royal Technology Solutions service-ticketing architecture.
The database contains:
- Customers
- Locations
- Devices
- Contracts
- Tickets
- Technicians
- Ticket assignments
Database protection includes logical database backups and recovery testing.
Example PostgreSQL Backup
pg_dump -Fc royaldb > royaldb_backup.dump

The backup should be stored separately from the production database system.
RoyalDB Recovery
A RoyalDB recovery process should include:
1. Identify the failure or data-loss event.
2. Determine the required recovery point.
3. Locate the appropriate backup.
4. Restore the database to a controlled environment.
5. Validate tables and relationships.
6. Verify primary and foreign key constraints.
7. Validate database roles and permissions.
8. Confirm application connectivity.
9. Return the database to production service.
Recovery Validation
Recovery validation should include:

```
Tables
  |
  v
Relationships
  |
  v
Constraints
  |
  v
Sequences
  |
  v
Roles
  |
  v
Permissions
  |
  v
Application Connectivity
```

AWS RDS Protection
The AWS RoyalDB deployment uses Amazon RDS for PostgreSQL.
The RDS environment is deployed within private subnets and protected through AWS security controls.
Backup and Recovery Objectives
- Automated database backups
- Point-in-time recovery where configured
- Snapshot-based recovery
- Multi-AZ subnet architecture
- Recovery testing
The AWS database should remain inaccessible directly from the public Internet.
Veeam Backup Strategy
Veeam is used as the primary backup platform for the virtualized on-premises environment.
Protected Systems
Protected systems may include:
- Domain controllers
- DNS servers
- DHCP servers
- File servers
- Web servers
- Application servers
- Database servers
- Security monitoring systems
Backup Jobs Should Be Monitored For
- Successful completion
- Failed jobs
- Backup repository capacity
- Recovery point availability
- Backup integrity
pfSense Configuration Backup
The pfSense firewall represents a critical network dependency.
Its configuration should be backed up after significant changes.
Configuration Backup Should Include
- Firewall rules
- NAT configuration
- VPN configuration
- Interface assignments
- DHCP configuration
- DNS configuration
- Routing configuration
A configuration backup provides a recovery point if the firewall must be rebuilt or replaced.
Backup Security
Backups are security-sensitive assets because they may contain copies of production systems and sensitive organizational information.
Backup Protections Should Include
- Restricted administrative access
- Least-privilege permissions
- Secure backup storage
- Network isolation where appropriate
- Encryption where supported
- Retention policies
- Regular recovery testing
Backup credentials should not be stored in source-code repositories.
Recovery Objectives
The environment uses two important recovery measurements.
Recovery Point Objective (RPO)
RPO defines the maximum acceptable amount of data that may be lost following an incident.
Example:
RPO = 24 hours
Critical databases may require a shorter RPO depending on business requirements.
Recovery Time Objective (RTO)
RTO defines the target amount of time required to restore a service.
Example:
RTO = 4 hours
Actual RTO values should be established based on business requirements and validated through recovery testing.
Backup Validation
Backups are not considered reliable simply because a backup job reports success.
Validation should include:
- Backup job verification
- Backup integrity checks
- Test restores
- Database restoration testing
- File restoration testing
- Virtual machine recovery testing
- Configuration restoration testing
Validation Cycle

```
Backup
  |
  v
Verify
  |
  v
Test Restore
  |
  v
Validate Data
  |
  v
Document Results
```

Recovery Scenarios
The recovery strategy addresses several potential failure scenarios.
Scenario	Recovery Approach
Deleted File	Restore file from backup
Failed VM	Restore VM from Veeam
Failed Database	Restore PostgreSQL backup
Corrupted Database	Restore known-good recovery point
pfSense Failure	Restore firewall configuration
Server Hardware Failure	Restore VM to available host
AWS RDS Failure	Restore from snapshot or recovery point
Security Incident	Isolate affected system and recover clean copy


Disaster Recovery Considerations
The backup strategy supports disaster recovery by maintaining recoverable copies of critical systems and data.
Future Improvements
- Off-site backup repository
- Immutable backups
- Expanded cloud backup strategy
- Automated recovery testing
- Documented disaster recovery exercises
- Recovery time measurement
Operational Responsibilities
Backup operations should include regular review of:
- Backup job status
- Storage capacity
- Failed backup jobs
- Recovery points
- Retention compliance
- Restore test results
Security and infrastructure administrators are responsible for reviewing backup health and initiating recovery procedures when required.
Backup and Recovery Status
Capability	Status
Veeam Backup Architecture	Implemented
RoyalDB Backup Strategy	Implemented
AWS RDS Protection	Implemented
pfSense Configuration Backup	Planned
Recovery Testing	Planned
Off-Site Backup Strategy	Planned
Immutable Backup Strategy	Planned


Future Enhancements
Planned improvements include:
- Implement immutable backup storage
- Establish formal backup retention policies
- Perform scheduled recovery testing
- Document measured RTO and RPO values
- Expand off-site backup capabilities
- Automate backup monitoring
- Integrate backup alerts with centralized monitoring
Conclusion
The Royal Technology Solutions backup and recovery strategy provides layered protection for the organization's on-premises and AWS infrastructure.
The strategy combines virtualization backup, database protection, firewall configuration backup, and AWS-managed recovery capabilities.
Future development will focus on strengthening recovery testing, backup immutability, off-site protection, and operational automation.
