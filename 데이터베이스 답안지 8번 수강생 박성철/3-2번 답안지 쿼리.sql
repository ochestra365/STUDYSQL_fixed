use bookrentalshop;
go

select * from membertbl;
select * from rentaltbl;


--membertbl의 이름, 등급, 주소+rentaltbl의 한번도 안 빌린 사람.

select m.Names
      ,m.Levels
	  ,m.addr
	  ,r.rentalDate
	  from membertbl as m
      left outer join rentaltbl as r
	  on m.Idx=r.memberIdx
	  where r.rentalDate is null
	  order by m.Names asc;