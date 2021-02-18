create or alter view uv_nonerentalMember
as
SELECT r.rentalidx
      --,r.memberidx
	  ,m.memberName
      --,r.bookidx
	  ,b.bookname
	  --,b.cateidx
      ,format(r.rentalDt,'yyyy-mm-dd') as rentalDT
      ,format(r.returnDt,'yyyy-mm-dd') as returnDT
      ,dbo.ufn_getState(r.rentalState) as '대여상태'
  FROM rentalTBl as r
  right outer join memberTBL as m
	on r.memberidx = m.memberidx
  left outer join booksTBL as b
    on r.bookidx=b.bookidx
  left outer join cateTBL as c
    on c.cateidx=b.cateidx
where r.rentalidx is null;

--In one query, multiple outer joins are used  between tables that are irrelevant to each other when users want to know meaningful search results.