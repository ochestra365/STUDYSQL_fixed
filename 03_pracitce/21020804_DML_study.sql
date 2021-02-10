--testTBL insert
use sqlDB;
go

--select among DML
select*from testTBL1;

--Insert among DML(SQL for modificating data)
insert into testTBL1 values(1, '홍길동', 25);--값을 넣는 것.
insert into testTBL1(id, userName) values(2, '박성철')--행과 값을 넣는 것.
insert into testTBL1(age, id) values(30,4);
--프라이머리키를 넣지 않고는 적용시킬 수 없다. pk값이 없이는 DML insert를 시행할 수 없다.

use tempdb;--데이터베이스를 만들기 전에 임시로 사용하여 디버깅 잡는 것이다.
create table testtb12
(id int identity,--int를 자동증가로 선언하겠다.
userName nchar(3),
age int,
nation nchar(4) default '대한민국');
go
insert into testtb12 values('지민',25,default);

exec sp_help 'testtb12';--작성된 테이블의 모든 정보를 알 수 있느 것이다.
select @@IDENTITY;
select ident_current('testtb12');--현재 테이블의 모든 정보.

select*from BikeStores.sales.order_items;--sql db에서 검색할 수 있다. 쿼리를 다른 곳에서 날려서 데이터를  다 불러 올수 있다.( 데이터베이스, 스키마명)

select*from ShopDB.dbo.memberTBl--내 데이터베이스가 아니더라도 값들을 다른 곳에 있는 데이터베이스의 정보들을 불러 올 수 있다.
--sales.order_items 테이블 복사
CREATE TABLE [sales_order_items](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[customer_id] [int] NULL,
	[order_status] [tinyint] NOT NULL,
	[order_date] [date] NOT NULL,
	[required_date] [date] NOT NULL,
	[shipped_date] [date] NULL,
	[store_id] [int] NOT NULL,
	[staff_id] [int] NOT NULL
	);

	insert into sales_order_items
	select*from BikeStores.sales.order_items;


	select*from sales_order_items;
	--update
select*from testTbl1

update testTbl1
set userName='나이',
	age=30,
where id=6;--이거 주석처리하고 날리면 모든 데이터가 갱신되는 것이다.

rollback;--게임으로 치면 임시저장 장치를 만드는 것이다.

use tempdb;
delete testtb12 where id='홍길동';
--delete절에서는 반드시 where를 써야한다. 다 살릴 수 있으니 도망가지 말아라.