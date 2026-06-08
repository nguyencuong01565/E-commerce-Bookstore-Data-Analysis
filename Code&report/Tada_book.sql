CREATE DATABASE TADA_book;
USE TADA_book;

SELECT *
FROM Book_clean_dataset1
;

--Top 10 đầu sách bán chạy nhất
SELECT TOP 10 quantity
    product_id,
    title,
    quantity,
    current_price,
    category,
    manufacturer,
    Revenue
FROM Book_clean_dataset1
ORDER BY quantity DESC
;

--Top 10 đầu sách mang lại doanh thu lớn nhất
SELECT TOP 10 Revenue
    product_id,
    title,
    Revenue,
    category,
    manufacturer
FROM Book_clean_dataset1
ORDER BY quantity DESC
;

--
SELECT TOP 50 Revenue
    product_id,
    title,
    quantity,
    current_price,
    category,
    Revenue
FROM Book_clean_dataset1
ORDER BY Revenue DESC
;

--Top các đầu sách được yêu thích nhất
SELECT 
    product_id,
    title,
    category,
    n_review,
    avg_rating
FROM Book_clean_dataset1
WHERE n_review > 120 AND avg_rating > 4.5
ORDER BY n_review DESC
;

--Category nào đang bán tốt nhất

SELECT 
    category,
    SUM(quantity) AS Total_Quantity
FROM Book_clean_dataset1 
GROUP BY category
ORDER BY SUM(quantity) DESC
;

SELECT 
    category,
    SUM(Revenue) AS Total_Sale
FROM Book_clean_dataset1 
GROUP BY category
ORDER BY SUM(Revenue) DESC
;


--NXB nào đang hoạt động tốt nhất
SELECT 
    manufacturer,
    SUM(Revenue) AS Total_Sale
FROM Book_clean_dataset1 
GROUP BY manufacturer
ORDER BY SUM(Revenue) DESC
;

--Phân khúc giá nào đang hoạt động tốt
WITH New_table AS(
SELECT *,
    CASE 
        WHEN original_price < 150000 THEN 'low_price'
        WHEN original_price BETWEEN 150000 AND 400000 THEN 'medium_price'
        ELSE 'high_price'
    END AS Category_Price
FROM Book_clean_dataset1 
)
SELECT 
    Category_Price,
    SUM(quantity) AS Total_Quantity
FROM New_table
GROUP BY Category_Price
ORDER BY SUM(quantity) DESC
;

--Bao nhiêu % sách được biết đến
WITH review_table AS(
SELECT *,
    CASE
        WHEN n_review < 50 THEN 'low'
        WHEN n_review BETWEEN 50 AND 120 THEN 'medium'
        ELSE 'high'
    END AS Category_review
FROM Book_clean_dataset1 
)
SELECT 
    Category_review,
    SUM(quantity) AS Total_Quantity
FROM review_table
GROUP BY Category_review
;

--Discount 
WITH discount_table AS(
    SELECT *,
        CASE
            WHEN discount_percentage < 15 THEN '1_low_discount'
            WHEN discount_percentage BETWEEN 15 AND 30 THEN '2_medium_discount'
            WHEN discount_percentage BETWEEN 30 AND 45 THEN '3_high_discount'
            WHEN discount_percentage BETWEEN 45 AND 60 THEN '4_very_high_discount'
            ELSE '5_extreme_discount'
        END AS Category_discount
    FROM Book_clean_dataset1 
)
SELECT 
    Category_discount,
    SUM(Revenue) AS Total_Sale
FROM discount_table
GROUP BY Category_discount
ORDER BY Category_discount DESC
;

--Các đầu sách nào không nên discount ở mức 4
WITH discount_table2 AS(
    SELECT *,
        CASE
            WHEN discount_percentage < 15 THEN '1_low_discount'
            WHEN discount_percentage BETWEEN 15 AND 30 THEN '2_medium_discount'
            WHEN discount_percentage BETWEEN 30 AND 45 THEN '3_high_discount'
            WHEN discount_percentage BETWEEN 45 AND 60 THEN '4_very_high_discount'
            ELSE '5_extreme_discount'
        END AS Category_discount
    FROM Book_clean_dataset1 
)
SELECT 
    product_id,
    title,
    Revenue,
    quantity,
    n_review,
    avg_rating
FROM discount_table2
WHERE Category_discount ='4_very_high_discount'
;











