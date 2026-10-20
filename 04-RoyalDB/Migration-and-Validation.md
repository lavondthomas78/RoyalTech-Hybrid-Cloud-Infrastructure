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
