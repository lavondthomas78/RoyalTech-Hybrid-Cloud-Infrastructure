\# Royal Technology Solutions

\## Hybrid Cloud Infrastructure Project



!\[Project Status](https://img.shields.io/badge/status-completed-success)



\---



\# Project Overview



This project demonstrates the design, implementation, migration, and validation of a hybrid enterprise infrastructure connecting an on-premises environment with Amazon Web Services (AWS).



The architecture combines local infrastructure, security monitoring, encrypted VPN connectivity, cloud networking, and managed database services to create a scalable enterprise environment.



The project includes:



\- pfSense firewall and VPN gateway

\- Ubuntu IDS/Snort security monitoring

\- Internal DNS infrastructure

\- AWS VPC architecture

\- Amazon RDS PostgreSQL deployment

\- RoyalDB database migration

\- Hybrid cloud connectivity validation



\---



\# Project Objective



The objective of this project was to design and implement an enterprise-style hybrid infrastructure that securely connects on-premises resources with cloud services.



The architecture focuses on:



\- Secure private communication between environments

\- Network segmentation

\- Cloud scalability

\- Database availability

\- Security monitoring

\- Infrastructure documentation



\---



\# Architecture Summary



The completed environment consists of:



\## On-Premises Infrastructure



\- pfSense firewall

\- ROYALSERVERS network

\- IDS/Snort security monitoring

\- DNS services

\- Administrative systems



Network: 192.168.2.0/24



\---



\## AWS Cloud Infrastructure



AWS Region:us-east-2 (Ohio)





VPC: Royal-Cloud-VPC 10.20.0.0/16





Services deployed:



\- EC2 web infrastructure

\- Private subnets

\- Amazon RDS PostgreSQL

\- Virtual Private Gateway



\---



\# Hybrid Connectivity



Secure communication between environments is provided through an IPsec site-to-site VPN.



Traffic flow: On-Premises Network 192.168.2.0/24



&#x20;   |



pfSense Firewall



&#x20;   |



IPsec VPN Tunnel



&#x20;   |



AWS Virtual Private Gateway



&#x20;   |



AWS VPC

10.20.0.0/16





\---



\# Database Migration



The RoyalDB PostgreSQL database was migrated from an on-premises PostgreSQL environment into Amazon RDS.



Validation included:



\- Schema verification

\- Table validation

\- Data count verification

\- Relationship integrity checks

\- Remote database connectivity testing



Database: royaldb







Engine: PostgreSQL





\---



\# Technology Stack



\## Networking



\- pfSense

\- IPsec VPN

\- IPv4 subnetting

\- Routing

\- Firewall rules



\## Cloud



\- Amazon Web Services

\- VPC

\- EC2

\- RDS PostgreSQL

\- Security Groups



\## Security



\- Snort IDS

\- Network segmentation

\- Least privilege access

\- TLS encryption



\## Database



\- PostgreSQL

\- Relational database design

\- RBAC

\- Backup and migration procedures



\---



\# Project Status



✅ Hybrid VPN connectivity complete  

✅ AWS infrastructure deployed  

✅ RoyalDB migrated  

✅ Database validation complete  

✅ Security monitoring deployed  

✅ Documentation in progress

