show tables;

create table board (
	idx int not null auto_increment,	/* 고유번호 */
	nickName varchar(20) not null,		/* 게시글을 올린 사람의 닉네임 */
	title varchar(100) not null,		/* 게시글의 글 제목 */
	email	varchar(50),				/* 글쓴이의 이메일 주소 (회원가입 시에 필수 입력 처리 되어있음.) */
	homePage varchar(50),				/* 글쓴이의 홈페이지 (블로그) 주소 */
	content text not null,				/* 글 내용 */
	wDate datetime default now(),		/* 글 올린 날짜 */
	hostIp varchar(50) not null,		/* 글쓴이의 접속 IP */
	readNum int default 0,				/* 글 조회수 */
	good int default 0,					/* '좋아요' 개수 누적하기 */
	mid varchar(20) not null,			/* 회원 아이디 (내가 올린 게시글 전체 조회시 사용) */
	
	primary key(idx)
);


desc board;

insert into board values (default,'관리자','게시판 서비스를 시작합니다.','dragon0hun@naver.com','https://github.com/develop00bazzi','이곳은 게시판입니다!',default,'192.168.50.65',default,default,'admin');

select * from board;

-- 게시판에 댓글 달기

create table boardReply (
	idx int not null auto_increment,		/* 댓글의 고유번호 */
	boardIdx int not null,					/* 원본 글의 고유번호 (외래키로 지정) */
	mid varchar(20) not null,				/* 댓글 올린 사람의 아이디 */
	nickName varchar(20) not null,			/* 댓글 올린 사람의 닉네임 */
	wDate datetime default now(),			/* 댓글 올린 날짜 */
	hostIp varchar(50) not null,			/* 댓글 올린 PC의 IP */
	content text not null,					/* 댓글 내용 */
	
	primary key(idx),
	foreign key(boardIdx) references board(idx)
--	on update cascade					/* 부모의 테이블이 수정되면 같이 수정 */
--	on delete restrict					/* 부모 테이블의 내용을 함부로 지우려고 하면 제약 조건을 걸어서 함부로 지울수 없도록 설정 */
-- 	현재 숫자로 설정했을때는 문제 없는데 문자로 처리할 경우 문제 무조건 생김.. 인지
);

desc boardReply;

-- 날짜 처리 연습

select now();	/* now(): 오늘 날짜와 시간을 보여준다. */

select year(now()); 		/* year(): 년도 출력 */
select month(now());	 	/* month(): 월 출력 */
select day(now());	 	/* day(): 일 출력 */
select date(now());	 	/* date(): 년-월-일 출력 */
select weekday(now());	/* 요일 - 0(월)부터 순서대로 */
select dayofweek(now());	/* 요일 -1(일)부터 순서대로 */
select hour(now());		/* hour(): 시간 */
select minute(now());		/* minute(): 분 */
select second(now());		/* second(): 초 */

select year('2022-12-01');

select idx, year(wDate) from board;
select idx, day(wDate),weekday(wDate) as 날짜 from board;

-- 날짜 연산

-- date_add(date, interval 값 타입)

select date_add(now(),interval 1 day); /* 오늘 날짜보다 +1일 출력 */
select date_add(now(),interval -1 day); /* 오늘 날짜보다 +1일 출력 */
select date_add(now(),interval 10 day_hour); /* 오늘 날짜보다 +10시간 출력 */
select date_add(now(),interval -10 day_hour); /* 오늘 날짜보다 -10시간 출력 */

-- date_sub(date, interval 값 타입)

select date_sub(now(),interval 1 day); /* 오늘 날짜보다 -1일 출력 */
select date_sub(now(),interval -1 day); /* 오늘 날짜보다 +1일 출력 */

--select from_days() from board;

select idx,wDate from board;

-- date_format(날짜, '양식기호');
-- 년도(2자리): %y,년도(4자리): %Y, 월:%m, 월(영문):%M, 일:%d, 시(12h):%h, 시(24h):%H, 분:%i, 초:%s

