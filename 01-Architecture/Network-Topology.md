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
