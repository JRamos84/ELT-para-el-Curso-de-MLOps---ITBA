SELECT 
    CAST("index" AS INTEGER) AS "index",
    CAST("user_id" AS INTEGER) AS "user_id",
    CAST("movie_id" AS INTEGER) AS "movie_id",
    CAST("Date" AS TIMESTAMP) AS "Date",
    "Unnamed__0"
FROM {{ source('recommmender_system_raw', 'score') }}
