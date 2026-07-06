select c.id, c.name, c.country, c.signed_up_at,
(
	select min(o.ordered_at) from orders o where o.customer_id = c.id
) - c.signed_up_at as days_to_first_order
from customers c
where c.signed_up_at >= date '2026-01-01'
