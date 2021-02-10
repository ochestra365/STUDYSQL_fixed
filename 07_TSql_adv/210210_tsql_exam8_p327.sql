use sqlDB;
go

select b.userID, 
		u.userName,
		iif(sum(price*amount) is null,0,sum(price*amount))as '총 구매금액',--만약 총 구매금액이 null이면 0으로 표시하고 아니면 총구매금액으로 표시
		case
		 when(sum(price*amount)>=1500)then 'vvip'
		 when(sum(price*amount)>=1000)then 'vip'
		 when(sum(price*amount)>=1)then 'normal'
		 else 'ghost'
		end as '회원구분'--테이블에 존재하는 필드가 아니기 때문에 이름을 따로 설정해줘야 한다.
	from buyTbl as b--기준이 buyTbl이다. left outer join은 from을 기준으로 잡고, right outer join은 그 이외의 것을 기준으로 잡는다.
	right outer join userTbl as u--실무에서는 데이터가 들어간 것을 보지 않고 일하는 데, 더미데이터를 보고 일하다 보면 업무내용이나 데이터속성을 다 파악할 수 없다. 그럼 키가 되는 값을 추론해서 써야 한다.
	on b.userID=u.userID
group by b.userid, u.userName--그룹바이는 집계함수 이외의 것을 적어주는 것이다. 왜냐하면 영향을 안 끼치기 위해서 이다. userid는 buytbl과 usertbl두개 다 있다.
order by sum(price*amount) desc;

select*
	from userTbl;