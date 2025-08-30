#  Building an Azure Data Warehouse for Bike Share Data Analytics

##  Project Overview
This project demonstrates the implementation of a modern cloud-based data warehouse solution using **Microsoft Azure** services. It involves designing and implementing a complete **ETL (Extract, Transform, Load) pipeline** that transforms operational bike share data from a **PostgreSQL database** into a **dimensional data warehouse optimized for analytics**.

---

## 🏢 Business Context
The bike share company requires analytical capabilities to understand:

-  Trip patterns and rider behavior  
-  Payment trends and revenue analysis  
-  Station utilization and performance  
-  Temporal patterns in bike usage  

---

## 🏗 Architecture Overview
##  Technology Stack
- **Source System**: PostgreSQL Database  
- **Data Lake**: Azure Blob Storage  
- **Data Warehouse**: Azure Synapse Analytics (Serverless SQL Pool)  
- **ETL Tool**: Azure Synapse Pipelines  
- **Analytics**: Star Schema Dimensional Model  

---

## 📊 Data Model

### ⭐ Star Schema Design
The data warehouse implements a **star schema** with the following structure:

#### Fact Tables
- **fact_trip**  
  - *Measures*: Trip Duration, Rider Age at Trip  
  - *Dimensions*: Date, Rider, Start Station, End Station  

- **fact_payment**  
  - *Measures*: Payment Amount  
  - *Dimensions*: Date, Rider  

#### Dimension Tables
- **dim_rider** → Rider demographics and membership details  
- **dim_station** → Station location and capacity information  
- **dim_date** → Time hierarchy for temporal analysis  

---

## 📈 Source Data Statistics
-  **Payment Records**: 1,946,607 transactions  
-  **Rider Records**: 75,000 unique riders  
-  **Station Records**: 838 bike stations  
-  **Trip Records**: 1,048,576 completed trips  

---

## 🚀 Project Implementation

###  Task 1: Azure Infrastructure Setup
- Created Azure Database for PostgreSQL  
- Provisioned Azure Synapse Analytics workspace  
- Configured serverless SQL pool for data warehouse operations
- ![Task 1 Copy](https://github.com/user-attachments/assets/91999334-5088-447c-b467-a8dad5748ef7)

###  Task 2: Dimensional Data Modeling
- Analyzed business requirements  
- Designed star schema with 2 fact tables and 3 dimension tables  
- Optimized for analytical query performance  

###  Task 3: Source Data Preparation
- Populated PostgreSQL with bike share operational data  
- Verified data integrity across all source tables  
- Established baseline for ETL validation
- [Task3](https://github.com/user-attachments/assets/a1ad1154-2633-4cc0-b553-7a121eb0d237)
  ![Task4copy](https://github.com/user-attachments/assets/27952365-77d6-4699-8091-8969a8cc4f71)



###  Task 4: Data Extraction
- Implemented Azure Synapse pipeline for data extraction  
- Extracted 4 source tables to Azure Blob Storage  
- Generated CSV files:  
  - `public.payment.csv`  
  - `public.rider.csv`  
  - `public.station.csv`  
  - `public.trip.csv`  

###  Task 5: Data Loading (Staging Layer)
- Created external tables pointing to Blob Storage files  
- Implemented serverless SQL pool external table architecture  
- Established staging layer for data transformation
- 
![Task5copy](https://github.com/user-attachments/assets/18f64350-1c3f-4c04-b860-4cc6a475cbef)


###  Task 6: Data Transformation (CETAS Implementation)
- Developed CETAS (Create External Table As Select) scripts  
- Transformed staging data into dimensional model  
- Created optimized fact and dimension tables  

![Task6copy](https://github.com/user-attachments/assets/f76cf29e-314f-43fe-8d05-f6d670ef7dea)




###  ETL Pipeline Features
- Serverless Architecture: Cost-effective serverless SQL pool  
- External Tables: Efficient data processing without movement  
- CETAS Operations: Parallelized transformations  
- Star Schema: Optimized model for analytics  

###  Data Quality & Validation
- Verified completeness in PostgreSQL  
- Monitored extraction success in Blob Storage  
- Validated dimensional model transformations  
- Tested query performance  


### 🏆 Key Achievements
- Scalable Architecture: Serverless warehouse handling millions of records

- Cost Optimization: Pay-per-query model for efficiency

- Performance: Sub-second queries via star schema

- Data Governance: Clear lineage from source → warehouse

- Automation: Fully automated ETL with minimal manual work


### Business Impact

- This data warehouse enables the bike share company to:

- Optimize station placement using trip patterns

 - Improve revenue analysis through payment insights

 - Enhance operational efficiency with utilization tracking

 - Gain customer insights into rider behavior

### Technical Skills Demonstrated

- Cloud Architecture: Azure Synapse, Blob Storage, PostgreSQL

- Data Modeling: Star schema, dimensional modeling

- ETL Development: Pipelines, CETAS, transformations

- SQL Expertise: T-SQL, external tables, serverless computing

- Data Engineering: End-to-end pipeline implementation





 




