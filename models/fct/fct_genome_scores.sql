WITH src_scores AS (
    SELECT * FROM {{ ref('src_genome_scores') }}
)

SELECT
    movie_id,
    tag_id,
    round(relevance, 2) AS relevance_score
FROM src_scores
WHERE relevance > 0
