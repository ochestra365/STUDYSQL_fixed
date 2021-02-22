use bookrentalshop;
go
select		idx
			,concat ('제목 : ', Names) as 이름
			,concat ('저자 > ', Author) as 이름
			,ReleaseDate as '출판일'
			,ISBN
			,Price  as '가격'
from bookstbl
order by idx desc;

 