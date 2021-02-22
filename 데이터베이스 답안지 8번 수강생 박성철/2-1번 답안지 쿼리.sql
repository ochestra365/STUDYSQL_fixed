use bookrentalshop;
go

select		concat (right( names,2),', ' ,left(names,1)) as '변경이름'
			,levels
			,left( addr,2) as '도시'
			,email as '이메일' from membertbl;