import sys
import psycopg2
from   psycopg2.extras import execute_values

try:
    # TODO: Fill in DB credentials
    database = psycopg2.connect(
        host     = "localhost",
        port     = 5433,
        dbname   = "demeter",
        user     = "postgres",
        password = "Clank273"
    )
    print(f"Connected: {database}")
except Exception as error:
    print(f"Could not connect: {error}")
    sys.exit(1)

# cursor.execute(""" """)
