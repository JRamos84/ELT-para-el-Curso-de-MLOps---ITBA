SELECT
    s."index" AS score_index,
    s."user_id",
    s."movie_id",
    s."Date" AS score_date,
    s."Unnamed__0" AS extra_column,  -- Ajusta esto si es necesario
    u."Full_Name",
    TO_TIMESTAMP(CAST(u."year_of_birth" AS TEXT) || '-01-01', 'YYYY-MM-DD') AS "year_of_birth",  -- Convertir solo el año a timestamp
    CASE 
        WHEN u."Gender" = 'M' THEN true
        WHEN u."Gender" = 'F' THEN false
        ELSE NULL
    END AS "is_male",
    u."Zip_Code",
    m."Name" AS movie_name,
    m."Release_Date",
    m."IMDB_URL",
    m."unknown",
    m."Action",
    m."Adventure",
    m."Animation",
    m."Children_s",
    m."Comedy",
    m."Crime",
    m."Documentary",
    m."Drama",
    m."Fantasy",
    m."Film_Noir",
    m."Horror",
    m."Musical",
    m."Mystery",
    m."Romance",
    m."Sci_Fi",
    m."Thriller",
    m."War",
    m."Western"
FROM {{ source('recommmender_system_raw', 'score') }} AS s
JOIN {{ source('recommmender_system_raw', 'user') }} AS u
    ON s."user_id" = u."id"  -- Relación entre scores y users
JOIN {{ source('recommmender_system_raw', 'movie') }} AS m
    ON s."movie_id" = m."id"  -- Relación entre scores y movies
