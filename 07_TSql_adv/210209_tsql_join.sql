select*from userTbl;
select*from buyTbl;

select*from userTbl where userID='JYP';
select*from buyTbl where userID='JYP';

select*from buyTbl where userID='BBK'

--inner join(책과는 다르게 실무스킬이 들어감)
select u.userName, u.addr,
		concat(u.mobile1,'-',left(u.mobile2,4),'-',right(u.mobile2,4)) as mobile,
		b.prodName,b.price,b.amount
	from buyTbl as b--별명 넣기
	inner join userTbl as u--별명 넣기. as를 넣는 것이 표준이다.
	on b.userID=u.userID--PK키와 FK키를 이용하면 비교가 쉽다.--여기까지가 테이블을 조인하는 과정
where b.userID='JYP';--여기까지가 조인한 테이블을 검색하는 것.
--별명을 넣는 형태로 작업을 하면 코딩량이 줄어들게 된다.