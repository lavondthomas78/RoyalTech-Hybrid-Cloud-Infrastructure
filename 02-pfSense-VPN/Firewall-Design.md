\# Royal Technology Solutions

\# pfSense Firewall Design Documentation



\## Overview



This document describes the firewall architecture and security design implemented using pfSense as the network security gateway for the Royal Technology Solutions hybrid cloud environment.



pfSense provides the security boundary between:



\- Internet connectivity

\- Internal networks

\- Server infrastructure

\- AWS cloud resources



\---



\# Firewall Role



The pfSense firewall provides:



\- Stateful packet inspection

\- Network segmentation

\- Traffic filtering

\- NAT services

\- VPN termination

\- Secure cloud connectivity



The firewall acts as the on-premises security edge for the hybrid architecture.



\---



\# Network Security Zones



\## WAN Zone



Purpose:



Provides external internet connectivity.



Security controls:



\- Stateful firewall inspection

\- Restricted inbound traffic

\- NAT protection



\---



\## ROYALTYLAN Network



Network: 192.168.1.0/24



Purpose:



\- User devices

\- Administrative systems

\- Internal clients



Security considerations:



\- Client traffic controlled by firewall policies

\- Access to protected resources restricted



\---



\## ROYALSERVERS Network



Network: 192.168.2.0/24



Purpose:



\- Infrastructure servers

\- Security tools

\- Hybrid cloud services



Protected systems:



| Device | Address | Function |

|---|---|---|

| IDS01 | 192.168.2.12 | Snort IDS |

| DNS01 | 192.168.2.20 | DNS Services |



\---



\# VPN Security Boundary



The IPsec VPN creates an encrypted connection between:



On-Premises: 192.168.2.0/24

AWS: 10.20.0.0/16

Traffic path: Internal Network



&#x20; |



pfSense Firewall



&#x20; |



Encrypted IPsec Tunnel



&#x20; |



AWS Virtual Private Gateway



&#x20; |



AWS Private Resources



\---



\# Firewall Policy Design



The firewall follows a least-privilege approach.



Security principles:



\- Allow required communication only

\- Restrict unnecessary access

\- Protect private cloud resources

\- Separate user and infrastructure traffic



\---



\# AWS Access Control



AWS private resources are not directly exposed to the internet.



Access path:





Administrator



&#x20;|



On-Premises Network



&#x20;|



pfSense Firewall



&#x20;|



IPsec VPN



&#x20;|



AWS Private Subnet



&#x20;|



RDS PostgreSQL



\---



\# Database Protection



RoyalDB PostgreSQL access is protected through multiple layers:



\## Network Layer



\- Private subnet deployment

\- VPN-only access

\- Security group filtering



\## Database Layer



\- Role-based access control

\- Least privilege permissions

\- TLS encryption



\---



\# Firewall Validation



Validated functions:



| Function | Status |

|---|---|

| Internet connectivity | Complete |

| Internal routing | Complete |

| IPsec VPN traffic | Complete |

| AWS private access | Complete |

| Database connectivity | Complete |



\---



\# Security Architecture Summary





Internet



|



pfSense Firewall



|



Internal Networks



|



IPsec VPN



|



AWS VPC



|



Private Services



\---



\# Status



| Component | Status |

|---|---|

| Firewall Deployment | Complete |

| Network Segmentation | Complete |

| VPN Integration | Complete |

| AWS Connectivity | Complete |

| Security Controls | Complete |

