-- ======================================================
-- Script: 02_norm_views.sql
--
-- Objective:
--     Normalize status values Open, Closed and Unspecified
--     Typecast unique_key to BIGINT and created_ts and closed_ts to TIMESTAMP
--     Conclude closure of requests with status not timestamps
-- 
-- NOTE:
--      This view is built upon v_raw with the derived column normalized_status
--      No filtering or SLA eligibilty logic is applied to this view
--
-- ======================================================

CREATE OR REPLACE 
VIEW v_norm 
AS 

SELECT 
CAST(unique_key AS BIGINT) unique_key, 
CAST(created_date AS TIMESTAMP) AS created_ts, 
CAST(closed_date AS TIMESTAMP) AS closed_ts,
agency, 
agency_name, 
complaint_type, 
descriptor, 
status, 
borough,
CASE 
        WHEN LOWER(status) IN (
            'pending',
            'in progress',
            'assigned',
            'open',
            'started'
        ) THEN 'Open'
        WHEN LOWER(status) = 'closed'
        THEN 'Closed'
        ELSE 'Unspecified' 
    END AS normalized_status
FROM v_raw;




