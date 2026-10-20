# VPN Architecture Validation

The validated traffic path is:

```text
                 ON-PREMISES
                192.168.2.0/24
                       |
                       v
                +-------------+
                |   pfSense   |
                | Firewall/VPN|
                +------+------+
                       |
                       v
                IPsec Site-to-Site
                    VPN Tunnel
                       |
                       v
             AWS Virtual Private Gateway
                       |
                       v
                Royal-Cloud-VPC
                 10.20.0.0/16
                       |
                       v
                AWS Private Network
```

Phase 1 Validation
AWS Royal Tunnel
Tunnel: AWS Royal Tunnel
Remote Gateway: 3.132.133.187
Status: Established
Configuration
Setting	Value
IKE Version	IKEv1
Authentication	Mutual PSK
Encryption	AES-128
Hash	SHA1
DH Group	2
NAT Traversal	Enabled


Validation Result
IPsec Phase 1 successfully established.
Phase 2 Validation
AWS Royal Tunnel 1
Local Network: 192.168.2.0/24
Remote Network: 10.20.0.0/16
Protocol: ESP
Encryption: AES-128
Authentication: SHA1
Status: Installed
AWS RoyalServers P2
Local Network: 192.168.2.0/24
Remote Network: 10.20.0.0/16
Purpose:
Provides encrypted communication between on-premises infrastructure and AWS private resources.
AWS Routing Validation
The AWS route table provides the return path to the on-premises network.
Destination	Target
192.168.2.0/24	Virtual Private Gateway vgw-0099c8a877ab1509c


Purpose
The route allows AWS resources to return traffic to the on-premises network through the IPsec VPN connection.
Database Connectivity Validation
The hybrid connection was tested against the Amazon RDS PostgreSQL instance.
Target: 10.20.11.48
Port: 5432
Validation command:
nc -vz 10.20.11.48 5432

Result:
Connection to 10.20.11.48 port 5432 succeeded

Validation Result
Private AWS database connectivity confirmed.
RoyalDB Connectivity
Database: royaldb
Platform: Amazon RDS PostgreSQL
Private Address: 10.20.11.48
Connectivity Path

```
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
AWS Private Network
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
```

Validation Summary
Test	Result
Phase 1 Tunnel	Complete
Phase 2 Tunnel	Complete
AWS Routing	Complete
Private Network Access	Complete
PostgreSQL Connectivity	Complete
RoyalDB Access	Complete


Evidence Collected
Validation evidence includes:
- pfSense IPsec status screenshots
- AWS route table screenshots
- RDS security group validation
- PostgreSQL connectivity test results
- Database migration validation results
Security Validation
The VPN validation confirms:
- Encrypted communication between on-premises and AWS
- Private AWS network access
- AWS return routing
- Protected database connectivity
- Successful PostgreSQL communication
- Successful RoyalDB access
Final Status
Component	Status
pfSense VPN Endpoint	Complete
AWS VPN Gateway	Complete
Phase 1 Tunnel	Complete
Phase 2 Tunnel	Complete
AWS Routing	Complete
Private AWS Connectivity	Complete
PostgreSQL Connectivity	Complete
RoyalDB Connectivity	Complete


OPERATIONAL / COMPLETE
The Royal Technology Solutions IPsec VPN has been successfully validated as the secure connectivity layer between the on-premises 192.168.2.0/24 network and the AWS 10.20.0.0/16 network.
The validated connection provides private access to AWS resources, including the Amazon RDS PostgreSQL RoyalDB environment.
