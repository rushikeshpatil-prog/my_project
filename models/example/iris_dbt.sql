WITH base AS (

    SELECT *
    FROM {{ ref('"DEMO"."PUBLIC"."TRIAL_SHEETS_IRIS_IRIS"') }}

),

features AS (

    SELECT *,
        
        -- size classification
        CASE 
            WHEN petal_area < 1 THEN 'Small'
            WHEN petal_area BETWEEN 1 AND 3 THEN 'Medium'
            ELSE 'Large'
        END AS petal_size,

        -- shape ratio
        (sepal_length / sepal_width) AS sepal_ratio,
        (petal_length / petal_width) AS petal_ratio

    FROM base

),

final AS (

    SELECT *,
        
        -- species grouping logic (analytical insight)
        CASE 
            WHEN petal_area < 1 THEN 'Likely Setosa'
            WHEN petal_area < 4 THEN 'Likely Versicolor'
            ELSE 'Likely Virginica'
        END AS predicted_species_group

    FROM features

)

SELECT * FROM final
