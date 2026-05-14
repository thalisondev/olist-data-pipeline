# Olist Data Pipeline 🚀

An end-to-end data engineering pipeline built with real Brazilian e-commerce data from [Olist](https://olist.com/).

## Architecture
CSV (Olist) → Python Ingestion → PostgreSQL (raw) → dbt (staging/marts) → Metabase Dashboard
↑
Prefect (orchestration)

## Tech Stack

| Layer | Technology |
|---|---|
| Data Source | Olist Dataset (Kaggle) |
| Ingestion | Python + Pandas |
| Storage | PostgreSQL 15 |
| Transformation | dbt |
| Orchestration | Prefect 2 |
| Visualization | Metabase |
| Infrastructure | Docker Compose |

## Data Models

### Staging
- `stg_orders` — cleaned orders data
- `stg_customers` — cleaned customers data
- `stg_order_items` — cleaned order items data

### Marts
- `orders_by_state` — total orders and avg delivery days by state
- `revenue_by_category` — revenue and orders by product category
- `top_sellers` — best performing sellers

## How to Run

### Prerequisites
- Docker Desktop
- Python 3.11

### 1. Clone the repository
```bash
git clone https://github.com/thalisondev/olist-data-pipeline.git
cd olist-data-pipeline
```

### 2. Download the dataset
Download the [Olist dataset](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce) and place the CSV files in `data/raw/olist/`.

### 3. Start the infrastructure
```bash
docker-compose up -d
```

### 4. Run the ingestion
```bash
python pipeline.py
```

### 5. Run dbt models
```bash
cd transform
dbt run --profiles-dir .
```

### 6. Access the dashboards
- **Metabase:** http://localhost:3000
- **Prefect:** http://localhost:4200

## Dashboard Preview

![Olist Analytics Dashboard](docs/dashboard.png)

## Dataset
- 100k+ orders from 2016 to 2018
- 9 tables: orders, customers, products, sellers, payments, reviews, geolocation
- Source: [Kaggle - Brazilian E-Commerce Public Dataset by Olist](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)