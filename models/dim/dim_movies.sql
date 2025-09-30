WITH src_movies AS (
    SELECT *
    FROM {{ ref('src_movies') }}
)

SELECT
    movie_id,
    genres,
    INITCAP(TRIM(title)) AS movie_title,
    SPLIT(genres, '|') AS genres_array
FROM src_movies
