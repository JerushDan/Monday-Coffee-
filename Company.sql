create database XYZ;
use XYZ;

CREATE TABLE information(
	id int primary key,
    name varchar(50),
    salary int
);

insert into information
(id,name,salary)
values
(1,"Adam",25000),
(2,"Bob",30000),
(3,"CAsey",45000);

insert into information values (4,"Jerush",60000);

select * from information




