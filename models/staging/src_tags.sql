{{ config(
    materialized='table'
) }}

WITH raw_tags AS (
    SELECT *
    FROM movielens.raw.raw_tags
)

SELECT
    userid AS user_id,
    movieid AS movie_id,
    tag,
    TO_TIMESTAMP(timestamp) AS tag_timestamp
FROM raw_tags
