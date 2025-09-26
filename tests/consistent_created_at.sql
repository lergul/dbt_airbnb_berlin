WITH L AS (
    SELECT
    *
    FROM
    {{ ref('dim_listings_cleansed') }}
),
    F AS (
        SELECT 
        *
        FROM
        {{ ref('fct_reviews') }}
    )

SELECT * FROM L 
LEFT JOIN F ON F.LISTING_ID = L.LISTING_ID
WHERE L.CREATED_AT > F.REVIEW_DATE
