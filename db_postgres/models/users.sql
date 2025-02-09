SELECT
    "index",
    CAST(id AS INTEGER) AS id,
    "Full_Name",
    TO_TIMESTAMP(CAST("year_of_birth" AS TEXT) || '-01-01', 'YYYY-MM-DD') AS "year_of_birth",  -- Convertir solo el año a timestamp
    CASE 
        WHEN "Gender" = 'M' THEN true
        WHEN "Gender" = 'F' THEN false
        ELSE NULL
    END AS is_male,
    "Zip_Code"
FROM {{ source('recommmender_system_raw', 'user') }} 
