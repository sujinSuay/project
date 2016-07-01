select * from schedule;

INSERT INTO GROUPS VALUES ( 0, '마스터', '마스터' , '마스터' , '마스터'  );
INSERT INTO GROUPS VALUES ( 1, '관리자','관리자' , '관리자', '관리자' );
INSERT INTO GROUPS VALUES ( 2, '일반', '일반' ,'일반' ,'일반'  );
INSERT INTO GROUPS VALUES ( 3, '승인요청',  '승인요청',  '승인요청',   '승인요청');
--소속사 등록은 11번 부터 시작
INSERT INTO GROUPS VALUES ( 11, 'JYP', 'JYP회사주소', '1111111', '1111' );
INSERT INTO GROUPS VALUES ( 12, 'SM', 'SM회사주소', '1111111', '1111' );
INSERT INTO GROUPS VALUES ( 13, 'YG', 'YG회사주소', '1111111', '1111' );
INSERT INTO GROUPS VALUES ( 14, 'PlanA', 'PlanA회사주소', '1111111', '1111' );

select * from groups;
select group_name from groups where group_id=(select group_id from member where m_id='id-0001')
select * from member
--m_id, social_no, password, group_id, gender, name, email, address, phone, favorite, temgroup
--마스터 등록  (group 값이 0)
INSERT INTO member VALUES ('master', '000000000000', 'master',  0, '여', 'master', 'master@kosta.com',  '주소b', '전화번호', '선호그룹' , 'temgroup'); 
--일반회원 등록 (group 값이 2)
INSERT INTO member VALUES ('id-0001', '000000000011', '0000',  2, 'female', 'id-0001', 'id-0001@kosta.com',  '주소b', '전화번호', '선호그룹', 'temgroup' );
INSERT INTO member VALUES ('id-0002', '000000000001', '0000',  2, 'female', 'id-0002', 'id-0002@kosta.com', '주소b', '전화번호', '선호그룹' , 'temgroup');
INSERT INTO member VALUES ('id-0003', '000000000002', '0000',  2, 'female', 'id-0003', 'id-0003@kosta.com', '주소c', '전화번호', '선호그룹','temgroup');
INSERT INTO member VALUES ('id-0004', '000000000003', '0000',  2, 'female', 'id-0004', 'id-0004@kosta.com', '주소d', '전화번호', '선호그룹' ,'temgroup');
INSERT INTO member VALUES ('id-0005', '000000000004', '0000',  2, 'female', 'id-0005', 'id-0005@kosta.com', '주소e', '전화번호', '선호그룹' ,'temgroup');
INSERT INTO member VALUES ('id-0006', '000000000005', '0000',  2, 'female', 'id-0006', 'id-0006@kosta.com', '주소f', '전화번호', '선호그룹' ,'temgroup');
--admin
INSERT INTO member VALUES ('admin1', '000000000006', 'master',  1, '여', 'admin1', 'admin@kosta.com', null , null, null ,'temgroup'); 
INSERT INTO member VALUES ('admin2', '000000000007', 'master',  1, '여', 'admin2', 'admin@kosta.com', null , null, null ,'temgroup'); 
INSERT INTO member VALUES ('admin3', '000000000008', 'master',  1, '여', 'admin3', 'admin@kosta.com', null , null, null ,'temgroup'); 


--manager
INSERT INTO member VALUES ('manager1', '000000000013', '0000',  11, 'male', 'JYP메니져이름', 'jyp@jyp.jyp', 'JYP주소', '전화번호', '선호그룹'  ,'temgroup' );
INSERT INTO member VALUES ('manager2', '000000000009', '0000',  12, 'male', 'SM메니져', 'jyp@kosta', 'JYP주소', '전화번호', '선호그룹'   ,'temgroup');
INSERT INTO member VALUES ('manager3', '000000000012', '0000',  13, 'male', 'YG메니져', 'YG@yg.yg', 'JYP주소', '전화번호', '선호그룹'   ,'temgroup');

--manager(매니저가 되기 위해 대기중인 매니저)
INSERT INTO member VALUES ('manager4', '000000000102', '0000',  3, 'male', 'JYP메니져이름DD', 'jyp@jyp.jyp', 'JYP주소', '전화번호', '선호그룹'  ,'temgroup' );
INSERT INTO member VALUES ('manager5', '000000000100', '0000',  3, 'male', 'SM메니져', 'jyp@kosta', 'JYP주소', '전화번호', '선호그룹'  ,'temgroup' );
INSERT INTO member VALUES ('manager6', '000000000101', '0000',  3, 'male', 'YG메니져', 'YG@yg.yg', 'JYP주소', '전화번호', '선호그룹'   ,'temgroup');
INSERT INTO member VALUES ('manager7', '000000000105', '0000',  3, 'male', 'YG메니져', 'YG@yg.yg', 'JYP주소', '전화번호', '선호그룹'   ,'temgroup');
INSERT INTO member VALUES ('manager8', '000000000106', '0000',  3, 'male', 'YG메니져', 'YG@yg.yg', 'JYP주소', '전화번호', '선호그룹'   ,'temgroup');

