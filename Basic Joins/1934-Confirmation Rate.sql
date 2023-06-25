select s.user_id, round(avg(
  CASE WHEN c.action='confirmed' THEN 1.0
  ELSE 0
  END
 ),2) as confirmation_rate
from Signups as s left join Confirmations as c 
on s.user_id= c.user_id group by S.user_id;