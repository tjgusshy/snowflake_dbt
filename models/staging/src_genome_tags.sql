WITH raw_genome_tags AS (
    SELECT *
    FROM movielens.raw.raw_genome_tags
)

SELECT
    tag,
    tagid AS tag_id
FROM raw_genome_tags
