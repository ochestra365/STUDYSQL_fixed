/*select*from stdTBL;
select*from clubTBL;
select*from clubRegTBL;
*/

--inner join 약식
select s.id, s.stdName, c.clubName, c.buildingNumber
	from stdTBl as s
inner join clubRegTBL as r
	on s.id=r.std_id
inner join clubTbl as c
	on r.club_id=c.id
	;--inner table이기 떄문에 쪼인만 제대로 하면 결과는 테이블 위치 상관없이 잘 나오게 된다.

--outer join 약식
select s.id, s.stdName, c.clubName, c.buildingNumber
	from stdTBl as s
left outer join clubRegTBL as r
	on s.id=r.std_id
left outer join clubTbl as c
	on r.club_id=c.id
	;

--userTBL/buyTBL
select u.userName, u.addr, b.prodName, b.price
	from userTbl as u
right outer join buyTbl as b
	on u.userID=b.userID;
--유저 테이블을 기준으로 구매테이블은 조인한다. 단 조건은 유저테이블의 유저ID랑 구매테이블의 유저 ID가 서로 매칭되게 해야 한다.3
--이너 조인은 내용이 일치하는 것.
--right를 기준으로하면 오른쪽이 기준, left를 기준으로 하면 왼쪽이 기준. 합집합 교집합 개념 ㅇㅇ left, right, full
--데이터 교환의 상관성을 이해하면서 교집합 합집합을 따져야 이것을 이해할 수 있따.

select*from buyTbl