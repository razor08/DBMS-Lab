create table part(pno varchar(20), pname varchar(20), colour varchar(20), primary key(pno));
create table warehouse(wno varchar(20), wname varchar(20), city varchar(20), primary key(wno));
create table shipment(pno varchar(20), wno varchar(20), quantity number(20), date varchar(20) ,primary key(pno, wno), foreign key(pno) references part(pno) ON DELETE CASCADE, foreign key(wno) references warehouse(wno) ON DELETE CASCADE);


insert into part values('P01', 'Bolt', 'Grey');
insert into part values('P02', 'Faucet', 'Golden');
insert into part values('P03', 'Chain', 'Grey');
insert into part values('P04', 'Pipe', 'Blue');
insert into part values('P05', 'Handle', 'Silver');


insert into warehouse values('W01', 'Ram', 'MTK');
insert into warehouse values('W02', 'Shiva', 'MVM');
insert into warehouse values('W03', 'Krishna', 'HSR');
insert into warehouse values('W04', 'Brahma', 'BTM');


insert into shipment values('P01', 'W01', 1000, '12-07-2017');
insert into shipment values('P02', 'W01', 1000, '12-07-2017');
insert into shipment values('P04', 'W02', 1000, '12-07-2017');
insert into shipment values('P05', 'W02', 1000, '13-07-2017');
insert into shipment values('P01', 'W03', 1000, '13-07-2017');
insert into shipment values('P02', 'W04', 1000, '14-07-2017');
insert into shipment values('P04', 'W04', 1000, '14-07-2017');

select w.wname from warehouse w, part p, shipment s where p.colour = "Grey" and s.wno = w.wno and s.pno = p.pno;

select p.pno, s.wno from shipment s, part p where s.pno = p.pno;

select count(pno) from shipment group by wno;