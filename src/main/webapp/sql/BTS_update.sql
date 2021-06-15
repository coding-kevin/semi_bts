/* 회원가입 */
drop table userinfo;
drop table cboard;
drop table cBoardComment;
drop table cat;
drop table tourplace;
drop table countLike;
drop table tourComment;
drop table tourplan;


CREATE TABLE userinfo (
	userid VARCHAR2(50) primary key,
	userName VARCHAR2(50) not null,
	userPwd VARCHAR2(50) not null,
	email VARCHAR2(50),
	hp VARCHAR2(50),
    zipcode varchar2(50),
	address VARCHAR2(100),
    addressDetail varchar(100),
	Regdate TIMESTAMP default sysdate
);

/* 커뮤니티 게시판 */
CREATE TABLE cboard (
	cbNo NUMBER primary key,
	userid VARCHAR2(50) not null, /* 회원아이디 */
	title VARCHAR2(50), /* 제목 */
	content VARCHAR2(500), /* 내용 */
	regdate TIMESTAMP, /* 등록일 */
	count NUMBER /* 조회수 */
);
-- 커뮤티니게시판 seq
create sequence cboard_seq
start with 1
increment by 1
nocache;

-- 커뮤니티게시판 fk 유저아이디
alter table cboard
add constraint fk_cboard_userid foreign key(userid)
references userinfo(userid);

/* 커뮤니티 댓글 */
CREATE TABLE cBoardComment (
	no number primary key, /*댓글고유번호*/
    cbNo NUMBER, /* 게시판번호 */
	content VARCHAR2(500), /* 내용 */
	regdate TIMESTAMP, /* 등록일 */
	userid VARCHAR2(50) /* 회원아이디 */
);
create sequence cBoardComment_seq
start with 1
increment by 1
nocache;

-- 커뮤니티게시판댓글 fk 유저아이디
alter table cBoardComment
add constraint fk_cBoardComment_userid foreign key(userid)
references userinfo(userid);

-- 커뮤니티게시판댓글 fk 커뮤니티게시판no
alter table cBoardComment
add constraint fk_cBoardComment_cbNo foreign key(cbNo)
references cboard(cbNo);

/* 카테고리 */
CREATE TABLE cat (
    catNo number primary key,
	catName VARCHAR2(50) /* 카테고리명 */
);

insert into cat(catno, catName)
values(1, '명소');
insert into cat(catno, catName)
values(2, '숙박');
insert into cat(catno, catName)
values(3, '맛집');
commit;

/* 여행지 */
-- 명소, 숙박, 맛집 찾은 데이터 사용 seq 필요없음
CREATE TABLE tourplace (
    placeNo NUMBER primary key, /* 여행지번호 */
	placeName VARCHAR2(500) , /* 장소이름 */
    placeTitle VARCHAR2(500) , /* 장소타이틀 */
	placeAddress VARCHAR2(1000), /* 장소주소 */
    placeTel varchar2(500), /*전화번호*/
    homepage varchar2(500), /*홈페이지*/
	placeInfo VARCHAR2(4000), /* 상세정보 */
    latitude varchar2(300), /*위도*/
    longitude varchar2(400), /*경도*/
	catNo NUMBER, /* 카테고리번호 */
    imageURL varchar2(500), /* 이미지URL */
    imagemain varchar2(500) /*썸네일이미지URL */
);
select * from tourplace order by placeno;

-- 여행지 fk 카테고리
alter table tourplace
add constraint fk_tourPlace_catNO foreign key(catNo)
references cat(catNo);

select * from tourplace order by placeno;

commit;

/* 좋아요 */
CREATE TABLE countLike (
	no number, /*db에 쌓이는 번호*/
    placeNo NUMBER, /* 여행지번호 */
	userid VARCHAR2(50) /* 회원아이디 */
);

create sequence like_seq
start with 1
increment by 1
nocache;

-- 좋아요 fk 여행지번호
alter table countLike
add constraint fk_like_placeNo foreign key(placeNo)
references tourPlace(placeNo);

-- 좋아요 fk 유저아이디
alter table countLike
add constraint fk_like_userid foreign key(userid)
references userinfo(userid);


/* 여행지 댓글 */
CREATE TABLE tourComment (
    no number primary key, /* 댓글번호 */
	userid VARCHAR2(50) NOT NULL, /* 회원아이디 */
	Content VARCHAR2(500), /* 내용 */
	regdate TIMESTAMP default sysdate, /* 등록일 */
	placeNo NUMBER /* 여행지번호 */
);
-- 여행지댓글 seq
create sequence tourComment_seq
start with 1
increment by 1
nocache;

-- 여행지댓글 fk 유저아이디
alter table tourComment
add constraint fk_tourComment_userid foreign key(userid)
references userinfo(userid);

-- 여행지댓글 fk 여행지번호
alter table tourComment
add constraint fk_tourComment_placeNo foreign key(placeNo)
references tourplace(placeNo);

/* 여행일정 */
CREATE TABLE tourplan (
	planNo NUMBER primary key, /* 여행코스번호 */
	startDate TIMESTAMP not null, /* 여행코스시작일 */
	endDate TIMESTAMP not null, /* 여행코스종료일 */
	planName VARCHAR2(50), /* 여행코스이름 */
	userid VARCHAR2(50), /* 회원아이디 */
	content varchar2(1000) /*여행코스 저장소*/
);

-- 여행계획 seq
create sequence tourplan_seq
start with 1
increment by 1
nocache;


