set serveroutput on;

DECLARE

str1 varchar(20) := 'Naman';
str2 varchar(20);
i number;
l number;

BEGIN
str1:=lower(str1);
l := length(str1);

for i in REVERSE 1..l
loop
str2 := str2 || substr(str1,  i, 1);
end loop;

if str1=str2
then
dbms_output.put_line('Palindrome!');
else
dbms_output.put_line('Not Palindrome!');
end if;

end;
/