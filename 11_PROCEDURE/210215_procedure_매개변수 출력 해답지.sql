declare @pout int;
exec usp_users4 '새로운 텍스트	', @pout output;

print concat('현재 입력된 값은==>', @pout);
select @pout as '현재값';--누를 수록 값이 증가한다. 왜임?