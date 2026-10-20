# Royal Technology Solutions

# AWS VPC Architecture Documentation

## Overview

This document describes the AWS cloud network architecture implemented for the Royal Technology Solutions hybrid infrastructure environment.

The AWS deployment provides scalable cloud resources while maintaining secure private communication with the on-premises environment through an IPsec site-to-site VPN.

---

# AWS Environment

## Region

**Region:** `us-east-2` (Ohio)

---

# Virtual Private Cloud

**Name:** `Royal-Cloud-VPC`

**CIDR:** `10.20.0.0/16`

### Purpose

The VPC:

- Provides isolated AWS networking
- Hosts cloud workloads
- Supports hybrid connectivity
- Enables private resource communication

---

# VPC Architecture

## AWS Network Topology

```text
                          AWS REGION
                            us-east-2
                               |
                               v
                     +--------------------+
                     |   Royal-Cloud-VPC  |
                     |    10.20.0.0/16    |
                     +---------+----------+
                               |
                 +-------------+-------------+
                 |                           |
                 v                           v
          PUBLIC SUBNETS               PRIVATE SUBNETS
          10.20.1.0/24                 10.20.11.0/24
          10.20.2.0/24                 10.20.12.0/24
                 |                           |
                 v                           v
            EC2 WEB SERVERS              RDS POSTGRESQL
                                             |
                                             v
                                           RoyalDB
```

Subnet Design
Public Subnets
Public subnets host internet-facing workloads.
Subnet	CIDR	Availability Zone
Royal-Public-Subnet-1	10.20.1.0/24	us-east-2a
Royal-Public-Subnet-2	10.20.2.0/24	us-east-2b


Purpose
- Web servers
- Public applications
- External services
Private Subnets
Private subnets host protected workloads.
Subnet	CIDR	Availability Zone
Royal-Private-Subnet-1	10.20.11.0/24	us-east-2a
Royal-Private-Subnet-2	10.20.12.0/24	us-east-2b


Purpose
- Databases
- Internal services
- Protected resources
Internet Gateway
Internet Gateway: igw-08cfbe50dd5cea3ab
Purpose
The Internet Gateway:
- Provides internet access for public subnet resources
- Supports public EC2 workloads
- Enables internet-facing services
Virtual Private Gateway
The Virtual Private Gateway provides the AWS endpoint for the hybrid VPN connection.
Connected On-Premises Network:
192.168.2.0/24
AWS Network:
10.20.0.0/16
Routing Architecture
Public Route Table
Name: Royal-Public-RT
Default Route:
0.0.0.0/0 → Internet Gateway
Associated Subnets
- 10.20.1.0/24
- 10.20.2.0/24
Private Route Table
Name: Royal-Private-RT
Routes
Destination	Target
10.20.0.0/16	local
192.168.2.0/24	Virtual Private Gateway


Associated Subnets
- 10.20.11.0/24
- 10.20.12.0/24
On-Premises Infrastructure
The AWS architecture is integrated with the Royal Technology Solutions on-premises environment.
pfSense Firewall
pfSense provides the primary network-security boundary for the on-premises environment.
Primary Functions
- Network gateway
- Firewall enforcement
- Network segmentation
- NAT
- Traffic control
- IPsec VPN termination
- Secure hybrid connectivity
ROYALSERVERS Gateway:
192.168.2.1
Network Segmentation
The on-premises environment is divided into separate network segments.
ROYALTYLAN
Network: 192.168.1.0/24
Gateway: 192.168.1.1
Purpose
- User devices
- Administrative systems
- Internal clients
ROYALSERVERS
Network: 192.168.2.0/24
Gateway: 192.168.2.1
Purpose
- Infrastructure servers
- Security services
- Monitoring
- Database services
- Backup infrastructure
- Hybrid cloud services
Core On-Premises Services
System	Address	Function
pfSense	192.168.2.1	Firewall / Router / VPN
IDS/IPS Ubuntu	192.168.2.12	Snort IDS/IPS
DC02	192.168.2.20	Active Directory / DNS
BDC02	192.168.2.22	Domain Controller
DNS01	192.168.2.40	DNS Infrastructure
MONO1	192.168.2.42	PRTG Monitoring
FTP01	192.168.2.50	Secure FTPS


