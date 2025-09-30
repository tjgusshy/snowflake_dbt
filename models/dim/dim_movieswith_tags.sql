{{ config(
    materialized='ephemeral',
    description='This ephemeral model contains movie ratings data with user IDs, movie IDs, ratings, and timestamps.'
) }}

With movies As (
    Select * From {{ ref('dim_movies') }}
),

tags As (
    Select *
    From {{ ref('dim_genome_tags') }}

),

score As (
    Select *
    From {{ ref('fct_genome_scores') }}
)

Select
    mvs.*,
    scr.*,
    tags.*
From movies As mvs
Left Join score As scr On mvs.movie_id = scr.movie_id
Left Join tags As tags On scr.tag_id = tags.tag_id
