SELECT
customer_id AS 'id Cliente', 
DATE AS Fecha,
sales.value AS 'Valor Venta'
FROM 
 
sales_products
JOIN sales ON sales_products.sale_id = sales.id
JOIN products ON products.id = sales_products.product_id
GROUP BY customer_id