Database Implementation – SQL Table Creation
This task marks the start of the implementation phase of the database project.
Using the finalized ER diagram and mapped relational schema, the database structure was created in SQL using Data Definition Language (DDL) commands.

Key Objectives
Convert each entity from the ER diagram into SQL CREATE TABLE statements.

Define Primary Keys and Foreign Keys to maintain relationships between tables.

Assign appropriate data types and add constraints (NOT NULL, UNIQUE, CHECK) where required.

Handle circular foreign key dependencies using the ALTER TABLE command.

Entities Implemented
Department – Stores department details including hire date and manager.

Employee – Contains employee personal details and links to their department and supervisor.

Locations – Records locations for each department.

Project – Holds project information including location, city, and associated department.

Works_on – A many-to-many relationship between employees and projects, with working hours recorded.

Dependent – Stores information about employees’ dependents.

Deliverables
SQL script file: database_implementation.sql

Contains all CREATE TABLE statements with constraints and relationship mappings.

Ready to be executed on SQL Server (or any compatible RDBMS).
