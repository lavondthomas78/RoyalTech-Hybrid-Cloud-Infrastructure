# Royal Technology Solutions

# RoyalDB RBAC and Security Documentation

## Overview

This document describes the security model implemented for RoyalDB.

RoyalDB uses PostgreSQL Role-Based Access Control (RBAC) to enforce controlled access to database resources.

The security design follows:

- Least privilege
- Separation of duties
- Controlled administrative access
- Role-based permissions

---

# Database Security Architecture

RoyalDB security is implemented across multiple layers:

```text
Users / Applications
        |
        v
PostgreSQL Authentication
        |
        v
Database Roles
        |
        v
Database Permissions
        |
        v
RoyalDB Objects

This layered approach separates authentication, authorization, and database resource access.
PostgreSQL Roles
RoyalDB implements three primary database roles:
Role	Purpose	Access Level
royaldb_dba	Database administration	Full database control
royaldb_tech	Technical operations	Limited DML permissions
royaldb_readonly	Reporting and read access	SELECT only


royaldb_dba
Purpose
Provides database administration capabilities.
Responsibilities
- Database management
- Schema administration
- Permission management
- Backup and recovery operations
Access Level
Full database control
The royaldb_dba role is intended for authorized database administration activities.
royaldb_tech
Purpose
Provides operational database access for technical personnel.
Responsibilities
- Support operations
- Ticket management
- Asset updates
- Service-related database tasks
Access Level
Limited DML permissions
Allowed Operations
- SELECT
- INSERT
- UPDATE
- DELETE
Access is limited to the operational functions required by technical personnel.
royaldb_readonly
Purpose
Provides reporting and auditing access.
Responsibilities
- View database information
- Generate reports
- Review operational data
Access Level
SELECT only
The read-only role prevents authorized reporting users from modifying database information.
Least Privilege Model
RoyalDB follows the principle of least privilege.
Users receive only the permissions required for their responsibilities.
Database Administrator
        |
        v
   royaldb_dba
        |
        v
Full Database Management


Support Technician
        |
        v
   royaldb_tech
        |
        v
Operational Database Access


Reporting User
        |
        v
royaldb_readonly
        |
        v
Read-Only Access

This separation limits unnecessary access and reduces the potential impact of unauthorized or accidental database changes.
Database Ownership
Database:
royaldb
Owner:
postgres
The database owner manages:
- Database privileges
- Role assignments
- Security configuration
Database ownership is separate from the operational roles used for normal database access.
Data Protection Controls
RoyalDB implements security controls across authentication, authorization, encryption, and network architecture.
Authentication
Implemented controls:
- PostgreSQL authentication
- User-based database access
- Role assignment
Authentication establishes the identity of users accessing the database.
Authorization
Implemented controls:
- RBAC permissions
- Database roles
- Object-level privileges
- Least-privilege access
Authorization determines what authenticated users are permitted to do within RoyalDB.
Encryption
Implemented protections include:
- TLS database connections
- Encrypted VPN communication
- Private AWS database deployment
These controls protect database communications at both the database and network layers.
Hybrid Cloud Security
RoyalDB operates within the broader hybrid cloud security architecture.
Database Access Path
              On-Premises Administrator
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
                   Private AWS Subnet
                         |
                         v
                    RDS PostgreSQL
                         |
                         v
                       RoyalDB

The private database deployment and VPN connectivity provide protected network access between the on-premises environment and AWS.
Layered RoyalDB Security Model
                    User / Application
                           |
                           v
                  PostgreSQL Authentication
                           |
                           v
                     RBAC Role
                           |
              +------------+------------+
              |            |            |
              v            v            v
          DBA Role      Tech Role   Read-Only Role
              |            |            |
              v            v            v
         Full Access    DML Access   SELECT Access
              |            |            |
              +------------+------------+
                           |
                           v
                     RoyalDB Objects

The layered model provides controlled access based on the responsibilities of each database user.
Security Validation
The following security controls were validated:
Control	Status
PostgreSQL Roles Created	Complete
Least-Privilege Permissions	Complete
Role-Based Access Control	Complete
Private Database Deployment	Complete
VPN-Protected Access	Complete
TLS Requirement	Complete
Database Security Integration	Complete


Security Summary
RoyalDB provides a secure database foundation through:
- PostgreSQL RBAC
- Controlled permissions
- Least-privilege access
- Separation of administrative responsibilities
- Private cloud deployment
- Encrypted communication
- VPN-protected connectivity
- TLS database connections
The security model supports future application development while maintaining controlled access to enterprise database resources.
Status
Component	Status
Role Design	Complete
Permissions Model	Complete
Least-Privilege Model	Complete
Database Security	Complete
Hybrid Security Integration	Complete
Security Validation	Complete


Final Status
OPERATIONAL / COMPLETE
The RoyalDB Role-Based Access Control and security model has been implemented and validated.
The completed security architecture provides differentiated access for database administrators, technical personnel, and read-only users while integrating RoyalDB with the private hybrid cloud security architecture.
```
