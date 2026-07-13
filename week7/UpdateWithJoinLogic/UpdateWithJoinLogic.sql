alter table users add column lifetime_value numeric (10,2) not null default 0;

update users u set lifetime_value = coalesce((
select sum(o.amount) from orders o where o.customer_id = u.id),0);