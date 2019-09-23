select * from notice order by no_no desc;
select * from manager;

insert into manager values ('a', password('a'));
insert into notice(no_writer, no_title, no_content) values ("a", "aaaaa", "aaaaaaaaaaaaaaaaaaaaaaaaa");

select * from notice order by no_no desc limit 6;
select count(no_no) from notice;

select * from event;
insert into event(e_writer, e_title, e_content) values ("a", "aaaaa", "aaaaaaaaaaaaaaaaaaaaaaaaa");


select * from event order by e_no desc limit 3 where e_img is not null;

select * from event order by e_no desc;
select * from event where e_img is not null order by e_no desc limit 3;