# Royal Technology Solutions

# RoyalDB Database Schema Documentation

## Overview

This document describes the relational database schema implemented for RoyalDB.

RoyalDB is designed as a centralized IT service management database supporting:

- Customer information
- Managed assets
- Service contracts
- Support operations
- Technician assignments

The database follows relational database design principles using:

- Primary keys
- Foreign keys
- Referential integrity
- Unique constraints
- Sequence-generated identifiers

---

# Database Platform

| Setting | Value |
|---|---|
| Database Engine | PostgreSQL 18.6 |
| Database Name | `royaldb` |
| Architecture Type | Relational Database Management System (RDBMS) |

---

# Entity Relationship Overview

```text
                         Customer
                        /        \
                       /          \
                      v            v
                 Location       Contract
                    |
                    v
                  Device


                  Ticket
                    |
                    v
             Ticket_Assignment
                    |
                    v
                Technician
