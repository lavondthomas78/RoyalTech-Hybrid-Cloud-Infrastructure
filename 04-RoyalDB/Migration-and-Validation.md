\# Royal Technology Solutions

\# RoyalDB Migration and Validation Documentation



\## Overview



This document describes the migration process used to move RoyalDB from the on-premises PostgreSQL environment to Amazon RDS PostgreSQL.



The migration demonstrates a hybrid cloud database deployment model where the database workload is hosted in AWS while maintaining secure connectivity from the on-premises environment.



\---



\# Source Database Environment



Source Platform: PostgreSQL 18.6



Operating System: Windows Server



Database: royaldb



Source Purpose:



\- IT service management database

\- Customer management

\- Asset tracking

\- Contract management

\- Ticket management



\---



\# Target Database Environment



Platform: Amazon RDS PostgreSQL



Instance: royal-db-01



Region: us-east-2



Database: royaldb



Endpoint Address: 10.20.11.48



Port: 5432



\---



\# Migration Process



The migration process followed these steps:



1\. Prepare source database

2\. Create database backup

3\. Transfer migration file

4\. Restore database to Amazon RDS

5\. Validate schema objects

6\. Validate data integrity

7\. Test application connectivity



\---



\# Database Backup



Backup method: pg\_dump





Backup file: royaldb\_aws\_migration.dump



The backup included:



\- Database schema

\- Tables

\- Sequences

\- Constraints

\- Relationships

\- Data



\---



\# Migration Architecture



```text

On-Premises PostgreSQL



&#x20;       |



&#x20;       |



pg\_dump Backup



&#x20;       |



&#x20;       |



Migration File



royaldb\_aws\_migration.dump



&#x20;       |



&#x20;       |



AWS Transfer



&#x20;       |



&#x20;       |



Amazon RDS PostgreSQL



&#x20;       |



&#x20;       |



RoyalDB

Schema Migration Validation



Validated database objects:



Object	Status

customer	Complete

location	Complete

device	Complete

contract	Complete

ticket	Complete

technician	Complete

ticket\_assignment	Complete

Data Validation



Validated row counts:



Table	Records

customer	3

location	3

device	4

contract	3

ticket	5

technician	3

ticket\_assignment	4



Validation confirms successful migration of database records.



Constraint Validation



Validated:



Primary keys

Foreign keys

Unique constraints

Sequence objects

Table relationships



Important constraints: technician\_email UNIQUE



Foreign key relationships:



contract.customer\_id → customer.customer\_id



location.customer\_id → customer.customer\_id



device.location\_id → location.location\_id



ticket\_assignment.ticket\_id → ticket.ticket\_id



ticket\_assignment.technician\_id → technician.technician\_id

Connectivity Validation



Database connectivity was tested through the hybrid cloud connection.



Test: nc -vz 10.20.11.48 5432



Result: Connection to 10.20.11.48 port 5432 succeeded



Validation: Private AWS database connectivity confirmed



Hybrid Database Architecture

Administrator



&#x20;     |



&#x20;     |



On-Premises Network



192.168.2.0/24



&#x20;     |



&#x20;     |



pfSense Firewall



&#x20;     |



&#x20;     |



IPsec VPN Tunnel



&#x20;     |



&#x20;     |



AWS Private Network



&#x20;     |



&#x20;     |



Amazon RDS PostgreSQL



&#x20;     |



&#x20;     |



RoyalDB

Migration Results

Component	Status

Database Backup	Complete

Schema Migration	Complete

Data Migration	Complete

Constraint Validation	Complete

Connectivity Testing	Complete

AWS Database Deployment	Complete

Final Status



RoyalDB has been successfully migrated into the hybrid cloud architecture.



The database now provides a secure and scalable foundation for future IT service management applications.

