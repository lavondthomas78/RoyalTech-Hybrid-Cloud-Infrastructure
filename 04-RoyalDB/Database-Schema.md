\# Royal Technology Solutions

\# RoyalDB Database Schema Documentation



\## Overview



This document describes the relational database schema implemented for RoyalDB.



RoyalDB is designed as a centralized IT service management database supporting customer information, managed assets, service contracts, and support operations.



The database follows relational database design principles using:



\- Primary keys

\- Foreign keys

\- Referential integrity

\- Unique constraints

\- Sequence-generated identifiers



\---



\# Database Platform



Database Engine: PostgreSQL 18.6



Database Name: royaldb



Architecture Type:



Relational Database Management System (RDBMS)



\---



\# Entity Relationship Overview



```text

&#x20;                   Customer

&#x20;                      |

&#x20;         ----------------------------

&#x20;         |                          |

&#x20;         |                          |

&#x20;     Location                  Contract

&#x20;         |

&#x20;         |

&#x20;      Device





&#x20;                   Ticket

&#x20;                      |

&#x20;                      |

&#x20;             Ticket\_Assignment

&#x20;                      |

&#x20;                      |

&#x20;                Technician

Database Tables

Customer Table



Purpose:



Stores customer organization information.



Primary Key: customer\_id



Relationships:



Customer

&#x20;   |

&#x20;   |

Location



and



Customer

&#x20;   |

&#x20;   |

Contract

Location Table



Purpose:



Stores physical customer locations.



Primary Key: location\_id



Foreign Key: customer\_id



Relationship:



location.customer\_id

&#x20;       |

&#x20;       |

customer.customer\_id

Device Table



Purpose:



Stores managed IT assets.



Primary Key: device\_id



Foreign Key: location\_id



Relationship:



device.location\_id

&#x20;       |

&#x20;       |

location.location\_id

Contract Table



Purpose:



Stores customer service agreements.



Primary Key: contract\_id



Foreign Key: customer\_id



Relationship:



contract.customer\_id

&#x20;       |

&#x20;       |

customer.customer\_id

Ticket Table



Purpose:



Stores service requests and support issues.



Primary Key: ticket\_id



The ticket table provides the foundation for IT service management tracking.



Technician Table



Purpose:



Stores support technician information.



Primary Key: technician\_id



Constraint: technician\_email UNIQUE



This prevents duplicate technician accounts.



Ticket\_Assignment Table



Purpose:



Creates the relationship between tickets and technicians.



Primary Key: ticket\_assignment\_id



Foreign Keys: ticket\_id technician\_id



Relationship:



Ticket

&#x20;  |

&#x20;  |

Ticket\_Assignment

&#x20;  |

&#x20;  |

Technician

Primary Keys



The database uses primary keys to uniquely identify records.



Implemented keys:



Table	Primary Key

customer	customer\_id

location	location\_id

device	device\_id

contract	contract\_id

ticket	ticket\_id

technician	technician\_id

ticket\_assignment	ticket\_assignment\_id

Foreign Key Relationships



Implemented relationships:



Child Table	Foreign Key	Parent Table

location	customer\_id	customer

device	location\_id	location

contract	customer\_id	customer

ticket\_assignment	ticket\_id	ticket

ticket\_assignment	technician\_id	technician

Sequence Management



The database uses PostgreSQL sequences for identifier generation.



Sequences include:



customer\_id\_seq

location\_id\_seq

device\_id\_seq

contract\_id\_seq

ticket\_id\_seq

technician\_id\_seq

ticket\_assignment\_id\_seq

Database Constraints



Implemented constraints:



Primary Key Constraints



Provide unique record identification.



Foreign Key Constraints



Maintain relational integrity between tables.



Unique Constraints



Implemented:



technician\_email UNIQUE

Data Integrity



The schema prevents:



Orphan records

Duplicate identifiers

Invalid relationships

Schema Validation



Validated tables:



Table	Row Count

customer	3

location	3

device	4

contract	3

ticket	5

technician	3

ticket\_assignment	4

Database Design Summary



RoyalDB provides a structured relational foundation for:



Customer management

Asset tracking

Contract management

Ticket management

Technician assignment



The schema supports secure migration to Amazon RDS PostgreSQL and future application development.



Status

Component	Status

Relational Schema	Complete

Entity Relationships	Complete

Constraints	Complete

Data Validation	Complete

