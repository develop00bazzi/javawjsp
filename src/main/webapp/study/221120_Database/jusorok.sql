show tables;

select * from bank;

select * from test1;

create table jusorok (
	idx int not null auto_increment primary key,	/* 고유번호 */
	mid varchar(20) not null,	/* 아이디 */
	pwd varchar(20) not null,	/* 비밀번호 */
	name varchar(20) not null,	/* 성명 */
	point int default 100,	/* 방문 포인트 */
	lastDate datetime default now()	/* 최종 방문 날짜 */
);

desc jusorok;

insert into jusorok values  (default, 'admin', '1234', '관리자', default, default);

select * from jusorok;

delete * from jusorok where ;