select c.country, o.id as order_id, o.amount from orders o join customers c on c.id = o.customer_id
where not exists (
select 1 from orders o2 join customers c2 on c2.id = o2.customer_id where c2.country = c.country and o2.amount > o.amount
)
order by o.amount desc
