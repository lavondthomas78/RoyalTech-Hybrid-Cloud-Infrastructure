# Royal Technology Solutions

# AWS RDS PostgreSQL Deployment Documentation

## Overview

This document describes the deployment and validation of the Amazon RDS PostgreSQL database environment supporting the Royal Technology Solutions hybrid cloud architecture.

The RDS deployment provides a managed database platform for RoyalDB while maintaining private network access through the hybrid VPN connection.

---

# RDS Deployment Details

## Database Instance

| Setting | Value |
|---|---|
| Instance Identifier | `royal-db-01` |
| Database Engine | PostgreSQL |
| Database Name | `royaldb` |
| Region | `us-east-2` |
| Availability Zone | `us-east-2a` |
| Port | `5432` |

---

# Network Placement

The RDS instance is deployed within the private AWS subnet layer.

**Private Subnet:** `Royal-Private-Subnet-1`

**CIDR:** `10.20.11.0/24`

**Database Address:** `10.20.11.48`

The private subnet placement prevents the database from being directly exposed to the public internet.

---

# Hybrid Connectivity Path

Database access follows the secure hybrid connectivity path below:

```text
                    ON-PREMISES
                   192.168.2.0/24
                          |
                          v
                  +---------------+
                  |    pfSense    |
                  | Firewall/VPN  |
                  +-------+-------+
                          |
                          v
                   IPsec VPN Tunnel
                          |
                          v
              AWS Virtual Private Gateway
                          |
                          v
                  AWS Private Network
                          |
                          v
                Private AWS Subnet
                  10.20.11.0/24
                          |
                          v
              Amazon RDS PostgreSQL
                   10.20.11.48
                          |
                          v
                       RoyalDB
