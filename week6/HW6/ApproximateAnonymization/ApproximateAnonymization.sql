select
left(c.name, 2) || '**' as name,
left(c.email, 1) || '***@' || split_part(c.email, '@', 2) as email,
c.country
from customers c where length(c.name) >= 2;