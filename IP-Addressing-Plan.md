# Royal Technology Solutions

# IP Addressing Plan



## Overview



This document defines the IPv4 addressing structure used throughout the Royal Technology Solutions hybrid infrastructure environment.



The addressing design provides logical network separation, infrastructure organization, secure hybrid connectivity, and room for future expansion.



The addressing plan covers the current on-premises ROYALSERVERS network and the AWS Royal-Cloud-VPC environment.



---



# Network Summary



| Network | CIDR | Purpose |

|---|---|---|

| ROYALTYLAN | 192.168.1.0/24 | User and administrative devices |

| ROYALSERVERS | 192.168.2.0/24 | Infrastructure services and hybrid connectivity |

| AWS Royal-Cloud-VPC | 10.20.0.0/16 | Cloud infrastructure |



---



# On-Premises Infrastructure



## ROYALTYLAN



Network:



```text

192.168.1.0/24



Gateway: 192.168.1.1



Purpose:



User systems

Administrative access

Internal client devices

Local enterprise resources

ROYALSERVERS



Network: 192.168.2.0/24



Gateway: 192.168.2.1



Purpose:



Server infrastructure

Security monitoring

Network services

Hybrid cloud connectivity

Infrastructure management



The ROYALSERVERS network is connected to the pfSense firewall through the dedicated server-side interface.



Infrastructure Addressing

Hostname / Device	IP Address	Function

pfSense Firewall	192.168.2.1	Firewall / VPN Gateway

IDS01	192.168.2.12	Snort IDS

DNS01	192.168.2.40	DNS Services

pfSense



Device:



pfSense



ROYALSERVERS interface:



192.168.2.1/24



Function:



Network gateway

Firewall

VPN endpoint

Network security enforcement

Traffic routing



The pfSense firewall provides the on-premises edge security function for the hybrid architecture.



IDS01



Hostname: IDS01



IP Address: 192.168.2.12



Operating System: Ubuntu Server with XFCE



Security Platform: Snort IDS



Function:



Intrusion detection

Network traffic analysis

Security alert generation

Security monitoring

DNS01



Hostname: DNS01



IP Address: 192.168.2.40



Function:



Internal DNS services

Infrastructure name resolution

Hybrid environment name resolution



DNS01 was moved from the previous 192.168.0.40 network to the current ROYALSERVERS network at 192.168.2.40.



AWS Addressing

VPC



Name: Royal-Cloud-VPC



CIDR: 10.20.0.0/16



Region: us-east-2



The VPC provides the primary private address space for the Royal Technology Solutions AWS environment.



AWS Availability Zones



The current AWS architecture uses two Availability Zones:



us-east-2a

us-east-2b



The two-AZ design supports infrastructure availability and provides separate subnet locations for cloud workloads.



AWS Public Subnets

Subnet	CIDR	Availability Zone	Purpose

Royal-Public-Subnet-1	10.20.1.0/24	us-east-2a	Public workloads

Royal-Public-Subnet-2	10.20.2.0/24	us-east-2b	Public workloads



The public subnets use routing through the Internet Gateway for approved Internet-facing resources.



AWS Private Subnets

Subnet	CIDR	Availability Zone	Purpose

Royal-Private-Subnet-1	10.20.11.0/24	us-east-2a	Database workloads

Royal-Private-Subnet-2	10.20.12.0/24	us-east-2b	Private resources



Private subnets do not use a direct Internet Gateway route.



The private network is used to protect backend resources from direct Internet exposure.



AWS Web Infrastructure



The current web infrastructure includes two EC2 instances.



Instance	Subnet	Private Network

Royal-Web-01	Royal-Public-Subnet-1	10.20.1.0/24

Royal-Web-02	Royal-Public-Subnet-2	10.20.2.0/24



The web servers are deployed across separate Availability Zones.



RoyalDB AWS Addressing

Amazon RDS PostgreSQL



Instance: royal-db-01



Database: royaldb



Port: TCP 5432



Deployment: Private



Subnet: Royal-Private-Subnet-1



Subnet CIDR: 10.20.11.0/24



RDS subnet group: royal-db-subnet-group



The RDS subnet group includes:

10.20.11.0/24

10.20.12.0/24



RDS private addresses are assigned by AWS and should not be treated as permanent infrastructure assignments. The RDS endpoint and subnet placement are the authoritative connection references.



VPN Network Relationship



The hybrid environment connects the on-premises and AWS networks through an IPsec site-to-site VPN.



Local network: 192.168.2.0/24



Remote AWS network: 10.20.0.0/16



Traffic relationship:



On-Premises ROYALSERVERS

192.168.2.0/24

&#x20;       |

&#x20;       |

pfSense Firewall

192.168.2.1

&#x20;       |

&#x20;       |

IPsec Site-to-Site VPN

&#x20;       |

&#x20;       |

AWS Virtual Private Gateway

&#x20;       |

&#x20;       |

Royal-Cloud-VPC

10.20.0.0/16

VPN Address Scope



The VPN is designed to provide private communication between: 192.168.2.0/24 and: 10.20.0.0/16



The VPN does not require public exposure of private database services.



AWS Routing

AWS Return Route



Destination: 192.168.2.0/24



Target: Virtual Private Gateway vgw-0099c8a877ab1509c



This route allows AWS resources to return traffic to the on-premises ROYALSERVERS network through the VPN connection.



Routing Design



The hybrid routing relationship is:



On-Premises

192.168.2.0/24

&#x20;      |

&#x20;      v

pfSense

192.168.2.1

&#x20;      |

&#x20;      v

IPsec VPN

&#x20;      |

&#x20;      v

AWS Virtual Private Gateway

&#x20;      |

&#x20;      v

Royal-Cloud-VPC

10.20.0.0/16

Address Allocation Strategy



The addressing design separates network functions by purpose.



192.168.1.0/24

ROYALTYLAN

User / Administrative Network



&#x20;       |



&#x20;       |



192.168.2.0/24

ROYALSERVERS

Infrastructure Network



&#x20;       |



&#x20;       | IPsec VPN



&#x20;       |



10.20.0.0/16

AWS Royal-Cloud-VPC

Cloud Infrastructure



This separation simplifies routing, firewall policy, troubleshooting, and future expansion.



Security Considerations



The addressing design supports multiple security controls.



These include:



Network segmentation

Firewall enforcement

Private AWS subnets

Security Groups

IPsec encryption

Private database deployment

Restricted administrative access

Intrusion detection



Addressing alone does not provide security; it works together with firewall rules, routing controls, access controls, and monitoring.



Addressing and RoyalDB



RoyalDB is deployed across the hybrid architecture.



On-premises: PostgreSQL RoyalDB



AWS: Amazon RDS PostgreSQL royal-db-01



The database migration architecture allows RoyalDB to operate within a private AWS subnet while maintaining controlled connectivity with the on-premises environment.



Addressing Validation



Validation activities include:



Confirming gateway addresses

Confirming subnet membership

Testing local connectivity

Testing VPN connectivity

Verifying AWS routing

Confirming private RDS placement

Confirming firewall routing

Validating DNS services



Addressing changes should be documented when infrastructure is moved between network segments.



Address Changes



The following infrastructure change is documented as part of the current architecture:



System	Previous Address	Current Address	Reason

DNS01	192.168.0.40	192.168.2.40	Moved to ROYALSERVERS network



The previous default gateway: 192.168.0.1



was removed from DNS01 after the network transition.



The current gateway is: 192.168.2.1

Addressing Documentation Standards



Future infrastructure additions should document:



Hostname

IPv4 address

Subnet

Gateway

VLAN or network segment

Function

Environment

Availability Zone when applicable

Whether the address is static or dynamically assigned



Cloud-managed addresses should be treated according to the addressing behavior of the AWS service.



Future Expansion



The addressing plan leaves room for future infrastructure expansion.



Potential additions include:



Additional application servers

Monitoring infrastructure

Management services

Additional AWS workloads

Additional private subnets

Disaster recovery resources

Development and testing environments



Future networks should use non-overlapping CIDR ranges to prevent routing conflicts.



Addressing Design Goals



The addressing architecture supports:



Logical network separation

Infrastructure organization

Secure hybrid connectivity

Private database access

Cloud scalability

Easier troubleshooting

Future infrastructure growth

Status

Component	Status

ROYALTYLAN Addressing	Documented

ROYALSERVERS Addressing	Complete

pfSense Addressing	Complete

IDS01 Addressing	Complete

DNS01 Addressing	Complete

AWS VPC Addressing	Complete

AWS Public Subnets	Complete

AWS Private Subnets	Complete

RDS Private Deployment	Complete

VPN Network Relationship	Complete

AWS Return Routing	Complete

Addressing Documentation	Complete

