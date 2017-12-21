create table part(pno varchar(20), pname varchar(20), colour varchar(20), primary key(pno));
create table supplier(sno varchar(20), sname varchar(20), address varchar(20), primary key(sno));
create table supply(pno varchar(20), sno varchar(20), quantity number(20), primary key(pno, sno), foreign key(pno) references part(pno) ON DELETE CASCADE, foreign key(sno) references supplier(sno) ON DELETE CASCADE);

insert into part values('P01', 'Bolt', 'Grey');
insert into part values('P02', 'Faucet', 'Golden');
insert into part values('P03', 'Chain', 'Grey');
insert into part values('P04', 'Pipe', 'Blue');
insert into part values('P05', 'Handle', 'Silver');


insert into supplier values('S01', 'Ram', 'MTK');
insert into supplier values('S02', 'Shiva', 'MVM');
insert into supplier values('S03', 'Krishna', 'HSR');
insert into supplier values('S04', 'Brahma', 'BTM');

insert into supply values('P01', 'S01', 1000);
insert into supply values('P02', 'S01', 1000);
insert into supply values('P04', 'S02', 1000);
insert into supply values('P05', 'S02', 1000);
insert into supply values('P01', 'S03', 1000);
insert into supply values('P02', 'S04', 1000);
insert into supply values('P04', 'S04', 1000);

select s.sno, su.pno from supplier s, supply su where s.sno = su.sno and s.sname = "Ram";

select s.sno, s.sname, p.pname from supplier s, supply su, part p where s.sno = su.sno and su.pno = p.pno and p.pname = 'Bolt';

delete from part where colour = 'Grey';

select * from part;

select * from supplier;

select * from supply;