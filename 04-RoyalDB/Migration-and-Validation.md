# Royal Technology Solutions

# RoyalDB Migration and Validation Documentation

## Overview

This document describes the migration process used to move RoyalDB from the on-premises PostgreSQL environment to Amazon RDS PostgreSQL.

The migration demonstrates a hybrid cloud database deployment model where the database workload is hosted in AWS while maintaining secure connectivity from the on-premises environment.

---

# Source Database Environment

| Setting | Value |
|---|---|
| Platform | PostgreSQL 18.6 |
| Operating System | Windows Server |
| Database | `royaldb` |

## Source Purpose

The source database supports:

- IT service management
- Customer management
- Asset tracking
- Contract management
- Ticket management

---

# Target Database Environment

| Setting | Value |
|---|---|
| Platform | Amazon RDS PostgreSQL |
| Instance | `royal-db-01` |
| Region | `us-east-2` |
| Database | `royaldb` |
| Private Address | `10.20.11.48` |
| Port | `5432` |

The target database is deployed within the private AWS subnet tier.

---

# Migration Process

The migration process followed these steps:

1. Prepare the source database
2. Create the database backup
3. Transfer the migration file
4. Restore the database to Amazon RDS
5. Validate schema objects
6. Validate data integrity
7. Validate database connectivity

---

# Database Backup

**Backup Method:**

`pg_dump`

**Backup File:**

`royaldb_aws_migration.dump`

The migration backup included:

- Database schema
- Tables
- Sequences
- Constraints
- Relationships
- Data

The backup provided the database package used to migrate RoyalDB into the AWS environment.

---

# Migration Architecture

```text
                 ON-PREMISES
             PostgreSQL 18.6
                    |
                    v
                 pg_dump
                    |
                    v
         royaldb_aws_migration.dump
                    |
                    v
             AWS Transfer
                    |
                    v
          Amazon RDS PostgreSQL
             royal-db-01
                    |
                    v
                 RoyalDB
```

Schema Migration Validation
The following database objects were validated following migration:
Database Object	Status
customer	Complete
location	Complete
device	Complete
contract	Complete
ticket	Complete
technician	Complete
ticket_assignment	Complete


Data Validation
Validated Row Counts
Table	Records
customer	3
location	3
device	4
contract	3
ticket	5
technician	3
ticket_assignment	4


The validation confirmed that the expected database records were present following migration.
Constraint Validation
The migrated database was validated for:
- Primary keys
- Foreign keys
- Unique constraints
- Sequence objects
- Table relationships
Important Constraint
technician_email UNIQUE
This constraint prevents duplicate technician email addresses.
Foreign Key Relationships

```

contract.customer_id
        |
        v
customer.customer_id


location.customer_id
        |
        v
customer.customer_id


device.location_id
        |
        v
location.location_id


ticket_assignment.ticket_id
        |
        v
ticket.ticket_id


ticket_assignment.technician_id
        |
        v
technician.technician_id
```

These relationships maintain referential integrity between the related database entities.
Connectivity Validation
Database connectivity was tested through the hybrid cloud connection.
Validation Command
nc -vz 10.20.11.48 5432

Result
Connection to 10.20.11.48 port 5432 succeeded

Validation Result
Private AWS database connectivity confirmed.
This test confirmed successful network connectivity to the PostgreSQL service hosted within the private AWS subnet.
Hybrid Database Architecture

```
                    Administrator
                         |
                         v
                 On-Premises Network
                   192.168.2.0/24
                         |
                         v
                   pfSense Firewall
                         |
                         v
                     IPsec VPN
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

The architecture allows authorized on-premises systems to communicate with the private AWS database through the encrypted hybrid connection.
Migration Results
Component	Status
Database Backup	Complete
Schema Migration	Complete
Data Migration	Complete
Constraint Validation	Complete
Connectivity Testing	Complete
AWS Database Deployment	Complete
RoyalDB Validation	Complete


Migration Validation Summary

```
Source Database
PostgreSQL 18.6
      |
      v
   pg_dump
      |
      v
Migration Backup
      |
      v
AWS Transfer
      |
      v
Amazon RDS PostgreSQL
      |
      v
Schema Validation
      |
      v
Data Validation
      |
      v
Connectivity Validation
      |
      v
RoyalDB Operational
```

Final Status
OPERATIONAL / COMPLETE
RoyalDB has been successfully migrated from the on-premises PostgreSQL environment into the hybrid cloud architecture using Amazon RDS PostgreSQL.
The migration was validated through:
- Schema validation
- Data validation
- Constraint validation
- Sequence validation
- Referential-integrity validation
- Network connectivity testing
- Private AWS database access
The completed deployment provides a managed PostgreSQL platform for RoyalDB while maintaining private connectivity through the Royal Technology Solutions hybrid network.
