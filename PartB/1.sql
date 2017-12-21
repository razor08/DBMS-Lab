drop table branch5;
drop table account5;
drop table customer5;

set serveroutput on;

create table branch5(code varchar(20), name varchar(20), assets varchar(20), primary key(code));
create table customer5(ssn varchar(20), name varchar(20), place varchar(20), primary key(ssn));
create table account5(accno varchar(20), ssn varchar(20), code varchar(20), balance varchar(20), primary key(accno, ssn), foreign key(ssn) references customer5(ssn) ON DELETE CASCADE);

insert into branch5 values('B01', 'MTK', 20000);
insert into branch5 values('B02', 'MVM', 30000);
insert into branch5 values('B03', 'HSR', 40000);
insert into branch5 values('B04', 'BTM', 50000);

insert into customer5 values('01', 'Jay', 'MTK');
insert into customer5 values('02', 'Ishan', 'MVM');
insert into customer5 values('03', 'Aditya', 'MTK');
insert into customer5 values('04', 'Meraj', 'HSR');
insert into customer5 values('05', 'Divyansh', 'BTM');
insert into customer5 values('06', 'Akash', 'BTM');

insert into account5 values('A01', '01', 'B01', 1000);
insert into account5 values('A02', '01', 'B01', 2000);
insert into account5 values('A03', '02', 'B02', 3000);
insert into account5 values('A04', '03', 'B01', 4000);
insert into account5 values('A05', '04', 'B03', 5000);
insert into account5 values('A06', '05', 'B04', 6000);
insert into account5 values('A07', '06', 'B04', 7000);

DECLARE 
cursor cc1 is 
select * from branch5;
v_cc1 cc1%rowtype;

cursor cc2 is 
select * from customer5;
v_cc2 cc2%rowtype;

cursor cc3 is 
select * from account5;
v_cc3 cc3%rowtype;

BEGIN

open cc1;
loop
fetch cc1 into v_cc1;
exit when cc1%notfound;
dbms_output.put_line('Code: '|| v_cc1.code || ' Name: '||v_cc1.name||' Assets: '|| v_cc1.assets);
end loop;
close cc1;

open cc2;
loop
fetch cc2 into v_cc2;
exit when cc2%notfound;
dbms_output.put_line('SSN: '|| v_cc2.ssn || ' Name: '||v_cc2.name||' Place: '|| v_cc2.place);
end loop;
close cc2;

open cc3;
loop
fetch cc3 into v_cc3;
exit when cc3%notfound;
dbms_output.put_line('Accno: '|| v_cc3.accno || ' SSN: '||v_cc3.ssn||' Code: '|| v_cc3.ssn || ' Balance: '|| v_cc3.balance);
end loop;
close cc3;

update account a
set a.balance = (a.balance + a.balance * 0.1) 
where a.ssn = "01";

dbms_output.put_line('Updated Number of rows: '|| sql%rowcount);

end;
/
