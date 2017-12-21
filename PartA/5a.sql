create table book (isbn varchar(20), title varchar(20), author varchar(20), publisher varchar(20), primary key(isbn));
create table student (usn varchar(20), name varchar(20), sem varchar(20), deptno varchar(20), primary key(usn));
create table borrow(isbn varchar(20), usn varchar(20), date varchar(20), primary key(isbn, usn), foreign key(usn) references student(usn) ON DELETE CASCADE, foreign key(isbn) references book(isbn) ON DELETE CASCADE);

insert into book values('01', 'Harry Potter', 'JK Rowling', 'WB');
insert into book values('02', 'Lord of the Rings', 'JRR Tolkien', 'WB');
insert into book values('03', 'Hobbit', 'JRR Tolkien', 'GB');
insert into book values('04', 'Jason Bourne', 'Robert Ludlum', 'LB');
insert into book values('05', 'The Notebook', 'Nicholas Sparks', 'TR');


insert into student values('IS044', 'Jay',5, 'D01');
insert into student values('IS005', 'Aditya',5, 'D01');
insert into student values('IS035', 'Divyansh',5, 'D02');
insert into student values('IS043', 'Ishan',5, 'D03');
insert into student values('IS061', 'Meraj',5, 'D01');

insert into borrow values('01', 'IS044', '16-12-2017');
insert into borrow values('01', 'IS043', '12-12-2017');
insert into borrow values('02', 'IS005', '21-12-2017');
insert into borrow values('02', 'IS061', '18-12-2017');
insert into borrow values('03', 'IS043', '19-12-2017');
insert into borrow values('04', 'IS035', '19-12-2017');
insert into borrow values('05', 'IS061', '20-12-2017');

select s.name, s.usn from student s, borrow b where b.isbn = '02' and b.usn = s.usn;

select s.name, s.usn from student s, borrow b, book bo where bo.title='Harry Potter' and b.usn = s.usn and b.isbn = bo.isbn;

select count(b.isbn), s.usn from borrow b, student s where s.usn = b.usn;