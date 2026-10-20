# Royal Technology Solutions

## Hybrid Enterprise Infrastructure & Cloud Architecture

Royal Technology Solutions is a self-designed and implemented hybrid enterprise infrastructure project combining an on-premises `Royalty.Local` environment with Amazon Web Services (AWS).

The project evolved from enterprise networking and database work into a functional infrastructure architecture that was designed, implemented, integrated, secured, tested, validated, and operated end-to-end.

The completed environment combines traditional enterprise infrastructure with cloud services, security monitoring, database services, backup and recovery, serverless computing, and managed AI/ML capabilities.

---

# Project Objectives

The project was developed to:

- Design and implement a functional enterprise infrastructure environment
- Build a secure and segmented on-premises network
- Implement centralized identity, DNS, and DHCP services
- Provide web, application, file, and secure file-transfer services
- Build and operate a PostgreSQL relational database
- Migrate RoyalDB into Amazon RDS PostgreSQL
- Establish secure hybrid connectivity between on-premises infrastructure and AWS
- Implement monitoring, intrusion detection, backup, recovery, and operational controls
- Demonstrate practical cloud architecture using AWS compute, database, serverless, monitoring, storage, and AI/ML services
- Create a foundation for continued cybersecurity, automation, and penetration-testing work

---

# Project Highlights

- Royalty.Local enterprise Windows Server 2025 environment
- pfSense perimeter firewall, router, and IPsec VPN endpoint
- Active Directory Domain Services
- DNS and DHCP
- Network segmentation
- VLANs, ACLs, OSPF, and HSRP
- IIS web services
- Application services
- Centralized file services
- FileZilla secure FTPS
- PostgreSQL RoyalDB
- Amazon RDS PostgreSQL
- AWS VPC and EC2
- AWS Lambda web-service layer
- Amazon Bedrock integration
- Amazon CloudWatch monitoring
- AWS CloudTrail auditing
- VPC Flow Logs
- IAM and Security Groups
- Amazon S3
- Snort IDS/IPS
- PRTG infrastructure monitoring
- Veeam backup and recovery
- Patch-management procedures
- Account lifecycle and incident-response procedures
- Dedicated penetration-testing environment
- End-to-end functional validation

---

# Architecture Overview

The completed architecture is organized across five major layers:

1. Network infrastructure
2. Security
3. Cloud infrastructure
4. Data services
5. Operations and management

## Finished-Product Architecture

```text
                              INTERNET
                                  |
                                  v
                         +----------------+
                         |    pfSense     |
                         | Firewall/Router|
                         |  VPN Endpoint  |
                         +-------+--------+
                                 |
                    +------------+------------+
                    |                         |
                    v                         v
             ROYALTYLAN                  ROYALSERVERS
           192.168.1.0/24               192.168.2.0/24
                                             |
              +------------------------------+------------------------------+
              |              |               |              |               |
              v              v               v              v               v
           AD / DNS         DHCP           WEB01        APPServer01         FS01
          DC02/BDC02       DHCP02           IIS         Application         Files
                                             |
                         +-------------------+-------------------+
                         |                                       |
                         v                                       v
                    PRTG / MONO1                           Snort IDS/IPS
                     Monitoring                               Security
                         |
                         |
                         v
                  RoyalDB PostgreSQL
                  On-Premises Database
                         |
                         v
                IPsec Site-to-Site VPN
                         |
                         v
                  +------------------+
                  |     AWS VPC      |
                  |   10.20.0.0/16   |
                  +---------+--------+
                            |
             +--------------+--------------+
             |              |               |
             v              v               v
          EC2 Web        Lambda       RDS PostgreSQL
         Web-01/02     Web Service         RoyalDB
                            |
                            v
                       Bedrock AI/ML

                  AWS OPERATIONS
             +-------------------------+
             | CloudWatch              |
             | CloudTrail              |
             | VPC Flow Logs           |
             | IAM                     |
             | Security Groups         |
             | S3                      |
             +-------------------------+

                  BACKUP / RECOVERY
                            |
                            v
                   Veeam Backup Server
```

The repository also contains detailed architecture diagrams for the network, hybrid cloud, AWS VPC, RoyalDB, security monitoring, and backup/recovery layers.

---

# On-Premises Infrastructure

The on-premises environment provides the foundation for the hybrid architecture.

## Royalty.Local Networks

| Network | CIDR | Purpose |
|---|---|---|
| ROYALTYLAN | `192.168.1.0/24` | User / administrative network |
| ROYALSERVERS | `192.168.2.0/24` | Infrastructure network |

Primary server gateway:

