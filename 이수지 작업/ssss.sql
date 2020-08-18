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



create or replace view vwmemberinfo
as
select m.* , t.regdate as teamregdate, team.name as teamname, mt.backnumber, mt.height, mt.position_seq, mt.weight, p.position from tblmember m inner join tbltransfer t on m.seq = t.member_seq 
    inner join tblmember_team mt on t.seq = mt.transfer_seq
        inner join tblteam team on t.team_seq = team.seq
            inner join tblposition p on p.seq = mt.position_seq ;

select * from vwmemberinfo;        
