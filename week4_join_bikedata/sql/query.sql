SELECT DISTINCT
    product_id
FROM
    staging.orders_items;

SELECT DISTINCT
    product_id
FROM
    staging.products;

-- Count distinct product_id in products table
SELECT
    COUNT(DISTINCT product_id) AS distinct_products
FROM
    staging.products;

-- Count distinct product_id in order_items table
SELECT
    COUNT(DISTINCT product_id) AS distinct_ordered_products
FROM
    staging.order_items;

-- Find products that have never been ordered
SELECT
    p.product_id,
    p.product_name
FROM
    staging.products p
    FULL OUTER JOIN staging.order_items oi ON p.product_id = oi.product_id
WHERE
    oi.product_id IS NULL;

-- 
SELECT
    oi.product_id AS product_id_1,
    p.product_id AS product_id_2,
FROM
    staging.order_items oi
    INNER JOIN staging.products p ON oi.product_id = p.product_id
WHERE
    oi.product_id IS NULL;

SELECT
    oi.product_id AS product_id_1,
    p.product_id AS product_id_2,
FROM
    staging.order_items oi
    RIGHT JOIN staging.products p ON oi.product_id = p.product_id
WHERE
    oi.product_id IS NULL;

/* Task 2: Why Distinct Counts Differ
The products table has 321 distinct products while order_items has only 307.
The difference of 14 represents products in the catalog that have never been purchased.
To find these products, we use a LEFT/FULL JOIN anti-join pattern, which is more efficient than NOT IN subqueries on large datasets. */
----------------------------------------------------------------------------------------------------------------------------------------------
/* Task 3 Group 1: JOIN Types from Products Table
JOIN and INNER JOIN are identical—the word "INNER" is optional. 
Both return 4,722 rows (only matches). 
LEFT JOIN returns 4,736 rows because it keeps all products, including the 14 never-ordered ones with NULL values in the order_items columns. 
This makes LEFT JOIN useful when you need to see all records from one table regardless of matches. 
 */
----------------------------------------------------------------------------------------------------------------------------------------------
/* Task 3 Group 2: How Table Order Matters
INNER JOIN gives the same result regardless of table order (4,722 rows). 
LEFT JOIN from order_items also returns 4,722 . 
RIGHT JOIN from order_items returns 4,736 rows, proving that "A LEFT JOIN B" equals "B RIGHT JOIN A." */
------------------------------------------------------------------------------------------------------------------------------------------------
/* 
Task 3 Group 3: Anti-Join Pattern
INNER JOIN + WHERE IS NULL is logically impossible and always returns zero rows.
Since INNER JOIN only returns matches, the join key can never be NULL.
RIGHT JOIN + WHERE IS NULL correctly returns 14 rows—the. */