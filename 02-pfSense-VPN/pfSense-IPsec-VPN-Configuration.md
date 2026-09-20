\# Royal Technology Solutions

\# pfSense IPsec VPN Configuration Documentation



\## Overview



This document describes the configuration and validation of the site-to-site IPsec VPN connecting the Royal Technology Solutions on-premises environment with Amazon Web Services (AWS).



The VPN provides encrypted private communication between:



On-Premises Network: 192.168.2.0/24

AWS Cloud Network: 10.20.0.0/16



\---



\# VPN Architecture





On-Premises Network



192.168.2.0/24



&#x20;   |



&#x20;   |



pfSense Firewall



VPN Endpoint



&#x20;   |



&#x20;   |



IPsec Site-to-Site Tunnel



&#x20;   |



&#x20;   |



AWS Virtual Private Gateway



&#x20;   |



&#x20;   |



Royal-Cloud-VPCs



10.20.0.0/16



\---



\# pfSense Role



pfSense provides:



\- Firewall enforcement

\- Network routing

\- NAT control

\- IPsec VPN termination

\- Secure hybrid connectivity



The firewall acts as the on-premises VPN endpoint.



\---



\# VPN Tunnel Information



| Setting | Value |

|---|---|

| VPN Type | Site-to-Site IPsec |

| Protocol | IKEv1 |

| Authentication | Mutual PSK |

| Encryption | AES-128 |

| Hash | SHA1 |

| DH Group | 2 (1024-bit) |

| NAT Traversal | Enabled |



\---



\# Phase 1 Configuration



Tunnel Name: AWS Royal Tunnel

Remote Gateway: 3.132.133.187

IKE Version: IKEv1

Mode: Main

Authentication: Mutual Pre-Shared Key

Encryption: AES 128-bit

Hash: SHA1

DH Group: 2



\---



\# Phase 1 Validation



Successful tunnel state: Established

Example: AWS Royal Tunnel

Status: Established



\---



\# Phase 2 Configuration



\## AWS Royal Tunnel 1



Local Network: 192.168.2.0/24

Remote Network: 10.20.0.0/16

Protocol: ESP

Encryption: AES-128

Authentication: SHA1



\---



\# AWS RoyalServers Phase 2



Local Network: 192.168.2.0/24

Remote Network: 10.20.0.0/16



Purpose:



Provides secure access from on-premises infrastructure to AWS private resources.



\---



\# Validation



Successful tests:



\- IPsec Phase 1 established

\- Phase 2 installed

\- AWS routes active

\- PostgreSQL connectivity successful



Database validation: Connection to 10.20.11.48 port 5432 succeeded



\---



\# Status



| Component | Status |

|---|---|

| pfSense VPN Endpoint | Complete |

| AWS VPN Gateway | Complete |

| Phase 1 Tunnel | Complete |

| Phase 2 Tunnel | Complete |

| Private AWS Connectivity | Complete |

