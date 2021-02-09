use sqldb;
go

declare @myvar1 int;
declare @myvar2 smallint, @myvar3 decimal(5,2);--5는 전체사이즈를 의미하고 2는 소숫점 뒷자리 몇번째까지 표기할 것인가를 말하는 것이다.,만약 뒤에 숫자가 6이라면 이는 말이 되지 않는 것이다. 전체 사이즈에 어긋나기 때문이다.
declare @myvar4 nchar(20);

set @myvar1 =5;
set @myvar2=3;
set @myvar3=4.25;
set @myvar4='가수 이름==>';

select @myvar1;
select '값은'+cast(@myvar3 as varchar);--생략하고 값을 안 넣고 하는 것은 생략할 때만 가능하다.

select @myvar4, userName from userTbl where height>180;

declare @myvar5 tinyint;
set @myvar5=3;

select top(@myvar5) userName,height from userTbl order by height desc;
