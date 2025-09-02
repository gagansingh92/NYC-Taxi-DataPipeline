# 🚖 NYC Taxi Data Engineering Pipeline

## 📌 Overview
End-to-end data engineering project for **NYC Yellow Taxi** trip records. It covers **ingestion → profiling → ETL → semantic data modeling → warehouse schema → analytics-ready output**. The goal is a clean, reproducible pipeline that demonstrates **DAX-style KPI thinking in BI**, **semantic modeling**, and strong **ETL/data quality** practices.

**What you’ll see**
- Trip & fare analytics, pickup/dropoff time intelligence, passenger trends
- Zone/bourough breakdowns with join to TLC **taxi_zones** metadata
- Profiling outputs (HTML/XLSX), warehouse DDL, and a clear **star schema**

---

## 📁 Project Structure
NYC-Taxi-DataPipeline/
├── README.md                           # Project documentation
├── images/
│   └── DataModel.png                   # Star schema / data model diagram
├── notebooks/
│   ├── ETL_Final.ipynb                 # ETL pipeline (cleaning & transformations)
│   └── Taxi_Data_Profiling.ipynb       # Data profiling notebook
├── sql/
│   └── ddl_dw_taxi.sql                 # Data warehouse DDL (fact + dimensions)
├── data/
│   └── taxi_zones.csv                  # TLC Taxi zones metadata
└── docs/
├── data_dictionary_trip_records_yellow.pdf  # Data dictionary
├── DataProfiling.html                        # Auto profiling report
├── Data_Profiling.xlsx                       # Profiling summary
├── Taxi_DataPipeline_doc_StepByStep.docx     # Deployment guide
└── NYC_Taxi.pptx                             # Project presentation

---

## 🛠️ Technologies Used
- **Python** → Pandas, NumPy, Jupyter  
- **Data Profiling** → ydata-profiling (Pandas Profiling)  
- **SQL** → PostgreSQL, Amazon Redshift  
- **ETL Orchestration** → Apache Airflow, AWS Glue  
- **Data Storage** → Amazon S3 (cloud), CSV (local)  
- **AWS Services** → Lambda, S3, Glue, Athena  
- **Analytics & BI** → Amazon QuickSight, Tableau, Power BI (DAX measures, semantic modeling)  

---
## ☁️ AWS Architecture Overview

Raw Data
│
▼
Amazon S3 (data lake: raw + processed)
│
▼
AWS Glue (ETL) ───▶ AWS Lambda (serverless triggers)
│
▼
Amazon Athena (interactive SQL on S3)
│
▼
Amazon Redshift (data warehouse)
│
▼
Amazon QuickSight ───▶ Tableau / Power BI (dashboards & analytics)


### 📝 Description
This architecture ingests **NYC Taxi Trip data** into an **Amazon S3 data lake**, where raw data is cleaned and transformed by **AWS Glue ETL jobs** (batch) and **Lambda functions** (event-driven). The processed data is cataloged in **AWS Glue Data Catalog** for schema management, enabling SQL-based exploration in **Athena**.  

For long-term storage and heavy analytics, curated data is loaded into **Amazon Redshift**. The analytics layer uses **Amazon QuickSight**, **Tableau**, or **Power BI** to visualise KPIs like revenue, trips, passenger counts, and location trends.  

**Monitoring and orchestration** is handled using **Apache Airflow (MWAA)** and **CloudWatch** for scheduling, logging, and alerts.  

---

## 🔍 Key Modules  
- **Data Ingestion** → Load raw trip records & taxi zone metadata.  
- **Data Profiling** → Assess quality, missing values, distributions (`DataProfiling.html`).  
- **ETL Transformations** → Cleaning, deriving metrics (trip distance bands, tip %, surcharges).  
- **Semantic Data Model** → Star schema with fact & dimension tables (`images/DataModel.png`).  
- **Warehouse Integration** → DDL in `sql/ddl_dw_taxi.sql` for Redshift/Postgres.  
- **Analytics Layer** → KPIs like total fares, tips, tolls, congestion surcharge, YoY/MoM trends, and zone-level performance.  

---

## 📄 Documentation  
- [Step-by-Step Pipeline Guide](./docs/Taxi_DataPipeline_doc_StepByStep.docx)  
- [NYC Taxi Data Dictionary](./docs/data_dictionary_trip_records_yellow.pdf)  
- [Data Profiling Report (HTML)](./docs/DataProfiling.html)  
- [Warehouse Schema DDL](./sql/ddl_dw_taxi.sql)  
- [Data Model Diagram](./images/DataModel.png)  

> ⚠️ Note: GitHub won’t render `.html` files directly. Download `DataProfiling.html` to view locally.  

---

## ▶️ Getting Started  
1. Clone the repository:  
   ```bash
   git clone https://github.com/gagansingh92/NYC-Taxi-DataPipeline.git
   cd NYC-Taxi-DataPipeline

2.	Create a virtual environment & install dependencies:
	python -m venv .venv && source .venv/bin/activate
	pip install pandas numpy jupyter ydata-profiling

3.	Open Jupyter notebooks:
	jupyter notebook notebooks/

4.	(Optional) Create schema in Postgres/Redshift using:
	\i sql/ddl_dw_taxi.sql

---

## 🙋 Author

**Gagan Preet Singh**  
Email: gagan.link08@gmail.com  
[LinkedIn](https://www.linkedin.com/in/gagansingh87)
