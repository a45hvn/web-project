select hometeam_seq, sum(case when rs.homegoal-rs.awaygoal > 0 then '3'
    when  rs.homegoal-rs.awaygoal < 0 then '0'
    when rs.homegoal-rs.awaygoal = 0 then '1'
    end) as rs From tblleagueresult rs inner join tblleaguegame game on game.seq=rs.leaguegame_seq group by game.HOMETeam_SEQ;
    
    
    select hometeam_seq, sum(case when rs.homegoal-rs.awaygoal > 0 then '3'
    when  rs.homegoal-rs.awaygoal < 0 then '0'
    when rs.homegoal-rs.awaygoal = 0 then '1'
    end) as rs From tblleagueresult rs inner join tblleaguegame game on game.seq=rs.leaguegame_seq group by hometeam_seq;
    
select * from tblcomment;
select * from tblteamentry;

select tblcomment.*, (select name from tblMember where seq = tblcomment.member_seq) as name from tblcomment where board_seq = 1;



---awayteam
select awayteam_seq, sum(case when rs.awaygoal-rs.homegoal > 0 then '3'
    when  rs.awaygoal-rs.homegoal < 0 then '0'
    when rs.awaygoal-rs.homegoal = 0 then '1'
    end) as rs From tblleagueresult rs inner join tblleaguegame game on game.seq=rs.leaguegame_seq group by awayteam_seq;
    
    

select * from tblmember;

update tblmember set image = 'player1.jgp' where seq = 1;

update tblmember set image = 'player2.jgp' where seq = 2;

commit;

select * from vwmemberinfo where seq = 2302;
select * from tblmember where seq = 3021;
---멤버 정보를 조회하는 뷰-----------------------------------------------------------------
create or replace view vwmemberinfo
as
select
    m.* , t.regdate as teamregdate,team.seq as team_seq ,team.name as teamname, mt.backnumber, mt.height, mt.position_seq, mt.weight, p.position
from tblmember m
    left outer join tbltransfer t on m.seq = t.member_seq 
        left outer join tblmember_team mt on t.seq = mt.transfer_seq
            left outer join tblteam team on t.team_seq = team.seq
                left outer join tblposition p on p.seq = mt.position_seq order by m.seq;
-----------------------------------------------------------------------------------------
----이적 내역 데이터 보는 뷰
create or replace view vwtransfer
as
select
    te.name as team , t.regdate , t.completedate , 
    case
        when t.state = 1 then '이적완료'
    end as state
    , m.seq ,m.name
from tblmember m
    left outer join tbltransfer t on m.seq = t.member_seq 
        left outer join tblmember_team mt on t.seq = mt.transfer_seq
            left outer join tblteam te on t.team_seq = te.seq
                left outer join tblposition p on p.seq = mt.position_seq;

select * from vwtransfer where seq = 1;
select * from tblmember where seq = 1;
-----------------------------------------------------------------------

     
 update tblmember set image = 'player1.jpg' where seq=2302;
 update tblmember set id='han' where seq=2302;
 update tblmember set pw = 'han' where seq=2302;
     
commit;

select * from tblmember where seq = 2302;

select * from vwmemberinfo;        

-- 회원 별로 경기일정 보는 쿼리(홈팀일 때 경기)
select rownum, lg.seq, lg.gamedate, gr.address, (select name from tblteam where seq = lg.awayteam_seq) as awayname 
  from TBLLEAGUEGAME lg   
    inner join tblteamentry te on te.seq = lg.hometeam_seq
        inner join tblteam t on t.seq = te.team_seq
            left join tbltransfer ts on ts.team_seq = t.seq
                inner join tblmember m on m.seq = ts.member_seq 
                    inner join TBLMEMBER_TEAM mt on ts.seq = mt.transfer_Seq
                        inner join TBLPLAYERENTRY pl on pl.member_team_seq = mt.seq 
                            inner join tblground gr on gr.seq = lg.ground_seq                                 
                                where pl.league_seq=2 and lg.league_seq =2 and m.seq=2323;

