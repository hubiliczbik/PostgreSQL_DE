select
	c.id,
	c.name,
	o.id as order_id,
	o.amount
from customers as c
join lateral (
	select id, amount from orders where customer_id = c.id order by amount desc limit 3
) as o on true;