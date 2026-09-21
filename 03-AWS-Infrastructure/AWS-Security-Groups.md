\# Royal Technology Solutions

\# AWS Security Groups Documentation



\## Overview



This document describes the AWS security group configuration used to protect resources deployed within the Royal Technology Solutions hybrid cloud environment.



Security groups provide instance-level traffic control and enforce access policies for AWS workloads.



The design follows:



\- Least privilege access

\- Network segmentation

\- Private resource protection

\- Controlled application access



\---



\# Security Architecture



Traffic flow:



```text

Internet



&#x20;  |



&#x20;  |



Web Security Group



&#x20;  |



&#x20;  |



EC2 Web Servers



&#x20;  |



&#x20;  |



Private Network



&#x20;  |



&#x20;  |



Database Security Group



&#x20;  |



&#x20;  |



Amazon RDS PostgreSQL



&#x20;  |



&#x20;  |



RoyalDB

Royal-Web-SG



Security Group: Royal-Web-SG



Purpose:



Provides controlled access to public-facing EC2 web servers.



Associated resources:



Royal-Web-01

Royal-Web-02

Inbound Rules

Type	Protocol	Port	Purpose

HTTP	TCP	80	Web traffic

HTTPS	TCP	443	Secure web traffic

SSH	TCP	22	Administrative access

Outbound Rules



Default outbound access:



All traffic



Purpose:



Allows web servers to communicate with required external services.



Royal-DB-SG



Security Group: Royal-DB-SG



Purpose:



Protects the Amazon RDS PostgreSQL database instance.



Associated resource: royal-db-01



Database: royaldb



Database Access Rules



Inbound:



Type	Protocol	Port	Source

PostgreSQL	TCP	5432	Approved hybrid network access

Database Security Model



The database is protected using multiple layers:



Network Layer

Private subnet deployment

No direct internet exposure

Access through VPN connectivity

AWS Layer

Security group filtering

Restricted inbound access

Controlled database communication

Database Layer

PostgreSQL authentication

Role-based permissions

TLS encryption

Hybrid Cloud Security Flow

On-Premises Network



192.168.2.0/24



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



Royal-DB-SG



&#x20;       |



&#x20;       |



RDS PostgreSQL

10.20.11.48



Security Validation



Validated controls:



Control	Status

Web server security group	Complete

Database security group	Complete

Private database access	Complete

VPN-based connectivity	Complete

PostgreSQL connectivity	Complete

Security Design Summary



The AWS security model separates public and private workloads.



Public resources:



EC2 web servers

Internet-facing services



Private resources:



RDS PostgreSQL

RoyalDB

Internal workloads



This architecture reduces exposure while maintaining required business connectivity.



Status

Component	Status

Royal-Web-SG	Complete

Royal-DB-SG	Complete

Database Protection	Complete

Hybrid Access Control	Complete