INSERT INTO member VALUES ('manager10', '000000002', '0000',  3, 'male', 'JYP메니져이름DD', 'jyp@jyp.jyp', 'JYP주소', '전화번호', '선호그룹'  ,'temgroup' );
INSERT INTO member VALUES ('manager11', '000000003', '0000',  3, 'male', 'SM메니져', 'jyp@kosta', 'JYP주소', '전화번호', '선호그룹'  ,'temgroup' );
INSERT INTO member VALUES ('manager12', '000000004', '0000',  3, 'male', 'YG메니져', 'YG@yg.yg', 'JYP주소', '전화번호', '선호그룹'   ,'temgroup');
INSERT INTO member VALUES ('manager13', '000000005', '0000',  3, 'male', 'YG메니져', 'YG@yg.yg', 'JYP주소', '전화번호', '선호그룹'   ,'temgroup');
INSERT INTO member VALUES ('manager14', '000000006', '0000',  3, 'male', 'YG메니져', 'YG@yg.yg', 'JYP주소', '전화번호', '선호그룹'   ,'temgroup');



commit

delete from member where m_id='manager8';


INSERT INTO type_list VALUES('여자그룹' , 'singer_type');
INSERT INTO type_list VALUES('남자그룹' , 'singer_type');
INSERT INTO type_list VALUES('여자솔로' , 'singer_type');
INSERT INTO type_list VALUES('남자솔로' , 'singer_type');
INSERT INTO type_list VALUES('혼성그룹' , 'singer_type');
INSERT INTO type_list VALUES('기타' , 'singer_type');

INSERT INTO type_list VALUES('TV' , 'event_type');
INSERT INTO type_list VALUES('공연' , 'event_type');
INSERT INTO type_list VALUES('촬영' , 'event_type');

INSERT INTO type_list VALUES('가수' , 'search_type');
INSERT INTO type_list VALUES('회사' , 'search_type');
INSERT INTO type_list VALUES('지역' , 'search_type');

select * from TYPE_LIST
select * from singer;

INSERT INTO singer VALUES(1, '트와이스', 11, '여자그룹', 'twice@jyp.com', 0, '트와이스,twice,TWICE');
INSERT INTO singer VALUES(2, '에이핑크', 14, '여자그룹', 'apink@PlanA.com', 0, '에이핑크,apink,A-PINK,a-pink,APINK');
INSERT INTO singer VALUES(3, '소녀시대', 12, '여자그룹', 'snsd@sm.com', 0, '소녀시대,snsd,girlsgeneration');
INSERT INTO singer VALUES(4, '아이오아이', 12, '여자그룹', 'ioi@sm.com', 0, '아이오아이,ioi,i.o.i,IOI,I.O.I,101');

INSERT INTO singer VALUES(5, '슈퍼주니어', 12, '남자그룹', 'superjunior@sm.com', 0, '슈퍼주니어,super,superjunior,junior,SUPER');
INSERT INTO singer VALUES(6, '빅뱅', 13, '남자그룹', 'bigbang@yg.com', 0, '빅뱅,bigbang,BIGBANG,BigBang,비그방');
INSERT INTO singer VALUES(7, '2PM', 14, '남자그룹', '2pm@jyp.com', 0, '투피엠,2pm,2PM,TWOPM,TWO,two');
INSERT INTO singer VALUES(8, '2AM', 14, '남자그룹', '2am@jyp.com', 0, '투에이엠,2am,2AM,TWO,two');

INSERT INTO singer VALUES(9, '거미', 13, '여자솔로', 'spider@yg.com', 0, '거미,스파이더,spider');
INSERT INTO singer VALUES(10, '아이유', 13, '여자솔로', 'iu@yg.com', 0, '아이유,IU,iu');
INSERT INTO singer VALUES(11, '에일리', 13, '여자솔로', '에일리@yg.com', 0, '에일리,alie,Alie');
INSERT INTO singer VALUES(12, '벤', 13, '여자솔로', 'ben@yg.com', 0, 'ben,벤,밴,van,ven,ban');

INSERT INTO singer VALUES(13, '임창정', 13, '남자솔로', 'im@yg.com', 0, '임창정');
INSERT INTO singer VALUES(14, '허각', 13, '남자솔로', 'her@yg.com', 0, '허각, 허 각');
INSERT INTO singer VALUES(15, '서인국', 13, '남자솔로', 'seo@yg.com', 0, '서인국, ');
INSERT INTO singer VALUES(16, '김연우', 13, '남자솔로', 'kimY@yg.com', 0, '김연우');

INSERT INTO singer VALUES(17, '쿨', 12, '혼성그룹', 'kimY@yg.com', 0, '쿨,cool');
INSERT INTO singer VALUES(18, '코요테', 11, '혼성그룹', 'kimY@yg.com', 0, '코요테,koyote');
INSERT INTO singer VALUES(19, '악동뮤지션', 14, '혼성그룹', 'kimY@yg.com', 0, '악동뮤지션,악뮤,akmu');
INSERT INTO singer VALUES(20, '클레지콰이', 12, '혼성그룹', 'kimY@yg.com', 0, '클레지콰이');


--main link 등록
insert into  link_list values ('main_link',null, null, 1);
insert into  link_list values ('main_link',null, null, 2);
insert into  link_list values ('main_link',null, null, 3);
insert into  link_list values ('main_link',null, null, 4);
insert into  link_list values ('main_link',null, null, 5);
insert into  link_list values ('main_link',null, null, 6);
insert into  link_list values ('main_link',null, null, 7);



commit;

<<<<<<< HEAD




commit




select * from member where group_id=3
select * from groups

SELECT * from schedule
FROM schedule s, singer sn, groups g
WHERE s.m_id = 'manager3' and s.singer_id = sn.singer_id and s.group_id = g.group_id and sn.group_id=g.group_id and s.schedule_start > '2016-06-03T'
ORDER BY schedule_start DESC
=======
>>>>>>> branch 'master' of https://github.com/sujinSuay/project.git

