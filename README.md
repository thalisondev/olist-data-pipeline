# Olist Data Pipeline 🚀

> End-to-end data pipeline built with real Brazilian e-commerce data — from raw CSV to dashboard.

![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-4169E1?style=for-the-badge&logo=postgresql&logoColor=white)
![dbt](https://img.shields.io/badge/dbt-FF694B?style=for-the-badge&logo=dbt&logoColor=white)
![Prefect](https://img.shields.io/badge/Prefect-024DFD?style=for-the-badge&logo=prefect&logoColor=white)
![Docker](https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white)
![Metabase](https://img.shields.io/badge/Metabase-509EE3?style=for-the-badge&logo=metabase&logoColor=white)

---

## 📌 About

Data pipeline built on the public [Olist](https://olist.com/) dataset — over **100k real orders** from Brazilian e-commerce between 2016 and 2018.

The goal was to build a complete data engineering architecture: ingestion, storage, transformation, orchestration, and visualization — all running via Docker with a single command.

> 🇧🇷 [Leia em Português](README.pt-br.md)

---

## 🏗️ Architecture

```
CSV (Olist/Kaggle)
       │
       ▼
 Python + Pandas          ← Ingestion and cleaning
       │
       ▼
  PostgreSQL 15           ← Storage (raw)
       │
       ▼
      dbt                 ← Transformation (staging → marts)
       │
       ▼
   Metabase               ← Dashboard and visualization
       │
  Prefect 2               ← Orchestration of the full flow
```

---

## 🛠️ Tech Stack

| Layer | Technology |
|---|---|
| Data Source | Olist Dataset (Kaggle) |
| Ingestion | Python + Pandas |
| Storage | PostgreSQL 15 |
| Transformation | dbt |
| Orchestration | Prefect 2 |
| Visualization | Metabase |
| Infrastructure | Docker Compose |

---

## 📊 Data Models

**Staging** — cleaning and standardizing raw data:
- `stg_orders` — cleaned orders
- `stg_customers` — cleaned customers
- `stg_order_items` — cleaned order items

**Marts** — analytical layer ready for consumption:
- `orders_by_state` — total orders and avg delivery days by state
- `revenue_by_category` — revenue and orders by product category
- `top_sellers` — best performing sellers

---

## 📸 Dashboard

![Olist Analytics Dashboard](docs/dashboard.png)

---

## ▶️ How to Run

### Prerequisites

- Docker Desktop
- Python 3.11+

### 1. Clone the repository

```bash
git clone https://github.com/thalisondev/olist-data-pipeline.git
cd olist-data-pipeline
```

### 2. Download the dataset

Download the [Olist dataset from Kaggle](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce) and place the CSV files in `data/raw/olist/`.

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

| Service | URL |
|---|---|
| Metabase | http://localhost:3000 |
| Prefect | http://localhost:4200 |

---

## 📦 Dataset

- **100k+ orders** from 2016 to 2018
- **9 tables:** orders, customers, products, sellers, payments, reviews, geolocation
- Source: [Kaggle — Brazilian E-Commerce Public Dataset by Olist](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)

---

## 👤 Author

Made by [Thalison Santos](https://github.com/thalisondev) — [@LinkedIn](https://www.linkedin.com/in/thalison-dev)
