select * from tblboard where category_seq=5 order by seq;


select * from tblMember;


select * from tblboard b inner join tblmember m on b.member_seq = m.seq where b.category_seq=5 order by b.seq desc;

