show tables;

create table user (
	idx int not null auto_increment primary key,
	mid varchar(20) not null,
	name varchar(20) not null,
	age int default 20,
	address varchar(50)
);

desc user;

insert into user values (default, 'admin', '관리자', 30, '청주');
insert into user values (default, 'hkd1234', '홍길동', 30, '서울');
insert into user values (default, 'kms1234', '김말숙', 30, '대전');
insert into user values (default, 'ikj1234', '이기자', 30, '안성');
insert into user values (default, 'bjh1234', '배지훈', 23, '청주');

select * from user;
select * from user order by idx desc;