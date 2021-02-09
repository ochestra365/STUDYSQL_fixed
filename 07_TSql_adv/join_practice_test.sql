--테이블3개 outer join
select*
	from StdTBl as s
	left outer join ClubRegTbl as r
	on s.id=r.std_id
	left outer join ClubTbl as c
	on r.club_id=c.id;
	--left)기준 테이블에 존재하지 않는 값들까지 모두 표현할 것이다.
	--right)기준이 아닌 테이블에 존재하지 않는 값들까지 모두 표현할 것이다.
	--full)기준 테이블과 기준이 아닌 테이블에 존재하지 않는 값들까지 모두 표현할 것이다.

select*
	from StdTBl as s
	left outer join ClubRegTbl as r
	on s.id=r.std_id

select*
	from StdTBl as s
	right outer join ClubRegTbl as r
	on s.id=r.std_id
	--데이터베이스 다이어그램이랑 같이 보면서 이해해야 쉽게 이해할 수 있따.