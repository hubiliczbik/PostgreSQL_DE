select * from orders
where status != 'cancelled'
order by
case
	when status = 'paid' then 1
	when status = 'pending' then 2
	when status = 'refunded' then 3
end,
amount desc;
