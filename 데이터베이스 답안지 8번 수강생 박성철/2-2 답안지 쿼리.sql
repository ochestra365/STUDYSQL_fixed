use bookrentalshop;
go
select		idx
			,concat ('���� : ', Names) as �̸�
			,concat ('���� > ', Author) as �̸�
			,ReleaseDate as '������'
			,ISBN
			,Price  as '����'
from bookstbl
order by idx desc;

 