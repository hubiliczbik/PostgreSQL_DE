select
	o.id,
	o.amount,
	(
		select c.country
		from customers c
		where c.id = o.customer_id
	) as customer_country
	from orders o
	order by o.amount desc
	limit 5;
