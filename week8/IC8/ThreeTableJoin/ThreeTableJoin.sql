select
	o.id,
    c.name,
    b.title,
    a.name,
    oi.quantity,
    b.price * oi.quantity as total
from orders as o
join customers as c on o.customer_id = c.id
join order_items as oi on o.id = oi.order_id
join books as b on b.id = oi.book_id
join authors as a on b.author_id = a.id;