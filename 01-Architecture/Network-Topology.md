# Royal Technology Solutions

# Network Topology Documentation

## Overview

The Royal Technology Solutions hybrid infrastructure uses a segmented enterprise network design connecting on-premises resources with Amazon Web Services (AWS).

The topology provides:

- Network segmentation
- Secure cloud connectivity
- Private database access
- Security monitoring
- Backup and recovery
- Future infrastructure expansion

---

# Logical Network Topology

```text
                              INTERNET
                                  |
                                  v
                         +----------------+
                         |    pfSense     |
                         | Firewall/Router|
                         |  VPN Endpoint  |
                         +-------+--------+
                                 |
                    +------------+------------+
                    |                         |
                    v                         v
             ROYALTYLAN                  ROYALSERVERS
           192.168.1.0/24               192.168.2.0/24
                                             |
              +------------------------------+------------------------------+
              |              |               |              |               |
              v              v               v              v               v
            DC02           BDC02          DHCP02          DNS01           WEB01
         AD / DNS       Domain Controller    DHCP      DNS Infrastructure    IIS
        .2.20             .2.22                          .2.40
              |
              +------------------+------------------+----------------+
              |                  |                  |                |
              v                  v                  v                v
            FS01              FTP01           APPServer01       RoyalDB
          File Services       FTPS              Application      PostgreSQL
              |                  |                  |                |
              +------------------+------------------+----------------+
                                 |
                       +---------+---------+
                       |                   |
                       v                   v
                 IDS/IPS Ubuntu        MONO1 / PRTG
                   .2.12                 .2.42
                    Snort              Monitoring
                       |
                       |
                Veeam Backup Server
                       |
                       |
                 IPsec Site-to-Site VPN
                       |
                       v
                AWS Virtual Private Gateway
                       |
                       v
                 Royal-Cloud-VPC
                   10.20.0.0/16
                       |
              +--------+--------+
              |                 |
              v                 v
        Public Subnets     Private Subnets
        10.20.1.0/24       10.20.11.0/24
        10.20.2.0/24       10.20.12.0/24
              |                 |
              v                 v
           EC2 Web          RDS PostgreSQL
           Servers             RoyalDB

On-Premises Network Design
pfSense Firewall
The pfSense firewall provides the primary security and routing boundary for the on-premises environment.
Primary functions include:
- Internet gateway functionality
- Firewall enforcement
- Network segmentation
- NAT services
- Traffic filtering
- IPsec VPN connectivity
ROYALSERVERS Gateway:
192.168.2.1
Network Segments
ROYALTYLAN
Network:
192.168.1.0/24
Gateway:
192.168.1.1
Purpose:
- User devices
- Administrative systems
- Internal clients
ROYALSERVERS
Network:
192.168.2.0/24
Gateway:
192.168.2.1
Purpose:
- Infrastructure servers
- Security tools
- Monitoring systems
- Database services
- Backup infrastructure
- Hybrid cloud services
Core Infrastructure Services
System	Address	Function
pfSense	192.168.2.1	Firewall / Router / VPN
IDS/IPS Ubuntu	192.168.2.12	Snort IDS/IPS
DC02	192.168.2.20	Active Directory / DNS
BDC02	192.168.2.22	Domain Controller
DNS01	192.168.2.40	DNS Infrastructure
MONO1	192.168.2.42	PRTG Monitoring
FTP01	192.168.2.50	Secure FTPS


Additional infrastructure includes:
- WEB01
- APPServer01
- FS01
- DHCP02
- RoyalDB
- Veeam Backup Server
- Print01
- PenTest Ubuntu
- WIN 11 CLIENT
Security Monitoring
IDS/IPS Ubuntu
Address:
192.168.2.12
Technology:
- Ubuntu Server
- Snort
Purpose:
- Intrusion detection
- Network traffic monitoring
- Security analysis
- Alert generation
- Security validation
Infrastructure Monitoring
MONO1 provides infrastructure monitoring through PRTG.
Address:
192.168.2.42
PRTG provides operational visibility into infrastructure health, services, and availability.
Backup and Recovery
Veeam Backup Server provides the primary backup and recovery platform for the on-premises infrastructure.
The backup architecture supports:
- Infrastructure backup
- Recovery operations
- Backup validation
- Disaster recovery planning
- Operational resilience
Hybrid Cloud Connectivity
The on-premises environment connects to AWS through an encrypted IPsec Site-to-Site VPN.
Local Network:
192.168.2.0/24
Remote AWS Network:
10.20.0.0/16
Traffic Flow
On-Premises Network
192.168.2.0/24
        |
        v
    pfSense
        |
        v
 IPsec VPN Tunnel
        |
        v
AWS Virtual Private Gateway
        |
        v
Royal-Cloud-VPC
10.20.0.0/16
        |
        v
AWS Private Resources

AWS Network Topology
Virtual Private Cloud
Name:
Royal-Cloud-VPC
CIDR:
10.20.0.0/16
Region:
us-east-2
The AWS environment uses separate public and private subnet tiers across two Availability Zones.
AWS Public Subnets
Subnet	CIDR	Availability Zone
Royal-Public-Subnet-1	10.20.1.0/24	us-east-2a
Royal-Public-Subnet-2	10.20.2.0/24	us-east-2b


Purpose:
- EC2 web servers
- Public-facing applications
- Internet-accessible services
AWS Private Subnets
Subnet	CIDR	Availability Zone
Royal-Private-Subnet-1	10.20.11.0/24	us-east-2a
Royal-Private-Subnet-2	10.20.12.0/24	us-east-2b


Purpose:
- Amazon RDS PostgreSQL
- RoyalDB
- Internal cloud services
- Protected resources
AWS Network Components
Internet Gateway
The AWS Internet Gateway provides internet connectivity for resources deployed within the public subnet tier.
Purpose:
- Public subnet internet access
- Public EC2 connectivity
- Internet-facing workloads
Virtual Private Gateway
The AWS Virtual Private Gateway provides the AWS endpoint for the hybrid IPsec VPN connection.
Connected On-Premises Network:
192.168.2.0/24
AWS Network:
10.20.0.0/16
AWS Routing Architecture
Public Route Table
Route Table:
Royal-Public-RT
Default Route:
0.0.0.0/0 → Internet Gateway
Associated Subnets:
- 10.20.1.0/24
- 10.20.2.0/24
Private Route Table
Route Table:
Royal-Private-RT
Routes:
10.20.0.0/16    → local
192.168.2.0/24  → Virtual Private Gateway

Associated Subnets:
- 10.20.11.0/24
- 10.20.12.0/24
The private route table allows return traffic from AWS private resources to reach the on-premises network through the encrypted VPN connection.
Database Connectivity Path
The private RoyalDB database follows the hybrid connectivity path below:
Administrator
      |
      v
On-Premises Network
192.168.2.0/24
      |
      v
pfSense Firewall
192.168.2.1
      |
      v
IPsec VPN
      |
      v
AWS Virtual Private Gateway
      |
      v
Royal-Cloud-VPC
10.20.0.0/16
      |
      v
Private Subnet
10.20.11.0/24
      |
      v
RDS PostgreSQL
10.20.11.48
      |
      v
RoyalDB

Security Boundaries
The architecture separates network resources into distinct security zones.
Segment	Purpose
ROYALTYLAN	User and administrative access
ROYALSERVERS	Infrastructure and security services
AWS Public Subnets	Public workloads
AWS Private Subnets	Protected cloud workloads


Security controls include:
- Network segmentation
- Firewall enforcement
- Private subnet deployment
- Security group filtering
- VPN-protected database access
- Encrypted hybrid connectivity
- IDS/IPS monitoring
- Role-based database access
Validation
The network topology has been validated through:
- Successful IPsec tunnel establishment
- AWS route validation
- Private AWS routing
- PostgreSQL connectivity testing
- RoyalDB migration validation
- IDS connectivity testing
- Security group validation
- Private database access
Network Validation Summary
Test	Result
pfSense Firewall	Complete
ROYALTYLAN Connectivity	Complete
ROYALSERVERS Connectivity	Complete
IDS/IPS Connectivity	Complete
AWS VPN Connectivity	Complete
AWS Network Routing	Complete
Private AWS Access	Complete
PostgreSQL Connectivity	Complete
RoyalDB Connectivity	Complete


Status
Component	Status
pfSense Firewall	Complete
ROYALTYLAN Network	Complete
ROYALSERVERS Network	Complete
Network Segmentation	Complete
IDS/IPS Deployment	Complete
Infrastructure Monitoring	Complete
Backup Infrastructure	Complete
AWS VPC	Complete
AWS Subnet Architecture	Complete
AWS Routing	Complete
IPsec VPN Connectivity	Complete
Private Database Connectivity	Complete


Final Status
OPERATIONAL / COMPLETE
The Royal Technology Solutions network topology provides a segmented enterprise-style foundation connecting on-premises infrastructure with AWS.
The design provides:
- Segmented internal networks
- Centralized firewall and routing
- Security monitoring
- Infrastructure monitoring
- Backup and recovery
- Encrypted hybrid connectivity
- Public and private AWS network tiers
- Private database connectivity
- A foundation for continued infrastructure expansion
