# Royal Technology Solutions

# Patch Management Process

## Overview

This document defines the patch management process for the Royal Technology Solutions hybrid infrastructure environment.

The purpose of patch management is to maintain the security, stability, performance, and reliability of infrastructure systems by identifying available updates, evaluating their impact, testing changes, deploying approved patches, and validating systems after maintenance.

The process applies to both on-premises infrastructure and AWS cloud resources.

---

# Patch Management Objectives

The primary objectives are:

- Reduce exposure to known vulnerabilities
- Maintain supported operating systems and software
- Establish a repeatable maintenance process
- Minimize service disruption
- Test updates before broad deployment when practical
- Maintain accurate patch records
- Validate systems after patch installation
- Support security and compliance requirements

---

# Patch Management Lifecycle

The patch management lifecycle follows a controlled process:

```text
             Identify Updates
                    |
                    |
               Assess Risk
                    |
                    |
               Test Updates
                    |
                    |
              Approve Changes
                    |
                    |
             Schedule Deployment
                    |
                    |
             Deploy Patches
                    |
                    |
            Validate Systems
                    |
                    |
             Document Results
                    |
                    |
              Monitor Systems
```

# Patch Sources

Patch sources may include:

| Platform | Patch Source |
|---|---|
| Windows Server | Microsoft Update / Windows Update |
| Windows Clients | Microsoft Update / Windows Update |
| Ubuntu Linux | Ubuntu package repositories |
| PostgreSQL | PostgreSQL supported release channels |
| pfSense | pfSense software updates |
| AWS Services | AWS-managed service updates |
| Security Tools | Vendor-supported update mechanisms |

Patch sources should be verified before deployment to ensure updates originate from trusted vendors or repositories.

# Windows Server Patch Management

Windows Server 2025 systems represent a significant portion of the Royal Technology Solutions on-premises infrastructure.

Systems may include:

- Domain controllers
- DNS servers
- DHCP servers
- File servers
- Web servers
- Application servers
- Database servers
- Security monitoring systems

Windows Server patching should include:

1. Review available updates.
2. Identify security and critical updates.
3. Determine affected systems.
4. Evaluate dependencies.
5. Test updates when practical.
6. Schedule maintenance.
7. Create or verify a current recovery point.
8. Deploy updates.
9. Reboot systems when required.
10. Validate services.
11. Document results.

# Active Directory Patch Considerations

Domain controllers require additional planning because they provide identity and authentication services.

Before patching domain controllers:

- Verify domain replication health
- Confirm DNS functionality
- Verify recent backups
- Confirm another domain controller is available when applicable
- Schedule maintenance appropriately

After patching:

- Verify Active Directory services
- Verify DNS
- Check replication
- Test authentication
- Review system event logs

# Linux and IDS Patch Management

The IDS01 system runs Ubuntu Server with XFCE and hosts Snort security monitoring components.

Linux patching should include:

- Operating system updates
- Security updates
- Snort updates
- Supporting package updates

Example update process:

```bash
sudo apt update
sudo apt upgrade
```

After updates:

```bash
sudo systemctl status snort
```

Configuration validation:

```bash
sudo snort -T -c /etc/snort/snort.conf
```

The IDS should not be considered operational until Snort service status and configuration validation have been completed.

# PostgreSQL Patch Management

RoyalDB uses PostgreSQL as its database platform.

PostgreSQL maintenance should consider:

- Database version
- Security updates
- Application compatibility
- Backup availability
- Recovery procedures
- Maintenance windows

Before updating a PostgreSQL system:

1. Verify recent database backups.
2. Confirm the recovery procedure.
3. Review application dependencies.
4. Review the target PostgreSQL release.
5. Test updates when practical.
6. Schedule maintenance.
7. Apply updates.
8. Validate database availability.
9. Verify roles and permissions.
10. Test application connectivity.

# AWS Patch Management

AWS resources require platform-specific maintenance procedures.

AWS infrastructure includes:

- EC2 instances
- Amazon RDS PostgreSQL
- VPC infrastructure
- Security Groups
- IAM resources

EC2 operating systems remain the responsibility of the organization according to the AWS shared responsibility model.

RDS maintenance is managed through AWS service mechanisms, while database configuration and operational decisions remain organizational responsibilities.

Patch management should include:

1. Review available maintenance.
2. Evaluate service impact.
3. Schedule maintenance.
4. Verify backups.
5. Apply approved updates.
6. Validate service availability.

# pfSense Patch Management

pfSense provides perimeter security and VPN services.

Because pfSense is a critical network dependency, updates should be carefully planned.

Before updating pfSense:

- Verify current configuration backup
- Review release notes
- Confirm VPN configuration
- Confirm firewall rules
- Establish a maintenance window

After updating:

- Verify firewall operation
- Verify interface status
- Verify routing
- Verify VPN connectivity
- Verify DHCP services
- Verify DNS functionality
- Review system logs

# Security Tool Patch Management

Security tools must also remain current.

Tools may include:

- Snort
- Nessus
- Qualys VMDR
- OpenVAS
- Splunk
- Darktrace
- AlienVault OTX integrations

Updates should be evaluated based on:

- Security impact
- Compatibility
- Vendor support
- Configuration requirements
- Operational impact

Security tools should be tested after updates to confirm monitoring and detection functionality remains operational.

# Patch Classification

Updates should be categorized by risk and urgency.

| Classification | Description | Target |
|---|---|---|
| Critical | Actively exploitable or severe security issue | Immediate priority |
| High | Significant vulnerability or operational risk | Expedited |
| Medium | Moderate security or stability issue | Scheduled |
| Low | Minor improvement or non-critical update | Planned maintenance |

Actual deployment timelines should be determined according to organizational risk tolerance and business requirements.

# Emergency Patching

