use bookrentalshop;
go

select b.Idx as '��ȣ'
	  ,d.Division as '�帣��ȣ'
	  ,d.Names as '�帣'
	  ,b.Names as 'å����'
	  ,b.Author as '����'
		from bookstbl as b
	inner join divtbl as d
	on b.Division=d.Division
	where d.Division='B002';
