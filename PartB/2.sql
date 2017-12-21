drop table salary5;
set serveroutput on;
create table salary5 (ssn varchar(20), deptNo varchar(20), pay varchar(20), primary key(ssn));
insert into salary5 values('S01', 'D01', 1000);
insert into salary5 values('S02', 'D01', 2000);
insert into salary5 values('S03', 'D02', 3000);
insert into salary5 values('S04', 'D01', 4000);
insert into salary5 values('S05', 'D03', 5000);
insert into salary5 values('S06', 'D04', 6000);
insert into salary5 values('S07', 'D04', 7000);

DECLARE

cursor cc1 is
select * from salary5;
v_cc1 cc1%rowtype;

BEGIN

update salary5 set pay = pay * 1.15 where deptNo = 'D01';

open cc1;
loop
fetch cc1 into v_cc1;
exit when cc1%notfound;
dbms_output.put_line('SSN: '|| v_cc1.ssn||' Department Number: ' || v_cc1.deptNo || ' Pay: '|| v_cc1.pay);
end loop;
close cc1;


dbms_output.put_line('Updated Row count: ' || sql%rowcount);


end;
/