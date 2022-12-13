show tables;

create table chat (
	idx int not null auto_increment primary key,	/* 채팅 내용 고유번호 */
	nickName varchar(20) not null,	/* 별명 */
	content varchar(200) not null,	/* 채팅 내용 */
	cDate datetime not null default now(),	/* 채팅 보낸 날짜 */
	avatar char(1) not null default '1'	/* 아바타 */
); 

desc chat;

insert into chat values (default, '관리자', '안녕하세요 관리자입니다!', default, default);
insert into chat values (default, '말숙킴', '안녕하세요 관리자입니다!', default, '2');

select * from chat;

