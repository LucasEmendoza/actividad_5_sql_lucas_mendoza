SELECT sales.id AS 'id Venta',
sales.customer_id AS 'id Cliente',
sales.value AS 'Valor Venta',
sales.date AS 'Fecha Venta'

from sales
ORDER BY date
