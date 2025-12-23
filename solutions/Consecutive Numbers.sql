/* Universal solution that works with any no of consecutive numbers filter*/
with grouping as(
select id, 
       num,
       row_number() over(order by id asc) -
       row_number() over(partition by num order by id) as grouped
from logs)

select distinct num as ConsecutiveNums
from grouping
group by num, grouped
having count(*) >= 3
