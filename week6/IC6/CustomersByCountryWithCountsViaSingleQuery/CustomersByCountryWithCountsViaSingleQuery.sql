select country, count(*) as total_customers from customers group by country order by total_customers desc;
