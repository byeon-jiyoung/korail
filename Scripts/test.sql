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


select citycode from city where cityname = '대구광역시';






-- test
select citycode from city where cityname = '대구광역시';
select citycode from city where cityname like '%대구%';

select * from city_train where citycode = 22;

select nodeid, nodename, ct.citycode, cityname from city_train ct join city c on ct.citycode = c.citycode order by c.citycode;

select * from price p join city_train ct on p.nodeid_s = ct.nodeid or p.nodeid_a = ct.nodeid;

select * from price p join city_train ct on p.nodeid_s = ct.nodeid;
select p.p_no, p.price, p.nodeid_s as 'startCode', ct.nodename as '출발역', ct.citycode from price p join city_train ct on p.nodeid_s = ct.nodeid;

select * from price p join city_train ct on p.nodeid_a = ct.nodeid;
select p.p_no, p.price, p.nodeid_a as 'arrvieCode', ct.nodename as '도착역', ct.citycode from price p join city_train ct on p.nodeid_a = ct.nodeid;

select startStation.p_no , startStation.price, startStation.nodename '출발역', arriveStation.nodename '도착역'
from 
	(select p.p_no, p.price, p.nodeid_s, ct.nodename, ct.citycode from price p join city_train ct on p.nodeid_s = ct.nodeid) startStation
join
	(select p.p_no, p.price, p.nodeid_a, ct.nodename, ct.citycode from price p join city_train ct on p.nodeid_a = ct.nodeid) arriveStation
on 
	startStation.p_no = arriveStation.p_no;