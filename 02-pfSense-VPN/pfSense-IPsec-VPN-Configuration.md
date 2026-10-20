# Royal Technology Solutions

# pfSense IPsec VPN Configuration Documentation

## Overview

This document describes the configuration and validation of the site-to-site IPsec VPN connecting the Royal Technology Solutions on-premises environment with Amazon Web Services (AWS).

The VPN provides encrypted private communication between the on-premises Royalty.Local environment and the AWS Royal-Cloud-VPC.

**On-Premises Network:**

`192.168.2.0/24`

**AWS Cloud Network:**

`10.20.0.0/16`

---

# VPN Architecture

```text
                    ON-PREMISES
                  192.168.2.0/24
                         |
                         v
                +----------------+
                |    pfSense     |
                | Firewall/Router|
                |  VPN Endpoint  |
                +-------+--------+
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