Additional infrastructure includes:
- WEB01
- APPServer01
- FS01
- RoyalDB
- DHCP02
- Veeam Backup Server
- Print01
- PenTest Ubuntu
- WIN 11 CLIENT
Security Monitoring
Snort IDS/IPS
The Ubuntu IDS/IPS system provides network intrusion detection and traffic analysis.
Address: 192.168.2.12
Technology
- Ubuntu Server
- Snort
Functions
- Intrusion detection
- Network traffic inspection
- Security analysis
- Alert generation
- Security validation
Infrastructure Monitoring
MONO1 provides infrastructure monitoring through PRTG.
Address: 192.168.2.42
PRTG provides operational visibility into infrastructure health, services, and availability.
Backup and Recovery
Veeam Backup Server provides the primary backup and recovery platform for the on-premises environment.
The backup architecture supports:
- Infrastructure backup
- Recovery operations
- Backup validation
- Disaster recovery planning
- Operational resilience
Hybrid Connectivity
Connectivity between the on-premises environment and AWS is provided through an encrypted IPsec Site-to-Site VPN.
Local Network:
192.168.2.0/24
Remote AWS Network:
10.20.0.0/16
Traffic Flow
On-Premises Network

```
192.168.2.0/24
        |
        v
    pfSense
        |
        v
 IPsec VPN Tunnel
        |
        v
AWS Virtual Private Gateway
        |
        v
Royal-Cloud-VPC
10.20.0.0/16
        |
        v
AWS Private Resources
```

AWS Infrastructure
Virtual Private Cloud
Name: Royal-Cloud-VPC
CIDR: 10.20.0.0/16
Region: us-east-2
The AWS environment uses separate public and private subnet tiers across two Availability Zones.
AWS Public Tier
Public Subnets
- 10.20.1.0/24 — us-east-2a
- 10.20.2.0/24 — us-east-2b
Purpose
- EC2 web infrastructure
- Public-facing workloads
- Internet-accessible services
AWS Private Tier
Private Subnets
- 10.20.11.0/24 — us-east-2a
- 10.20.12.0/24 — us-east-2b
Purpose
- RDS PostgreSQL
- RoyalDB
- Protected cloud resources
- Internal services
AWS Compute
EC2
The EC2 layer provides cloud-based web infrastructure.
Workloads
- Royal-Web-01
- Royal-Web-02
These systems provide the public-facing cloud web tier.
AWS Serverless Layer
AWS Lambda
AWS Lambda provides the serverless application layer supporting the web service.

```
              AWS Web Service
                     |
                     v
                   Lambda
                     |
                     v
               Serverless Logic
                     |
                     v
                  CloudWatch
```

Lambda provides application execution without requiring a dedicated server for the serverless portion of the architecture.
AWS Database Layer
Amazon RDS PostgreSQL
Amazon RDS provides the managed PostgreSQL database platform for RoyalDB.
Instance:
royal-db-01
Database:
royaldb
Private Address:
10.20.11.48
RDS is deployed within the AWS private subnet tier.
RoyalDB Cloud Migration
The RoyalDB PostgreSQL database was migrated from the on-premises environment to Amazon RDS PostgreSQL.
The migration included:
1. Source database export using pg_dump
2. Secure transfer of the backup
3. Schema restoration
4. Data restoration
5. Database validation
6. Connectivity testing
7. Security validation
The resulting architecture provides a managed cloud database integrated with the hybrid network.
AWS Security
AWS security controls include:
- Public/private subnet separation
- Security Groups
- Private database deployment
- VPN-based private access
- Controlled routing
- IAM
- PostgreSQL authentication
- Role-based database permissions
- TLS encryption
AWS Monitoring and Auditing
The AWS environment includes multiple operational and security visibility services.
CloudWatch
CloudWatch provides monitoring and operational visibility for AWS workloads and services.
CloudTrail
CloudTrail provides auditing of AWS API activity and account-level actions.
VPC Flow Logs
VPC Flow Logs provide network traffic-flow visibility within the AWS environment.
Together, these services extend the monitoring architecture from the on-premises environment into AWS.
Managed AI/ML Layer
Amazon Bedrock
Amazon Bedrock provides the managed AI/ML capability within the architecture.
The service provides a foundation for future intelligent application functionality while maintaining integration with the broader AWS environment.

