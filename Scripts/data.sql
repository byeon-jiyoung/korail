use korail;

show tables;

-- set foreign_key_checks = 0;

select * from train_info;
insert into train_info(ti_name) values ('KTX'),('새마을호'),('무궁화호'),('ITX-청춘');

select * from discount;
insert into discount(dis_name, dis_rate) values ('청소년드림',15),('힘내라청춘',15),('맘편한KTX',5),('다자녀행복',10);

select * from city;
load xml local infile 'd://city.xml' into table city rows identified by '<item>' (
	citycode, cityname
);

select * from city_train order by citycode;
load data local infile 'd://city_train.csv' into table city_train
character set 'utf8'
fields terminated by ',';
-- delete from city_train where citycode = 0;

select * from city_train;

select * from train;
insert into train(t_code, t_ti_no, t_start_time, t_arrive_time, t_start, t_arrive) 
values ('K001',1,'2019-09-30 11:30:00.000','2019-09-30 13:30:00.000','NAT010000','NAT014445');
insert into train(t_code, t_ti_no, t_start_time, t_arrive_time, t_start, t_arrive) 
values ('S001',2,'2019-09-30 11:30:00.000','2019-09-30 14:30:00.000','NAT010000','NAT013271');
insert into train(t_code, t_ti_no, t_start_time, t_arrive_time, t_start, t_arrive) 
values ('K002',1,'2019-09-30 14:30:00.000','2019-09-30 16:30:00.000','NAT010000','NAT013271');
insert into train(t_code, t_ti_no, t_start_time, t_arrive_time, t_start, t_arrive) 
values ('K003',1,'2019-10-7 09:40:00.000','2019-10-7 09:45:00.000','NAT010000','NAT013271');
insert into train(t_code, t_ti_no, t_start_time, t_arrive_time, t_start, t_arrive) 
values ('K004',1,'2019-10-7 14:00:00.000','2019-10-7 17:00:00.000','NAT013271','NAT014445');
insert into train(t_code, t_ti_no, t_start_time, t_arrive_time, t_start, t_arrive) 
values ('K005',1,'2019-10-7 18:00:00.000','2019-10-7 22:00:00.000','NAT013271','NAT014445');
insert into train(t_code, t_ti_no, t_start_time, t_arrive_time, t_start, t_arrive) 
values ('K006',1,'2019-10-9 18:00:00.000','2019-10-7 22:00:00.000','NAT013271','NAT014445');

select * from train_time;
/*insert into train_time(tt_start_time, t_code, price, nodeid) values ('2019-10-05 11:30:00.000','K001',20000,'NAT011668');
insert into train_time(tt_start_time, t_code, price, nodeid) values ('2019-10-05 12:30:00.000','K001',30000,'NAT012546');
insert into train_time(tt_start_time, t_code, price, nodeid) values ('2019-10-05 13:00:00.000','K001',40000,'NAT013271');
insert into train_time(tt_start_time, t_code, price, nodeid) values ('2019-10-05 14:00:00.000','K001',50000,'NAT014445');
insert into train_time(tt_start_time, t_code, price, nodeid) values ('2019-10-05 11:30:00.000','S001',15000,'NAT011668');
insert into train_time(tt_start_time, t_code, price, nodeid) values ('2019-10-05 13:00:00.000','S001',30000,'NAT013271');
insert into train_time(tt_start_time, t_code, price, nodeid) values ('2019-10-05 10:16:00.000','K001',5000,'NAT010032');*/
insert into train_time(tt_start_time, t_code, price, nodeid) values ('2019-10-7 12:00:00.000','K001',20000,'NAT011668');
insert into train_time(tt_start_time, t_code, price, nodeid) values ('2019-10-7 12:30:00.000','K001',30000,'NAT012546');
insert into train_time(tt_start_time, t_code, price, nodeid) values ('2019-10-7 13:00:00.000','K001',40000,'NAT013271');
insert into train_time(tt_start_time, t_code, price, nodeid) values ('2019-10-7 14:00:00.000','K001',50000,'NAT014445');
insert into train_time(tt_start_time, t_code, price, nodeid) values ('2019-10-7 12:10:00.000','S001',15000,'NAT011668');
insert into train_time(tt_start_time, t_code, price, nodeid) values ('2019-10-7 13:00:00.000','S001',30000,'NAT013271');
insert into train_time(tt_start_time, t_code, price, nodeid) values ('2019-10-7 09:45:00.000','K003',60000,'NAT013271');

