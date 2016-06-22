select * from member
select * from comments;

INSERT INTO member
VALUES ('sujin@kosta.com', '933333333333', 'sujin',  0, '여', '김수진', 'sujin@kosta', '주소', '전화번호', '선호그룹' )




CREATE TABLE member (
	m_id VARCHAR2(50) PRIMARY KEY, /* id */
	social_no VARCHAR(13) UNIQUE NOT NULL, /* 주민번호 */
	password VARCHAR2(20) NOT NULL, /* 비밀번호 */
	group_id NUMBER(3) NOT NULL, /* 소속 */
	gender VARCHAR2(10) NOT NULL, /* 성별 */
	name VARCHAR2(30) NOT NULL, /* 이름 */
	email VARCHAR2(20) NOT NULL, /* 이메일 */
	address VARCHAR2(50), /* 주소 */
	phone VARCHAR2(15), /* 전화번호 */
	favorite VARCHAR2(1000) /* 선호그룹 */
);


INSERT INTO GROUPS
VALUES ( 0, '관리자', '관리자주소', '관리자전화번호', '관리자링크' );

/* groups */
CREATE TABLE groups (
	group_id NUMBER(3) PRIMARY KEY, /* 소속 */
	group_name VARCHAR2(50) NOT NULL, /* 이름 */
	group_address VARCHAR2(100) NOT NULL, /* 주소 */
	group_phone VARCHAR2(20) NOT NULL, /* 전화번호 */
	group_link VARCHAR2(200) /* 링크 */
);



INSERT INTO singer
VALUES (0, '가수이름', 0, '가수타입', '정보링크', 0, '검색태그')

/* singer */
CREATE TABLE singer (
	singer_id NUMBER(4) PRIMARY KEY, /* 가수 */
	singer_name VARCHAR2(20) NOT NULL, /* 가수이름 */
	group_id NUMBER(3) NOT NULL, /* 소속 */
	type_name VARCHAR2(200) NOT NULL, /* 가수타입 */
	singer_link VARCHAR2(200), /* 정보링크 */
	singer_favorite NUMBER(10) NOT NULL, /* 선호도 */
	singer_tag VARCHAR2(500) NOT NULL /* 검색태그 */
);


/* board */
INSERT INTO board
VALUES (board_no_seq.nextval, '열혈코딩', sysdate, 'sujin@kosta.com', 3, '컴퓨터프로그래밍언어',  3, 3, '0' )



CREATE TABLE board (
	board_no NUMBER PRIMARY KEY, /* 게시글번호 */
	board_title VARCHAR2(500) NOT NULL, /* 제목 */
	board_date DATE NOT NULL, /* 날짜 */
	m_id VARCHAR2(50) NOT NULL, /* id */
	board_hits NUMBER(7) NOT NULL, /* 조회수 */
	board_content CLOB NOT NULL, /* 내용 */
	board_likes NUMBER(10) NOT NULL, /* 추천 */
	singer_id NUMBER(4) NOT NULL, /* 가수 */
	board_writer_type VARCHAR2(50) /* 게시자타입 */
);




create sequence board_no_seq nocache;

/* schedule */
CREATE TABLE schedule (
	schedule_id NUMBER(10) PRIMARY KEY, /* 스캐쥴번호 */
	schedule_time DATE NOT NULL, /* 일시 */
	schedule_time_range NUMBER(2) NOT NULL, /* 공연시간 */
	singer_id NUMBER(4) NOT NULL, /* 가수 */
	schedule_name VARCHAR2(200) NOT NULL, /* 행사이름 */
	type_name VARCHAR2(200) NOT NULL, /* 행사타입 */
	schedule_address VARCHAR2(500) NOT NULL /* 장소 */
);

create sequence schedule_id_seq nocache;
/* comment */

CREATE TABLE comments (
	board_no NUMBER(10) NOT NULL, /* 게시글번호 */
	comment_id NUMBER(10) NOT NULL, /* 댓글ID */
	comment_content VARCHAR2(300) NOT NULL, /* 내용 */
	m_id VARCHAR2(50) NOT NULL, /* id */
	comment_date DATE NOT NULL /* 일시 */
);

create sequence comment_id_seq nocache;

insert into COMMENTS values(0, 1, '댓글1내용', 'id-1', sysdate);
insert into COMMENTS values(0, 2, '댓글2내용', 'id-1', sysdate);
insert into COMMENTS values(0, 3, '댓글3내용', 'id-1', sysdate);
insert into COMMENTS values(1, 1, '댓글1내용', 'id-1', sysdate);
insert into COMMENTS values(1, 2, '댓글2내용', 'id-1', sysdate);
insert into COMMENTS values(1, 1, '댓글1내용', 'id-1', sysdate);
insert into COMMENTS values(2, 2, '댓글2내용', 'id-1', sysdate);
insert into COMMENTS values(2, 3, '댓글3내용', 'id-1', sysdate);
commit
select * from comments

/* search_data */
CREATE TABLE search_data (
	singer_id NUMBER(4) NOT NULL, /* 가수 */
	singer_count NUMBER(10) NOT NULL, /* 조회수 */
	search_date DATE NOT NULL /* 날짜 */
);

/* type_list */
CREATE TABLE type_list (
	type_name VARCHAR2(200) PRIMARY KEY, /* 타입 */
	word_type VARCHAR2(200) NOT NULL /* 타입종류 */
);

CREATE TABLE link_list(
	link_type 		VARCHAR2(200),
	link_address 	VARCHAR2(500),
	file_name 		VARCHAR2(500),
	link_id 		NUMBER(10)
);
alter table comments add constraint fk_comments foreign key(board_no) references board(board_no);
alter table member add constraint fk_member foreign key(group_id) references groups(group_id);
alter table singer add constraint fk_singer foreign key(group_id) references groups(group_id);
alter table singer add constraint fk_singer_type foreign key(type_name) references type_list(type_name);
alter table schedule add constraint fk_schedule foreign key(singer_id) references singer(singer_id);
alter table schedule add constraint fk_schedule_type foreign key(type_name) references type_list(type_name);
alter table search_data add constraint fk_search_data foreign key(singer_id) references singer(singer_id);
alter table board add constraint fk_board foreign key(singer_id) references singer(singer_id);
alter table board add constraint fk_board_member foreign key(m_id) references member(m_id);