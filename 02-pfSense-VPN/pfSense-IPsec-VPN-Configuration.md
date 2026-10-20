# Royal Technology Solutions

# pfSense IPsec VPN Configuration Documentation

## Overview

This document describes the configuration and validation of the site-to-site IPsec VPN connecting the Royal Technology Solutions on-premises environment with Amazon Web Services (AWS).

The VPN provides encrypted private communication between the on-premises Royalty.Local environment and the AWS Royal-Cloud-VPC.

**On-Premises Network:**

`192.168.2.0/24`

**AWS Cloud Network:**

`10.20.0.0/16`

---

# VPN Architecture

```text
                    ON-PREMISES
                  192.168.2.0/24
                         |
                         v
                +----------------+
                |    pfSense     |
                | Firewall/Router|
                |  VPN Endpoint  |
                +-------+--------+
                        |
                        v
                 IPsec Site-to-Site
                    VPN Tunnel
                        |
                        v
             AWS Virtual Private Gateway
                        |
                        v
                 Royal-Cloud-VPC
                   10.20.0.0/16

pfSense Role
pfSense provides the on-premises endpoint for the hybrid VPN connection.
Primary functions include:
- Firewall enforcement
- Network routing
- NAT control
- IPsec VPN termination
- Secure hybrid connectivity
The firewall provides the security boundary between the on-premises environment and AWS.
VPN Tunnel Information
Setting	Value
VPN Type	Site-to-Site IPsec
Protocol	IKEv1
Authentication	Mutual Pre-Shared Key
Encryption	AES-128
Hash	SHA1
DH Group	2 (1024-bit)
NAT Traversal	Enabled


Phase 1 Configuration
Tunnel Name: AWS Royal Tunnel
Remote Gateway: 3.132.133.187
IKE Version: IKEv1
Mode: Main
Authentication: Mutual Pre-Shared Key
Encryption: AES-128
Hash: SHA1
DH Group: 2
Phase 1 Validation
The AWS Royal Tunnel was successfully established.
Setting	Status
Tunnel	AWS Royal Tunnel
Remote Gateway	3.132.133.187
Phase 1	Established


Phase 2 Configuration
AWS Royal Tunnel 1
Local Network:
192.168.2.0/24
Remote Network:
10.20.0.0/16
Protocol: ESP
Encryption: AES-128
Authentication: SHA1
AWS RoyalServers Phase 2
Local Network:
192.168.2.0/24
Remote Network:
10.20.0.0/16
Purpose:
Provides secure access from the on-premises infrastructure to AWS private resources.
AWS Routing Integration
The AWS environment provides a return route for the on-premises network through the Virtual Private Gateway.
AWS Route:
192.168.2.0/24 → Virtual Private Gateway
AWS VPC:
10.20.0.0/16
This routing configuration allows private communication between the on-premises network and AWS resources.
Hybrid Connectivity
The complete connectivity path is:
On-Premises Network
192.168.2.0/24
        |
        v
    pfSense
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
        |
        v
AWS Private Resources

Private Database Connectivity
The IPsec VPN provides the network path to the private Amazon RDS PostgreSQL deployment.
Administrator
      |
      v
On-Premises Network
192.168.2.0/24
      |
      v
pfSense Firewall
192.168.2.1
      |
      v
IPsec VPN
      |
      v
AWS Virtual Private Gateway
      |
      v
AWS Private Network
      |
      v
RDS PostgreSQL
10.20.11.48
      |
      v
RoyalDB

The database remains within the AWS private subnet architecture and is accessed through the hybrid network connection.
VPN Security Design
The VPN provides multiple security controls:
- Encrypted IPsec communication
- Pre-shared key authentication
- AES-128 encryption
- SHA1 authentication
- Diffie-Hellman Group 2
- NAT Traversal
- Private AWS routing
- Restricted database access
The VPN separates private hybrid traffic from public internet traffic.
Validation
The VPN configuration was validated through:
- Phase 1 tunnel establishment
- Phase 2 security association
- AWS route validation
- Private AWS routing
- PostgreSQL connectivity
- RoyalDB connectivity
Database connectivity was validated against:
Target: 10.20.11.48
Port: 5432
Validation result:
Connection to 10.20.11.48 port 5432 succeeded

VPN Validation Summary
Component	Status
pfSense VPN Endpoint	Complete
Phase 1 Configuration	Complete
Phase 1 Establishment	Complete
Phase 2 Configuration	Complete
Phase 2 Installation	Complete
AWS Routing	Complete
Private AWS Connectivity	Complete
PostgreSQL Connectivity	Complete
RoyalDB Connectivity	Complete


Operational Status
OPERATIONAL / COMPLETE
The pfSense IPsec VPN provides the encrypted connectivity layer between the Royal Technology Solutions on-premises network and the AWS Royal-Cloud-VPC.
The validated configuration provides private network communication between:
On-Premises:
192.168.2.0/24
AWS:
10.20.0.0/16
The VPN supports secure access to private AWS resources, including the Amazon RDS PostgreSQL RoyalDB environment.
