{{ config(   
    materialized='table',
    description='This table model contains movie release date data with movie IDs and release dates.'
) }}

WITH fct_ratings AS (
    SELECT * FROM {{ ref('fct_ratings') }}
),

seed_dates AS (
    SELECT * FROM {{ ref('seeds_movie_release_date') }}
)

SELECT DISTINCT
    f.*,
    CASE
        WHEN sr.release_date IS NULL THEN 'Unknown'
        ELSE 'known'
    END AS release_date
FROM fct_ratings AS f
LEFT JOIN seed_dates AS sr ON f.movie_id = sr.movie_id