```text
192.168.2.1
```

## Core Infrastructure

| System | Address | Function |
|---|---|---|
| pfSense | `192.168.2.1` | Firewall / Router / VPN |
| IDS/IPS Ubuntu | `192.168.2.12` | Snort IDS/IPS |
| DC02 | `192.168.2.20` | Active Directory / DNS |
| BDC02 | `192.168.2.22` | Domain Controller |
| DNS01 | `192.168.2.40` | DNS infrastructure |
| MONO1 | `192.168.2.42` | PRTG monitoring |
| FTP01 | `192.168.2.50` | Secure FTPS |

Additional infrastructure includes:

- DHCP02
- WEB01
- APPServer01
- FS01
- RoyalDB
- Veeam Backup Server
- Print01
- PenTest Ubuntu
- WIN 11 CLIENT
- AWS administration VM
- Supporting infrastructure systems

---

# Identity and Access

Active Directory provides centralized authentication and identity management for the `Royalty.Local` environment.

Capabilities include:

- Domain authentication
- User accounts
- Security groups
- Group-based authorization
- Administrative separation
- Service authentication
- Account lifecycle management
- Least-privilege access

Windows 11 domain authentication was successfully validated using domain users through successful login and logout testing.

---

# Network Architecture

The on-premises network uses segmentation and controlled routing to separate user and infrastructure resources.

Network capabilities include:

- IPv4 subnetting
- VLAN segmentation
- Inter-VLAN routing
- ACLs
- OSPF
- HSRP
- DHCP
- DNS
- Firewall policy enforcement

The network was validated through connectivity, DNS, HTTPS, ACL, routing, and gateway testing.

---

# Hybrid Connectivity

The on-premises environment connects to AWS using an encrypted IPsec Site-to-Site VPN.

```text
Royalty.Local
192.168.2.0/24
      |
      v
pfSense Firewall
192.168.2.1
      |
      v
IPsec Site-to-Site VPN
      |
      v
AWS Virtual Private Gateway
      |
      v
Royal-Cloud-VPC
10.20.0.0/16
```

The VPN provides encrypted private communication between the on-premises infrastructure and AWS.

---

# Web, Application, File, and FTPS Services

## WEB01

WEB01 provides the on-premises IIS web-service layer for Royal Technology Solutions.

## APPServer01

APPServer01 provides application-service capability within the on-premises architecture.

## FS01

FS01 provides centralized file-service capability.

## FTP01

FTP01 provides secure file transfer using FileZilla Server.

The final FTPS implementation includes:

- Explicit FTP over TLS
- TLS 1.2+
- Passive FTP ports
- Domain-backed credentials
- Controlled authorization
- NTFS permissions

FileZilla connectivity and authentication were successfully validated from the master workstation.

---

# AWS Cloud Infrastructure

The AWS environment is deployed in:

```text
us-east-2 — Ohio
```

## VPC

**Name:** `Royal-Cloud-VPC`

**CIDR:** `10.20.0.0/16`

The architecture uses two Availability Zones:

- `us-east-2a`
- `us-east-2b`

## Public Subnets

| Subnet | CIDR | Availability Zone |
|---|---|---|
| Royal-Public-Subnet-1 | `10.20.1.0/24` | `us-east-2a` |
| Royal-Public-Subnet-2 | `10.20.2.0/24` | `us-east-2b` |

## Private Subnets

| Subnet | CIDR | Availability Zone |
|---|---|---|
| Royal-Private-Subnet-1 | `10.20.11.0/24` | `us-east-2a` |
| Royal-Private-Subnet-2 | `10.20.12.0/24` | `us-east-2b` |

## AWS Services

- Amazon VPC
- Internet Gateway
- Route Tables
- Virtual Private Gateway
- Amazon EC2
- Amazon RDS PostgreSQL
- AWS Lambda
- Amazon Bedrock
- Amazon CloudWatch
- AWS CloudTrail
- VPC Flow Logs
- IAM
- Security Groups
- Amazon S3

---

# AWS Compute

Two EC2 web workloads were deployed:

- Royal-Web-01
- Royal-Web-02

The EC2 layer provides cloud-based compute for the web architecture.

## AWS Lambda

AWS Lambda provides the serverless execution layer for the web service.

Lambda provides application execution without requiring a dedicated server for that portion of the architecture.

The Lambda workload is integrated with the AWS monitoring layer through CloudWatch.

## Amazon Bedrock

Amazon Bedrock provides the managed AI/ML service capability represented in the AWS architecture.

Bedrock extends the environment beyond traditional compute, networking, and database services into managed cloud AI capabilities.

