-- tblBoard --
create table tblBoard (
	idx int not null,
	memID varchar(20) not null,
	title varchar(100) not null,
	content varchar(2000) not null,
	writer varchar(30) not null,
	indate datetime default now(),
	count int default 0,
	
	-- 댓글 기능 추가 --
	boardGroup int,			-- 게시글과 댓글 그룹
	boardSequence int,		-- 같은 그룹 안의 댓글 간 순서 지정
	boardLevel int,			-- 댓글의 레벨(들여쓰기)
	boardAvailable int,		-- 삭제한 글인지 여부
	
	primary key(idx)		-- 자동 증가 X, idx의 최댓값을 구해 증가하도록 만들 것
);


-- tblMember --
create table tblMember (
	memID varchar(50) not null,		-- 회원ID
	memPwd varchar(50) not null,	-- 회원비번
	memName varchar(50) not null,	-- 회원이름
	memPhone varchar(50) not null,	-- 회원전화번호
	memAddr varchar(100),			-- 회원주소
	latitude decimal(13, 10),		-- 현재위치 위도(총 13자리, 소수점 아래 10자리까지 가능)
	longitude decimal(13, 10),		-- 현재위치 경도
	primary key(memID)
);


-- 회원 테이블에 임의의 데이터 주입 --
insert into tblMember(memID, memPwd, memName, memPhone)
values('test01', 'test01', '테스트01', '010-1111-1111');
insert into tblMember(memID, memPwd, memName, memPhone)
values('test02', 'test02', '테스트02', '010-2222-2222');
insert into tblMember(memID, memPwd, memName, memPhone)
values('test03', 'test03', '테스트03', '010-3333-3333');


select IFNULL(max(idx)+1, 1) from tblBoard;	-- NULL이면 1, NULL이 아니면 idx의 max 값에 1을 더하기
-- 게시판 테이블에 임의의 데이터 주입 --
insert into tblBoard
select IFNULL(max(idx)+1, 1), 'test01', '게시판 연습', '게시판 연습 글입니다', '테스트01', now(), 0, IFNULL(max(boardGroup)+1, 0), 0, 0, 1
from tblBoard;

insert into tblBoard
select IFNULL(max(idx)+1, 1), 'test02', '게시판 연습', '게시판 연습 글입니다', '테스트02', now(), 0, IFNULL(max(boardGroup)+1, 0), 0, 0, 1
from tblBoard;

insert into tblBoard
select IFNULL(max(idx)+1, 1), 'test03', '게시판 연습', '게시판 연습 글입니다', '테스트03', now(), 0, IFNULL(max(boardGroup)+1, 0), 0, 0, 1
from tblBoard;

select * from tblBoard;

delete from tblBoard where idx=1;
delete from tblBoard where idx=2;
delete from tblBoard where idx=3;
delete from tblBoard where idx=4;

delete from tblBoard;

update tblBoard set boardSequence + 1 where boardGoup = 1;



