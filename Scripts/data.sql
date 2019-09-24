use korail;

show tables;

-- set foreign_key_checks = 0;

select * from train_info;
insert into train_info(ti_name) values ('KTX'),('새마을호'),('무궁화호'),('ITX-청춘');

select * from city;
load xml local infile 'd://city.xml' into table city rows identified by '<item>' (
	citycode, cityname
);

select * from city_train order by citycode;
load data local infile 'd://city_train.csv' into table city_train
character set 'utf8'
fields terminated by ',';

select * from price;
insert into price(price, nodeid_s, nodeid_a) values (43500,'NAT010000','NAT013271');
insert into price(price, nodeid_s, nodeid_a) values (23700,'NAT010000','NAT011668');


select * from train;
insert into train(t_code, t_ti_no, t_star_time, t_arrive_time, t_start, t_arrive) 
values ('K001',1,'2019-09-30 11:30:00.000','2019-09-30 13:30:00.000','NAT010000','NAT013271');

select * from train_time;
insert into train_time(tt_start_time, t_code, p_no) values ('2019-09-30 11:30:00.000','K001',1);

select * from city_train where citycode = (select citycode from city where cityname like '%대구%');

select * from train_seat;
insert into train_seat(ts_car, ts_no, t_code) values (1,1,'K001'),(1,2,'K001'),(1,3,'K001'),(1,4,'K001');


select nodename from city_train where nodeid = (select t.t_start from train t join train_time tt on t.t_code = tt.t_code);
select * from city_train where nodeid = 'NAT013271';
select nodeid from city_train where nodename like '%대전%';


select * from member;
insert into member values ('test','test','변지영','1993-01-29','01020544177','대구','아파트',0,now(),false);

select * from reservation;
insert into reservation(mem_id, res_date, tt_no_s, tt_no_a, ts_no, ts_car) values ('test',now(),1,1,1,4);

select price from price where p_no = (
select p_no from reservation r join train_time tt on r.tt_no_s = tt.tt_no);

select * from price where nodeid_a in (select nodeid from city_train where nodename like '%대전%');

