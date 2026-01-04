import duckdb

con = duckdb.connect("nyc_311.duckdb")


con.execute("""
CREATE OR REPLACE VIEW v_raw \
            AS
            SELECT *
            FROM 'NYC311.parquet' 
            """)

con.execute("""
SELECT MAX(created_date) FROM v_raw
            """).fetchone()

