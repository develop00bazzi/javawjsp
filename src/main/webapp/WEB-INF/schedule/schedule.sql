show tables;

create table schedule (
	idx int not null auto_increment primary key,	/* 일정 관리 고유번호 */
	mid varchar(20) not null,	/* 회원 아이디 일정 검색시 사용 */
	sDate datetime not null,	/* 일정 등록 날짜 */
	part varchar(10) not null,	/* 일정 분류 항목 (1.모임, 2.업무, 3.학습, 4.여행, 5.기타)*/
	content text not null	/* 일정 상세 내역 */
);

insert into schedule values (default, 'admin', '2022-12-08', '학습', '프로젝트 계획서 제출 및 수정, 프로젝트 뷰 뭐시기');
insert into schedule values (default, 'admin', '2022-12-10', '학습', '뭐하려고 했더라');
insert into schedule values (default, 'admin', '2022-12-12', '기타', '저녁 약속');
insert into schedule values (default, 'admin', '2022-12-15', '기타', '프로젝트 발표 준비');
insert into schedule values (default, 'admin', '2022-12-15', '업무', '은행 업무');
insert into schedule values (default, 'admin', '2022-12-15', '업무', '학원 업무');
insert into schedule values (default, 'admin', '2022-12-15', '학습', '인터넷 강의 수강');
insert into schedule values (default, 'admin', '2022-12-19', '학습', '프로젝트 발표');
insert into schedule values (default, 'admin', '2022-12-28', '업무', '청년취업지원제도 뭐시기 해야함.');
insert into schedule values (default, 'atom1234', '2022-12-08', '업무', '청년취업지원제도 뭐시기 해야함.');
insert into schedule values (default, 'atom1234', '2022-12-08', '업무', '청년취업지원제도 뭐시기 해야함.');

insert into schedule values (default, 'admin', '2023-01-05', '업무', ' Spring 진도 복습');

select * from schedule order by sDate desc;
select * from schedule where mid='admin' order by sDate desc;
select * from schedule where mid='admin' and sDate='2022-12-10' order by sDate desc;


select * from schedule where mid='admin' and date_format(sDate,'%Y-%m')='2022-12' group by part order by sDate desc;

select *,count(*) from schedule where mid='admin' and sDate='2022-12-15' group by part order by sDate desc;

select * from schedule where mid='admin' and date_format(sDate,'%Y-%m')='2022-12' group by part order by sDate desc;

select * from schedule where mid='admin' and date_format(sDate,'%Y-%m')='2023-1' order by sDate desc;	/* 에러가 발생 */

-- 테이트 포맷을 사용하면 날짜 형식에 맞게 표기를 해야한다.


select * from schedule where mid='admin' and date_format(sDate, '%Y-%m')='2022-12' order by sDate,part;


select * from schedule where mid='admin' and date_format(sDate, '%Y-%m')='2022-12' order by sDate;

select * from schedule where mid='admin' and date_format(sDate, '%Y-%m')='2022-12' order by sDate desc;

select *,count(*) from schedule where mid='admin' and sDate='2022-12-15' group by part;







