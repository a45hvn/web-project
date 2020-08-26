----------------------------------------------------------------------------------------------------
-- teaminformation에서 쓰이는 query
----------------------------------------------------------------------------------------------------
select*from team;
create or replace view team
as
select
 team.seq seq,member.name coachname, member.image as image, coach.introduce,team.logo logo,
 team.name teamname, team.birth birth, team.slogan slogan, team.hello hello,
 teamground.name ground, teamground.address address, teamground.lat lat, teamground.lng lng,
 home.home home
from tblcoach coach
    inner join tblmember member on member.seq=coach.member_seq
     inner join tblteam team on coach.team_seq=team.seq
        inner join tblteamground teamground on team.teamground_seq=teamground.seq
            inner join tblhome home on teamground.home_seq=home.seq;
----------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------------
-- teaminformation 에서 사용되는 선수정보
----------------------------------------------------------------------------------------------------
create or replace view player
as
select
     mt.seq member_Seq, mt.backnumber backnumber, mt.height height,
     mt.weight weight, position.position position, member.name playername,
     member.image playerimage, to_char(member.birth,'yyyymmdd') birth,
     team.name teamname, to_char(transfer.completedate,'yyyymmdd') completedate
from tblmember_team mt
    inner join tbltransfer transfer on transfer.seq=mt.transfer_seq
        inner join tblmember member on transfer.member_seq=member.seq
            inner join tblteam team on team.seq=transfer.team_seq
                inner join tblposition position on position.seq = mt.position_seq
                    where transfer.state=1;
----------------------------------------------------------------------------------------------------
-- 경기결과 정리
----------------------------------------------------------------------------------------------------

create or replace view gameresult
as
select 
    result.leaguegame_seq leaguegame_seq, home.team_seq hometeam_seq, away.team_seq awayteam_seq,
    (case
        when result.homegoal-result.awaygoal > 0 then '승'
        when result.homegoal-result.awaygoal = 0 then '무'
        when result.homegoal-result.awaygoal < 0 then '패'
    end) gameresult
from tblleagueresult result
    inner join home home on result.leaguegame_seq=home.seq
        inner join away away on result.leaguegame_seq=away.seq;
        
        
create or replace view gameresult2
as
select 
    result.leaguegame_seq leaguegame_seq, home.team_seq hometeam_seq, away.team_seq awayteam_seq,
    (result.homegoal-result.awaygoal) gameresult
from tblleagueresult result
    inner join home home on result.leaguegame_seq=home.seq
        inner join away away on result.leaguegame_seq=away.seq;

        
select hometeam_seq,count(*) from gameresult where gameresult='무' group by hometeam_seq ;
-----------------------------------------------------------------------------------------------
-- 홈팀의 전적을 보여준다. -> 리그별로 조회 가능(home1,2,3)
-----------------------------------------------------------------------------------------------
create or replace view homeresult
as
select
    hometeam_seq,
    nvl((select count(*) from gameresult where gameresult='승' and r2.hometeam_seq=gameresult.hometeam_seq group by hometeam_seq),0) win,
    nvl((select count(*) from gameresult where gameresult='무' and r2.hometeam_seq=gameresult.hometeam_seq group by hometeam_seq),0) lose,
    nvl((select count(*) from gameresult where gameresult='패' and r2.hometeam_seq=gameresult.hometeam_seq group by hometeam_seq),0) drow
from gameresult2 r2 group by hometeam_seq;

-----------------------------------------------------------------------------------------------
--어웨이팀의 전적을 보여준다.-> 리그별로 조회 가능(away1,2,3)
-----------------------------------------------------------------------------------------------
create or replace view awayresult
as
select
    awayteam_seq,
    nvl((select count(*) from gameresult where gameresult='승' and r2.awayteam_seq=gameresult.awayteam_seq group by awayteam_seq),0) win,
        nvl((select count(*) from gameresult where gameresult='패' and r2.awayteam_seq=gameresult.awayteam_seq group by awayteam_seq),0) lose,
        nvl((select count(*) from gameresult where gameresult='무' and r2.awayteam_seq=gameresult.awayteam_seq group by awayteam_seq),0) drow
from gameresult2 r2 group by awayteam_seq;

-----------------------------------------------------------------------------------------------