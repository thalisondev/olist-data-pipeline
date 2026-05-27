# Olist Data Pipeline 🚀

> Pipeline end-to-end construído com dados reais do e-commerce brasileiro — do CSV bruto até o dashboard.

![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-4169E1?style=for-the-badge&logo=postgresql&logoColor=white)
![dbt](https://img.shields.io/badge/dbt-FF694B?style=for-the-badge&logo=dbt&logoColor=white)
![Prefect](https://img.shields.io/badge/Prefect-024DFD?style=for-the-badge&logo=prefect&logoColor=white)
![Docker](https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white)
![Metabase](https://img.shields.io/badge/Metabase-509EE3?style=for-the-badge&logo=metabase&logoColor=white)

---

## 📌 Sobre o projeto

Pipeline de dados construído com o dataset público da [Olist](https://olist.com/) — mais de **100 mil pedidos reais** do e-commerce brasileiro entre 2016 e 2018.

O objetivo foi construir uma arquitetura completa de engenharia de dados: ingestão, armazenamento, transformação, orquestração e visualização — tudo rodando via Docker com um único comando.

> 🇺🇸 [Read in English](README.md)

---

## 🏗️ Arquitetura

```
CSV (Olist/Kaggle)
       │
       ▼
 Python + Pandas          ← Ingestão e limpeza
       │
       ▼
  PostgreSQL 15           ← Armazenamento (raw)
       │
       ▼
      dbt                 ← Transformação (staging → marts)
       │
       ▼
   Metabase               ← Dashboard e visualização
       │
  Prefect 2               ← Orquestração de todo o fluxo
```

---

## 🛠️ Tech Stack

| Camada | Tecnologia |
|---|---|
| Fonte de dados | Olist Dataset (Kaggle) |
| Ingestão | Python + Pandas |
| Armazenamento | PostgreSQL 15 |
| Transformação | dbt |
| Orquestração | Prefect 2 |
| Visualização | Metabase |
| Infraestrutura | Docker Compose |

---

## 📊 Modelos de dados

**Staging** — limpeza e padronização dos dados brutos:
- `stg_orders` — pedidos limpos
- `stg_customers` — clientes limpos
- `stg_order_items` — itens de pedido limpos

**Marts** — camada analítica pronta para consumo:
- `orders_by_state` — total de pedidos e média de dias de entrega por estado
- `revenue_by_category` — receita e pedidos por categoria de produto
- `top_sellers` — melhores vendedores

---

## 📸 Dashboard

![Olist Analytics Dashboard](docs/dashboard.png)

---

## ▶️ Como rodar

### Pré-requisitos

- Docker Desktop
- Python 3.11+

### 1. Clone o repositório

```bash
git clone https://github.com/thalisondev/olist-data-pipeline.git
cd olist-data-pipeline
```

### 2. Baixe o dataset

Baixe o [dataset da Olist no Kaggle](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce) e coloque os arquivos CSV em `data/raw/olist/`.

### 3. Suba a infraestrutura

```bash
docker-compose up -d
```

### 4. Execute a ingestão

```bash
python pipeline.py
```

### 5. Rode os modelos dbt

```bash
cd transform
dbt run --profiles-dir .
```

### 6. Acesse os dashboards

| Serviço | URL |
|---|---|
| Metabase | http://localhost:3000 |
| Prefect | http://localhost:4200 |

---

## 📦 Dataset

- **100k+ pedidos** de 2016 a 2018
- **9 tabelas:** orders, customers, products, sellers, payments, reviews, geolocation
- Fonte: [Kaggle — Brazilian E-Commerce Public Dataset by Olist](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)

---

## 👤 Autor

Feito por [Thalison Santos](https://github.com/thalisondev) — [@LinkedIn](https://www.linkedin.com/in/thalison-dev)
