\# Royal Technology Solutions

\# AWS RDS PostgreSQL Deployment Documentation



\## Overview



This document describes the deployment and validation of the Amazon RDS PostgreSQL database environment supporting the Royal Technology Solutions hybrid cloud architecture.



The RDS deployment provides a managed database platform for RoyalDB while maintaining private network access through the hybrid VPN connection.



\---



\# RDS Deployment Details



\## Database Instance



| Setting | Value |

|---|---|

| Instance Identifier | royal-db-01 |

| Database Engine | PostgreSQL |

| Database Name | royaldb |

| Region | us-east-2 |

| Availability Zone | us-east-2a |

| Port | 5432 |



\---



\# Network Placement



The RDS instance is deployed within the private AWS subnet layer.



Private subnet: 

Royal-Private-Subnet-1

CIDR: 10.20.11.0/24

Database Address: 10.20.11.48



\---



\# Hybrid Connectivity Path



Database access follows this secure path: ```text On-Premises Network



192.168.2.0/24



&#x20;       |



&#x20;       |



pfSense Firewall



&#x20;       |



&#x20;       |



IPsec VPN Tunnel



&#x20;       |



&#x20;       |



AWS Virtual Private Gateway



&#x20;       |



&#x20;       |



Private AWS Subnet



10.20.11.0/24



&#x20;       |



&#x20;       |



Amazon RDS PostgreSQL



10.20.11.48



&#x20;       |



&#x20;       |



RoyalDB

Database Security



The RDS deployment uses multiple security layers.



Network Protection



Controls:



Private subnet deployment

No direct internet exposure

Security group restrictions

VPN-based access

AWS Security Group



Database security group: Royal-DB-SG



Database access: PostgreSQL TCP 5432



Purpose:



Allows approved hybrid network traffic to reach the database.



Database Protection



Implemented controls:



PostgreSQL authentication

Role-based access control

Least privilege permissions

TLS encryption requirement

RoyalDB Migration



The RoyalDB database was migrated from the on-premises PostgreSQL environment to Amazon RDS PostgreSQL.



Migration process:



Export source database using pg\_dump

Transfer backup file

Restore schema and data

Validate tables and records

Confirm database connectivity

Database Validation



Connectivity test:



Command: nc -vz 10.20.11.48 5432



Result:



Connection to 10.20.11.48 port 5432 succeeded

Data Validation



Validated database objects:



Table	Row Count

customer	3

location	3

device	4

contract	3

ticket	5

technician	3

ticket\_assignment	4

Database Architecture

Users / Administrators



&#x20;       |



On-Premises Network



&#x20;       |



pfSense VPN Gateway



&#x20;       |



IPsec VPN



&#x20;       |



AWS Private Network



&#x20;       |



RDS PostgreSQL



&#x20;       |



RoyalDB

Deployment Status

Component	Status

RDS Instance	Complete

Private Subnet Deployment	Complete

Security Group Protection	Complete

VPN Database Access	Complete

RoyalDB Migration	Complete

Data Validation	Complete

