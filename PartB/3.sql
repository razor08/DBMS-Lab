set serveroutput on;
DECLARE 
i number;
n number;
flag number;
 
BEGIN
i:=2;
n:=23;
flag:=0;
for i in 2..n/2
loop
if mod(n, i) = 0
then
flag:=1;
end if;
end loop;

if flag=1
then 
dbms_output.put_line('Not Prime');
else
dbms_output.put_line('Prime');
end if;
end;
/