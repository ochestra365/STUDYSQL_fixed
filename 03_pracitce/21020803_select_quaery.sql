use sqlDB;
go

--이름이 김경호인 사람 조회
select *from userTbl
 where userName='김경호';

 --1970년 이후 출생이고 키 182 이상인 사람 아이디, 이름만 조회
 select userID, userName, height
 from userTbl
 where birthYear>=1970
 and height >=182;


 --1970년 이후 출생이거나 키가 182이상이거나 인 사람들 모두
 select userID, userName, height
 from userTbl
 where birthYear>=1970
 or height >=182;

 --키가 180~183인 사람만 조회
 select userID, userName, height
 from userTbl
 where height >=180
 and height<=183;

 --비트윈 구문, between~and
 select userID, userName, height
 from userTbl
 where height between 180 and 183;

 --지역이 경남, 전남, 경북
  select userID, userName, addr
 from userTbl
 where addr='경남' or addr = '전남' or addr='경북';


 select userID, userName, addr
 from userTbl
 where addr in ('경남', '전남', '경북');

 --like
 select userID, userName, addr
 from userTbl
 where userName like '_종신';

  select userID, userName, addr
 from userTbl
 where userName like '김%';

 --subquery
 select userName, height
	from userTbl
where height > 
(
	select height from userTbl where userName='김경호'
);
--서브쿼리에서 컬럼 설정(2개 이상)을 잘못할 경우 에러가 발생한다. 또한 값이 두 개가 나오면 에러가 발생한다.

 select userName, height
	from userTbl
where height > 177;

 select userName, height
	from userTbl
where height in
(
	select height from userTbl where addr='경남'
);

--any는 둘 중의 하나를 만족하면 되고, all은 조건 모두를 만족해야 한다. some은 any와 동일한 의미로 사용된다.

--order by 정렬(쇼핑몰에서 가장 많이 확인할 수 있다.)
select userName, mDate
	from userTbl
	order by mDate desc; --asc오름차순, desc내림차순

	select *
	from userTbl
	order by userID desc; --asc오름차순, desc내림차순

--distinct
select distinct addr
	from userTbl;

select top(5)*
	from userTbl
order by mDate desc;

--offset 앞선 갯수만큼 뛰어넘은 후 조회
select userID, userName, birthYear
	from userTbl
order by birthYear
offset 4 rows;

--복사(전부 가져와서 복사하겠다.--> buyTbl2를 만들어서 원본에 있는 것을 복사해서 넣겠다. 단 PK가 없다. 그것이 특징이다.)
select * into buyTbl2 from buyTbl;
select userID, prodName into buyTbl3 from buyTbl;--필요한 필드 2개만 만들어서 넣겠다. into에 들어가는 것은 원래 있는 테이블에 쓸 수 없다.

--GROUP BY
select * from buyTbl;

select userID, amount
	from buyTbl
order by userID;

select userID as '사용자 ID', sum(amount) as '구매합계'
	from buyTbl
group by userID;

--MIN, MAX
select min(height) as '최소키'
	from userTbl;

select max(height) as '최대키'
	from userTbl;

-- 셀렉트는 표현할 속성을 드러내는 것, 프롬은 테이블, 그 아래는 나타내고자 하는 숨겨진 속성들을 기입하는 것이다. as를 통해 나타내고자 하는 속성 이름을 변경할 수 있다.
select userID, min(height) as '최소키',max(height) as '최대키'
	from userTbl
	group by userID;

select userID, userName
	from userTbl
	where height = (select min(height) from userTbl)
	or height = (select max(height) from userTbl);

--총 데이터 개수
select count(*) as '회원수' from userTbl;
select count(*) as '구매내역수' from buyTbl;

--잘못된 필터링
select userID, sum(price*amount) as '전체 구매금액'
	from buyTbl
	--where sum(price*amount) >1000
	group by userID
	having sum(price*amount) >1000
	order by sum(price*amount) desc;

--rollup, cube
select num, groupName, sum(price*amount) as '구매금액'
from buyTbl
group by rollup (groupName, num);

--userID, groupName 가지고 cube 다차원 합계
select userID, groupName, sum(price*amount) as '구매금액'
from buyTbl
group by cube (groupName, userID);

--cte
select userID, sum(price*amount) as 'total'
	from buyTbl
group by userID
order by sum(price*amount) desc;
--한 쿼리문 안에서 업무의 효율성을 높인다. (서브쿼리의 작성을 최소화)->C#에서 메서드를 만드는 것과 같다.
with cte_tmp(userID, total)
as
(
	select userID, sum(price*amount) as' total'
	from buyTbl
	group by userID
)
select*from cte_tmp order by total desc;
--update
select*from testTbl1

update testTbl1
set userName='박성철',
	age=30,
where id=6;