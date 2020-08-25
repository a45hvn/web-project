
select * from tblfriends where follow__member_seq = 2431;

insert into tblfriends values(friends_seq.nextVal,2431,2113);

commit;

select * from tblfriends where follower__member_seq = 2431;
delete from tblfriends where follower__member_seq = 2431 and follow__member_seq =2302;


select * from tblmember where seq = 2431;

select * from tblmember where seq = 2302;

rollback;
commit;

-- 가져올 것 
-- 시간, 리그게임_seq, 팀이름, 선수이름, event

select bc.time, lg.seq as leagueGame_seq, t.name as teamName, m.name as playerName, bca.event from tblbroadcast bc 
inner join tblbroadcastact bca on bc.broadcastact_seq = bca.seq 
    inner join TBLPLAYERENTRY pl on pl.seq = bc.playerentry_seq 
        inner join TBLLEAGUEGAME lg on lg.seq = bc.leaguegame_seq
            inner join TBLMEMBER_TEAM mt on mt.seq = pl.member_team_seq
                inner join TBLTRANSFER ts on ts.seq = mt.transfer_seq
                    inner join TBLMEMBER m on m.seq = ts.member_seq
                        inner join tblteam t on t.seq = ts.team_seq order by bc.leaguegame_seq;

select * from tblbroadcast order by leaguegame_seq, time;
 
commit; 

select * from tblteam where name = '안날';


select * from tblground;

select * from ranking;

select * from tblbroadcast;


select * from player;
select * from TBLPERSONALLEAGUERECORD;
--------------------------------------------개인기록 합 뷰
create or replace view vwsumpersonalrecord
as
select sum(goal) as goal ,sum(tackle) as tackle, sum(save) as save, sum(yellowcard) as yellowcard, sum(foul) as foul, playerentry_seq from TBLPERSONALLEAGUERECORD GROUP by playerentry_seq;
----------------------------------------------------------
--------------------------------------------개인기록 합 뷰 2
create or replace view vwsumpersonalrecord2
as
select sum(goal+tackle+save+yellowcard+foul)as sumrecord, playerentry_seq from TBLPERSONALLEAGUERECORD GROUP by playerentry_seq;
----------------------------------------------------------

---------------------------개인기록 랭킹 뷰-----------------
select vw.sumrecord, rank() OVER(order by vw.sumrecord desc), m.seq from vwsumpersonalrecord2 vw
inner join tblplayerentry pl on vw.playerentry_seq = pl.seq 
    inner join TBLMEMBER_TEAM mt on pl.member_team_seq = mt.seq
        inner join tbltransfer tr on mt.transfer_seq = tr.seq
            inner join tblmember m on tr.member_seq = m.seq where pl.league_seq =3;

select m.name,m.image, mt.height,mt.weight from tblmember m 
inner join tbltransfer ts on m.seq = ts.member_seq 
    inner join tblmember_team mt on ts.seq = mt.transfer_seq where m.name = '이혁혼';
    
update tblmember_team SET height =? ,weight=? where transfer_seq = (select seq from tbltransfer where member_seq = ?);

select * from tblmember order by seq desc;
select seq from tbltransfer where member_seq = 288;
select * from tblmember_team where transfer_seq = 288;

insert into tblmember VALUES(3002,'테스트','id','pw','010-2222-2222', to_date('2020-01-10','yyyy-mm-dd'), '서울시 서초구', DEFAULT, '6.png',1 );
commit;
select * from tbltransfer;

select * from vwmemberinfo;


--문자중계 일정
--가져올 데이터 번호, 리그이름, 시간, 장소, 경기, 이긴팀
create or replace view vwbroadcastschedule
as
select l.name as league, lg.gamedate as gamedate, g.name as ground, lg.seq as seq,
(select name from tblteam t inner join tblteamentry te on t.seq = te.team_seq where te.seq = lg.hometeam_seq) as hometeam, 
(select name from tblteam t inner join tblteamentry te on t.seq = te.team_seq where te.seq = lg.awayteam_seq) as awayteam, 
lr.homegoal as homegoal, lr.awaygoal as awaygoal from tblleagueGame lg 
inner join tblleague l on l.seq = lg.league_seq 
inner join tblground g on g.seq = lg.ground_seq 
inner join TBLLEAGUERESULT lr on lr.leaguegame_seq = lg.seq;


select * from (select a.*, rownum as rnum from (select * from vwbroadcastschedule order by seq desc)a) where rnum >=1 and rnum <=100 order by seq desc;  

select * from (select a.*, rownum as rnum from (select * from vwfriendlyboard order by seq desc)a) where rnum >=%s and rnum <=%s order by seq desc;



--친선경기 일정

-- dm 
select * from tbldm where read_member_seq = 2302;
select * from tblmember where name ='한초백';

select * from tblfriends f inner join tblmember m on f.follow__member_seq = m.seq;

select f.seq, f.follow__member_seq as following_seq, f.follower__member_seq as me_seq, (select name from tblmember where seq = f.follow__member_seq) as followingName, (select image from tblmember where seq = f.follow__member_seq) as followingImage from tblfriends f inner join tblmember m on f.follower__member_seq = m.seq;

alter table tblboard add match_seq number;


select * from tblboard where category_seq = 5 order by seq;-- 907 부터 1149
select * from tblboard where category_seq = 6 order by seq;-- 1150 부터 1392

update tblboard set match_seq =  where seq = ;

select count(*) from tblmatch order by seq;
select count(*) from tblleaguegame;
select count(*) from tblteam t inner join tblteamentry te on t.seq = te.team_seq where te.seq = lg.awayteam_seq) as awayteam, lr.homegoal, lr.awaygoal from tblleagueGame lg inner join tblleague l on l.seq = lg.league_seq inner join tblground g on g.seq = lg.ground_seq inner join TBLLEAGUERESULT lr on lr.leaguegame_seq = lg.seq;
select ROWNUM as cnt, l.name as leagueName, lg.gamedate as gameDate, g.name as ground, (select name from tblteam t inner join tblteamentry te on t.seq = te.team_seq where te.seq = lg.hometeam_seq) as hometeam, (select name from tblteam t inner join tblteamentry te on t.seq = te.team_seq where te.seq = lg.awayteam_seq) as awayteam, lr.homegoal, lr.awaygoal from tblleagueGame lg inner join tblleague l on l.seq = lg.league_seq inner join tblground g on g.seq = lg.ground_seq inner join TBLLEAGUERESULT lr on lr.leaguegame_seq = lg.seq;
			

select * from (select a.*, rownum as rnum from (select * from vwfriendlyboard order by seq desc)a) where rnum >=%s and rnum <=%s