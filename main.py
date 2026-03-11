from fastapi import FastAPI, HTTPException, Body
import oracledb
import json
import os
import logging
from typing import List, Dict, Any
from pydantic import BaseModel

# Configure logging - both console and file
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s',
    handlers=[
        logging.StreamHandler(),  # Console output
        logging.FileHandler('scm-api.log', mode='a')  # File output
    ]
)
logger = logging.getLogger(__name__)
logger.info("=" * 80)
logger.info("SCM API Starting - Logs will be saved to scm-api.log")
logger.info("=" * 80)

app = FastAPI()

class SQLQuery(BaseModel):
    """Request body model for SQL query"""
    inquiry_sql: str

# Oracle Database Configuration (using environment variables)
DB_HOST = os.getenv("DB_HOST", "localhost")
DB_PORT = int(os.getenv("DB_PORT", 1521))
DB_SERVICE = os.getenv("DB_SERVICE", "XE")
DB_USER = os.getenv("DB_USER", "scm")
DB_PASSWORD = os.getenv("DB_PASSWORD", "scm123")

def get_db_connection():
    """Establish connection to Oracle database"""
    try:
        connection = oracledb.connect(
            user=DB_USER,
            password=DB_PASSWORD,
            dsn=f"{DB_HOST}:{DB_PORT}/{DB_SERVICE}"
        )
        return connection
    except oracledb.Error as e:
        raise HTTPException(status_code=500, detail=f"Database connection failed: {str(e)}")

def validate_select_query(sql: str) -> str:
    """Validate that query is a SELECT statement and add FETCH FIRST 10 ROWS ONLY for Oracle"""
    # Convert to uppercase for case-insensitive comparison
    sql_upper = sql.strip().upper()
    
    # Check if query starts with SELECT (case-insensitive)
    if not sql_upper.startswith("SELECT"):
        raise HTTPException(status_code=400, detail="Only SELECT queries are allowed")
    
    # Add FETCH FIRST 10 ROWS ONLY if not already present (case-insensitive check)
    if "FETCH" not in sql_upper and "ROWNUM" not in sql_upper:
        sql = f"{sql.strip()} FETCH FIRST 10 ROWS ONLY"
    
    return sql.strip()

def execute_query(sql: str) -> List[Dict[str, Any]]:
    """Execute SQL query and return results as list of dictionaries"""
    connection = None
    try:
        connection = get_db_connection()
        cursor = connection.cursor()
        
        # Execute the query
        cursor.execute(sql)
        
        # Get column names
        columns = [desc[0] for desc in cursor.description]
        
        # Fetch all results
        rows = cursor.fetchall()
        
        # Convert rows to list of dictionaries
        results = []
        for row in rows:
            results.append(dict(zip(columns, row)))
        
        cursor.close()
        return results
    
    except oracledb.Error as e:
        raise HTTPException(status_code=400, detail=f"Query execution error: {str(e)}")
    finally:
        if connection:
            connection.close()

@app.post("/scm/scm-inquiry")
def scm_inquiry(inquiry_sql: str = Body(..., media_type="text/plain")):
    """
    Execute SQL query against Oracle database
    
    Parameters:
    - inquiry_sql: SQL SELECT query string passed as plain text in request body
    
    Returns:
    - JSON object with query results
    """
    logger.info(f"Received SQL query: {inquiry_sql[:100]}...")  # Log first 100 chars
    
    try:
        # Validate the SQL query
        validated_sql = validate_select_query(inquiry_sql)
        logger.info(f"Validated SQL: {validated_sql[:100]}...")
        
        # Execute the query
        logger.info(f"Executing query against database...")
        results = execute_query(validated_sql)
        logger.info(f"Query executed successfully. Returned {len(results)} rows")
        
        # Return results as JSON
        return {
            "status": "success",
            "data": results,
            "row_count": len(results)
        }
    except HTTPException as e:
        logger.error(f"HTTP Error: {e.detail}")
        raise
    except Exception as e:
        logger.error(f"Unexpected error: {str(e)}")
        raise HTTPException(status_code=500, detail=f"Internal server error: {str(e)}")

@app.get("/")
def root():
    return {"message": "SCM API - SQL Inquiry Service"}
