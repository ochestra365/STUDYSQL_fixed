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

select @myvar4, userName from userTbl where height>180;--컴마를 찍어주지 않아서 값이 출력되지 않음. 컴파일러에서는 셀렉트 뒤 두 개의 객체를 하나로 인식했을 것이라서 값이 도출되지 않았을 것이다.
--변수를 꾸밀 때도 사용할 수 있다.
declare @myvar5 tinyint; --255 변수를 선언하고, @붙이고 뒤에 아무 이름이나 붙이면 된다.
set @myvar5 =3;--변수에 값을 넣고,

select top(@myvar5) userName, height from userTbl order by height desc;--결과를 출력한다.
--동적으로 내가 필요할 때마다 맞는 사이즈의 결과를 도출할 수 있다.

select @@VERSION;
--형변환함수
select avg(CONVERT(float, amount)) as 'amount' from buyTbl;--형변환 내기만 한 것. 집계함수도 시스템 함수이다.
select TRY_Convert(float, amount) as amount from buyTbl;
select AVG(convert (float,amount)) as '평균구매개수' from buyTbl;--이런 형식으로 테이블을 보면서 값을 비교해야 편하다.--형변환 값 내기.

select price, amount, price/amount as[단가/수량] from buyTbl;--sql서버에서 []를 문자열로 함. 그러나 ''로 표기하는 것이 표준이다.

--
--'1000'-->숫자로 바꾼다.
select parse('2021년 2월 9일' as date);--더 이상 문자열이 아니다. date 속성으로 바뀐 것이다. 그러나 글자를 잘 못 쓰면 데이터형식 변환을 할 수 없다.
select try_parse('2021연 2월 9일' as date);--값이 잘못 나오면 null 값이 나온다. 즉, 정보를 찾을 수 없다는 것이다. null이 나왔다는 것은 오류가 발생했다는 것을 의미한다.

select parse('123.45' as decimal(5,2));--데이터형식에 맞는 자료
select try_parse('123.45' as int);--데이터 형식에 맞지 않는 자료


--스칼라함수(단일 리턴 함수)
select getdate() as '현재날짜';
--실행하기 전에 결과가 어떤 지 보고 선택해야 함.
select year(getdate()) as '금년';
select year(getdate()) as '이번달';--자바스크립트는 +1을 해줘어야 이번 달이 나온다.
select year(getdate()) as '오늘일';

select abs(-100);
select round(3.1415,3);
select round(12314.435,-1);

select round(rand()*100,-1);

select iif(200>100, '참', '거짓');--활용 잘하면 매우 좋다.

--문자열함수
--많이 쓸 일이 없다.
select ascii('a'), ascii('A');
select char(98), char(66);
select unicode('가') as '글자코드';
select nchar(45909);

--매우 많이 쓰이는 것들.
--문자열 결합 함수
select concat('Microsoft ','SQL', ' Server ',2019);--다 붙어서 나온다. 개수를 몇 개 넣어도 상관없다. 매우 편한 코드이다. 코딩량을 줄일 수 있다.
--문자열의 시작위치 리턴
select CHARINDEX('Server', 'SQL Server 2019');--모든 프로그램 언어들은 인덱스가 0부터 시작, 그러나 이것은 데이터베이스이다. 우리가 알고 있는 일반적인 언어와 차이가 있다.
--left,right
select left('SQL Server 2019', 3), right('SQL Server 2019',4);--필요한 글자를 출력하는 것. 정말 많이 쓰는 함수이다. 데이터베이스에만 존재한다. 다른언어에는 substring이라는 함수로 존재한다.
