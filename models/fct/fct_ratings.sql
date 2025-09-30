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
        SELECT COALESCE(MAX(rating_timestamp), '1970-01-01')
        FROM {{ this }}
    )
{% endif %}