{{
   config(
    materialized='view'
   )
}}

with source_entreprise as (
    SELECT sales_rep, ARRAY_AGG(DISTINCT company_name) AS company_names
    FROM {{ source('COURS_DBT', 'SALESTEAM')}}
    GROUP BY sales_rep
)

SELECT *
FROM source_entreprise
