use bookrentalshop;
go

--1-1번 답안지 쿼리
select lower(email), mobile, names, addr 
from bookrentalshop.dbo.membertbl
order by Names desc;

--1-2번 답안지 쿼리
select names, author, releasedate,price
	from bookrentalshop.dbo.bookstbl
--2-1번 답안지 쿼리
select		concat (right( names,2),', ' ,left(names,1)) as '변경이름'
			,levels
			,left( addr,2) as '도시'
			,email as '이메일' from membertbl;
--2-2번 답안지 쿼리
use bookrentalshop;
go
select		idx
			,concat ('제목 : ', Names) as 이름
			,concat ('저자 > ', Author) as 이름
			,ReleaseDate as '출판일'
			,ISBN
			,Price  as '가격'
from bookstbl
order by idx desc;
--3-1번 답안지 쿼리
select b.Idx as '번호'
	  ,d.Division as '장르번호'
	  ,d.Names as '장르'
	  ,b.Names as '책제목'
	  ,b.Author as '저자'
		from bookstbl as b
	inner join divtbl as d
	on b.Division=d.Division
	where d.Division='B002';
--3-2번 답안지 쿼리.
select m.Names
      ,m.Levels
	  ,m.addr
	  ,r.rentalDate
	  from membertbl as m
      left outer join rentaltbl as r
	  on m.Idx=r.memberIdx
	  where r.rentalDate is null
	  order by m.Names asc;
--4-1번 답안지 쿼리
insert into divtbl values ('I002', '자기개발서');
--4-2번 답안지 쿼리
update membertbl set addr = '부산시 해운대구' where Names = '성명건';
update membertbl set Mobile = '010-6683-7732' where Names = '성명건';
--5번 답안지 쿼리
select	d.Names
		,sum(b.Price) as '총 합계금액'
		from bookstbl as b 
		right outer join divtbl as d
		on b.division=d.division
		group by b.division, d.Names;
--5번 문항은 null값의 합계가 뜨지 않는데, 순서대로 문제를 풀지 않아서 쿼리 계산이 안 돼는 건지
--아니면 제가 쿼리 문항을 잘 못 쓴 건지 모르겠습니다.
--일단 다 써서 재검토 하려면 데이터베이스가 중복 처리해서 무결성이 침해될 까봐 해당답안지를 냅니다
--고생많으셨습니다.