\# Royal Technology Solutions

\# Network Topology Documentation



\## Overview



The Royal Technology Solutions hybrid infrastructure uses a segmented enterprise network design connecting on-premises resources with Amazon Web Services (AWS).



The topology provides:



\- Network segmentation

\- Secure cloud connectivity

\- Private database access

\- Security monitoring

\- Future infrastructure expansion



\---



\# Logical Network Topology



```text

&#x20;                        INTERNET

&#x20;                           |

&#x20;                           |

&#x20;                   pfSense Firewall

&#x20;                   FW01-RoyalServers

&#x20;                           |

&#x20;           --------------------------------

&#x20;           |

&#x20;           |

&#x20;      On-Premises Network



&#x20;           |

&#x20;           |

&#x20;   -------------------------

&#x20;   |                       |

&#x20;ROYALTYLAN            ROYALSERVERS

192.168.1.0/24        192.168.2.0/24



&#x20;                           |

&#x20;            --------------------------------

&#x20;            |                              |

&#x20;           IDS01                         DNS01

&#x20;       192.168.2.12                  192.168.2.20



&#x20;            |

&#x20;            |

&#x20;       Snort IDS Monitoring



On-Premises Network Design

pfSense Firewall



The pfSense firewall provides:



Internet gateway functionality

Firewall enforcement

Network segmentation

IPsec VPN connectivity



Primary server network gateway: 192.168.2.1



Network Segments

ROYALTYLAN



Purpose:



User devices

Administrative systems

Internal clients



Network: 192.168.1.0/24

Gateway: 192.168.1.1



Purpose:



Infrastructure servers

Security tools

Cloud connectivity



Network: 192.168.2.0/24

Gateway: 192.168.2.1



Infrastructure Services

IDS01



Hostname: ids.royalty.local

Address: 192.168.2.12



Role: 



Intrusion detection

Network monitoring

Snort security analysis



DNS01



Address: 192.168.2.20



Role:



Internal name resolution

Infrastructure service discovery

Hybrid Cloud Connectivity



The on-premises environment connects to AWS using an IPsec site-to-site VPN.



Traffic flow:



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



AWS Virtual Private Gateway



&#x20;       |



&#x20;       |



AWS VPC



10.20.0.0/16



AWS Network Topology



VPC



Name: Royal-Cloud-VPC



CIDR: 10.20.0.0/16



Region: us-east-2



AWS Subnet Design

Public Tier



Used for internet-accessible workloads.



10.20.1.0/24

10.20.2.0/24



Components:



EC2 web servers

Public-facing services

Private Tier



Used for protected workloads.



10.20.11.0/24

10.20.12.0/24



Components:



Database services

Internal cloud resources

Database Connectivity Path



Administrator



&#x20;     |



On-Premises Network



192.168.2.0/24



&#x20;     |



pfSense Firewall



&#x20;     |



IPsec VPN



&#x20;     |



AWS VPC



&#x20;     |



RDS PostgreSQL



10.20.11.48



&#x20;     |



RoyalDB



Security Boundaries



The architecture separates:



Segment	Purpose

ROYALTYLAN	User access

ROYALSERVERS	Infrastructure services

AWS Public Subnets	Public workloads

AWS Private Subnets	Protected workloads

Validation



The topology has been validated through:



Successful IPsec tunnel establishment

Private AWS routing

PostgreSQL connectivity

RoyalDB migration validation

IDS connectivity testing

Status

Component	Status

pfSense Firewall	Complete

ROYALSERVERS Network	Complete

IDS Deployment	Complete

AWS VPN Connectivity	Complete

AWS Network Routing	Complete





