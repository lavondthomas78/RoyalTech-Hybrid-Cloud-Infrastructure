s\# Royal Technology Solutions

\# RoyalDB Architecture Documentation



\## Overview



RoyalDB is the centralized relational database platform supporting the Royal Technology Solutions IT service management environment.



The database provides a structured system for managing:



\- Customers

\- Locations

\- Devices

\- Contracts

\- Support tickets

\- Technicians

\- Ticket assignments



RoyalDB was designed as the backend data foundation for a centralized IT operations platform.



\---



\# Database Purpose



RoyalDB provides:



\- Centralized service information

\- Relational data management

\- Data integrity enforcement

\- Role-based database security

\- Scalable cloud deployment



The database architecture supports the transition from an on-premises PostgreSQL environment to Amazon RDS PostgreSQL.



\---



\# Database Platform



Source Database: PostgreSQL 18.6





Operating Environment: Windows Server





Target Database: Amazon RDS PostgreSQL



Database Name: royaldb



\---



\# Database Architecture



Logical design:



```text

Customer



&#x20;  |



&#x20;  |



Location



&#x20;  |



&#x20;  |



Device





Customer



&#x20;  |



&#x20;  |



Contract





Ticket



&#x20;  |



&#x20;  |



Ticket\_Assignment



&#x20;  |



&#x20;  |



Technician

Database Entities

Customer



Purpose:



Stores customer organization information.



Primary Key:



customer\_id

Location



Purpose:



Stores customer site locations.



Relationship:



Location.customer\_id

&#x20;       |

&#x20;       |

Customer.customer\_id

Device



Purpose:



Stores managed IT assets.



Relationship:



Device.location\_id

&#x20;       |

&#x20;       |

Location.location\_id

Contract



Purpose:



Stores customer service agreements.



Relationship:



Contract.customer\_id

&#x20;       |

&#x20;       |

Customer.customer\_id

Ticket



Purpose:



Stores service requests and support issues.



Technician



Purpose:



Stores support personnel information.



Constraint:



technician\_email UNIQUE

Ticket\_Assignment



Purpose:



Provides the relationship between tickets and technicians.



Relationships:



Ticket

&#x20;|

&#x20;|

Ticket\_Assignment

&#x20;|

&#x20;|

Technician

Data Integrity



Implemented controls:



Primary keys

Foreign keys

Unique constraints

Relational relationships

Sequence-generated identifiers

Database Security



Implemented roles:



royaldb\_dba



Purpose:



Full database administration.



Permissions:



Schema management

Data modification

Database administration

royaldb\_tech



Purpose:



Technical support access.



Permissions:



Limited data modification

Operational database access

royaldb\_readonly



Purpose:



Reporting and viewing access.



Permissions:



SELECT permissions only

Cloud Migration Architecture



Migration path:



On-Premises PostgreSQL



&#x20;       |



&#x20;       |



Database Backup



&#x20;       |



&#x20;       |



AWS Transfer



&#x20;       |



&#x20;       |



Amazon RDS PostgreSQL



&#x20;       |



&#x20;       |



RoyalDB

Current Status

Component	Status

Database Design	Complete

Relational Schema	Complete

Security Roles	Complete

Migration to AWS	Complete

Validation	Complete

