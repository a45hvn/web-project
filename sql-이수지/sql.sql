select * from tblboard where category_seq=5 order by seq;


select * from tblMember;


select * from tblboard b inner join tblmember m on b.member_seq = m.seq where b.category_seq=5 order by b.seq desc;

--dm을 보는 뷰
create or replace view vwdm
as
select dm.seq, dm.content, dm.regdate, dm.read_member_seq , dm.writer_member_seq, mb.name as "read_name" , mb.image as "read_image" from tbldm dm 
    inner join tblmember mb 
        on mb.seq = dm.read_member_seq;
            
select dm.seq, dm."read_name", dm."read_image", dm.content, to_char(dm.regdate,'yyyy-mm-dd hh24:mi:ss') as regdate, dm.read_member_seq, dm.writer_member_seq, mb.name as "writer name", mb.image as "writer image"  from vwdm dm inner join tblmember mb on mb.seq = dm.writer_member_seq where read_member_Seq = 2302;
                
                
update tblmember set image = 'player2.jpg' where name = '황온형';               

commit;
                
                
select count(*) from vwmemberinfo;


select * from tblmember ;
commit;
insert into tbldm values(dm_seq.nextVal, '경기 잘봤습니다.', to_date('2020-08-17 15:14:10', 'yyyy-mm-dd hh24:mi:ss'), 2302, 147);
