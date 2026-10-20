# Royal Technology Solutions

# AWS Routing and Networking Documentation

## Overview

This document describes the AWS routing architecture supporting the Royal Technology Solutions hybrid cloud environment.

The routing design enables secure communication between the on-premises network and AWS private resources through an IPsec site-to-site VPN connection.

---

# AWS Routing Architecture

The AWS environment uses separate routing domains for public and private workloads.

Routing components include:

- VPC local routing
- Internet Gateway routing
- Virtual Private Gateway routing
- Private subnet routing

---

# VPC Local Routing

**VPC:** `Royal-Cloud-VPC`

**CIDR:** `10.20.0.0/16`

The local route allows communication between resources inside the AWS VPC.

| Destination | Target | Status |
|---|---|---|
| `10.20.0.0/16` | local | Active |

---

# Public Route Table

**Name:** `Royal-Public-RT`

**Purpose:**

Provides internet access for public-facing workloads.

## Public Routes

| Destination | Target | Status |
|---|---|---|
| `10.20.0.0/16` | local | Active |
| `0.0.0.0/0` | Internet Gateway | Active |

**Internet Gateway:** `igw-08cfbe50dd5cea3ab`

---

# Public Subnet Associations

Associated subnets:

- `Royal-Public-Subnet-1` — `10.20.1.0/24`
- `Royal-Public-Subnet-2` — `10.20.2.0/24`

**Purpose:**

- Web servers
- Public applications
- Internet-facing services

---

# Private Route Table

**Name:** `Royal-Private-RT`

**Purpose:**

Provides protected connectivity for private workloads.

## Private Routes

| Destination | Target | Status |
|---|---|---|
| `10.20.0.0/16` | local | Active |
| `192.168.2.0/24` | Virtual Private Gateway | Active |

**Virtual Private Gateway:** `vgw-0099c8a877ab1509c`

---

# Private Subnet Associations

Associated subnets:

- `Royal-Private-Subnet-1` — `10.20.11.0/24`
- `Royal-Private-Subnet-2` — `10.20.12.0/24`

**Purpose:**

- Database workloads
- Internal services
- Protected resources

---

# Hybrid VPN Routing

The IPsec VPN connects the on-premises server network with AWS private resources.

## Traffic Flow

```text
On-Premises Network
192.168.2.0/24
        |
        v
pfSense Firewall
        |
        v
IPsec VPN Tunnel
        |
        v
AWS Virtual Private Gateway
        |
        v
Private Route Table
        |
        v
AWS Private Resources

Return Traffic Path
AWS resources return traffic using:
Destination: 192.168.2.0/24
Target: Virtual Private Gateway vgw-0099c8a877ab1509c
This allows AWS private resources to communicate with on-premises infrastructure.
Database Connectivity Routing
The RoyalDB database connection follows this path:
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
AWS VPC
10.20.0.0/16
      |
      v
Private Subnet
10.20.11.0/24
      |
      v
RDS PostgreSQL
10.20.11.48
      |
      v
RoyalDB
```

Routing Security
The routing architecture supports network isolation between public and private workloads.
Security controls include:
- Public and private subnet separation
- Private database placement
- VPN-protected hybrid connectivity
- Controlled return routing
- AWS route-table isolation
- Security group enforcement
Validation
Routing validation completed:
Test	Result
AWS local routing	Complete
Internet Gateway routing	Complete
VPN route configuration	Complete
Private subnet communication	Complete
RDS connectivity	Complete


Connectivity Test
Command:
nc -vz 10.20.11.48 5432

Result:
Connection to 10.20.11.48 port 5432 succeeded

Validation Result:
Private AWS database connectivity confirmed.
Routing Validation Summary
Component	Status
VPC Local Routing	Complete
Public Routing	Complete
Private Routing	Complete
Internet Gateway Routing	Complete
VPN Routing	Complete
Hybrid Connectivity	Complete
RDS Connectivity	Complete


Final Status
OPERATIONAL / COMPLETE
The AWS routing architecture provides the network foundation for secure communication between the Royal Technology Solutions on-premises environment and AWS.
The routing design provides:
- Public and private network segmentation
- Internet connectivity for public workloads
- Private routing for protected workloads
- VPN-based connectivity to the on-premises network
- Private database access
- Validated connectivity to Amazon RDS PostgreSQL
