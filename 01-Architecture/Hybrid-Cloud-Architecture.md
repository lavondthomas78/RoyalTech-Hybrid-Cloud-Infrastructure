\# Royal Technology Solutions

\# Hybrid Cloud Architecture Overview



\## Project Overview



Royal Technology Solutions Hybrid Cloud Infrastructure is an enterprise-style architecture designed to connect an on-premises environment with Amazon Web Services (AWS).



The solution integrates local infrastructure, security monitoring, encrypted VPN connectivity, cloud networking, and managed database services.



The project demonstrates:



\- Hybrid cloud design

\- Network segmentation

\- Secure site-to-site connectivity

\- Cloud infrastructure deployment

\- Database migration

\- Security monitoring



\---



\# Architecture Goals



The primary goals of this architecture are:



\- Provide secure communication between on-premises and cloud environments

\- Host critical services in scalable cloud infrastructure

\- Maintain private access to sensitive resources

\- Implement security monitoring and network controls

\- Create a foundation for future application expansion



\---



\# High-Level Architecture



```text

&#x20;                        INTERNET

&#x20;                           |

&#x20;                           |

&#x20;                   pfSense Firewall

&#x20;                   VPN Gateway

&#x20;                           |

&#x20;                           |

&#x20;             ----------------------------

&#x20;             |

&#x20;             |

&#x20;       ROYALSERVERS Network

&#x20;         192.168.2.0/24

&#x20;             |

&#x20;      ---------------------

&#x20;      |                   |

&#x20;    IDS01               DNS01

&#x20; 192.168.2.12       192.168.2.20

&#x20;      |

&#x20;      |

&#x20;   Snort IDS





&#x20;             IPsec Site-to-Site VPN



&#x20;                        |

&#x20;                        |



&#x20;             AWS Virtual Private Gateway



&#x20;                        |

&#x20;                        |



&#x20;             Royal-Cloud-VPC

&#x20;                10.20.0.0/16



&#x20;       --------------------------------

&#x20;       |                              |

&#x20;  Public Subnets              Private Subnets

&#x20;  10.20.1.0/24                10.20.11.0/24

&#x20;  10.20.2.0/24                10.20.12.0/24



&#x20;                                     |

&#x20;                                     |



&#x20;                             Amazon RDS PostgreSQL



&#x20;                                 RoyalDB

&#x20;                             10.20.11.48



On-Premises Infrastructure

pfSense Firewall



Role:



Network gateway

Firewall enforcement

VPN endpoint

Traffic control



Network: 192.168.2.0/24



IDS01



Hostname: ids.royalty.local



IP Address: 192.168.2.12



Purpose:



Network intrusion detection

Security monitoring

Traffic analysis



Technology:



Ubuntu Server

Snort IDS



AWS Infrastructure

Virtual Private Cloud



Name: Royal-Cloud-VPC



CIDR: 10.20.0.0/16



Region: us-east-2



AWS Services



Implemented services:



EC2



Purpose:



Web infrastructure

Public-facing workloads

Amazon RDS PostgreSQL



Purpose:



Managed database hosting

RoyalDB production environment



Database: royaldb



Private Address: 10.20.11.48



Hybrid Connectivity



Connectivity between environments is provided through an IPsec site-to-site VPN.



Local Network: 192.168.2.0/24



Remote AWS Network: 10.20.0.0/16



Traffic Flow: 



On-Premises Network

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

AWS Private Resources



Security Design



Security controls implemented:



Network segmentation

Firewall enforcement

IPsec encryption

Private database deployment

Security groups

Database role-based access control

IDS monitoring

Current Validation Status

Component	Status

pfSense VPN	Complete

AWS VPC	Complete

RDS Deployment	Complete

RoyalDB Migration	Complete

Database Validation	Complete

IDS Deployment	Complete

Future Expansion



Planned additions:



Application/API tier

Enterprise monitoring

Automated backups

Additional AWS workloads

Expanded security operations

