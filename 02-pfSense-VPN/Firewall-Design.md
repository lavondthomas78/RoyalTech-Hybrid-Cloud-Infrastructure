# Royal Technology Solutions

# pfSense Firewall Design Documentation

## Overview

This document describes the firewall architecture and security design implemented using pfSense as the network security gateway for the Royal Technology Solutions hybrid cloud environment.

pfSense provides the primary security boundary between:

- Internet connectivity
- Internal networks
- Server infrastructure
- AWS cloud resources

---

# Firewall Role

The pfSense firewall provides:

- Stateful packet inspection
- Network segmentation
- Traffic filtering
- NAT services
- VPN termination
- Secure cloud connectivity

The firewall acts as the on-premises security edge for the hybrid architecture.

---

# Network Security Zones

## WAN Zone

**Purpose:**

Provides external internet connectivity.

**Security controls:**

- Stateful firewall inspection
- Restricted inbound traffic
- NAT protection

---

## ROYALTYLAN Network

**Network:** `192.168.1.0/24`

**Gateway:** `192.168.1.1`

**Purpose:**

- User devices
- Administrative systems
- Internal clients

**Security considerations:**

- Client traffic controlled by firewall policies
- Access to protected resources restricted
- User and infrastructure traffic separated

---

## ROYALSERVERS Network

**Network:** `192.168.2.0/24`

**Gateway:** `192.168.2.1`

**Purpose:**

- Infrastructure servers
- Security tools
- Monitoring
- Database services
- Hybrid cloud services
- Backup infrastructure

### Protected Systems

| **Device** | **Address** | **Function** |
|---|---|---|
| IDS/IPS Ubuntu | `192.168.2.12` | Snort IDS/IPS |
| DC02 | `192.168.2.20` | Active Directory / DNS |
| BDC02 | `192.168.2.22` | Domain Controller |
| DNS01 | `192.168.2.40` | DNS Infrastructure |
| MONO1 | `192.168.2.42` | PRTG Monitoring |
| FTP01 | `192.168.2.50` | Secure FTPS |

---

# Network Segmentation

pfSense separates the primary internal network segments.

```text
                         INTERNET
                            |
                            v
                    +---------------+
                    |    pfSense    |
                    | Firewall/Router|
                    +-------+-------+
                            |
                 +----------+----------+
                 |                     |
                 v                     v
          ROYALTYLAN             ROYALSERVERS
        192.168.1.0/24          192.168.2.0/24
                 |                     |
                 v                     v
          User / Client          Infrastructure
             Systems                Services

Firewall Policy Design
The firewall follows a least-privilege approach.
Security principles include:
- Allow required communication only
- Restrict unnecessary access
- Separate user and infrastructure traffic
- Protect server infrastructure
- Protect private cloud resources
- Control traffic between security zones
Traffic Control
pfSense provides centralized traffic filtering between the major network zones.
Traffic control is used to:
- Permit required services
- Restrict unauthorized traffic
- Protect infrastructure systems
- Control access to private resources
- Support secure hybrid cloud communication
NAT and Internet Access
pfSense provides Network Address Translation (NAT) for the on-premises environment.
NAT supports:
- Internal client internet access
- Private address translation
- Controlled outbound connectivity
- Internet access from internal networks
IPsec VPN Security Boundary
pfSense serves as the on-premises endpoint for the site-to-site IPsec VPN connecting the Royal Technology Solutions environment to AWS.
On-Premises Network:
192.168.2.0/24
AWS Network:
10.20.0.0/16
Traffic path:
On-Premises Network
192.168.2.0/24
        |
        v
    pfSense
        |
        v
Encrypted IPsec Tunnel
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

The VPN provides encrypted communication between the on-premises infrastructure and AWS private resources.
AWS Access Control
AWS private resources are not directly exposed to the internet.
Private resource access follows the controlled path:
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
Private AWS Resources

This design keeps protected cloud resources separated from public-facing workloads.
Database Protection
RoyalDB PostgreSQL is deployed within the AWS private subnet architecture.
Database access is protected through multiple layers.
Network Layer
- Private subnet deployment
- VPN-protected access
- AWS security group filtering
- Route isolation
Database Layer
- PostgreSQL authentication
- Role-based access control
- Least-privilege permissions
- TLS encryption
Database connectivity:
On-Premises Network
        |
        v
    pfSense
        |
        v
    IPsec VPN
        |
        v
 AWS Private Network
        |
        v
 RDS PostgreSQL
  10.20.11.48
        |
        v
     RoyalDB

Security Monitoring Integration
The firewall architecture integrates with the broader security monitoring environment.
Security monitoring components include:
- Snort IDS/IPS
- PRTG infrastructure monitoring
- AWS CloudWatch
- AWS CloudTrail
- VPC Flow Logs
The monitoring architecture provides visibility into network activity, infrastructure health, and cloud operations.
Firewall Validation
The firewall architecture has been validated through:
- Internet connectivity testing
- Internal network connectivity
- Network segmentation testing
- IPsec VPN establishment
- AWS private routing
- Private database connectivity
- PostgreSQL connectivity testing
- Security monitoring connectivity
Validation Summary
Function	Status
Internet Connectivity	Complete
Internal Routing	Complete
Network Segmentation	Complete
Firewall Enforcement	Complete
NAT Services	Complete
IPsec VPN Connectivity	Complete
AWS Private Access	Complete
Database Connectivity	Complete
Security Monitoring Integration	Complete


Security Architecture Summary
                         INTERNET
                            |
                            v
                    +---------------+
                    |    pfSense    |
                    | Firewall/Router|
                    |  VPN Endpoint |
                    +-------+-------+
                            |
              +-------------+-------------+
              |                           |
              v                           v
        ROYALTYLAN                   ROYALSERVERS
      192.168.1.0/24                192.168.2.0/24
                                          |
                              +-----------+-----------+
                              |                       |
                              v                       v
                         Infrastructure          Security
                            Services             Monitoring
                              |
                              v
                       IPsec Site-to-Site
                              |
                              v
                    AWS Virtual Private Gateway
                              |
                              v
                       Royal-Cloud-VPC
                         10.20.0.0/16
                              |
                              v
                       Private AWS Resources
                              |
                              v
                       RDS PostgreSQL
                              |
                              v
                           RoyalDB

Status
Component	Status
Firewall Deployment	Complete
Network Segmentation	Complete
Traffic Filtering	Complete
NAT Configuration	Complete
VPN Integration	Complete
AWS Connectivity	Complete
Database Protection	Complete
Security Monitoring Integration	Complete


Final Status
OPERATIONAL / COMPLETE
The pfSense firewall provides the primary security and routing boundary for the Royal Technology Solutions hybrid infrastructure.
The design provides:
- Enterprise-style network segmentation
- Centralized firewall enforcement
- Controlled network traffic
- NAT and internet access
- Encrypted IPsec connectivity
- Protected AWS private resources
- Private database access
- Integration with security and infrastructure monitoring
The firewall architecture provides the foundation for secure communication between the on-premises Royalty.Local environment and the AWS cloud environment.
