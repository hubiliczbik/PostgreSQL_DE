select name, signed_up_at,
case
		when signed_up_at >= current_date - interval '30 days' then 'new'
		when exists (select 1 from orders o where o.customer_id = c.id) then 'returning'
		when (select max(o.ordered_at) from orders o where o.customer_id = c.id) < current_date - interval '180 days' then 'lapsed'
		else 'inactive'
end as classify
from customers c;