---

# AWS Monitoring and Governance

## Amazon CloudWatch

Amazon CloudWatch provides AWS operational monitoring and visibility.

The monitoring architecture uses CloudWatch as the AWS-native monitoring layer for cloud workloads and services, including the Lambda web-service layer.

## AWS Security and Governance

The AWS environment incorporates multiple layers of security and governance.

### IAM

AWS Identity and Access Management controls identities, roles, and permissions.

### Security Groups

Security Groups provide workload-level network access control.

### CloudTrail

AWS CloudTrail provides auditing and visibility into AWS API activity.

### VPC Flow Logs

VPC Flow Logs provide network-flow visibility within the AWS environment.

### Amazon S3

Amazon S3 provides object-storage capability supporting cloud infrastructure and application workflows.

---

# RoyalDB

RoyalDB is a functioning PostgreSQL relational database supporting the centralized IT service-ticketing architecture.

## Core Entities

- Customer
- Location
- Device
- Contract
- Ticket
- Technician
- Ticket_Assignment

## Database Controls

RoyalDB implements:

- Primary keys
- Foreign keys
- Unique constraints
- Sequences
- Referential integrity
- Role-based access control
- Least-privilege permissions
- Backup and recovery procedures

## Configured Database Roles

- `royaldb_dba`
- `royaldb_tech`
- `royaldb_readonly`

---

# RoyalDB Cloud Migration

The on-premises PostgreSQL RoyalDB environment was migrated into Amazon RDS PostgreSQL.

The migration process included:

- Database schema extraction
- Database backup
- Schema restoration
- Table validation
- Data validation
- Relationship validation
- Constraint verification
- Role and permission planning
- AWS private database deployment

The AWS database is deployed privately within the `Royal-Cloud-VPC` architecture.

---

# Security Architecture

Security is implemented through multiple layers across the on-premises and AWS environments.

```text
Internet
   |
   v
pfSense Firewall
   |
   v
Network Segmentation
   |
   v
IPsec VPN
   |
   v
AWS Security Groups
   |
   v
Private Resources
   |
   v
RoyalDB
```

## Security Technologies and Controls

- pfSense firewall
- IPsec VPN
- VLAN segmentation
- ACL controls
- Snort IDS/IPS
- PostgreSQL RBAC
- Least privilege
- TLS encryption
- AWS Security Groups
- IAM controls
- CloudTrail
- VPC Flow Logs
- Backup and recovery controls

---

# Security Monitoring

The completed monitoring architecture combines on-premises infrastructure monitoring, network intrusion detection, and AWS-native monitoring.

## PRTG

MONO1 hosts PRTG Network Monitor.

Validated PRTG services include:

- PRTG Core Server
- PRTG Probe Service
- PRTG NATS Message Service

PRTG provides infrastructure monitoring and operational visibility.

## Snort IDS/IPS

The Ubuntu IDS/IPS environment provides network security monitoring through Snort.

```text
Network Traffic
      |
      v
   pfSense
      |
      v
 Snort IDS/IPS
      |
      v
 Security Alerts
      |
      v
Monitoring / Investigation
```

## AWS Monitoring

AWS monitoring and auditing capabilities include:

- CloudWatch
- CloudTrail
- VPC Flow Logs

Together, these components extend monitoring visibility into the cloud environment.

---

# Operations and Management

Operational management extends the architecture beyond deployment.

Completed operational areas include:

- Monitoring
- Scheduled backups
- Patch management
- Account lifecycle management
- Incident response
- Recovery procedures
- Disaster recovery planning
- Infrastructure validation

## Monitoring

Monitoring includes:

- PRTG
- Snort IDS/IPS
- CloudWatch
- CloudTrail
- VPC Flow Logs

## Backup and Recovery

Veeam Backup & Replication provides the primary on-premises backup and recovery platform.

Backup and recovery planning includes:

- Backup validation
- Recovery procedures
- Disaster recovery
- Infrastructure restoration
- Operational resilience

## Patch Management

Patch management includes:

- Windows Update monitoring
- Update-service inspection
- Recent update-event review
- Installed-update review
- Reboot-pending validation
- Patch readiness assessment

The operational baseline confirmed Windows Update orchestration and recent successful Microsoft security intelligence updates.

## Account Lifecycle

Identity operations include:

- Account creation
- Security-group assignment
- Authentication validation
- Access control
- Account review
- User lifecycle management

## Incident Response

Incident-response procedures provide a structured approach to:

- Identify operational or security events
- Validate affected systems
- Contain issues
- Investigate
- Recover affected services
- Document the event
- Validate restoration

