use bookrentalshop;
go

select * from membertbl;
select * from rentaltbl;


--membertbl�� �̸�, ���, �ּ�+rentaltbl�� �ѹ��� �� ���� ���.

select m.Names
      ,m.Levels
	  ,m.addr
	  ,r.rentalDate
	  from membertbl as m
      left outer join rentaltbl as r
	  on m.Idx=r.memberIdx
	  where r.rentalDate is null
	  order by m.Names asc;