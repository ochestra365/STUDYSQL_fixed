use bookrentalshop;
go

select	d.Names
		,sum(b.Price) as '�� �հ�ݾ�'
		from bookstbl as b 
		right outer join divtbl as d
		on b.division=d.division
		group by b.division, d.Names;
		
		
