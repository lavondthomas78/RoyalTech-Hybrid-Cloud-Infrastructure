# Royal Technology Solutions

# RoyalDB Architecture Documentation

## Overview

RoyalDB is the centralized relational database platform supporting the Royal Technology Solutions IT service management environment.

The database provides a structured system for managing:

- Customers
- Locations
- Devices
- Contracts
- Support tickets
- Technicians
- Ticket assignments

RoyalDB was designed as the backend data foundation for a centralized IT operations platform.

---

# Database Purpose

RoyalDB provides:

- Centralized service information
- Relational data management
- Data integrity enforcement
- Role-based database security
- Scalable cloud deployment

The database architecture supports the transition from an on-premises PostgreSQL environment to Amazon RDS PostgreSQL.

---

# Database Platform

| Setting | Value |
|---|---|
| Source Database | PostgreSQL 18.6 |
| Operating Environment | Windows Server |
| Target Database | Amazon RDS PostgreSQL |
| Database Name | `royaldb` |

---

# Database Architecture

The logical database design consists of seven primary entities.

```text
                         Customer
                        /        \
                       /          \
                      v            v
                 Location       Contract
                    |
                    v
                  Device


                  Ticket
                    |
                    v
             Ticket_Assignment
                    |
                    v
                Technician
```

The design separates major business entities while maintaining the relationships required for IT service management.
Database Entities
Customer
Purpose:
Stores customer organization information.
Primary Key:
customer_id
Customer serves as the parent entity for customer locations and service contracts.
Location
Purpose:
Stores customer site locations.
Primary Key:
location_id
Foreign Key:
customer_id
Relationship
location.customer_id
        |
        v
customer.customer_id

Device
Purpose:
Stores managed IT assets.
Primary Key:
device_id
Foreign Key:
location_id
Relationship
device.location_id
        |
        v
location.location_id

Contract
Purpose:
Stores customer service agreements.
Primary Key:
contract_id
Foreign Key:
customer_id
Relationship
contract.customer_id
        |
        v
customer.customer_id

Ticket
Purpose:
Stores service requests and support issues.
Primary Key:
ticket_id
The Ticket entity provides the foundation for IT service-management tracking.
Technician
Purpose:
Stores support personnel information.
Primary Key:
technician_id
Constraint:
technician_email UNIQUE
The unique constraint prevents duplicate technician email addresses.
Ticket_Assignment
Purpose:
Provides the relationship between tickets and technicians.
Primary Key:
ticket_assignment_id
Foreign Keys:
- ticket_id
- technician_id
Relationship

```
Ticket
   |
   v
Ticket_Assignment
   |
   v
Technician
```

This structure allows support tickets to be associated with technicians while maintaining relational integrity.
Data Integrity
RoyalDB implements multiple controls to maintain data integrity.
Implemented controls include:
- Primary keys
- Foreign keys
- Unique constraints
- Referential relationships
- Sequence-generated identifiers
These controls help prevent invalid relationships, duplicate identifiers, and orphaned records.
Database Security
RoyalDB uses PostgreSQL Role-Based Access Control (RBAC).
royaldb_dba
Purpose:
Full database administration.
Permissions:
- Schema management
- Data modification
- Database administration
- Permission management
- Backup and recovery operations
royaldb_tech
Purpose:
Technical support access.
Permissions:
- Limited data modification
- Operational database access
- SELECT
- INSERT
- UPDATE
- DELETE
Access is limited according to operational requirements.
royaldb_readonly
Purpose:
Reporting and viewing access.
Permissions:
- SELECT permissions only
This role prevents reporting users from modifying database information.
Database Security Model

```
                    Users / Applications
                            |
                            v
                  PostgreSQL Authentication
                            |
                            v
                       Database Role
                            |
              +-------------+-------------+
              |             |             |
              v             v             v
         royaldb_dba   royaldb_tech   royaldb_readonly
              |             |             |
              v             v             v
         Full Access     DML Access    Read-Only
              |             |             |
              +-------------+-------------+
                            |
                            v
                       RoyalDB Objects
```

The security model follows least-privilege and separation-of-duties principles.
Cloud Migration Architecture
RoyalDB was migrated from the on-premises PostgreSQL environment to Amazon RDS PostgreSQL.
Migration Path

```
             On-Premises PostgreSQL
                    |
                    v
              Database Backup
                    |
                    v
                   pg_dump
                    |
                    v
            Migration File
       royaldb_aws_migration.dump
                    |
                    v
               AWS Transfer
                    |
                    v
          Amazon RDS PostgreSQL
                    |
                    v
                 RoyalDB
```

Hybrid Database Architecture
After migration, RoyalDB operates within the hybrid cloud architecture.
                 On-Premises Network

```
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

This architecture allows authorized on-premises systems to communicate with the private AWS database through the encrypted hybrid connection.
Database Architecture Summary

```
                    Royal Technology Solutions
                              |
                              v
                         RoyalDB
                              |
            +-----------------+-----------------+
            |                 |                 |
            v                 v                 v
        Customers         Operations       Support
            |                 |                 |
            v                 v                 v
        Locations         Contracts        Tickets
            |                                  |
            v                                  v
         Devices                       Ticket Assignments
                                               |
                                               v
                                           Technicians
```
RoyalDB provides the centralized data foundation for the organization's IT service-management architecture.
Current Status
Component	Status
Database Design	Complete
Relational Schema	Complete
Entity Relationships	Complete
Data Integrity Controls	Complete
Security Roles	Complete
RBAC Model	Complete
Database Migration	Complete
Migration Validation	Complete
AWS RDS Deployment	Complete
Hybrid Connectivity	Complete


Final Status
OPERATIONAL / COMPLETE
RoyalDB has been implemented as the centralized relational database foundation for Royal Technology Solutions.
The architecture provides:
- Structured relational data management
- Customer and asset management
- Contract management
- IT service-ticket management
- Technician assignment
- Referential integrity
- Role-based access control
- Least-privilege database security
- On-premises PostgreSQL capability
- Amazon RDS PostgreSQL deployment
- Private hybrid cloud connectivity
RoyalDB provides the backend data foundation for future IT service-management application development.
