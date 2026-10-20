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
```

Database Security
The RDS deployment uses multiple security layers to protect the RoyalDB database.
Network Protection
Controls include:
- Private subnet deployment
- No direct internet exposure
- AWS security group restrictions
- VPN-based private access
- Route isolation
AWS Security Group
Security Group: Royal-DB-SG
Database: royaldb
Instance: royal-db-01
Port: 5432
The database security group controls inbound PostgreSQL access to the RDS instance.
Database Protection
Implemented database-level controls include:
- PostgreSQL authentication
- Role-based access control
- Least-privilege permissions
- TLS encryption
These controls provide protection at both the network and database layers.
RoyalDB Migration
RoyalDB was migrated from the on-premises PostgreSQL environment to Amazon RDS PostgreSQL.
The migration process included:
1. Exporting the source database using pg_dump
2. Creating the migration backup
3. Transferring the migration file
4. Restoring the schema and data
5. Validating database objects
6. Validating data integrity
7. Testing private database connectivity
Database Backup
Backup Method: pg_dump
Backup File:
royaldb_aws_migration.dump
The migration backup included:
- Database schema
- Tables
- Sequences
- Constraints
- Relationships
- Data
Database Validation
Connectivity Validation
Database connectivity was tested against the private RDS endpoint.
Target: 10.20.11.48
Port: 5432
Validation Command:
nc -vz 10.20.11.48 5432

Result:
Connection to 10.20.11.48 port 5432 succeeded

Validation Result:
Private AWS database connectivity confirmed.
Data Validation
Validated RoyalDB objects and records include:
Table	Row Count
customer	3
location	3
device	4
contract	3
ticket	5
technician	3
ticket_assignment	4

```
Database Architecture
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
Private Subnet
10.20.11.0/24
      |
      v
RDS PostgreSQL
10.20.11.48
      |
      v
RoyalDB

Hybrid Database Security
The database connectivity model combines several security boundaries:
On-Premises Security
        |
        v
pfSense Firewall
        |
        v
Encrypted IPsec VPN
        |
        v
AWS Private Network
        |
        v
AWS Security Group
        |
        v
Private RDS PostgreSQL
        |
        v
PostgreSQL Authentication
        |
        v
RoyalDB RBAC
```

This architecture keeps the database private while allowing approved hybrid connectivity.
Deployment Validation
Validated components include:
Component	Status
RDS Instance	Complete
Private Subnet Deployment	Complete
Database Security Group	Complete
VPN Database Access	Complete
RoyalDB Migration	Complete
Schema Validation	Complete
Data Validation	Complete
PostgreSQL Connectivity	Complete


Deployment Status
Component	Status
Amazon RDS PostgreSQL	Complete
royal-db-01	Complete
Private Network Placement	Complete
Security Group Protection	Complete
Hybrid VPN Connectivity	Complete
RoyalDB Migration	Complete
Database Validation	Complete


Final Status
OPERATIONAL / COMPLETE
The Royal Technology Solutions RoyalDB environment has been deployed to Amazon RDS PostgreSQL within the private AWS network.
The deployment provides:
- Managed PostgreSQL infrastructure
- Private database placement
- VPN-protected hybrid connectivity
- AWS security group protection
- PostgreSQL authentication
- Role-based access control
- TLS encryption
- Validated RoyalDB data and schema
The RDS deployment provides the managed database foundation for future Royal Technology Solutions application and service development.
