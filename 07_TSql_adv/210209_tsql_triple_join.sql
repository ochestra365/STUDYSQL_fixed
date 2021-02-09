/*select*from stdTBL;
select*from clubTBL;
select*from clubRegTBL;
*/

--inner join 약식
select s.id, s.stdName, c.clubName, c.buildingNumber
	from stdTBl as s,
inner join clubRegTBL as r
	on s.id=r.std_id
inner join clubTbl as c
	on r.club_id=c.id
	;--inner table이기 떄문에 쪼인만 제대로 하면 결과는 테이블 위치 상관없이 잘 나오게 된다.