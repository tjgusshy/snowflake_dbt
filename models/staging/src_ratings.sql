{{ config(
    materialized='table',
    description='This table contains the raw movie ratings data from the MOVIELENS.RAW.RAW_RATINGS table, with user IDs, movie IDs, ratings, and timestamps.',
) }}
WITH raw_ratings AS (
    SELECT *
    FROM movielens.raw.raw_ratings
)

SELECT
    userid AS user_id,
    movieid AS movie_id,
    rating,
    TO_TIMESTAMP(timestamp) AS rating_timestamp
FROM raw_ratings
