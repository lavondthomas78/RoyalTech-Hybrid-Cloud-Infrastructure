# Royal Technology Solutions

# RoyalDB Database Schema Documentation

## Overview

This document describes the relational database schema implemented for RoyalDB.

RoyalDB is designed as a centralized IT service management database supporting:

- Customer information
- Managed assets
- Service contracts
- Support operations
- Technician assignments

The database follows relational database design principles using:

- Primary keys
- Foreign keys
- Referential integrity
- Unique constraints
- Sequence-generated identifiers

---

# Database Platform

| Setting | Value |
|---|---|
| Database Engine | PostgreSQL 18.6 |
| Database Name | `royaldb` |
| Architecture Type | Relational Database Management System (RDBMS) |

---

# Entity Relationship Overview

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

The schema separates customer, location, asset, contract, ticket, and technician information into related entities.
The Ticket_Assignment table provides the relationship between service tickets and technicians.
Database Tables
Customer Table
Purpose:
Stores customer organization information.
Primary Key:
customer_id
Relationships
Customer
   |
   +----> Location
   |
   +----> Contract

A customer can have multiple locations and service contracts.
Location Table
Purpose:
Stores physical customer locations.
Primary Key:
location_id
Foreign Key:
customer_id
Relationship
location.customer_id
        |
        v
customer.customer_id

The foreign key establishes the relationship between a customer and its physical locations.
Device Table
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

Each device is associated with a customer location.
Contract Table
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

Contracts are associated with the customer receiving the service agreement.
Ticket Table
Purpose:
Stores service requests and support issues.
Primary Key:
ticket_id
The Ticket table provides the foundation for IT service-management tracking.
Technician Table
Purpose:
Stores support technician information.
Primary Key:
technician_id
Unique Constraint:
technician_email UNIQUE
The unique constraint prevents duplicate technician email addresses.
Ticket_Assignment Table
Purpose:
Creates the relationship between tickets and technicians.
Primary Key:
ticket_assignment_id
Foreign Keys:
- ticket_id
- technician_id
Relationship
Ticket
   |
   v
Ticket_Assignment
   |
   v
Technician

The assignment table allows technicians to be associated with service tickets while maintaining the relational structure of the database.
Primary Keys
The database uses primary keys to uniquely identify records within each table.
Implemented Primary Keys
Table	Primary Key
customer	customer_id
location	location_id
device	device_id
contract	contract_id
ticket	ticket_id
technician	technician_id
ticket_assignment	ticket_assignment_id


Foreign Key Relationships
The database uses foreign keys to maintain relationships and referential integrity between related tables.
Child Table	Foreign Key	Parent Table
location	customer_id	customer
device	location_id	location
contract	customer_id	customer
ticket_assignment	ticket_id	ticket
ticket_assignment	technician_id	technician


Sequence Management
The database uses PostgreSQL sequences to generate numeric identifiers.
Implemented Sequences
customer_id_seq
location_id_seq
device_id_seq
contract_id_seq
ticket_id_seq
technician_id_seq
ticket_assignment_id_seq

Sequence-generated identifiers provide consistent numeric primary keys for the database entities.
Database Constraints
The schema implements multiple constraint types to protect data integrity.
Primary Key Constraints
Primary keys provide unique record identification within each table.
Foreign Key Constraints
Foreign keys maintain valid relationships between parent and child records.
Unique Constraints
The following unique constraint is implemented:
technician_email UNIQUE

This prevents duplicate technician email addresses.
Referential Integrity
The foreign key relationships help prevent invalid relationships and orphaned records.
The schema enforces relationships between:
Customer
   |
   +---- Location
   |
   +---- Contract
         

Location
   |
   +---- Device


Ticket
   |
   +---- Ticket_Assignment
                    |
                    +---- Technician

These relationships provide the structural foundation for the RoyalDB service-management database.
Data Integrity
The schema is designed to prevent:
- Orphan records
- Duplicate primary identifiers
- Invalid foreign-key relationships
- Duplicate technician email addresses
- Unstructured relationships between core entities
Schema Validation
The implemented database objects were validated by confirming the expected tables and record counts.
Table	Row Count
customer	3
location	3
device	4
contract	3
ticket	5
technician	3
ticket_assignment	4


Database Relationship Summary
The primary relationships can be represented as:
Customer
   |
   +--------------------+
   |                    |
   v                    v
Location             Contract
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

This design separates major business entities while maintaining the relationships required for IT service-management operations.
Database Design Summary
RoyalDB provides a structured relational foundation for:
- Customer management
- Location management
- Asset tracking
- Contract management
- Ticket management
- Technician management
- Technician assignment
The schema uses primary keys, foreign keys, unique constraints, referential integrity, and sequence-generated identifiers to provide a consistent relational database structure.
The completed schema supports migration to Amazon RDS PostgreSQL and provides the database foundation for future application development.
Status
Component	Status
Relational Schema	Complete
Entity Relationships	Complete
Primary Keys	Complete
Foreign Keys	Complete
Referential Integrity	Complete
Unique Constraints	Complete
Sequence Management	Complete
Data Validation	Complete


Final Status
OPERATIONAL / COMPLETE
The RoyalDB relational schema has been implemented and validated using PostgreSQL 18.6.
The database provides the structured data foundation for the Royal Technology Solutions IT service-management architecture and is integrated into the broader hybrid cloud environment through the Amazon RDS PostgreSQL deployment.
