\# Royal Technology Solutions

\# AWS VPC Architecture Documentation



\## Overview



This document describes the AWS cloud network architecture implemented for the Royal Technology Solutions hybrid infrastructure environment.



The AWS deployment provides scalable cloud resources while maintaining secure private communication with the on-premises environment through an IPsec site-to-site VPN.



\---



\# AWS Environment



\## Region us-east-2 (Ohio)



\---



\## Virtual Private Cloud



Name: Royal-Cloud-VPC

CIDR: 10.20.0.0/16



Purpose:



\- Provides isolated AWS networking

\- Hosts cloud workloads

\- Supports hybrid connectivity

\- Enables private resource communication



\---



\# VPC Architecture



```text

&#x20;                AWS Region

&#x20;                us-east-2



&#x20;                    |



&#x20;            Royal-Cloud-VPC



&#x20;             10.20.0.0/16



&#x20;                    |



&#x20;       --------------------------------



&#x20;       |                              |



&#x20;  Public Subnets              Private Subnets



&#x20;  10.20.1.0/24                10.20.11.0/24



&#x20;  10.20.2.0/24                10.20.12.0/24



&#x20;       |                              |



&#x20;    EC2 Web                    RDS PostgreSQL



&#x20;    Servers                    RoyalDB

Subnet Design

Public Subnets



Public subnets host internet-facing workloads.



Subnet	CIDR	Availability Zone

Royal-Public-Subnet-1	10.20.1.0/24	us-east-2a

Royal-Public-Subnet-2	10.20.2.0/24	us-east-2b



Purpose:



Web servers

Public applications

External services

Private Subnets



Private subnets host protected workloads.



Subnet	CIDR	Availability Zone

Royal-Private-Subnet-1	10.20.11.0/24	us-east-2a

Royal-Private-Subnet-2	10.20.12.0/24	us-east-2b



Purpose:



Databases

Internal services

Protected resources

Internet Gateway



Internet Gateway: igw-08cfbe50dd5cea3ab



Purpose:



Provides internet access for public subnet resources

Supports public EC2 workloads

Virtual Private Gateway



The Virtual Private Gateway provides the AWS endpoint for the hybrid VPN connection.



Connected network: 192.168.2.0/24



Remote AWS network:

10.20.0.0/16

Routing Architecture

Public Route Table



Name: Royal-Public-RT

Route: 0.0.0.0/0 → Internet Gateway



Associated subnets:

10.20.1.0/24

10.20.2.0/24

Private Route Table



Name: Royal-Private-RT



Routes:

10.20.0.0/16 → local

192.168.2.0/24 → Virtual Private Gateway



Associated subnets:

10.20.11.0/24

10.20.12.0/24

Hybrid Connectivity



Traffic path:



On-Premises Network



192.168.2.0/24



&#x20;       |



pfSense Firewall



&#x20;       |



IPsec VPN Tunnel



&#x20;       |



AWS Virtual Private Gateway



&#x20;       |



Royal-Cloud-VPC



10.20.0.0/16



Security Design



AWS networking controls include:



Private subnet database deployment

Security groups

VPN-only database access

Route isolation

Network segmentation

Deployment Status

Component	Status

AWS VPC	Complete

Subnet Architecture	Complete

Internet Gateway	Complete

VPN Gateway Connectivity	Complete

Route Tables	Complete

Hybrid Routing	Complete

