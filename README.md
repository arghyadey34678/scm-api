# SCM API - Oracle Database Query Service

A FastAPI-based REST API that executes SQL SELECT queries against an Oracle database and returns results as JSON.

## Features

- ✅ Single POST endpoint for SQL queries
- ✅ Automatic `FETCH FIRST 10 ROWS ONLY` limitation
- ✅ SQL validation (SELECT queries only)
- ✅ Results returned as JSON
- ✅ Swagger UI documentation
- ✅ Environment-based configuration
- ✅ Ready for Render.com deployment

## Local Installation

1. Clone the repository:
```bash
git clone https://github.com/yourusername/scm-api.git
cd scm-api
```

2. Install dependencies:
```bash
pip install -r requirements.txt
```

3. Run the server:
```bash
uvicorn main:app --reload
```

4. Access API:
   - API: http://localhost:8000
   - Swagger Docs: http://localhost:8000/docs
   - ReDoc: http://localhost:8000/redoc

## Environment Variables

Configure these environment variables for database connection:

```
DB_HOST=localhost
DB_PORT=1521
DB_SERVICE=FREEPDB1
DB_USER=scm
DB_PASSWORD=scm123
```

## API Endpoint

### POST /scm/scm-inquiry

Execute a SQL SELECT query against Oracle database.

**Request:**
```
Content-Type: text/plain

SELECT * FROM orders WHERE order_id = 1001
```

**Response:**
```json
{
  "status": "success",
  "data": [
    {
      "ORDER_ID": 1001,
      "CUSTOMER_ID": 101,
      "ORDER_DATE": "2024-03-10",
      "AMOUNT": 500.00
    }
  ],
  "row_count": 1
}
```

## Deployment on Render.com

### Method 1: Using render.yaml (Recommended)

1. Push code to GitHub:
```bash
git add .
git commit -m "Initial commit"
git push origin main
```

2. Go to [Render Dashboard](https://dashboard.render.com)

3. Click "New +" → "Web Service from GitHub"

4. Connect your GitHub repository

5. Render will auto-detect render.yaml configuration

6. Set environment variables in Render dashboard:
   - `DB_HOST`: Your Oracle DB host
   - `DB_PORT`: Your Oracle DB port (usually 1521)
   - `DB_SERVICE`: Your Oracle service name
   - `DB_USER`: Oracle username
   - `DB_PASSWORD`: Oracle password

7. Click "Deploy"

### Method 2: Manual Setup

1. Push code to GitHub

2. Go to [Render Dashboard](https://dashboard.render.com)

3. Click "New +" → "Web Service"

4. Configure:
   - **Name**: scm-api
   - **Environment**: Python 3
   - **Build Command**: `pip install -r requirements.txt`
   - **Start Command**: `uvicorn main:app --host 0.0.0.0 --port 8000`
   - **Plan**: Free or Starter

5. Add Environment Variables:
   - DB_HOST
   - DB_PORT
   - DB_SERVICE
   - DB_USER
   - DB_PASSWORD

6. Click "Create Web Service"

## Requirements

- Python 3.9+
- FastAPI 0.104.1
- Uvicorn 0.24.0
- oracledb 1.4.0

## Notes

- Queries are limited to 10 rows by default using `FETCH FIRST 10 ROWS ONLY`
- Only SELECT queries are accepted
- All other query types will return a 400 error
- Database connection errors return a 500 error

## Testing

Using curl:
```bash
curl -X POST "http://localhost:8000/scm/scm-inquiry" \
  -H "Content-Type: text/plain" \
  -d "SELECT * FROM users"
```

## License

MIT
