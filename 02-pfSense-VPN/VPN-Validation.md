\# Royal Technology Solutions

\# IPsec VPN Validation Documentation



\## Overview



This document provides validation evidence for the successful implementation of the site-to-site IPsec VPN connecting the Royal Technology Solutions on-premises environment to Amazon Web Services (AWS).



Validation confirms:



\- IPsec tunnel establishment

\- Phase 2 security association

\- AWS routing

\- Private cloud connectivity

\- Database communication



\---



\# VPN Architecture Validation



Traffic path: 



On-Premises Network



192.168.2.0/24



&#x20;   |



&#x20;   |



pfSense Firewall



&#x20;   |



&#x20;   |



IPsec Site-to-Site VPN



&#x20;   |



&#x20;   |



AWS Virtual Private Gateway



&#x20;   |



&#x20;   |



Royal-Cloud-VPC



10.20.0.0/16



\---



\# Phase 1 Validation



\## AWS Royal Tunnel



Tunnel: AWS Royal Tunnel



Remote Gateway: 3.132.133.187



Status: Established



Configuration:



| Setting | Value |

|---|---|

| IKE Version | IKEv1 |

| Authentication | Mutual PSK |

| Encryption | AES-128 |

| Hash | SHA1 |

| DH Group | 2 |

| NAT Traversal | Enabled |



Validation Result:



IPsec Phase 1 successfully established



\---



\# Phase 2 Validation



\## AWS Royal Tunnel 1



Local Network: 192.168.2.0/24

Remote Network: 10.20.0.0/16

Protocol: ESP

Encryption: AES-128

Authentication: SHA1

Status: Installed



\---



\## AWS RoyalServers P2



Local Network: 192.168.2.0/24

Remote Network: 10.20.0.0/16



Purpose:



Provides encrypted communication between on-premises infrastructure and AWS private resources.



\---



\# AWS Routing Validation



AWS route table configuration:



Destination: 192.168.2.0/24



Target: Virtual Private Gateway vgw-0099c8a877ab1509c



Purpose: 



Allows AWS resources to return traffic to the on-premises network through the IPsec tunnel.



\---



\# Database Connectivity Validation



The hybrid connection was tested against the Amazon RDS PostgreSQL instance.



Target: 10.20.11.48

Port: 5432

Validation command: ```bash nc -vz 10.20.11.48 5432

Result: Connection to 10.20.11.48 port 5432 succeeded

Validation Result: Private AWS database connectivity confirmed RoyalDB Connectivity

Database: royaldb

Platform: Amazon RDS PostgreSQL

Connectivity path: Administrator



&#x20;   |



On-Premises Network



&#x20;   |



pfSense Firewall



&#x20;   |



IPsec VPN



&#x20;   |



AWS Private Subnet



&#x20;   |



RDS PostgreSQL



&#x20;   |



RoyalDB

Validation Summary

Test	Result

Phase 1 Tunnel	Complete

Phase 2 Tunnel	Complete

AWS Routing	Complete

Private Network Access	Complete

PostgreSQL Connectivity	Complete

RoyalDB Access	Complete

Evidence Collected



Validation evidence includes:



pfSense IPsec status screenshots

AWS route table screenshots

RDS security group validation

PostgreSQL connectivity test results

Database migration validation results

Status

Component	Status

pfSense VPN Endpoint	Complete

AWS VPN Gateway	Complete

Encryption Tunnel	Complete

Private Cloud Access	Complete

Database Connectivity	Complete

