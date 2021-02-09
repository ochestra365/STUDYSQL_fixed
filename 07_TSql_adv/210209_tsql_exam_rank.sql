use sqlDB;
go

select	dense_rank() over(partition by addr order by height desc ) as '키 큰 순위', 
		userName, addr, height
	from userTbl;
--정렬의 뒤에 키에의한 순서로 한다. 두번 째 조건을 따로 줄 수도 있다. 그런데 공동 2위 작업이 가장 무난하다.(order 대신 partition을 쓴다.)
--주소로 나누고 키로 순서를 매긴다.(내림차순으로)--부분별로 나누는 것은 파티션, 순서매기는 것은 키
--리포트에서 많이 쓰인다.

--PIVOT
create table pivotTBL
(
	userName nvarchar(10),
	season nvarchar(2),
	amount int
);
go
insert into pivotTBL values('김범수','겨울',10),
						   ('윤종신','여름',15),
						   ('김범수','가을',25),
						   ('김범수','봄',3),
						   ('김범수','봄',37),
						   ('윤종신','겨울',40),
						   ('김범수','여름',14),
						   ('김범수','겨울',22),
						   ('윤종신','여름',64)
insert into pivotTBL values('성시경','여름',30);
select * from pivotTBL

select * from pivotTBL
	pivot(sum(amount)
		for season
		in ([봄],[여름],[가을],[겨울])) as resultPivot;
		--세로로 나온 데이터를 통계를 내면서 가로로 나오게 하는 것이다.

--json
select userID, userName, height, addr
	from userTbl
	where height >=180
	for json auto;