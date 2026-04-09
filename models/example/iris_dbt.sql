WITH base AS (

    SELECT *
    FROM {{ source('iris_source', 'IRIS_SQL_OUTPUT') }}

),

features AS (

    SELECT *,
        
        -- petal size category
        CASE 
            WHEN petal_area < 1 THEN 'Small'
            WHEN petal_area BETWEEN 1 AND 3 THEN 'Medium'
            ELSE 'Large'
        END AS petal_size,

        -- ratios
        (sepal_length / sepal_width) AS sepal_ratio,
        (petal_length / petal_width) AS petal_ratio

    FROM base

),

final AS (

    SELECT *,
        
        -- predicted grouping logic
        CASE 
            WHEN petal_area < 1 THEN 'Likely Setosa'
            WHEN petal_area < 4 THEN 'Likely Versicolor'
            ELSE 'Likely Virginica'
        END AS predicted_species_group

    FROM features

)

SELECT * FROM final
