import oracledb
import os

# Database Configuration (same as main.py)
DB_HOST = os.getenv("DB_HOST", "localhost")
DB_PORT = int(os.getenv("DB_PORT", 1521))
DB_SERVICE = os.getenv("DB_SERVICE", "XE")
DB_USER = os.getenv("DB_USER", "scm")
DB_PASSWORD = os.getenv("DB_PASSWORD", "scm123")

print("Testing Oracle Database Connection...")
print(f"Host: {DB_HOST}")
print(f"Port: {DB_PORT}")
print(f"Service: {DB_SERVICE}")
print(f"User: {DB_USER}")
print(f"DSN: {DB_HOST}:{DB_PORT}/{DB_SERVICE}")
print("-" * 50)

try:
    connection = oracledb.connect(
        user=DB_USER,
        password=DB_PASSWORD,
        dsn=f"{DB_HOST}:{DB_PORT}/{DB_SERVICE}"
    )
    print("✓ Connection successful!")
    print(f"Oracle version: {connection.version}")
    connection.close()
    print("✓ Connection closed successfully")
except oracledb.Error as e:
    print(f"✗ Connection failed!")
    print(f"Error: {e}")
    error_obj, = e.args
    print(f"Error Code: {error_obj.code}")
    print(f"Error Message: {error_obj.message}")
except Exception as e:
    print(f"✗ Unexpected error: {e}")
