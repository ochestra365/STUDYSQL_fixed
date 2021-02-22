use bookrentalshop;
go

select	d.Names
		,sum(b.Price) as 'ÃÑ ÇÕ°è±Ý¾×'
		from bookstbl as b 
		right outer join divtbl as d
		on b.division=d.division
		group by b.division, d.Names;
		
		
