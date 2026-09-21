# Royal Technology Solutions



# Hybrid Cloud Infrastructure Project



![Project Status](https://img.shields.io/badge/status-completed-success)



---



# Project Overview



This project documents the design, implementation, migration, security, monitoring, and operational management of a hybrid enterprise infrastructure connecting an on-premises environment with Amazon Web Services (AWS).



The architecture was developed as a hands-on enterprise infrastructure project for Royal Technology Solutions. It combines network infrastructure, perimeter security, encrypted hybrid connectivity, cloud services, database systems, intrusion detection, backup and recovery, and operational security processes.



The project demonstrates how infrastructure components can be designed and integrated into a cohesive enterprise environment rather than operating as isolated technologies.



---



# Project Objectives



The primary objectives of the project are to:



- Design an enterprise-style hybrid infrastructure

- Connect on-premises infrastructure with AWS

- Implement secure network segmentation

- Deploy pfSense as a firewall and VPN gateway

- Implement intrusion detection with Snort

- Deploy AWS VPC infrastructure

- Migrate RoyalDB PostgreSQL into Amazon RDS

- Implement database security and role-based access

- Establish backup and disaster recovery procedures

- Document patch management

- Establish monitoring and alerting operations

- Develop an incident response workflow

- Validate infrastructure functionality and security controls



---



# Architecture Overview



The completed architecture is organized into six primary infrastructure layers:



```text

&#x20;                   Royal Technology Solutions

&#x20;                             |

&#x20;                             |

&#x20;                   Enterprise Architecture

&#x20;                             |

&#x20;       ------------------------------------------------

&#x20;       |          |          |          |             |

&#x20;       |          |          |          |             |

&#x20;    Network    Security    Cloud      Data       Operations

&#x20;       |          |          |          |             |

&#x20;       ↓          ↓          ↓          ↓             ↓

&#x20;   pfSense      Snort       AWS      RoyalDB      Backup / DR

&#x20;   Routing      IDS        VPC       PostgreSQL   Patching

&#x20;   VPN          Monitoring  EC2       RBAC         Monitoring

&#x20;   VLANs        Security   RDS       Migration    Response

On-Premises Infrastructure



The on-premises environment provides the foundation for the hybrid architecture.



Primary infrastructure includes:



pfSense firewall

ROYALTYLAN network

ROYALSERVERS network

DNS infrastructure

Windows Server infrastructure

Linux infrastructure

IDS/Snort security monitoring

Internal services

Administrative systems



Current server network:



ROYALSERVERS

192.168.2.0/24



Gateway: 192.168.2.1



Key infrastructure systems include:



System	Address	Function

pfSense	192.168.2.1	Firewall / VPN Gateway

IDS01	192.168.2.12	Snort IDS

DNS01	192.168.2.40	DNS Services

Hybrid Connectivity



The on-premises environment connects to AWS using an IPsec site-to-site VPN.



On-Premises

192.168.2.0/24

&#x20;       |

&#x20;       |

&#x20;   pfSense

192.168.2.1

&#x20;       |

&#x20;       |

&#x20;  IPsec VPN

&#x20;       |

&#x20;       |

AWS Virtual Private Gateway

&#x20;       |

&#x20;       |

Royal-Cloud-VPC

10.20.0.0/16



The VPN provides encrypted private communication between the on-premises infrastructure and the AWS VPC.



AWS Cloud Infrastructure



The AWS environment is deployed in:



Region: us-east-2



VPC:



Royal-Cloud-VPC

10.20.0.0/16



The architecture uses two Availability Zones:



us-east-2a

us-east-2b

Public Subnets

Subnet	CIDR	Availability Zone

Royal-Public-Subnet-1	10.20.1.0/24	us-east-2a

Royal-Public-Subnet-2	10.20.2.0/24	us-east-2b

Private Subnets

Subnet	CIDR	Availability Zone

Royal-Private-Subnet-1	10.20.11.0/24	us-east-2a

Royal-Private-Subnet-2	10.20.12.0/24	us-east-2b



AWS services include:



Amazon VPC

EC2

Amazon RDS PostgreSQL

Security Groups

IAM

Virtual Private Gateway

Internet Gateway

Route Tables

RoyalDB



RoyalDB is the PostgreSQL relational database supporting the Royal Technology Solutions service-ticketing architecture.



The database contains entities supporting:



Customers

Locations

Devices

Contracts

Tickets

Technicians

Ticket assignments



Database security includes:



Primary keys

Foreign keys

Unique constraints

Role-based access control

Least-privilege permissions

Database backup and recovery procedures



Configured database roles include:



royaldb\_dba

royaldb\_tech

royaldb\_readonly

RoyalDB Cloud Migration



The on-premises PostgreSQL RoyalDB environment was migrated into Amazon RDS PostgreSQL.



The migration process included:



Database schema extraction

Database backup

Schema restoration

Table validation

Data validation

Relationship validation

Constraint verification

Role and permission planning

AWS private database deployment



The AWS database is deployed privately within the Royal-Cloud-VPC architecture.



Security Architecture



Security is implemented through multiple layers.



&#x20;                   Internet

&#x20;                      |

&#x20;                      ↓

&#x20;                pfSense Firewall

&#x20;                      |

&#x20;                      ↓

&#x20;               Network Segmentation

&#x20;                      |

&#x20;                      ↓

&#x20;                 IPsec VPN

&#x20;                      |

&#x20;                      ↓

&#x20;                AWS Security Groups

&#x20;                      |

&#x20;                      ↓

&#x20;                Private Resources

&#x20;                      |

&#x20;                      ↓

&#x20;                   RoyalDB



Security technologies and controls include:



pfSense firewall

IPsec VPN

VLAN segmentation

ACL controls

Snort IDS

PostgreSQL RBAC

Least privilege

TLS encryption

AWS Security Groups

IAM controls

Backup and recovery controls

Security Monitoring



The security monitoring architecture includes an Ubuntu-based IDS host running Snort.



Network Traffic

&#x20;      |

&#x20;      ↓

pfSense

&#x20;      |

&#x20;      ↓

IDS01

&#x20;      |

&#x20;      ↓

Snort IDS

&#x20;      |

&#x20;      ↓

Security Alerts

&#x20;      |

&#x20;      ↓

Monitoring / Investigation



Security monitoring documentation covers:



IDS architecture

Snort deployment

Security tools

Security controls

Monitoring validation

Future SIEM integration

Operations and Management



Operational management extends the architecture beyond deployment.



The operations framework includes:



Backup

&#x20;  ↓

Disaster Recovery

&#x20;  ↓

Patch Management

&#x20;  ↓

Monitoring

&#x20;  ↓

Incident Response

&#x20;  ↓

Continuous Improvement



Operational documentation covers:



Backup and recovery

Disaster recovery

Patch management

Monitoring and alerting

Incident response

Repository Structure

RoyalTech-Hybrid-Cloud-Infrastructure

│

├── README.md

├── IP-Addressing-Plan.md

│

├── 01-Architecture

│   ├── Hybrid-Cloud-Architecture.md

│   └── Network-Topology.md

│

├── 02-pfSense-VPN

│   ├── Firewall-Design.md

│   ├── pfSense-IPsec-VPN-Configuration.md

│   └── VPN-Validation.md

│

├── 03-AWS-Infrastructure

│   ├── AWS-RDS-Deployment.md

│   ├── AWS-Routing-and-Networking.md

│   ├── AWS-Security-Groups.md

│   └── AWS-VPC-Architecture.md

│

├── 04-RoyalDB

│   ├── Database-Schema.md

│   ├── Migration-and-Validation.md

│   ├── RBAC-and-Security.md

│   └── RoyalDB-Architecture.md

│

├── 05-Security-Monitoring

│   ├── IDS-Snort-Architecture.md

│   ├── Security-Tools-and-Controls.md

│   └── Monitoring-Validation.md

│

├── 06-Operations-and-Management

│   ├── Backup-and-Recovery-Strategy.md

│   ├── Disaster-Recovery-Plan.md

│   ├── Incident-Response-Workflow.md

│   ├── Monitoring-and-Alerting-Operations.md

│   └── Patch-Management-Process.md

│

├── 06-Screenshots

│

└── 07-Diagrams

Documentation Map

01 — Architecture



Documents the overall hybrid infrastructure design and network topology.



02 — pfSense and VPN



Documents firewall architecture, IPsec VPN configuration, and VPN validation.



03 — AWS Infrastructure



Documents AWS VPC architecture, routing, security groups, and RDS deployment.



04 — RoyalDB



Documents database architecture, schema, migration, validation, RBAC, and security.



05 — Security Monitoring



Documents Snort IDS, security tools, controls, and monitoring validation.



06 — Operations and Management



Documents backup, disaster recovery, patch management, monitoring operations, and incident response.



IP Addressing



The primary network ranges are:



Network	CIDR	Purpose

ROYALTYLAN	192.168.1.0/24	User / administrative network

ROYALSERVERS	192.168.2.0/24	Infrastructure network

AWS Royal-Cloud-VPC	10.20.0.0/16	Cloud infrastructure



Detailed addressing information is maintained in:



IP-Addressing-Plan.md

Validation



The project includes validation activities across multiple infrastructure layers.



Validation areas include:



Network connectivity

Firewall rules

IPsec VPN connectivity

AWS routing

Security Groups

RDS deployment

RoyalDB schema

Database relationships

Database permissions

IDS deployment

Security monitoring

Backup and recovery procedures

Operational processes

Technology Stack

Networking

pfSense

IPsec VPN

IPv4 subnetting

Routing

VLANs

ACLs

OSPF

HSRP

DHCP

DNS

Cloud

Amazon Web Services

VPC

EC2

Amazon RDS

Security Groups

IAM

Virtual Private Gateway

Internet Gateway

Security

Snort IDS

pfSense

Network segmentation

ACLs

Least privilege

TLS

Vulnerability management

Security monitoring

Database

PostgreSQL

RoyalDB

Relational database design

RBAC

Database constraints

Backup and recovery

AWS RDS

Operations

Backup and recovery

Disaster recovery

Patch management

Monitoring and alerting

Incident response

Project Development Approach



This environment was developed incrementally through hands-on infrastructure deployment, testing, troubleshooting, validation, and documentation.



The architecture evolved from individual networking and infrastructure projects into a larger enterprise environment.



The project emphasizes:



Practical implementation

Repeatable configuration

Security by design

Validation before expansion

Documentation of infrastructure decisions

Incremental migration toward cloud infrastructure

Current Architecture Status

Architecture Area	Status

Enterprise Architecture	Complete

Network Architecture	Complete

pfSense Firewall	Complete

IPsec VPN	Complete

AWS VPC	Complete

AWS Routing	Complete

AWS Security Groups	Complete

Amazon RDS	Complete

RoyalDB Migration	Complete

Database Security	Complete

IDS / Snort	Complete

Security Monitoring	Complete

Backup Strategy	Complete

Disaster Recovery	Complete

Patch Management	Complete

Monitoring Operations	Complete

Incident Response	Complete

Supporting Screenshots	Planned

Architecture Diagrams	Planned

Future Development



Future development may include:



Centralized SIEM deployment

Security dashboards

Automated alert response

Automated vulnerability management

Expanded AWS workloads

Additional infrastructure services

Infrastructure-as-code implementation

Automated deployment pipelines

Expanded disaster recovery testing

Additional architecture diagrams

Expanded validation evidence

Project Status



Hybrid Cloud Infrastructure Architecture: Complete



The core infrastructure architecture, cloud migration, security monitoring, database deployment, and operational management documentation have been completed.



The remaining portfolio work focuses on organizing visual evidence, final diagrams, documentation quality assurance, and continued infrastructure development.



Purpose of This Repository



This repository serves as the technical documentation and portfolio record for the Royal Technology Solutions hybrid infrastructure environment.



It demonstrates the design and integration of networking, security, cloud infrastructure, database services, monitoring, and operational management into a unified enterprise architecture.



The environment continues to provide a foundation for future infrastructure expansion and additional automation.