insert into train_time(tt_start_time, t_code, price, nodeid) values ('2019-10-7 19:30:00.000','K005',60000,'NAT013271');
insert into train_time(tt_start_time, t_code, price, nodeid) values ('2019-10-7 20:30:00.000','K005',60000,'NAT011668');
insert into train_time(tt_start_time, t_code, price, nodeid) values ('2019-10-7 21:00:00.000','K005',60000,'NAT014445');

insert into train_time(tt_start_time, t_code, price, nodeid) values ('2019-10-9 19:30:00.000','K006',60000,'NAT013271');
insert into train_time(tt_start_time, t_code, price, nodeid) values ('2019-10-9 20:30:00.000','K006',60000,'NAT011668');
insert into train_time(tt_start_time, t_code, price, nodeid) values ('2019-10-9 21:00:00.000','K006',60000,'NAT014445');

select * from city_train where citycode = (select citycode from city where cityname like '%대구%');

select * from train_seat;
insert into train_seat(ts_car, ts_no, t_code) values (1,1,'K001'),(1,2,'K001'),(1,3,'K001'),(1,4,'K001');
insert into train_seat(ts_car, ts_no, t_code) values (1,5,'K001'),(1,6,'K001'),(1,7,'K001'),(1,8,'K001');
insert into train_seat(ts_car, ts_no, t_code) values (2,1,'K001'),(2,2,'K001'),(2,3,'K001'),(2,4,'K001');
insert into train_seat(ts_car, ts_no, t_code) values (2,5,'K001'),(2,6,'K001');
insert into train_seat(ts_car, ts_no, t_code) values (3,1,'K001'),(3,2,'K001'),(3,3,'K001'),(3,4,'K001');
insert into train_seat(ts_car, ts_no, t_code) values (3,5,'K001');
insert into train_seat(ts_car, ts_no, t_code) values (4,1,'K001'),(4,2,'K001'),(4,3,'K001'),(4,4,'K001');

insert into train_seat(ts_car, ts_no, t_code) values (1,1,'S001'),(1,2,'S001'),(1,3,'S001'),(1,4,'S001');
insert into train_seat(ts_car, ts_no, t_code) values (2,1,'S001'),(2,2,'S001'),(2,3,'S001'),(2,4,'S001');
insert into train_seat(ts_car, ts_no, t_code) values (3,1,'S001'),(3,2,'S001'),(3,3,'S001'),(3,4,'S001');
insert into train_seat(ts_car, ts_no, t_code) values (4,1,'S001'),(4,2,'S001'),(4,3,'S001'),(4,4,'S001');

insert into train_seat(ts_car, ts_no, t_code) values (1,1,'K003'),(1,2,'K003'),(1,3,'K003'),(1,4,'K003');
insert into train_seat(ts_car, ts_no, t_code) values (2,1,'K003'),(2,2,'K003'),(2,3,'K003'),(2,4,'K003');
insert into train_seat(ts_car, ts_no, t_code) values (3,1,'K003'),(3,2,'K003'),(3,3,'K003'),(3,4,'K003');
insert into train_seat(ts_car, ts_no, t_code) values (4,1,'K003'),(4,2,'K003'),(4,3,'K003'),(4,4,'K003');

insert into train_seat(ts_car, ts_no, t_code) values (1,1,'K006'),(1,2,'K006'),(1,3,'K006'),(1,4,'K006');
insert into train_seat(ts_car, ts_no, t_code) values (1,5,'K006'),(1,6,'K006'),(1,7,'K006'),(1,8,'K006');
insert into train_seat(ts_car, ts_no, t_code) values (2,1,'K006'),(2,2,'K006'),(2,3,'K006'),(2,4,'K006');
insert into train_seat(ts_car, ts_no, t_code) values (2,5,'K006'),(2,6,'K006');
insert into train_seat(ts_car, ts_no, t_code) values (3,1,'K006'),(3,2,'K006'),(3,3,'K006'),(3,4,'K006');
insert into train_seat(ts_car, ts_no, t_code) values (3,5,'K006');
insert into train_seat(ts_car, ts_no, t_code) values (4,1,'K006'),(4,2,'K006'),(4,3,'K006'),(4,4,'K006');


select * from city_train where nodeid = 'NAT013271';
select nodeid from city_train where nodename like '%대전%';


select * from member;
insert into member values ('test','test',1234,'변지영','1993-01-29','01020544177','test@test.com','대구','아파트',0,now(),false);

select * from reservation;
insert into reservation(res_no, mem_id, res_date, tt_no, ts_car, ts_no, res_people) values (1,'test',now(),1,1,4,3);
