# Royal Technology Solutions

# AWS Security Groups Documentation

## Overview

This document describes the AWS security group configuration used to protect resources deployed within the Royal Technology Solutions hybrid cloud environment.

Security groups provide instance-level traffic control and enforce access policies for AWS workloads.

The design follows:

- Least privilege access
- Network segmentation
- Private resource protection
- Controlled application access

---

# Security Architecture

The AWS architecture uses Security Groups to control network access between public-facing web workloads and protected database resources.

```text
                         INTERNET
                            |
                            v
                    +----------------+
                    | Royal-Web-SG   |
                    +--------+-------+
                             |
                             v
                    +----------------+
                    |  EC2 Web       |
                    |  Servers       |
                    +--------+-------+
                             |
                             v
                     PRIVATE NETWORK
                             |
                             v
                    +----------------+
                    |  Royal-DB-SG   |
                    +--------+-------+
                             |
                             v
                    +----------------+
                    | RDS PostgreSQL |
                    |    RoyalDB     |
                    +----------------+
```

Royal-Web-SG
Security Group: Royal-Web-SG
Purpose:
Provides controlled access to public-facing EC2 web servers.
Associated Resources:
- Royal-Web-01
- Royal-Web-02
Inbound Rules
Type	Protocol	Port	Purpose
HTTP	TCP	80	Web traffic
HTTPS	TCP	443	Secure web traffic
SSH	TCP	22	Administrative access


Outbound Rules
Default outbound access:
All traffic
Purpose:
Allows web servers to communicate with required external services.
Royal-DB-SG
Security Group: Royal-DB-SG
Purpose:
Protects the Amazon RDS PostgreSQL database instance.
Associated Resource: royal-db-01
Database: royaldb
Database Access Rules
Inbound
Type	Protocol	Port	Source
PostgreSQL	TCP	5432	Approved hybrid network access


The database security group controls access to PostgreSQL on TCP port 5432.
Database Security Model
The RoyalDB database is protected using multiple security layers.
Network Layer
Controls include:
- Private subnet deployment
- No direct internet exposure
- Access through VPN connectivity
AWS Layer
Controls include:
- Security group filtering
- Restricted inbound access
- Controlled database communication
Database Layer
Controls include:
- PostgreSQL authentication
- Role-based permissions
- TLS encryption
Hybrid Cloud Security Flow
The database connectivity path follows the hybrid security architecture:
On-Premises Network

```
192.168.2.0/24
        |
        v
pfSense Firewall
        |
        v
IPsec VPN Tunnel
        |
        v
AWS Private Network
        |
        v
Royal-DB-SG
        |
        v
RDS PostgreSQL
10.20.11.48
        |
        v
RoyalDB
```

Security Validation
Validated security controls include:
Control	Status
Web server security group	Complete
Database security group	Complete
Private database access	Complete
VPN-based connectivity	Complete
PostgreSQL connectivity	Complete


Security Design Summary
The AWS security model separates public and private workloads.
Public Resources
- EC2 web servers
- Internet-facing services
Private Resources
- RDS PostgreSQL
- RoyalDB
- Internal workloads
This architecture reduces exposure while maintaining required business connectivity.
Status
Component	Status
Royal-Web-SG	Complete
Royal-DB-SG	Complete
Database Protection	Complete
Hybrid Access Control	Complete


Final Status
OPERATIONAL / COMPLETE
The AWS security group architecture provides controlled network access between public-facing web workloads and protected private database resources.
The security design integrates:
- AWS Security Groups
- Private subnet deployment
- VPN-protected connectivity
- PostgreSQL access controls
- Role-based permissions
- TLS encryption
The resulting architecture provides a controlled security boundary between the public AWS workload tier and the private RoyalDB environment.
