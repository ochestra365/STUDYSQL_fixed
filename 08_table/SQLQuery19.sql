create view uv_stdclubTBL
as
	select s.id, s.stdName, c.clubName, c.buildingNumber
	from stdTbl as s
	inner join  clubregtbl as r
	on s.id=r.std_id
	inner join ClubTbl as c
	on r.club_id=c.id
go

select *from uv_stdclubTBL;