select idx,date_format(wDate,'%y-%m-%d') from board;	/* 월을 숫자 출력 */
select idx,date_format(wDate,'%y-%M-%d') from board;	/* 월을 영문 출력 */
select idx,date_format(wDate,'%h-%i-%s') from board;	/* 12H */
select idx,date_format(wDate,'%H-%i-%s') from board;	/* 24H */

-- 현재부터 한달 전의 날짜

select date_sub(now(),interval 1 month);

-- 하루 전 체크

select date_add(now(),interval -1 day);
select date_add(now(),interval -1 day), wDate from board;

-- 날짜 차이 계산: DATEDIFF (시작 날짜, 마지막 날짜)

select datediff('2022-11-30', '2022-12-01');
select datediff(now(), '2022-11-30');
select idx, wDate, datediff(now(), wDate) from board;

select idx, wDate, datediff(now(), wDate) as day_diff from board;

select *, timestampdiff(hour,wDate,now()) as hour_diff from board;
select *,datediff(now(), wDate) as day_diff, timestampdiff(hour,wDate,now()) as hour_diff from board;


select * from board;

-- 이전 글 다음 글 체크

select * from  board where idx< order by idx desc limit 1;
select * from  board where idx>30 limit 1;

-- 실무가면 자료가 많으니까 리미트를 걸어서 깔끔하게 처리할 수 있도록 처리한다.

-- 221205 서브쿼리 연습

-- 댓글의 수를 전체 List에 출력하기 연습

select * from boardReply order by idx desc;

-- boardIdx(게시판 글의 고유번호) 잘 봐가면서 확인

-- 댓글 테이블(boardReply)에서 board 테이블의 고유번호 61번 글에 연결되어있는 댓글의 개수는?

select count(*) as cnt from boardReply where boardIdx=61;

-- 댓글 테이블(boardReply)에서 board 테이블의 고유번호 61번 글에 연결되어있는 댓글의 개수는?

-- 원본글의 고유번호와 함께 출력, 댓글 개수의 별명은 replyCnt

select boardIdx,count(*) as replyCnt from boardReply where boardIdx=61;

-- 댓글 테이블(boardReply)에서 board 테이블의 고유번호 61번 글에 연결되어있는 댓글의 개수는?

-- 원본글의 고유번호와 함께 출력, 댓글 개수의 별명은 replyCnt

-- 이때 원본 글을 쓴 닉네임을 함께 출력하시오. 단, 닉네임은 board(원본글 테이블)에서 가져와서 출력하시오.

select boardIdx,nickName,count(*) as replyCnt from boardReply where boardIdx=61;\

select boardIdx,(select nickName from board where idx=61) as boardNickName,count(*) as replyCnt from boardReply where boardIdx=61;

-- 실무에서는 보통 예약어를 대문자로 적는다.

-- 앞의 문장을 부모 테이블의 관점에서 본다면? (board)

select mid,nickName from board where idx=61;

-- 앞의 닉네임을 자식(댓글) 테이블(boardReply)에서 가져와서 보여준다면?

select mid,(select nickName from boardReply where boardIdx=61) as replyNickName from board where idx=61;

-- 부모 관점 (board)에서 고유번호 61번의 아이디와, 현재 글에 달려있는 댓글의 개수는?

select mid,(select count(*) from boardReply where boardIdx=61) as replyCnt from board where idx=61;

-- 서브쿼리를 사용할때는 조건에 합당한 경우만 사용 가능하니 주의 해야 한다.

-- dao 작성하기 전에 sql문을 항상 연습해보고 출력하는 것이 좋을거 같다...

-- 부모 관전에서 부모글 board 테이블의 모든 내용과, 현재글에 달려있는 댓글의 개수를 가져오되, 최근글 5개만 출력하기

select *,(select count(*) from boardReply where boardIdx=61) as replyCnt from board order by idx desc limit 5;

select *,(select count(*) from boardReply where boardIdx=b.idx) as replyCnt from board b order by idx desc limit 5;

-- 쿼리문을 잘 짜야 프로그램을 단순하게 잘 구성할 수 있다.

-- dao에 가져갈 내용

-- 각각의 테이블에 별명을 붙여서 앞의 내용을 변경시켜보자.























