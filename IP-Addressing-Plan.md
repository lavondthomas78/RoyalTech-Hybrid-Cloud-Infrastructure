\# Royal Technology Solutions

\# IP Addressing Plan



\## Overview



This document defines the IPv4 addressing structure used throughout the Royal Technology Solutions hybrid cloud environment.



The addressing design provides:



\- Network segmentation

\- Infrastructure organization

\- Secure hybrid connectivity

\- Scalable cloud expansion



\---



\# Network Summary



| Network | CIDR | Purpose |

|---|---|---|

| ROYALTYLAN | 192.168.1.0/24 | User and administrative devices |

| ROYALSERVERS | 192.168.2.0/24 | Infrastructure services |

| AWS Royal-Cloud-VPC | 10.20.0.0/16 | Cloud environment |



\---



\# On-Premises Infrastructure



\## ROYALTYLAN



Network: 192.168.1.0/24

Gateway: 192.168.1.1





Purpose:



\- User systems

\- Administrative access

\- Internal client devices



\---



\## ROYALSERVERS



Network:





192.168.2.0/24





Gateway:





192.168.2.1





Purpose:



\- Server infrastructure

\- Security monitoring

\- Hybrid cloud connectivity



\---



\# Infrastructure Devices



| Hostname | IP Address | Function |

|---|---|---|

| pfSense Firewall | 192.168.2.1 | Firewall / VPN Gateway |

| IDS01 | 192.168.2.12 | Snort IDS |

| DNS01 | 192.168.2.20 | DNS Services |



\---



\# Security Monitoring



\## IDS01



Hostname:





ids.royalty.local



Address: 192.168.2.12

Operating System: Ubuntu Server

Security Platform: Snort IDS



\---



\# AWS Addressing



\## VPC



Name: Royal-Cloud-VPC

CIDR: 10.20.0.0/16

Region: us-east-2



\---



\# AWS Public Subnets



| Subnet | CIDR | Purpose |

|---|---|---|

| Royal-Public-Subnet-1 | 10.20.1.0/24 | Public workloads |

| Royal-Public-Subnet-2 | 10.20.2.0/24 | Public workloads |



\---



\# AWS Private Subnets



| Subnet | CIDR | Purpose |

|---|---|---|

| Royal-Private-Subnet-1 | 10.20.11.0/24 | Database workloads |

| Royal-Private-Subnet-2 | 10.20.12.0/24 | Private resources |



\---



\# Database Addressing



\## Amazon RDS PostgreSQL



Instance: royal-db-01





Private Address: 10.20.11.48

Database: royaldb

Port: TCP 5432



\---



\# VPN Network Relationship



Local Network: 192.168.2.0/24

Remote AWS Network: 10.20.0.0/16



Traffic Flow:



On-Premises Network

|

|

pfSense Firewall

|

|

IPsec VPN Tunnel

|

|

AWS Virtual Private Gateway

|

|

AWS VPC



\---



\# Routing Summary



\## AWS Return Route



Destination: 192.168.2.0/24

Target: Virtual Private Gateway vgw-0099c8a877ab1509c



\---



\# Addressing Design Goals



The addressing plan supports:



\- Logical network separation

\- Secure database access

\- Hybrid cloud communication

\- Future infrastructure growth



\---



\# Status



| Component | Status |

|---|---|

| On-Premises Addressing | Complete |

| AWS Addressing | Complete |

| VPN Networks | Complete |

| Database Addressing | Complete |









