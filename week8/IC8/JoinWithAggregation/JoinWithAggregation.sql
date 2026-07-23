select
	a.name,
	count (distinct b.id),
	sum(b.price * s.quantity) as total_revenue
from authors as a
join books as b on a.id = b.author_id
join sales as s on b.id = s.book_id
group by b.author_id, a."name";
