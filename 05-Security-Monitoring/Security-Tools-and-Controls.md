\# Royal Technology Solutions

\# Security Tools and Controls Architecture



\## Overview



This document describes the security tools, controls, and monitoring technologies implemented within the Royal Technology Solutions hybrid infrastructure environment.



The security architecture follows a layered defense approach combining network security, vulnerability management, intrusion detection, cloud security controls, and centralized monitoring.



\---



\# Security Architecture Model



The environment uses multiple security layers:



```text

&#x20;                Internet



&#x20;                   |



&#x20;             pfSense Firewall



&#x20;                   |



&#x20;       ----------------------------



&#x20;       |                          |



&#x20;    On-Premises               AWS Cloud



&#x20;       |                          |



&#x20;  IDS / Snort              Security Groups



&#x20;       |



&#x20;  Vulnerability Scanning



&#x20;       |



&#x20;  Centralized Monitoring



&#x20;       |



&#x20;      SIEM Platform

Network Security Controls

pfSense Firewall



Role:



Perimeter security gateway

Firewall rule enforcement

VPN termination

Network segmentation

Traffic filtering



Security functions:



Stateful firewall inspection

NAT protection

IPsec VPN connectivity

Access control policies

Intrusion Detection

Snort IDS



Deployment: IDS01 Ubuntu Server 192.168.2.12



Purpose:



Network traffic inspection

Threat detection

Security alert generation

Suspicious activity monitoring



Capabilities:



Packet analysis

Rule-based detection

Signature matching

Alert creation

Vulnerability Management

Nessus



Purpose:



Vulnerability assessment

Configuration auditing

Security compliance scanning



Used for identifying:



Missing patches

Weak configurations

Known vulnerabilities

Qualys VMDR



Purpose:



Vulnerability management

Asset discovery

Risk prioritization



Capabilities:



Continuous assessment

Vulnerability tracking

Security visibility

OpenVAS



Purpose:



Open-source vulnerability scanning



Capabilities:



Network scanning

Vulnerability detection

Security assessment

Threat Intelligence

AlienVault OTX



Purpose:



Threat intelligence gathering

Indicator analysis

Security research



Provides:



Malicious IP intelligence

Domain reputation

Threat indicators

Advanced Threat Detection

Darktrace



Purpose:



Behavioral threat detection

Network anomaly analysis



Capabilities:



Machine learning detection

Unusual behavior identification

Threat investigation support

Security Monitoring

Splunk



Purpose:



Centralized logging

Security event analysis

Operational monitoring



Data sources:



Firewall logs

IDS alerts

Server events

AWS security logs

Cloud Security Controls

AWS Security Groups



Role:



Instance-level firewall protection

Network access control



Implemented controls:



Restricted inbound access

Controlled database connectivity

Application security boundaries

Database Security Controls

PostgreSQL Security



RoyalDB security includes:



Role-based access control

Least privilege permissions

Secure authentication

Database ownership management



Roles:



royaldb\_dba

royaldb\_tech

royaldb\_readonly



Security objectives:



Protect customer information

Limit administrative access

Maintain database integrity

Security Control Mapping

Security Area	Technology

Firewall Protection	pfSense

Network Detection	Snort IDS

Vulnerability Management	Nessus / Qualys / OpenVAS

Threat Intelligence	AlienVault OTX

Behavioral Detection	Darktrace

Log Management	Splunk

Cloud Security	AWS Security Groups

Database Protection	PostgreSQL RBAC

Future Enhancements



Planned improvements:



Security Operations Center dashboard

Automated alert response

Full SIEM deployment

Security automation workflows

Threat hunting procedures

Current Status

Component	Status

Firewall Security	Complete

IDS Deployment	Complete

Vulnerability Management Design	Complete

Cloud Security Controls	Complete

Monitoring Architecture	In Progress

