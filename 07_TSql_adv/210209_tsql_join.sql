select*from userTbl;
select*from buyTbl;

select*from userTbl where userID='JYP';
select*from buyTbl where userID='JYP';

select*from buyTbl where userID='BBK'

--inner join
select*
	from buyTbl
	inner join userTbl
	on buyTbl.userID=userTbl.userID--PK키와 FK키를 이용하면 비교가 쉽다.
where buyTbl.userID='JYP';