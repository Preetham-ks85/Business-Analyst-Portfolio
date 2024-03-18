create database Preetham;
use Preetham;
create table students(sid int,sname char(50), age int, course char(30));
show tables;
insert into students values(1,"Anu",23,"MySQL");
select * from students;
select sid,course from students;
insert into students values(2,"Maggie",30,"Excel");
select * from students;
create table patient(pid int,pname varchar(30),dob date, date_of_admission datetime);
insert into patient values(101,"Anil","1995-05-12","2023-09-20 11:05:22");
select * from patient;
insert into patient values(101,"Anita","1995-05-12",now());
select now() as currenttime;
select 2+3 as Total;
select 2>3 as result;
select 5>3 as result;
select 2=null as result;
select 2 is null as result;
select 2 is not null as result;
alter table students add column marks int;
alter table students drop column age;
alter table students change column sid studentid int;
alter table students modify column sname varchar(30);
rename table students to myclass;
desc myclass;
select * from myclass;
rename table myclass to students;
insert into students(studentid,sname,marks) values(3,"dinesh",89);
select * from students;
-- inserting multiple values
insert into students values(4,"Gang","Powerbi",87),(5,"Sang","Tableau",56),(6,"Mang","R",78);
update students set sname="Akash" where studentid=1;
update students set marks=78 where studentid=1;
set sql_safe_updates=0;
update students set marks=0 where studentid=2;
update students set course="mysql";
update students set marks=90 where sname='Sang' and course='mysql'
-- delete
delete from students where marks is null;
delete from students where marks=78;
delete from students;
-- truncate
truncate table students;
-- select command
select * from myemp;
select * from myemp limit 10;
select emp_id,First_name,last_name,salary from myemp;
select First_name, last_name, dep_id, salary, salary*0.2 as bonus from myemp;
select distinct mgr_id from myemp;
select distinct dep_id from myemp;
select distinct dep_id,mgr_id from myemp;
-- order by
select distinct dep_id from myemp order by dep_id;
select distinct mgr_id from myemp order by mgr_id desc;
select distinct dep_id,mgr_id from myemp order by dep_id,mgr_id;
select first_name,dep_id from myemp where dep_id=80;
-- sal who are all earning more than 3000
select first_name,salary from myemp where salary > 3000 order by salary;
select first_name,hire_date from myemp where hire_date > "2000-01-01" order by hire_date;
select * from myemp where dep_id != 80 order by dep_id;
-- sal who are all earning 10000 to 20000
select first_name,salary from myemp where salary between 10000 and 20000 order by salary;
select * from myemp where year (hire_date) > "2000" order by hire_date;
-- year wont work with where clause
select first_name,hire_date from myemp where year (hire_date) order by hire_date;
select first_name, hire_date from myemp where year (hire_date) > "2000" order by hire_date;
select first_name, hire_date, year (hire_date) from myemp order by hire_date;

-- like operator
select * from myemp where first_name like "a%";
select * from myemp where first_name like "%a";
select first_name from myemp where first_name like "%a%";
select * from myemp where first_name like "j____";
-- And and Or operator
select first_name, salary, dep_id from myemp where salary > 1000 and dep_id=80 order by salary;
select first_name, dep_id, hire_date from myemp where dep_id=90 and hire_date > 1995;
select year(hire_date) from myemp where dep_id=90;
select first_name, dep_id from myemp where dep_id=50 or dep_id=60 order by dep_id;
select first_name, dep_id from myemp where dep_id=10 or dep_id=20 or dep_id=30 or dep_id=40 or dep_id=50 order by dep_id;
select * from myemp where dep_id in(10,20,30,40,50) order by dep_id;
select * from myemp where dep_id not in(10,20,30,40,50) order by dep_id;
select * from myemp where dep_id between 10 and 50 order by dep_id;
select sum(salary) from myemp;
select avg(salary), min(salary), max(salary) from myemp;
select round(avg(salary),2) as avrg_sal from myemp;
select count(*) from myemp;
select count(*) as total from myemp where salary > 10000;

-- get the count of emp in each dept
select first_name,dep_id, count(dep_id) from myemp group by dep_id;

-- need tot sal in dep wise
select *, sum(salary) from myemp group by dep_id order by dep_id desc;

-- calculate avg sal by dep wise
select dep_id, avg(salary) from myemp group by dep_id order by dep_id;

-- multiple columns
select dep_id, mgr_id, avg(salary) from myemp group by dep_id, mgr_id order by dep_id;

select dep_id, avg(salary) from myemp where dep_id in(20,30,40,50) group by dep_id;

-- get the count of emp in each dep
select dep_id, count(*) from myemp group by dep_id;

-- contraints
drop table students;
create table students(sid int unique, sname varchar(30) not null, course varchar(30) default "mysql", age int check(age>=21));
desc students;
insert into students(sid,sname,age) values(1,"Anu",23);
select * from students;
insert into students(sid,sname,age) values(2,"Ramesh",22);

