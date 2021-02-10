declare @i smallint, @hap bigint = 0;--1~100
set @i=0;--값을 주지 않으면 null이 된다. 디폴트값을 넣어주지 않으면 while문이 돌아가지 않는다.
while(@i<=100)
begin
	if(@i%7=0)--7의 배수
	begin
		print concat('7의 배수 : ',@i);
		set @i +=1;--몰겠다
		continue;
	end--begin, end가 너무 많아서 복잡해진다.

	set @hap +=@i;
	if(@hap>1000) break;
	set @i+=1;
end

print @hap;