---

# Penetration Testing Environment

A dedicated Ubuntu penetration-testing environment is maintained for future controlled security testing.

The environment provides a foundation for:

- Network reconnaissance
- Vulnerability assessment
- Service enumeration
- Security validation
- Controlled penetration-testing exercises

Penetration testing is intentionally treated as future expansion of the completed infrastructure rather than represented as completed activity.

---

# Repository Structure

```text
RoyalTech-Hybrid-Cloud-Infrastructure/
|
+-- README.md
+-- IP-Addressing-Plan.md
|
+-- 01-Architecture/
|
+-- 02-pfSense-VPN/
|
+-- 03-AWS-Infrastructure/
|
+-- 04-RoyalDB/
|
+-- 05-Security-Monitoring/
|
+-- 06-Operations-and-Management/
|
+-- 07-Screenshots/
|
+-- 08-Diagrams/
|
+-- 09-Automation-Toolkit/
```

---

# Documentation Map

## 01 — Architecture

Documents the overall enterprise and hybrid-cloud architecture.

## 02 — pfSense and VPN

Documents firewall, routing, network segmentation, and IPsec VPN configuration.

## 03 — AWS Infrastructure

Documents AWS VPC architecture, routing, security groups, EC2, RDS, Lambda, Bedrock, CloudWatch, and supporting cloud services.

## 04 — RoyalDB

Documents database architecture, schema, migration, validation, RBAC, and security.

## 05 — Security Monitoring

Documents Snort IDS/IPS, PRTG monitoring, security controls, and monitoring validation.

## 06 — Operations and Management

Documents backup, disaster recovery, patch management, monitoring operations, account lifecycle, and incident response.

## 07 — Screenshots

Contains implementation and validation evidence.

## 08 — Diagrams

Contains architecture diagrams documenting the major infrastructure relationships.

## 09 — Automation Toolkit

Contains PowerShell and other infrastructure automation used to support administration and validation.

---

# IP Addressing

The primary network ranges are:

| Network | CIDR | Purpose |
|---|---|---|
| ROYALTYLAN | `192.168.1.0/24` | User / administrative network |
| ROYALSERVERS | `192.168.2.0/24` | Infrastructure network |
| AWS Royal-Cloud-VPC | `10.20.0.0/16` | Cloud infrastructure |

Detailed addressing information is maintained in:

`IP-Addressing-Plan.md`

---

# Validation

The completed environment has undergone end-to-end functional validation.

Validated capabilities include:

- Active Directory authentication
- Domain user login/logout
- DNS
- DHCP
- Network connectivity
- Web services
- HTTPS
- Secure FTP
- FileZilla authentication
- Veeam operation
- PRTG operation
- AWS infrastructure
- AWS networking
- RDS PostgreSQL
- RoyalDB
- Hybrid VPN connectivity
- Security monitoring
- Backup and recovery capabilities
- Patch-management readiness

The Windows 11 client successfully authenticated using domain users.

The master workstation is capable of performing the primary operational functions required to manage and test the environment.

---

# Architecture Status

## OPERATIONAL / COMPLETE

The Royal Technology Solutions environment has progressed beyond proof-of-concept development.

The infrastructure has been:

1. Designed
2. Implemented
3. Integrated
4. Secured
5. Tested
6. Validated
7. Operated
8. Prepared for documentation and portfolio presentation

The resulting architecture represents a functional hybrid enterprise infrastructure environment combining traditional on-premises systems with AWS cloud services, serverless application execution, AI/ML capabilities, centralized monitoring, security controls, and backup/recovery.

---

# Project Status

| Component | Status |
|---|---|
| pfSense Firewall | Complete |
| Network Segmentation | Complete |
| IPsec VPN Connectivity | Complete |
| Active Directory | Complete |
| DNS / DHCP | Complete |
| IIS Web Services | Complete |
| Secure FTPS | Complete |
| AWS VPC Infrastructure | Complete |
| AWS Routing | Complete |
| AWS Security Groups | Complete |
| Amazon EC2 | Complete |
| Amazon RDS PostgreSQL | Complete |
| RoyalDB Migration | Complete |
| AWS Lambda Web Service | Complete |
| Amazon Bedrock Integration | Complete |
| CloudWatch Monitoring | Complete |
| CloudTrail Auditing | Complete |
| VPC Flow Logs | Complete |
| IAM Controls | Complete |
| Snort IDS/IPS | Complete |
| PRTG Monitoring | Complete |
| Veeam Backup / Recovery | Complete |
| Patch Management Documentation | Complete |
| Incident Response Documentation | Complete |
| Disaster Recovery Documentation | Complete |
| End-to-End Validation | Complete |

