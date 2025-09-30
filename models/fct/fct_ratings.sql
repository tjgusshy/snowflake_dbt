{{ config(
    materialized='incremental',
    description='This table contains movie ratings data with user IDs, movie IDs, ratings, and timestamps.',
    on_schema_change='fail'
) }}

WITH src_ratings AS (
    SELECT * FROM {{ ref('src_ratings') }}
)

SELECT
    user_id,
    movie_id,
    rating,
    rating_timestamp
FROM src_ratings
WHERE
    rating IS NOT NULL
    {% if is_incremental() %}
        AND rating_timestamp
        > (SELECT COALESCE(MAX(rating_timestamp), '1970-01-01') FROM {{ this }})
    {% endif %}
