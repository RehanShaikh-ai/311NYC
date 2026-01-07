import duckdb

con = duckdb.connect("nyc_311.duckdb")


con.execute("""
CREATE OR REPLACE VIEW v_raw \
            AS
            SELECT *,
            CASE 
                WHEN lower(status) IN(
            'open', 
            'in progress', 
            'pending', 
            'started') THEN 'Open'
            ELSE 'Unspecified'
            END AS normalized_status
            FROM 'NYC311.parquet' 
            """)

con.execute("""
            SELECT normalized_status, status 
            FROM v_raw 
            WHERE status = 'Pending' 
            LIMIT 10 """).fetch_df()
