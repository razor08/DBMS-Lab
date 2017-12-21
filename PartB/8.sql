drop table emp;
create table emp(ssn varchar(20), name varchar(20), deptNo varchar(20), primary key(ssn));


insert into emp values('IS044', 'Jay', 'D01');
insert into emp values('IS005', 'Aditya', 'D01');
insert into emp values('IS035', 'Divyansh', 'D02');
insert into emp values('IS043', 'Ishan', 'D03');
insert into emp values('IS061', 'Meraj', 'D01');


set serveroutput on;

create or replace trigger tri_employee1 before
insert or update on emp
for each row

DECLARE

rec varchar(20);

BEGIN

select to_char(sysdate, 'Dy') into rec from dual;

if rec='Thu' or rec='Wed'
then
dbms_output.put_line(rec);
raise_application_error(-20343, 'Not allowed to enter if day is '||rec);
end if;
end;
/

show error;

select * from emp;

update emp set name='Divyansh' where ssn='IS035';