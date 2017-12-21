create table boat(bid varchar(20), bname varchar(20), colour varchar(20), primary key(bid));
create table sailor(sid varchar(20), sname varchar(20), age varchar(20), rating varchar(20), primary key(sid));
create table reserves(bid varchar(20), sid varchar(20), day varchar(20), primary key(bid, sid), foreign key(bid) references boat(bid) ON DELETE CASCADE, foreign key(sid) references sailor(sid) ON DELETE CASCADE);

insert into boat values('B01', 'Slice of Life', 'White');
insert into boat values('B02', 'Jackdaw', 'Brown');
insert into boat values('B03', "Queen Anne's Revenge", 'White');

insert into sailor values('S01', 'Dexter Morgan', 35, 4.5);
insert into sailor values('S02', 'Debra Morgan', 32, 4.3);
insert into sailor values('S03', 'Edward Kenway', 38, 4.2);
insert into sailor values('S04', 'Blackbeard', 45, 4.1);

insert into reserves values('B01', 'S01', 'Monday');
insert into reserves values('B01', 'S02', 'Tuesday');
insert into reserves values('B02', 'S03', 'Monday');
insert into reserves values('B03', 'S03', 'Tuesday');
insert into reserves values('B03', 'S04', 'Wednesday');


select r.bid from reserves r, sailor s where s.sid = r.sid and s.sname =  "Edward Kenway";

select bid, sid from reserves group by sid;

select count(bid) from reserves group by sid;