use bookrentalshop;
go

select		concat (right( names,2),', ' ,left(names,1)) as '�����̸�'
			,levels
			,left( addr,2) as '����'
			,email as '�̸���' from membertbl;