```
              AWS Application Layer
                       |
                       v
                    Lambda
                       |
                       v
                 Amazon Bedrock
                       |
                       v
                  AI / ML Services

End-to-End Architecture
                         INTERNET
                            |
                            v
                         pfSense
                            |
                +-----------+-----------+
                |                       |
                v                       v
          ROYALTYLAN              ROYALSERVERS
         192.168.1.0/24           192.168.2.0/24
                                        |
                           +------------+------------+
                           |            |             |
                           v            v             v
                       Identity     Security      Operations
                       Services     Monitoring    & Backup
                           |            |             |
                           +------------+-------------+
                                        |
                                        v
                                   IPsec VPN
                                        |
                                        v
                                    AWS VPC
                                  10.20.0.0/16
                                        |
                         +--------------+--------------+
                         |                             |
                         v                             v
                    Public Tier                  Private Tier
                         |                             |
                         v                             v
                      EC2 Web                    RDS PostgreSQL
                         |                             |
                         v                             v
                      Lambda                       RoyalDB
                         |
                         v
                    Bedrock AI/ML
                         |
                         v
                  AWS Monitoring
                         |
                  +------+------+------+
                  |             |      |
                  v             v      v
              CloudWatch    CloudTrail  VPC Flow Logs
```

Security Design
The architecture implements multiple layers of security.
Network Security
- Network segmentation
- Stateful firewall enforcement
- NAT
- Private routing
- IPsec encryption
Infrastructure Security
- Active Directory
- Security monitoring
- PRTG monitoring
- Veeam backup and recovery
- Secure FTPS
AWS Security
- Public/private subnet separation
- Security Groups
- IAM
- Private RDS deployment
- VPN-based access
Database Security
- PostgreSQL authentication
- Role-based access control
- Least-privilege permissions
- TLS encryption
Monitoring and Auditing
- Snort IDS/IPS
- PRTG
- CloudWatch
- CloudTrail
- VPC Flow Logs
Current Validation Status
Component	Status
pfSense Firewall	Complete
Network Segmentation	Complete
Active Directory	Complete
DNS	Complete
DHCP	Complete
IDS/IPS Deployment	Complete
PRTG Monitoring	Complete
Veeam Backup	Complete
IPsec VPN	Complete
AWS VPC	Complete
AWS Routing	Complete
EC2 Web Infrastructure	Complete
Lambda Web Service	Complete
RDS Deployment	Complete
RoyalDB Migration	Complete
Database Validation	Complete
AWS Security Groups	Complete
CloudWatch	Complete
CloudTrail	Complete
VPC Flow Logs	Complete
Bedrock Integration	Complete


Architecture Status
OPERATIONAL / COMPLETE
The Royal Technology Solutions Hybrid Cloud Infrastructure has progressed from an initial enterprise networking project into a functional hybrid infrastructure architecture.
The completed environment integrates:
- Enterprise networking
- On-premises infrastructure
- Active Directory
- DNS and DHCP
- Firewall and routing
- IDS/IPS security monitoring
- Infrastructure monitoring
- Backup and recovery
- Secure file transfer
- IPsec hybrid connectivity
- AWS networking
- EC2 compute
- Serverless Lambda services
- Private RDS PostgreSQL
- RoyalDB
- CloudWatch monitoring
- CloudTrail auditing
- VPC Flow Logs
- Amazon Bedrock
The architecture provides a foundation for continued development in cloud engineering, cybersecurity, automation, application infrastructure, and penetration-testing research.
Final Status
Component	Status
AWS VPC	Complete
AWS Subnet Architecture	Complete
AWS Routing	Complete
Hybrid Routing	Complete
AWS Compute	Complete
Serverless Layer	Complete
Database Layer	Complete
Security Architecture	Complete
Monitoring and Auditing	Complete
Hybrid Cloud Architecture	Complete
