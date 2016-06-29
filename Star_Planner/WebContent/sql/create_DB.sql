alter table member add tem_group varchar2(200)  --member에 메니져 소속사 넣어주는 컬럼 추가하는 쿼리!!

/* member */


drop sequence comment_id_seq
drop sequence singer_no_seq;
drop sequence group_id_seq;
drop sequence board_no_seq;
drop sequence schedule_id_seq;
drop table link_list;
drop table schedule;
drop table comments;
drop table search_data;
drop table board;
drop table member;
drop table singer;
drop table type_list;
drop table groups;

CREATE TABLE member (
	m_id VARCHAR2(200) PRIMARY KEY, /* id */
	social_no VARCHAR(50) UNIQUE NOT NULL, /* 주민번호 */
	password VARCHAR2(200) NOT NULL, /* 비밀번호 */
	group_id NUMBER(3) NOT NULL, /* 소속 */
	gender VARCHAR2(10) NOT NULL, /* 성별 */
	name VARCHAR2(200) NOT NULL, /* 이름 */
	email VARCHAR2(500) NOT NULL, /* 이메일 */
	address VARCHAR2(500), /* 주소 */
	phone VARCHAR2(15), /* 전화번호 */
	favorite VARCHAR2(1000), /* 선호그룹 */
	tem_group varchar2(200)
);

/* groups */
CREATE TABLE groups (
	group_id NUMBER(3) PRIMARY KEY, /* 소속 */
	group_name VARCHAR2(300) NOT NULL, /* 이름 */
	group_address VARCHAR2(500) NOT NULL, /* 주소 */
	group_phone VARCHAR2(50) NOT NULL, /* 전화번호 */
	group_link VARCHAR2(500) /* 링크 */
);

--매니저는 11번부터 group_id에 등록
CREATE SEQUENCE  group_id_seq START WITH  11 INCREMENT BY 1  NOCACHE;

/* singer */
CREATE TABLE singer (
	singer_id NUMBER(4) PRIMARY KEY, /* 가수 */
	singer_name VARCHAR2(500) NOT NULL, /* 가수이름 */
	group_id NUMBER(3) NOT NULL, /* 소속 */
	type_name VARCHAR2(500) NOT NULL, /* 가수타입 */
	singer_link VARCHAR2(500), /* 정보링크 */
	singer_favorite NUMBER(10) NOT NULL, /* 선호도 */
	singer_tag VARCHAR2(500) NOT NULL /* 검색태그 */
);

--디비에 20번까지 등록되있어서 21로 설정함
create sequence singer_no_seq start with 21  nocache;

/* board */

CREATE TABLE board (
	board_no NUMBER PRIMARY KEY, /* 게시글번호 */
	board_title VARCHAR2(500) NOT NULL, /* 제목 */
	board_date DATE NOT NULL, /* 날짜 */
	m_id VARCHAR2(200) NOT NULL, /* id */
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
	schedule_start VARCHAR2(21) NOT NULL, /* 일시 */
	schedule_end VARCHAR2(21) NOT NULL, /* 공연시간 */
	singer_id NUMBER(4) NOT NULL, /* 가수 */
	schedule_name VARCHAR2(200) NOT NULL, /* 행사이름 */
	type_name VARCHAR2(200) NOT NULL, /* 행사타입 */
	schedule_address VARCHAR2(500), /* 장소 */
	schedule_contents VARCHAR2(900)
);

create sequence schedule_id_seq nocache;

/* comment */

CREATE TABLE comments (
	board_no NUMBER(10) NOT NULL, /* 게시글번호 */
	comment_id NUMBER(10) PRIMARY KEY, /* 댓글ID */
	comment_content VARCHAR2(300) NOT NULL, /* 내용 */
	m_id VARCHAR2(200) NOT NULL, /* id */
	comment_date DATE NOT NULL, /* 일시 */
	comment_family_id NUMBER(10) NOT NULL, /* 댓글의 댓글인 경우 부모의 ID */
	comment_check NUMBER(2) NOT NULL  /*댓글일 경우 0, 댓글의 댓글이면 1*/
); 

create sequence comment_id_seq nocache;

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