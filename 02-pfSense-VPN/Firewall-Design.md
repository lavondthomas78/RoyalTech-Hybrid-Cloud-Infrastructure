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

| Device | Address | Function |
|---|---:|---|
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