-- 회원 별로 경기일정 보는 쿼리(어웨이팀일 때 경기)
select rownum, lg.seq, lg.gamedate, gr.address, (select name from tblteam where seq = lg.hometeam_seq) as hometeamname 
  from TBLLEAGUEGAME lg   
    inner join tblteamentry te on te.seq = lg.awayteam_seq
        inner join tblteam t on t.seq = te.team_seq
            left join tbltransfer ts on ts.team_seq = t.seq
                inner join tblmember m on m.seq = ts.member_seq 
                    inner join TBLMEMBER_TEAM mt on ts.seq = mt.transfer_Seq
                        inner join TBLPLAYERENTRY pl on pl.member_team_seq = mt.seq 
                            inner join tblground gr on gr.seq = lg.ground_seq                                 
                                where pl.league_seq=3 and lg.league_seq =3 and m.seq=2323;                                
                        
                                
select * from tblleague;
select * from tblleaguegame;
                                
                
--구단에 속한 선수를 보는 쿼리
select * from tblmember_team mt 
inner join tbltransfer ts on mt.transfer_seq = ts.seq 
where team_seq =59;

select * from tblmember where seq = 2323;
                     
                     
select * from teamlist2;
--못씀
select count(*) from TBLPERSONALLEAGUERECORD pr 
left join TBLLEAGUEGAME lg on lg.seq = pr.leaguegame_seq
inner join TBLPLAYERENTRY pl on pl.seq = pr.playerentry_seq
inner join TBLMEMBER_TEAM mt on mt.seq = pl.member_team_seq
inner join TBLTRANSFER ts on ts.seq = mt.transfer_seq
inner join TBLMEMBER m on m.seq = ts.member_seq;





select * from TBLPERSONALLEAGUERECORd order by seq;

select pl.seq from TBLPLAYERENTRY pl inner join tblmember_team mt on pl.member_team_seq = mt.seq inner join tbltransfer ts on mt.transfer_seq = ts.seq inner join tblmember m on m.seq = ts.member_seq where m.seq = 2092;

update TBLPERSONALLEAGUERECORd set playerentry_seq =() where seq = 1;

(select pl.seq from TBLPLAYERENTRY pl inner join tblmember_team mt on pl.member_team_seq = mt.seq inner join tbltransfer ts on mt.transfer_seq = ts.seq inner join tblmember m on m.seq = ts.member_seq where m.seq = 926);

update TBLPERSONALLEAGUERECORd set playerentry_seq=(select pl.seq from TBLPLAYERENTRY pl inner join tblmember_team mt on pl.member_team_seq = mt.seq inner join tbltransfer ts on mt.transfer_seq = ts.seq inner join tblmember m on m.seq = ts.member_seq where m.seq = 2029) where seq = 1;

commit;
rollback;

select * from TBLLEAGUEGAME;




select * from tblmember m inner join tbltransfer ts on m.seq = ts.member_seq
    inner join tblmember_team mt on ts.seq = mt.transfer_seq 
        inner join tblplayerentry pl on mt.seq = pl.member_team_seq;
    
select count(*) from TBLLEAGUEGAME lg inner join TBLLEAGUE l on l.seq = lg.league_seq
     inner join TBLPLAYERENTRY pl 
        on l.seq = pl.league_Seq 
            inner join TBLMEMBER_TEAM mt 
                on mt.seq = pl.member_team_seq
                    inner join TBLTRANSFER ts
                        on ts.seq = mt.transfer_seq
                            inner join TBLMEMBER m
                                on m.seq = ts.member_seq;
                                
select count(*) from TBLPERSONALLEAGUERECORD;
                                        
select count(*) from TBLPERSONALLEAGUERECORD where PLAYERENTRY_SEQ = 1;
    

create table tblfriends(
   seq number primary key,
   FOLLOW__MEMBER_SEQ number not null,
   FOLLOWER__MEMBER_SEQ number not null   
); 
commit;

--나를 팔로우 하는 친구(follow)
select f.seq, f.follow__member_seq as me_seq , f.follower__member_seq as follower_seq, (select name from tblmember where seq = f.follower__member_seq) as followerName ,(select image from tblmember where seq = f.follower__member_seq) as followerImage from tblfriends f inner join tblmember m on f.follow__member_seq = m.seq order by f.follow__member_seq;

--내가 팔로우 하는 친구(follower)
select f.seq, f.follow__member_seq as following_seq, f.follower__member_seq as me_seq, (select name from tblmember where seq = f.follow__member_seq) as followingName, (select image from tblmember where seq = f.follow__member_seq) as followingImage from tblfriends f inner join tblmember m on f.follower__member_seq = m.seq;


