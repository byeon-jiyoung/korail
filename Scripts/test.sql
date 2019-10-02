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

select startStation.p_no , startStation.price, startStation.nodename, startStation.nodeid, arriveStation.nodename, arriveStation.nodeid
from 
	(select p.p_no, p.price, ct.nodeid, ct.nodename, ct.citycode from price p join city_train ct on p.nodeid_s = ct.nodeid) startStation
join
	(select p.p_no, p.price, ct.nodeid, ct.nodename, ct.citycode from price p join city_train ct on p.nodeid_a = ct.nodeid) arriveStation
on 
	startStation.p_no = arriveStation.p_no;
	

select nodeid, nodename from city_train where nodename like '%서울%';



select * from train;
select * from train t join city_train ct on t.t_start = ct.nodeid;
select * from train t join city_train ct on t.t_arrive = ct.nodeid;

select startStation.t_code , startStation.t_ti_no, startStation.t_start_time, startStation.t_arrive_time, startStation.nodeid as start_nodeid, startStation.nodename as start_nodename, 
arriveStation.nodeid as arrive_nodeid, arriveStation.nodename as arrive_nodename
from	
	(select * from train t join city_train ct on t.t_start = ct.nodeid) startStation
join
	(select * from train t join city_train ct on t.t_arrive = ct.nodeid) arriveStation
on 
	startStation.t_code = arriveStation.t_code;

select * from train_time;
select * from train_time tt join price p on tt.p_no = p.p_no;

select * from train_seat;

select * from reservation where tt_no in (select tt_no from train_time tt join price p on tt.p_no = p.p_no);
select * from reservation r join member m on r.mem_id = m.mem_id join;

select * from reservation r join member m on r.mem_id = m.mem_id join train_time tt on r.tt_no = tt.tt_no;

select * from train_time tt join price p on tt.p_no = p.p_no;



select * from train_time tt join price p on tt.p_no in (
	select startStation.p_no
	from	
		(select * from price p join city_train ct on p.nodeid_s = ct.nodeid) startStation
	join
		(select * from price p join city_train ct on p.nodeid_a = ct.nodeid) arriveStation
	on 
		startStation.p_no = arriveStation.p_no
) group by tt_no;


select * from reservation;
truncate reservation;

select * from train_seat where t_code = 'K001';
update train_seat set ts_choice = 0;