select * from authors;
select * from books;
delete from authors where authorid=1;


CREATE TABLE Books_1(
             BookId INTEGER primary key, 
             Title VARCHAR(50),
             AuthorId INTEGER, foreign key (authorid) references authors(authorid));


insert into Books values(1,'Harry Potter and the Philosopher\'s Stone',1);
insert into Books values(2,'Harry Potter and the Chamber of Secrets',1);
insert into Books values(3,'Harry Potter and the Half-Blood Prince',1);
insert into Books values(4,'Harry Potter and the Goblet of Fire',1);

insert into Books values(5,'Night Without End',5);
insert into Books values(6,'Fear is the Key',5);
insert into Books values(7,'Where Eagles Dare',5);

insert into Books values(8,'Sense and Sensibility',6);
insert into Books values(9,'Pride and Prejudice',6);
insert into Books values(10,'Emma',6);
insert into Books values(11,'Five Point Someone',7);
insert into Books values(12,'Two States',7);
insert into Books values(13,'Salome',8);
insert into Books values(15,'The Happy Prince',8);

delete from authors where authorid=1;

CREATE TABLE Authors_1(AuthorId INTEGER primary key, 
                                Name VARCHAR(70));

insert into Authors_1 values(1,'J K Rowling');
insert into Authors_1 values(2,'Thomas Hardy');
insert into Authors_1 values(3,'Oscar Wilde');
insert into Authors_1 values(4,'Sidney Sheldon');
insert into Authors_1 values(5,'Alistair MacLean');
insert into Authors_1 values(6,'Jane Austen');
insert into Authors_1 values(7,'Chetan Bhagat');
insert into Authors_1 values(8,'Oscar Wilde');



CREATE TABLE Books_2(
             BookId INTEGER primary key, 
             Title VARCHAR(50),
             AuthorId INTEGER, foreign key (authorid) references authors(authorid) on delete cascade on update cascade);


insert into Books_2 values(1,'Harry Potter and the Philosopher\'s Stone',1);
insert into Books_2 values(2,'Harry Potter and the Chamber of Secrets',1);
insert into Books_2 values(3,'Harry Potter and the Half-Blood Prince',1);
insert into Books_2 values(4,'Harry Potter and the Goblet of Fire',1);

insert into Books_2 values(5,'Night Without End',5);
insert into Books_2 values(6,'Fear is the Key',5);
insert into Books_2 values(7,'Where Eagles Dare',5);

insert into Books_2 values(8,'Sense and Sensibility',6);
insert into Books_2 values(9,'Pride and Prejudice',6);
insert into Books_2 values(10,'Emma',6);
insert into Books_2 values(11,'Five Point Someone',7);
insert into Books_2 values(12,'Two States',7);
insert into Books_2 values(13,'Salome',8);
insert into Books_2 values(14,'The Happy Prince',8);

select * from authors_1;
select * from books_2;
delete from authors_1 where authorid=1;
drop table books_1;


-- joining tables
select * from movies;
select * from members;
select * from movies inner join members on movies.id=members.movieid;
select id,title,first_name,last_name from movies inner join members on movies.id=members.movieid;
select * from movies left join members on movies.id=members.movieid;
select * from movies right join members on movies.id=members.movieid;

select * from meals;
select * from drinks;
select * from meals cross join drinks on meals.rate=drinks.rate;
select * from meals cross join drinks;
select mealname,drinkname,drinks.rate from meals cross join drinks;
select meals.mealname,drinks.drinkname,meals.rate + drinks.rate as sum from meals cross join drinks;

-- aliances of table name
select m.mealname, d.drinkname, m.rate+d.rate as sum from meals as m cross join drinks as d;

-- for doing self join taking myemp table
select emp.first_name, emp.last_name, mgr.first_name, mgr.last_name from myemp as emp inner join myemp as mgr on emp.mgr_id=mgr.emp_id;

select * from movies;
select * from members;
select members.movieid, movies.title, members.first_name, members.last_name from movies left join members on movies.id=members.movieid;

select * from students;
insert into students value(3,"Ram","DA",24);
rollback;
start transaction;
insert into students values(4,"Krish","Bi",23);
select * from students;
rollback;

create table newtable(name varchar(30));
start transaction;
insert into newtable value("a");
insert into newtable value("b");
insert into newtable value("c");
select * from newtable;
savepoint sa;
insert into newtable value("d");
insert into newtable value("e");
savepoint sb;
insert into newtable value("f");
insert into newtable value("g");
select * from newtable;
rollback to sb;
select * from newtable;
rollback to sa;
select * from newtable;
commit;
select * from newtable;
rollback;
select * from newtable;