Emergency patching may be required when a critical vulnerability presents significant risk.

Emergency patching process:

```text
Critical Vulnerability
        |
        |
Risk Assessment
        |
        |
Determine Exposure
        |
        |
Backup / Recovery Verification
        |
        |
Emergency Change Approval
        |
        |
Deploy Patch
        |
        |
Validate Systems
        |
        |
Monitor
        |
        |
Document
```

Emergency changes should still be documented even when normal maintenance procedures must be accelerated.

# Patch Testing

Updates should be tested before production deployment when practical.

Testing environments may include:

- Virtual machines
- Lab servers
- Development systems
- Test database instances

Testing should verify:

- Operating system stability
- Application functionality
- Network connectivity
- Authentication
- Database connectivity
- Security monitoring
- Backup functionality

The Royal Technology Solutions virtualization lab provides an environment for testing infrastructure changes before broader deployment.

# Maintenance Windows

Patch deployment should occur during planned maintenance windows whenever possible.

Maintenance planning should consider:

- Business operating hours
- System dependencies
- User impact
- Backup availability
- Recovery time
- Network dependencies
- Application availability

Critical infrastructure should be patched in a sequence that minimizes service interruption.

# Patch Deployment Order

A general deployment sequence is:

```text
Network Infrastructure
        |
        |
Domain / Identity Services
        |
        |
Core Infrastructure Services
        |
        |
Database Services
        |
        |
Application Services
        |
        |
Security Monitoring
```

Actual deployment order may vary based on dependencies and maintenance requirements.

# Backup Before Patching

A recoverable state should be established before significant maintenance.

Backup considerations include:

- Verify recent Veeam backups
- Verify RoyalDB database backups
- Verify pfSense configuration backup
- Verify AWS recovery capabilities
- Confirm recovery points are accessible

The objective is to provide a known recovery path if an update causes an unexpected failure.

# Patch Validation

After patch deployment, systems must be validated.

Validation should include:

## Infrastructure

- System boots successfully
- Network connectivity works
- Required services are running
- System resources are normal

## Identity

- Authentication works
- DNS functions correctly
- Active Directory services are operational
- Replication is healthy

## Database

- PostgreSQL starts successfully
- RoyalDB is accessible
- Roles and permissions remain correct
- Application connectivity works

## Network Security

- Firewall rules remain active
- VPN connectivity works
- Network segmentation remains functional

## Security Monitoring

- Snort is operational
- Security alerts are generated normally
- Logs continue to flow
- Monitoring systems remain connected

# Change Management

Patch deployment should follow a controlled change process.

Each significant change should document:

- Change description
- Systems affected
- Reason for change
- Risk assessment
- Maintenance window
- Backup verification
- Deployment results
- Validation results
- Rollback procedure
- Administrator responsible

# Rollback Strategy

If a patch causes unacceptable problems, the system should be returned to a known-good state when possible.

Potential rollback methods include:

- VM snapshot recovery
- Veeam VM restoration
- Database restoration
- Package rollback
- Configuration restoration
- AWS recovery point restoration
- pfSense configuration restoration

Rollback procedures should be tested where practical.

# Patch Monitoring

Patch management is an ongoing operational process.

Administrators should regularly review:

- Available security updates
- Failed updates
- Systems missing patches
- Unsupported software
- Vulnerability scanner findings
- Vendor security advisories
- Patch compliance

Security monitoring tools such as vulnerability scanners can help identify systems requiring additional attention.

# Patch Compliance

Patch compliance should be tracked across the infrastructure.

Example:

| System Category | Patch State |
|---|---|
| Windows Servers | Monitored |
| Linux Servers | Monitored |
| RoyalDB | Monitored |
| pfSense | Monitored |
| AWS EC2 | Monitored |
| AWS RDS | AWS Managed / Monitored |
| Security Tools | Monitored |

A future centralized dashboard can provide a consolidated view of patch compliance.

# Documentation Requirements

Patch records should include:

- Date
- System
- Patch or update
- Version before update
- Version after update
- Administrator
- Maintenance window
- Validation results
- Issues encountered
- Rollback actions if required

Maintaining accurate records supports troubleshooting, security auditing, and future maintenance planning.

# Patch Management Security

Patch management itself must be protected.

Administrative access should use:

- Least privilege
- Strong authentication
- Secure management protocols
- Restricted administrative networks
- Auditable administrator accounts

Patch files should be obtained from trusted vendor sources.

Unauthorized software or updates should never be introduced into production systems.

# Operational Metrics

Future patch management metrics may include:

- Patch compliance percentage
- Critical vulnerabilities outstanding
- Average time to patch
- Failed patch percentage
- Systems requiring remediation
- Emergency patches deployed
- Successful rollback events

These metrics can be integrated into future operational dashboards.

# Patch Management Status

| Capability | Status |
|---|---|
| Patch Management Process | Documented |
| Windows Server Patching | Documented |
| Linux / IDS Patching | Documented |
| PostgreSQL Patching | Documented |
| AWS Patching | Documented |
| pfSense Patching | Documented |
| Security Tool Patching | Documented |
| Patch Testing | Planned |
| Centralized Patch Compliance | Planned |
| Automated Patch Deployment | Planned |

# Future Enhancements

Planned improvements include:

- Centralized patch management
- Automated patch compliance reporting
- Formal maintenance schedules
- Expanded test environments
- Automated vulnerability-to-patch workflows
- Patch compliance dashboards
- Automated change documentation

# Conclusion

The Royal Technology Solutions patch management process provides a structured method for maintaining infrastructure security and operational stability.

The process incorporates Windows Server, Linux, PostgreSQL, pfSense, AWS infrastructure, and security monitoring technologies.

Future improvements will focus on centralized management, automation, compliance reporting, and measured patch performance.
