# NYC 311 SLA Analytics

A decision-oriented BI project analyzing SLA compliance and operational performance using real NYC 311 service request data.  
Built with API-driven ingestion and a modern analytics-first architecture.

## Project Objective

To evaluate operational efficiency and SLA adherence across NYC agencies using real, API-sourced data.  
The project is intentionally framed around analytical rigor, pushing heavy logic upstream and keeping BI tools focused on decision-making visuals.

## Data Source

- Platform: NYC Open Data (Socrata)
- Dataset: 311 Service Requests
- Dataset ID: `erm2-nwe9`
- Access Method: Socrata API via Python (`sodapy`)
- Data Scope: Time-scoped operational slice (explicitly framed, not full historical analysis)

## Architecture

NYC Open Data API  
        ↓  
Python (sodapy)  
        ↓  
Parquet (raw, immutable)  
        ↓  
DuckDB (views + aggregations)  
        ↓  
Power BI (visualization only)

## Storage Strategy

- Raw data stored in Parquet for columnar, compressed analytics
- Raw files treated as immutable
- CSV-based workflows intentionally avoided

## Analytics Layer

- DuckDB used as the analytical SQL engine (OLAP)
- Parquet queried directly without import
- Business logic implemented via SQL views:
  - Base data cleaning and derived metrics
  - SLA classification logic
  - Aggregated, BI-ready summary views

