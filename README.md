# Building-an-Azure-Data-Warehouse-for-Bike-Share-Data-Analytics


Project Overview
This project demonstrates the implementation of a modern cloud-based data warehouse solution using Microsoft Azure services. The project involves designing and implementing a complete ETL (Extract, Transform, Load) pipeline that transforms operational bike share data from a PostgreSQL database into a dimensional data warehouse optimized for analytics.
Business Context
The bike share company requires analytical capabilities to understand:

Trip patterns and rider behavior
Payment trends and revenue analysis
Station utilization and performance
Temporal patterns in bike usage

Architecture Overview
PostgreSQL (OLTP) → Azure Blob Storage → Azure Synapse Analytics → Star Schema Data Warehouse
Technology Stack

Source System: PostgreSQL Database
Data Lake: Azure Blob Storage
Data Warehouse: Azure Synapse Analytics (Serverless SQL Pool)
ETL Tool: Azure Synapse Pipelines
Analytics: Star Schema Dimensional Model

Data Model
Star Schema Design
The data warehouse implements a star schema with the following structure:
Fact Tables

fact_trip

Primary measures: Trip Duration, Rider Age at Trip
Dimensions: Date, Rider, Start Station, End Station


fact_payment

Primary measures: Payment Amount
Dimensions: Date, Rider



Dimension Tables

dim_rider: Rider demographics and membership details
dim_station: Station location and capacity information
dim_date: Time hierarchy for temporal analysis

Source Data Statistics

Payment Records: 1,946,607 transactions
Rider Records: 75,000 unique riders
Station Records: 838 bike stations
Trip Records: 1,048,576 completed trips

Project Implementation
Task 1: Azure Infrastructure Setup

✅ Created Azure Database for PostgreSQL
✅ Provisioned Azure Synapse Analytics workspace
✅ Configured serverless SQL pool for data warehouse operations

Task 2: Dimensional Data Modeling

✅ Analyzed business requirements
✅ Designed star schema with 2 fact tables and 3 dimension tables
✅ Optimized for analytical query performance

Task 3: Source Data Preparation

✅ Populated PostgreSQL with bike share operational data
✅ Verified data integrity across all source tables
✅ Established baseline for ETL validation

Task 4: Data Extraction

✅ Implemented Azure Synapse pipeline for data extraction
✅ Successfully extracted 4 source tables to Azure Blob Storage
✅ Generated CSV files: public.payment.csv, public.rider.csv, public.station.csv, public.trip.csv

Task 5: Data Loading (Staging Layer)

✅ Created external tables pointing to Blob Storage files
✅ Implemented serverless SQL pool external table architecture
✅ Established staging layer for data transformation

Task 6: Data Transformation (CETAS Implementation)

✅ Developed CETAS (Create External Table As Select) scripts
✅ Transformed staging data into dimensional model
✅ Created optimized fact and dimension tables

Technical Highlights
ETL Pipeline Features

Serverless Architecture: Cost-effective serverless SQL pool implementation
External Tables: Efficient data processing without data movement
CETAS Operations: Parallel data transformation and materialization
Star Schema: Optimized dimensional model for analytical queries

Data Quality & Validation

Source Validation: Verified data completeness in PostgreSQL
Pipeline Monitoring: Tracked extraction success in Blob Storage
Transformation Validation: Confirmed dimensional model accuracy
Performance Testing: Validated query response times

File Structure
📁 azure-data-warehouse-project/
├── 📄 README.md
├── 📁 sql-scripts/
│   ├── 📁 load/ (External table creation)
│   │   ├── staging_payment.sql
│   │   ├── staging_rider.sql
│   │   ├── staging_station.sql
│   │   └── staging_trip.sql
│   └── 📁 transform/ (CETAS scripts)
│       ├── 📁 fact-tables/
│       │   ├── fact_trip.sql
│       │   └── fact_payment.sql
│       └── 📁 dimension-tables/
│           ├── dim_rider.sql
│           ├── dim_station.sql
│           └── dim_date.sql
├── 📁 documentation/
│   ├── 📁 diagrams/
│   │   └── star_schema_design.png
│   └── 📁 screenshots/
│       ├── azure_blob_storage.png
│       ├── synapse_workspace.png
│       └── data_validation.png
└── 📁 data-setup/
    └── ProjectDataToPostgres.py
Key Achievements

Scalable Architecture: Implemented serverless data warehouse capable of handling millions of records
Cost Optimization: Utilized pay-per-query serverless model for optimal cost efficiency
Performance Optimization: Star schema design enables sub-second analytical queries
Data Governance: Established clear data lineage from source to warehouse
Automation: Fully automated ETL pipeline with minimal manual intervention

Business Impact
This data warehouse enables the bike share company to:

Optimize Station Placement: Analyze trip patterns to identify high-demand locations
Revenue Analysis: Track payment trends and identify revenue opportunities
Operational Efficiency: Monitor bike utilization and maintenance schedules
Customer Insights: Understand rider behavior and preferences

Technical Skills Demonstrated

Cloud Architecture: Azure Synapse Analytics, Blob Storage, PostgreSQL
Data Modeling: Star schema design, dimensional modeling principles
ETL Development: Pipeline design, data transformation, CETAS operations
SQL Expertise: Advanced T-SQL, external tables, serverless computing
Data Engineering: End-to-end data pipeline implementation

Future Enhancements

Real-time Streaming: Implement Azure Stream Analytics for real-time data processing
Machine Learning: Integrate Azure ML for predictive analytics
Advanced Analytics: Power BI dashboard development for executive reporting
Data Governance: Implement Azure Purview for data catalog and lineage
