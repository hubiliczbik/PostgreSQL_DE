select
    c.email,
    concat_ws(', ',
        case when c.email like '% %' then 'contains spaces' end,
        case when c.email not like '%@%' then 'does not contain @' end,
        case when c.email ~ '@.*@' then 'has multiple @' end,
        case when c.email like '.%' or c.email like '%.' then 'starts or ends with dot' end,
        case when c.email like '%..%' then 'has consecutive dots' end
    ) as rules_fired
from customers c
where c.email like '% %'
   or c.email not like '%@%'
   or c.email ~ '@.*@'
   or c.email like '.%'
   or c.email like '%.'
   or c.email like '%..%';