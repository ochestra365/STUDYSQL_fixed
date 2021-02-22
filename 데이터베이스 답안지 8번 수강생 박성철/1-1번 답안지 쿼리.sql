use bookrentalshop;
go

select lower(email), mobile, names, addr 
from bookrentalshop.dbo.membertbl
order by Names desc;
