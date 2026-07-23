SELECT o.id, o.customer_id, c.name as customer_name from orders as o join customers as c on o.customer_id = c.id;