create table student(sid int primary key auto_increment, sname varchar(20), age int, course varchar(30));
insert into student(sname,age,course) value("Anu",23,"Sql");
insert into student(sname,age,course) value("Sneha",24,"DA");
select * from student;
alter table student auto_increment=101;
insert into student(sname,age,course) value("Meghana",30,"Excel");
insert into student(sname,age,course) value("Chinmai",25,"Bi");
select * from student;
delete from student;
insert into student(sname,age,course) value("Sam",25,"Bi");
insert into student(sname,age,course) value("Sahasa",25,"Bi");
truncate table student;
insert into student(sname,age,course) value("Malini",25,"Bi");
insert into student(sname,age,course) value("Dhamini",25,"Bi");
select * from student;

-- views 
select * from myemp limit 10;
select emp_id, first_name, last_name, salary, salary*0.1 as bonus from myemp limit 10;
create view emp3 as(select emp_id, first_name, last_name, salary, salary*0.1 as bonus from myemp limit 10);
select * from emp3;

select * from movies;
select * from members;
select id, title, first_name, last_name from movies left join members on movies.id=members.movieid;
select id, title, ifnull(first_name,"-"), ifnull(last_name,"-") as lname from movies left join members on movies.id=members.movieid;
create view first as (select id, title, ifnull(first_name,"-"), ifnull(last_name,"-") as lname from movies left join members on movies.id=members.movieid);
select * from first;

select * from myemp;
select * from myemp where dep_id=30;
create view dep_30 as(select * from myemp where dep_id=30);
select * from dep_30;

select * from authors;
create view autho as (select * from authors where authorid<10);
select * from autho;
insert into autho value(10,"Anusha");
select * from autho;
select * from authors;
drop view autho;
create view autho as select * from authors where authorid<10 with check option;
select * from autho;
insert into autho values(20,"Aniket");


show indexes from authors;
desc myemp;
create index author1 on authors(authorid);
show indexes from authors;

select * from offices limit 5;
select count(*) from offices;
show indexes from offices;
select * from offices where officecode=4;
drop index off on offices;

-- example for index type Hash
select * from authors;
select authors(concat(id,name)) as hashvalue from authors;


call preetham.hw1();
call preetham.hw2(15);


use preetham;
select * from fraud;
select * from payments;
desc payments;
insert into payments value(500, "HS45678", "2023-10-22", null);


select * from orders;
select * from products;


call pvendor;

select * from myemp limit 10;
select emp_id, first_name, last_name, year(now())-year(hire_date) as experience from myemp limit 10;
-- applying function
select emp_id, first_name, last_name, experience(emp_id) from myemp limit 10; 

set sql_safe_updates=0;
set global log_bin_trust_function_creators = 1;


select * from books;
select * from authors;
select * from book_sales;
desc book_sales;
alter table books add column sales int default 0;
update books set sales=sales+3 where bookid=5;
update books set sales=sales+2 where bookid=5;
update books set sales=sales+1 where bookid=5;

create table emp11(empid int, ename varchar(30), working_hours int);
insert into emp11 values(101, "Ramya", 42);
insert into emp11 values(102, "Raj", 48);
insert into emp11 values(103, "Ravi", -47);
select * from emp11;
insert into emp11 values(104, "Ali", -50);


select * from myemp limit 10;
select * from myemp order by salary desc;
select first_name, last_name, max(salary) as salary from myemp;
select first_name, last_name from myemp where salary=24000;
select max(salary) from myemp;
select first_name, last_name from myemp where salary=(select max(salary) from myemp);
select avg(salary) from myemp;
select * from myemp where salary>(select avg(salary) from myemp);
select dep_id, avg(salary) from myemp group by dep_id;
select * from myemp e where salary>(select avg(salary) from myemp where dep_id=e.dep_id) order by dep_id;


select * from offices;
select * from employees;
select * from employees where officecode in(select officecode from offices where country="USA");


-- windows function
select dep_id, avg(salary) from myemp group by dep_id;
select emp_id, first_name, last_name, dep_id, salary, avg(salary) over (partition by dep_id) as average_salary from myemp;

create table marks(sid int, sname varchar(30), score int);
insert into marks values(1, "Naveen", 70), (2, "Venky", 80), (3, "Ramya", 70), (4, "Hari", 85), (5, "Krishna", 60);
select * from marks;
select *, rank() over(order by score desc) as rnk from marks;

select * from sales;
select *, dense_rank() over(partition by fiscal_year order by sale desc) as rnk from sales;

select emp_id, first_name, last_name, salary, dense_rank() over (order by salary desc) as rnk from myemp;
select emp_id, first_name, last_name, salary, salary*0.1 as bonus from myemp;
with S as(select emp_id, first_name, last_name, salary, salary*0.1 as bonus from myemp)
select first_name, last_name, bonus from S;

