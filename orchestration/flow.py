import time
import logging
from prefect import flow, task
from prefect.logging import get_run_logger

@task(name="Test Connection")
def test_connection():
    logger = get_run_logger()
    from sqlalchemy import create_engine, text
    engine = create_engine("postgresql://olist_user:olist_pass@olist_postgres:5432/olist_db")
    with engine.connect() as conn:
        result = conn.execute(text("SELECT COUNT(*) FROM raw.orders"))
        count = result.scalar()
        logger.info(f"✅ Total de pedidos no banco: {count}")
    return count

@flow(name="Olist Pipeline")
def olist_pipeline():
    test_connection()

if __name__ == "__main__":
    time.sleep(15)
    olist_pipeline()