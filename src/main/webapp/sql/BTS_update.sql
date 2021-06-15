/* ȸ������ */
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

/* Ŀ�´�Ƽ �Խ��� */
CREATE TABLE cboard (
	cbNo NUMBER primary key,
	userid VARCHAR2(50) not null, /* ȸ�����̵� */
	title VARCHAR2(50), /* ���� */
	content VARCHAR2(500), /* ���� */
	regdate TIMESTAMP, /* ����� */
	count NUMBER /* ��ȸ�� */
);
-- Ŀ��Ƽ�ϰԽ��� seq
create sequence cboard_seq
start with 1
increment by 1
nocache;

-- Ŀ�´�Ƽ�Խ��� fk �������̵�
alter table cboard
add constraint fk_cboard_userid foreign key(userid)
references userinfo(userid);

/* Ŀ�´�Ƽ ��� */
CREATE TABLE cBoardComment (
	no number primary key, /*��۰�����ȣ*/
    cbNo NUMBER, /* �Խ��ǹ�ȣ */
	content VARCHAR2(500), /* ���� */
	regdate TIMESTAMP, /* ����� */
	userid VARCHAR2(50) /* ȸ�����̵� */
);
create sequence cBoardComment_seq
start with 1
increment by 1
nocache;

-- Ŀ�´�Ƽ�Խ��Ǵ�� fk �������̵�
alter table cBoardComment
add constraint fk_cBoardComment_userid foreign key(userid)
references userinfo(userid);

-- Ŀ�´�Ƽ�Խ��Ǵ�� fk Ŀ�´�Ƽ�Խ���no
alter table cBoardComment
add constraint fk_cBoardComment_cbNo foreign key(cbNo)
references cboard(cbNo);

/* ī�װ� */
CREATE TABLE cat (
    catNo number primary key,
	catName VARCHAR2(50) /* ī�װ��� */
);

insert into cat(catno, catName)
values(1, '���');
insert into cat(catno, catName)
values(2, '����');
insert into cat(catno, catName)
values(3, '����');
commit;

/* ������ */
-- ���, ����, ���� ã�� ������ ��� seq �ʿ����
CREATE TABLE tourplace (
    placeNo NUMBER primary key, /* ��������ȣ */
	placeName VARCHAR2(500) , /* ����̸� */
    placeTitle VARCHAR2(500) , /* ���Ÿ��Ʋ */
	placeAddress VARCHAR2(1000), /* ����ּ� */
    placeTel varchar2(500), /*��ȭ��ȣ*/
    homepage varchar2(500), /*Ȩ������*/
	placeInfo VARCHAR2(4000), /* ������ */
    latitude varchar2(300), /*����*/
    longitude varchar2(400), /*�浵*/
	catNo NUMBER, /* ī�װ���ȣ */
    imageURL varchar2(500), /* �̹���URL */
    imagemain varchar2(500) /*������̹���URL */
);
select * from tourplace order by placeno;

-- ������ fk ī�װ�
alter table tourplace
add constraint fk_tourPlace_catNO foreign key(catNo)
references cat(catNo);

select * from tourplace order by placeno;

commit;

/* ���ƿ� */
CREATE TABLE countLike (
	no number, /*db�� ���̴� ��ȣ*/
    placeNo NUMBER, /* ��������ȣ */
	userid VARCHAR2(50) /* ȸ�����̵� */
);

create sequence like_seq
start with 1
increment by 1
nocache;

-- ���ƿ� fk ��������ȣ
alter table countLike
add constraint fk_like_placeNo foreign key(placeNo)
references tourPlace(placeNo);

-- ���ƿ� fk �������̵�
alter table countLike
add constraint fk_like_userid foreign key(userid)
references userinfo(userid);


/* ������ ��� */
CREATE TABLE tourComment (
    no number primary key, /* ��۹�ȣ */
	userid VARCHAR2(50) NOT NULL, /* ȸ�����̵� */
	Content VARCHAR2(500), /* ���� */
	regdate TIMESTAMP default sysdate, /* ����� */
	placeNo NUMBER /* ��������ȣ */
);
-- ��������� seq
create sequence tourComment_seq
start with 1
increment by 1
nocache;

-- ��������� fk �������̵�
alter table tourComment
add constraint fk_tourComment_userid foreign key(userid)
references userinfo(userid);

-- ��������� fk ��������ȣ
alter table tourComment
add constraint fk_tourComment_placeNo foreign key(placeNo)
references tourplace(placeNo);

/* �������� */
CREATE TABLE tourplan (
	planNo NUMBER primary key, /* �����ڽ���ȣ */
	startDate TIMESTAMP not null, /* �����ڽ������� */
	endDate TIMESTAMP not null, /* �����ڽ������� */
	planName VARCHAR2(50), /* �����ڽ��̸� */
	userid VARCHAR2(50), /* ȸ�����̵� */
	content varchar2(1000) /*�����ڽ� �����*/
);

-- �����ȹ seq
create sequence tourplan_seq
start with 1
increment by 1
nocache;


