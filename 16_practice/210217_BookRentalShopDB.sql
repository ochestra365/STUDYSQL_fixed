-- 실제 회원 정보 불러오기 레벨 거꾸로, 이름순
select memberID, memberName, levels, mobile,email
	from memberTBL
where levels <> 'S'
order by levels asc, memberName asc;

--책정보
select cateidx, bookname, author, 
	   interpreter, company, price
	from booksTBL
order by price desc;

select*from cateTBL;

--시스템 함수사용 쿼리
select memberID as '회원 아이디', 
	   concat (right(memberName,2), left(membername,1)) as 이름,
	   case levels 
			when 'A' then '골드회원'
			when 'B' then '실버회원'
			when 'C' then '브론즈회원'
			when 'D' then '철회원'
			when 'S' then '관리자'
			else '비회원'
	   end as '회원레벨'
	   , 
	   mobile as 전화번호,
	   upper(email) as '이메일'
	from memberTBL
where levels <> 'S'
order by levels, memberName asc;
--아래의 함수를 사용자 정의 함수로 만들 것이다.



--사용자 정의 함수사용 쿼리

select memberID as '회원 아이디', 
	   concat (right(memberName,2), left(membername,1)) as 이름,
	   dbo.ufn_getLevel(levels)as '회원레벨',mobile ,
	   UPPER(email) as '이메일'
	from memberTBL
where levels <> 'S'
order by levels, memberName asc;

--책 정보, 시스템 함수, 포맷 함수 쿼리
select 
	 bookidx  '책 고유번호' 
	,cateidx as '카테고리'
	,concat(N'책제목>',bookname) as '책 이름'  
	,author as 작가
	,isnull(interpreter,'(역자없음)')  as '번역가'
	,company as 회사
	,format(releaseDate,'yyyy년 MM월 dd일' ) as '출판일'
	,format(price,'#,#원') as '가격'
from booksTBL;

--책정보 조인
select 
	 b.bookidx 
	--,b.cateidx
	,c.cateName
	,b.bookname
	,b.author
	,b.interpreter
	,b.company 
from booksTBL as b
inner join cateTBL as c
	on b.cateidx=c.cateidx;

-- 대여된 책의 정보 쿼리 조인
USE  BookRentalShopDB
GO

SELECT r.rentalidx
     -- ,r.memberidx
     -- ,r.bookidx
	 ,m.memberidx
	  ,b.bookname
	  ,b.author
      ,format(r.rentalDt,'yyyy-mm-dd') as '대여일'
      ,format(r.returnDt,'yyyy-mm-dd')as '반납일'
      ,r.rentalState
	  ,dbo.ufn_getstate(r.rentalState) as '대여상태'
  FROM  dbo. rentalTBl as r
  inner join booksTBL as b
	on r.bookidx=b.bookidx
  inner join membertbl as m
  on r.memberidx=m.memberidx;
GO