---

# Technology Stack

## Networking

- pfSense
- IPsec VPN
- IPv4 subnetting
- Routing
- VLANs
- ACLs
- OSPF
- HSRP
- DHCP
- DNS

## Systems

- Windows Server 2025
- Windows 11
- Ubuntu Server
- IIS
- FileZilla Server
- Oracle VirtualBox
- VMware

## Cloud

- Amazon Web Services
- Amazon VPC
- Amazon EC2
- Amazon RDS PostgreSQL
- AWS Lambda
- Amazon Bedrock
- Amazon CloudWatch
- AWS CloudTrail
- VPC Flow Logs
- Amazon S3
- Security Groups
- IAM
- Virtual Private Gateway
- Internet Gateway
- Route Tables

## Security

- Snort IDS/IPS
- pfSense
- Network segmentation
- ACLs
- Least privilege
- TLS
- Security Groups
- IAM
- CloudTrail
- VPC Flow Logs
- Security monitoring

## Database

- PostgreSQL
- RoyalDB
- Relational database design
- RBAC
- Database constraints
- Backup and recovery
- Amazon RDS PostgreSQL

## Operations

- Veeam
- PRTG
- Backup and recovery
- Disaster recovery
- Patch management
- Monitoring
- Account lifecycle management
- Incident response

---

# Architecture Diagrams

The repository includes architecture diagrams documenting the major infrastructure components and relationships.

| Diagram | Description |
|---|---|
| Hybrid Cloud Architecture | Overall on-premises and AWS architecture |
| Network Topology | On-premises network topology and segmentation |
| AWS VPC Architecture | AWS VPC, subnets, and cloud infrastructure |
| RoyalDB Architecture | Database architecture and cloud migration |
| Security Monitoring Architecture | IDS, Snort, PRTG, and security monitoring |
| Backup and Disaster Recovery Architecture | Backup, recovery, and operational resilience |
| Finished Product Architecture | Integrated enterprise and hybrid-cloud architecture |

---

# Project Evidence

Evidence included in the repository covers:

- AWS deployment
- RDS connectivity validation
- PostgreSQL schema validation
- RoyalDB migration
- Veeam backup validation
- VPN tunnel validation
- Snort IDS operational validation
- PRTG monitoring validation
- Domain authentication
- Secure FTPS
- Network architecture
- Cloud architecture
- End-to-end infrastructure validation

---

# Role

Designed, implemented, configured, integrated, troubleshot, validated, and documented the infrastructure architecture.

Areas of responsibility included:

- Network engineering
- Systems administration
- Windows Server administration
- Linux administration
- Firewall configuration
- VPN implementation
- Network segmentation
- Cloud deployment
- Database administration
- Database migration
- Security implementation
- Monitoring
- Backup and recovery
- Patch management
- Incident-response planning
- Infrastructure validation
- Technical documentation

---

# Future Expansion

The operational baseline is complete.

Future development may include:

- Expanded penetration-testing exercises
- Additional security automation
- Expanded PRTG monitoring
- Additional AWS serverless services
- Expanded Bedrock integration
- SIEM integration
- Additional cloud workloads
- Infrastructure-as-Code
- Automated patch management
- Automated compliance validation
- Additional disaster recovery testing
- Additional security validation

These items represent future development opportunities and are not requirements for the current operational baseline.

---

# Final Project Statement

Royal Technology Solutions represents a personal enterprise infrastructure architecture built from the ground up and evolved into a functional hybrid environment.

The project demonstrates the ability to design infrastructure across traditional enterprise systems and cloud services, integrate those environments securely, troubleshoot failures, recover from infrastructure problems, validate functionality, implement operational controls, and document the resulting architecture.

The completed environment combines:

- Enterprise networking
- Windows and Linux infrastructure
- Identity services
- Web and application services
- Secure file transfer
- Relational database services
- Cloud computing
- Serverless computing
- Managed AI/ML services
- Security monitoring
- Backup and recovery
- Operational management

The result is an operational hybrid infrastructure environment that provides a foundation for continued development in:

- Cloud Engineering
- Infrastructure Engineering
- Network Engineering
- Cybersecurity
- Database Administration
- Automation
- Penetration Testing

---

# Project Status

**OPERATIONAL / COMPLETE**

**Current Phase:** Portfolio Documentation

**Primary Objective:** Demonstrate practical enterprise infrastructure, hybrid cloud, security, database, and operations capabilities through a working architecture.
