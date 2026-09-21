\# Royal Technology Solutions

\# RoyalDB RBAC and Security Documentation



\## Overview



This document describes the security model implemented for RoyalDB.



RoyalDB uses PostgreSQL role-based access control (RBAC) to enforce controlled access to database resources.



The security design follows:



\- Least privilege

\- Separation of duties

\- Controlled administrative access

\- Role-based permissions



\---



\# Database Security Architecture



RoyalDB security is implemented across multiple layers:



```text

Users / Applications



&#x20;       |



&#x20;       |



PostgreSQL Authentication



&#x20;       |



&#x20;       |



Database Roles



&#x20;       |



&#x20;       |



Database Permissions



&#x20;       |



&#x20;       |



RoyalDB Objects

PostgreSQL Roles



RoyalDB implements three primary database roles:



Role	Purpose

royaldb\_dba	Database administration

royaldb\_tech	Technical operations

royaldb\_readonly	Reporting and read access

royaldb\_dba



Purpose:



Provides database administration capabilities.



Responsibilities:



Database management

Schema administration

Permission management

Backup and recovery operations



Access Level:



Full database control

royaldb\_tech



Purpose:



Provides operational access for technical personnel.



Responsibilities:



Support operations

Ticket management

Asset updates

Service-related database tasks



Access Level: Limited DML permissions



Allowed operations:



INSERT

UPDATE

DELETE

SELECT



Access is limited to required operational functions.



royaldb\_readonly



Purpose:



Provides reporting and auditing access.



Responsibilities:



View database information

Generate reports

Review operational data



Access Level: SELECT only



This role prevents unauthorized modifications.



Least Privilege Model



RoyalDB follows the principle of least privilege.



Users receive only the permissions required for their responsibilities.



Example:



Database Administrator



&#x20;       |



&#x20;       |



royaldb\_dba



&#x20;       |



Full database management

Support Technician



&#x20;       |



&#x20;       |



royaldb\_tech



&#x20;       |



Operational database access

Reporting User



&#x20;       |



&#x20;       |



royaldb\_readonly



&#x20;       |



Read-only access

Database Ownership



Database: sroyaldb



Owner: postgres



The database owner manages:



Database privileges

Role assignments

Security configuration

Data Protection Controls



Implemented protections:



Authentication



Controls:



PostgreSQL authentication

User-based database access

Role assignment

Authorization



Controls:



RBAC permissions

Database roles

Object-level privileges

Encryption



Implemented:



TLS database connections

Encrypted VPN communication

Private AWS database deployment

Hybrid Cloud Security



Database access path:



On-Premises Administrator



&#x20;       |



&#x20;       |



pfSense Firewall



&#x20;       |



&#x20;       |



IPsec VPN Tunnel



&#x20;       |



&#x20;       |



AWS Private Network



&#x20;       |



&#x20;       |



RDS PostgreSQL



&#x20;       |



&#x20;       |



RoyalDB

Security Validation



Validated security controls:



Control	Status

PostgreSQL roles created	Complete

Least privilege permissions	Complete

Private database deployment	Complete

VPN-protected access	Complete

TLS requirement	Complete

Security Summary



RoyalDB provides a secure database foundation through:



PostgreSQL RBAC

Controlled permissions

Private cloud deployment

Encrypted communication

Separation of administrative responsibilities



The security model supports future application development while maintaining enterprise database protection.



Status

Component	Status

Role Design	Complete

Permissions Model	Complete

Database Security	Complete

Hybrid Security Integration	Complete

