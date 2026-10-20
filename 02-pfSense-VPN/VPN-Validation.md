# Royal Technology Solutions

# IPsec VPN Validation Documentation

## Overview

This document provides validation evidence for the successful implementation of the site-to-site IPsec VPN connecting the Royal Technology Solutions on-premises environment to Amazon Web Services (AWS).

Validation confirms:

- IPsec tunnel establishment
- Phase 2 security association
- AWS routing
- Private cloud connectivity
- Database communication

---

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
Private Cloud Access	Complete

Database Connectivity	Complete

