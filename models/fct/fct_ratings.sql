{{ config(
    materialized='incremental',
    description='This table contains movie ratings data with user IDs, movie IDs, ratings, and timestamps.',
    on_schema_change='fail'
) }}

WITH src_ratings AS (
    SELECT * FROM {{ ref('src_ratings') }}
)

SELECT
    src_ratings.user_id,
    src_ratings.movie_id,
    src_ratings.rating
FROM src_ratings
WHERE
    src_ratings.rating IS NOT NULL
    {% if is_incremental() %}
        AND src_ratings.rating_timestamp > (
            SELECT COALESCE(MAX(src_ratings.rating_timestamp), '1970-01-01')
            FROM {{ this }}
        )
    {% endif %}
