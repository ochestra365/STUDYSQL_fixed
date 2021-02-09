use tempdb;
select * from userTBL_practice where Nam = '김경호';
select * from userTBL_practice;
go
select userID, Nam from userTBL_practice where birthyear>=1970 and height >=182;
--원하는 속성을 출력한다. , 해당 테이블에서, 조건은 출생연도와 키
select userID, Nam from userTBL_practice where birthyear>=1970 or height>=182;
--타이핑 실수가 출력 시 가장 문제가 된다.
go
select Nam, height from userTBL_practice where height>=180 and height <=183;
select nam, height from userTBL_practice where height between 180 and 183;
--같은 겨로가
go
select nam, addr from userTBL_practice where addr='경남' or addr='전남' or addr='경북';
select nam, addr from userTBL_practice where addr in('경남','전남','경북');
select nam, height from userTBL_practice where nam like '김%';
select nam, height from userTBL_practice where nam like '_종신';
go
select nam, height from userTBL_practice where height > 177;
select nam, height from userTBL_practice where height > ( select height from userTBL_practice where nam='경호');
select  nam, height from userTBL_practice where height >=(select height from userTBL_practice where addr='경남');
--where height >=(select height from userTBL_practice where addr='경남');두개의 값을 뱉어내서 오류가 발생함.
select nam, height from userTBL_practice where height >= any(select height from userTBL_practice where addr='경남');
select nam, height from userTBL_practice where height >= all(select height from userTBL_practice where addr='경남');
--합집합 교집합 개념, any는 합집합, all은 교집합--where절이후 결과값이 2개가 도출되는 데, 이 도출값을 모두 적용할 것이냐? 아님 선택해서 도출할 것이냐 요런 개념.
go
select nam, height from userTBL_practice where height =any (select height from userTBL_practice where addr='경남');
--정확히 결과값이 170, 173인 사람만 출력됨. 이는=any 서브쿼리는 in서브쿼리와 같음.
go
select nam, mdate from userTBL_practice order by mdate;
select nam, mdate from userTBL_practice order by mdate desc;--내림차순
select nam, mdate from userTBL_practice order by mdate asc;--오름차순
go
select distinct addr from userTBL_practice;--중복값을 삭제한다. 
--즉, 셀렉트 값 뒤에 바로 써주는 것들은 검색의 조건을 설정하는 것이다. top()은 검색결과의 몇번째까지 나타낼 것인가를 드러낸다.
--top(0.1) percent는 상위 건수의 0.1%만 검색하겠다는 의미이다. 또한 top(%) percent with ties는 N%가 넘더라도 출력하는 것을 말한다.
--샘플링 데이터의 몇 퍼센트를 출력할 것이냐를 알아보는 구문이다.
go
