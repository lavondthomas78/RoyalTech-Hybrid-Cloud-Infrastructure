# Royal Technology Solutions

# RoyalDB RBAC and Security Documentation

## Overview

This document describes the security model implemented for RoyalDB.

RoyalDB uses PostgreSQL Role-Based Access Control (RBAC) to enforce controlled access to database resources.

The security design follows:

- Least privilege
- Separation of duties
- Controlled administrative access
- Role-based permissions

---

# Database Security Architecture

RoyalDB security is implemented across multiple layers:

```text
Users / Applications
        |
        v
PostgreSQL Authentication
        |
        v
Database Roles
        |
        v
Database Permissions
        |
        v
RoyalDB Objects
