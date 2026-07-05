select name, email,
case
	when email is null then 'null'
	when email = '' then 'empty'
end as email_issue
from customers where email is null or email = '';
