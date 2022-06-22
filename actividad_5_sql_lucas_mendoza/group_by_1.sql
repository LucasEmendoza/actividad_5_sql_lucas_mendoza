SELECT sales.id AS 'id Ventas',
sales.date AS 'Fecha',
sales_products.amount AS 'Cantidad',
sales_products.value AS 'Precio',
SUM(sales_products.amount * sales_products.value) AS 'Precio total'
FROM 

sales
JOIN sales_products ON sales.id = sales_products.sale_id
JOIN products ON products.id = sales_products.product_id

GROUP BY sales.id