create table emp(ssn varchar(20), name varchar(20), deptNo varchar(20), primary key(ssn));
create table assigned_to(ssn varchar(20), projectNo varchar(20), primary key(ssn, projectNo), foreign key(ssn) references emp(ssn) ON DELETE CASCADE);
create table project(projectNo varchar(20), projectArea varchar(20),foreign key(projectNo) references assigned_to(projectNo) ON DELETE CASCADE);

insert into emp values('IS044', 'Jay', 'D01');
insert into emp values('IS005', 'Aditya', 'D01');
insert into emp values('IS035', 'Divyansh', 'D02');
insert into emp values('IS043', 'Ishan', 'D03');
insert into emp values('IS061', 'Meraj', 'D01');

insert into assigned_to values('IS044', 'P01');
insert into assigned_to values('IS034', 'P01');
insert into assigned_to values('IS043', 'P02');
insert into assigned_to values('IS035', 'P02');
insert into assigned_to values('IS061', 'P03');

insert into project values('P01', 'NLP');
insert into project values('P02', 'DIP');
insert into project values('P03', 'DBMS');

select e.ssn from emp e, project p, assigned_to a where p.projectArea = 'DBMS' and p.projectNo = a.projectNO and e.ssn = a.ssn;

select count(ssn) from emp group by deptNo;

update assigned_to set projectNo = 'P20' where ssn='IS043';

select * from assigned_to where ssn = 'IS043';
