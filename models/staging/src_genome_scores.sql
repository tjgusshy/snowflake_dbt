WITH raw_genome_scores AS (
    SELECT *
    FROM movielens.raw.raw_genome_scores
)

SELECT
    movieid AS movie_id,
    tagid AS tag_id,
    relevance
FROM raw_genome_scores
