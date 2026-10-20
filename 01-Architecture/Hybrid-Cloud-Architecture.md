# Royal Technology Solutions

# Hybrid Cloud Architecture Overview

## Project Overview

Royal Technology Solutions Hybrid Cloud Infrastructure is an enterprise-style architecture designed to connect an on-premises environment with Amazon Web Services (AWS).

The solution integrates local infrastructure, security monitoring, encrypted VPN connectivity, cloud networking, managed database services, serverless computing, cloud monitoring, and managed AI/ML capabilities.

The project demonstrates:

- Hybrid cloud design
- Enterprise network segmentation
- Secure site-to-site connectivity
- Cloud infrastructure deployment
- Database migration
- Security monitoring
- Backup and recovery
- Serverless application services
- Cloud monitoring and auditing
- Managed AI/ML integration

---

# Architecture Goals

The primary goals of this architecture are:

- Provide secure communication between on-premises and cloud environments
- Host scalable workloads in cloud infrastructure
- Maintain private access to sensitive resources
- Implement security monitoring and network controls
- Provide centralized database services
- Establish backup and recovery capabilities
- Create a foundation for future application expansion

---

# High-Level Architecture

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
             +-------------------------------+-------------------------------+
             |              |                |              |                 |
             v              v                v              v                 v
            DC02           BDC02           DHCP02         DNS01             WEB01
         AD / DNS       Domain Controller    DHCP      DNS Infrastructure      IIS
         .2.20             .2.22                          .2.40
             |
             +------------------+-------------------+----------------+
             |                  |                   |                |
             v                  v                   v                v
           FS01              FTP01            APPServer01         RoyalDB
       File Services         FTPS               Application       PostgreSQL
             |                  |                   |                |
             +------------------+-------------------+----------------+
                                |
                    +-----------+-----------+
                    |                       |
                    v                       v
              IDS/IPS Ubuntu            MONO1 / PRTG
                .2.12                     .2.42
                 Snort                  Monitoring
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
            +----------------------+
            |   Royal-Cloud-VPC    |
            |    10.20.0.0/16      |
            +----------+-----------+
                       |
             +---------+---------+
             |                   |
             v                   v
       PUBLIC SUBNETS       PRIVATE SUBNETS
       10.20.1.0/24         10.20.11.0/24
       10.20.2.0/24         10.20.12.0/24
             |                   |
             v                   v
          EC2 Web           RDS PostgreSQL
          Servers              RoyalDB
             |
             v
          Lambda
        Web Service
             |
             v
         Bedrock
          AI / ML
             |
             v
        CloudWatch
             |
       +-----+------+
       |            |
       v            v
   CloudTrail   VPC Flow Logs
