WITH raw_links AS (
    SELECT *
    FROM movielens.raw.raw_links
)

SELECT
    movieid AS movie_id,
    imdbid AS imdb_id,
    tmdbid AS tmdb_id
FROM raw_links