with S as(select emp_id, first_name, last_name, salary, dense_rank() over(order by salary desc) as rnk from myemp)
select emp_id, first_name, last_name, rnk from S where rnk=5;

with S as(select emp_id, first_name, last_name, salary, dense_rank() over(partition by dep_id order by salary desc) as rnk from myemp)
select * from S where rnk=3;

with S as(select emp_id, first_name, last_name, salary, dense_rank() over(partition by dep_id order by salary desc) as rnk from myemp)
select * from S where rnk in (1,3,5);

with S as(select emp_id, first_name, last_name, salary, dep_id, dense_rank() over(partition by dep_id order by salary desc) as rnk from myemp)
select * from S where rnk in (1,3,5);

select * from trains;
select *, lead(time, 1) over(partition by train_id order by time) as next_station_time from trains;

with S as(select *, lead(time,1) over(partition by train_id order by time) as next_station_time from trains)
select *, subtime(next_station_time, time) as transition_time from S;


-- union
create table v1(id int, name varchar(30), course varchar(20));
insert into v1 values(1, "Tim", "Mysql"), (2, "John", "Tableau"), (3, "Hari", "Powerbi");
drop table v2;
create table v2(id int, name varchar(30), course varchar(20), age int);
insert into v2 values(4, "Timy", "Mysql", 25), (5, "Johny", "Tableau", 24), (6, "Hari", "Powerbi", 25);
select * from v1 union select * from v2;
select name from v1 union select name from v2;
select name from v1 union all select name from v2;


select * from movies;
select * from members;
select * from movies left join members on movies.id=members.movieid;

select * from movies left join members on movies.id=members.movieid
union
select * from movies right join members on movies.id=members.movieid;


create database excelr;
use excelr;
use Preetham;

-- joining from 2 different database
select * from preetham.movies inner join excelr.members on movies.id=members.movieid;


-- text function
select char_length("India");
select concat("I am working", " ", "in mysql workbench", " ", "updated version");
select lower("ADDED") as outcome;
select upper("added") as outcome;
select left("i am working in the preetham database", 15) as result;
select left("i am working in the preetham database", char_length("i am working in")) as result;
select right("i am working in the preetham database", char_length("database")) as result;
select trim("    Hi everyone   ") as results;
select replace("    hi    preetham    ", " ", "-")as results;
select substring("www.w3school.com", 5) as results;
select substring("www.w3school.com", -5) as results;
select substring("www.w3school.com", 5, 8) as results;

select substring_index("www.w3school.com", ".",2) as results;

-- date time function
select now();
select curdate();
select current_time();
select date(now());
select time(now());
select month("2023-10-20") as mnth;
select monthname(now()) as mnth;
select day(now()) as day;
select dayname(now()) as day;
select quarter(now()) as qtr;
select current_date;
select weekday("2023-10-20") as r;
select hour(now());
select minute(now());
select second(now());

 select datediff("2023-10-24", "2022-03-23");
 select timestampdiff(year, "2022-03-23", "2023-10-24");
 select timestampdiff(month, "2022-03-23", "2023-10-24");
 select timestampdiff(day, "2022-03-23", "2023-10-24");
 
 select date_format(now(), "%d-%m-%y");
 select date_format(now(), "%D-%M-%Y") as date1;
 select date_format(now(), "%d-%m-%y %h:%i:%s:%p");
 
 -- myemp table calculate exp with(years,mnths,date)
 select date_format(hire_date, "%D %M %Y") as hiredate from myemp;
 
 
 
 create table cost(id int, name varchar(30), price int);
 insert into cost values(1, "Samsung", 20000), (2, "Moto", 15000), (3, "Iphone", 100000);
 select * from cost;
 
 select name,
 case
 when price <= 15000 then "Non expensive"
 when price <= 20000 then "Affordable"
 else "Expensive product"
 end status1
 from cost;
 
 -- if null
 create table emp6(id int, name varchar(30), salary decimal(10,2));
 insert into emp6 values(1, "Harish", 40000), (2, "Harini", 50000), (3, "Roy", null);
 select * from emp6;
 select (salary+30000) as total from emp6;
 select *, (ifnull(salary, 0)+40000) as total_salary from emp6;
 
 -- coalesce
 create table emp7(id int, Fname varchar(30), Mname varchar(40), Lname varchar(40));
 insert into emp7 values(1, null, null, "Harish"), (2, null, "Harini", null), (3, "Roy", null, null), (4, "Ravi", "Suresh", "Krishna");
 select * from emp7;
 select id, coalesce(Fname, Mname, Lname) from emp7;
 
 call new13(@record);
 select @record as tot_rec;
 
 
 create table product12(id int, pname varchar(40), price decimal(7,2));
 insert into product12 values(1, "mobile1", 2000), (2, "mobile2", 15000), (3, "mobile1", 2000);
 select * from product12;
 
