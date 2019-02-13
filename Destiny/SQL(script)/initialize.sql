
ALTER TABLE comments DROP CONSTRAINT fk_comment_target_no ;
DROP TABLE push_alam_list;
DROP TABLE push_alam;
DROP TABLE complain;
DROP TABLE comments;
DROP TABLE upload;
DROP TABLE community;
DROP TABLE meeting_act_crew_list;
DROP TABLE meeting_crew_list;
DROP TABLE meeting_act;
DROP TABLE meeting;
DROP TABLE chatting;
DROP TABLE letter;
DROP TABLE users;
DROP TABLE age_range;
DROP TABLE telepathy;
DROP TABLE location;
DROP TABLE interest;
DROP TABLE type;




DROP SEQUENCE seq_type_no;
DROP SEQUENCE seq_interest_no;
DROP SEQUENCE seq_location_no;
DROP SEQUENCE seq_telepathy_no;
DROP SEQUENCE seq_letter_no;
DROP SEQUENCE seq_chatting_no;
DROP SEQUENCE seq_meeting_no;
DROP SEQUENCE seq_meeting_act_no;
DROP SEQUENCE seq_meeting_crew_no;
DROP SEQUENCE seq_meeting_act_crew_no;
DROP SEQUENCE seq_community_no;
DROP SEQUENCE seq_upload_no;
DROP SEQUENCE seq_comment_no;
DROP SEQUENCE seq_complain_no;
DROP SEQUENCE seq_push_alam_no;
DROP SEQUENCE seq_push_alam_list_no;




CREATE SEQUENCE seq_type_no INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_interest_no INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_location_no INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_telepathy_no INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_letter_no INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_chatting_no INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_meeting_no INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_meeting_act_no INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_meeting_crew_no INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_meeting_act_crew_no INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_community_no	INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_upload_no	INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_comment_no	INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_complain_no	INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_push_alam_no INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_push_alam_list_no INCREMENT BY 1 START WITH 10000;




CREATE TABLE type(
    type_no					NUMBER			NOT NULL,
    type_name				VARCHAR2(5)		NOT NULL,
    type_img					VARCHAR2(50)		NOT NULL,
    PRIMARY KEY(type_no)
);

CREATE TABLE interest(
    interest_no				NUMBER			NOT NULL,
    interest_name				VARCHAR2(20)		NOT NULL,
    PRIMARY KEY(interest_no)
);

CREATE TABLE location(
    location_no				NUMBER			NOT NULL,
    city_name					VARCHAR2(30),
    town_name				VARCHAR2(30),
    PRIMARY KEY(location_no)
);

CREATE TABLE telepathy(
    telepathy_no 	 			NUMBER 			NOT NULL,
    telepathy_question	 		VARCHAR2(100)		NOT NULL,
    ex_one	 				VARCHAR2(50) 		NOT NULL,
    ex_two	  				VARCHAR2(50)		NOT NULL,
    ex_one_img	  			VARCHAR2(50)		NOT NULL,
    ex_two_img	  			VARCHAR2(50)		NOT NULL,
    PRIMARY KEY(telepathy_no)
);

CREATE TABLE age_range(
    age_range_no 	 			NUMBER 			NOT NULL,
    low_age	 				NUMBER,
    high_age	 				NUMBER,
    PRIMARY KEY(age_range_no)
);

CREATE TABLE users (
    user_id						VARCHAR2(20)		NOT NULL,
    nick_name						VARCHAR2(20)		NOT NULL,
    user_grade					CHAR(3)				NOT NULL,
    password						VARCHAR2(20)		NOT NULL,
    email							VARCHAR2(50)		NOT NULL,
    birthday						DATE				NOT NULL,
    address						VARCHAR2(30)		NOT NULL,
    profile_img					VARCHAR2(50)		NOT NULL,
    gender						CHAR(1)				NOT NULL,
    phone							VARCHAR2(14)		NOT NULL,
    attend_count					NUMBER			NOT NULL,
    last_login_day					DATE				NOT NULL,
    warning_count					NUMBER			NOT NULL,
    my_type						NUMBER						REFERENCES type(type_no),		
    first_type						NUMBER						REFERENCES type(type_no),		
    second_type					NUMBER						REFERENCES type(type_no),		
    thrid_type						NUMBER						REFERENCES type(type_no),		
    first_interest					NUMBER			NOT NULL	REFERENCES interest(interest_no),
    second_interest				NUMBER			NOT NULL	REFERENCES interest(interest_no),
    third_interest 					NUMBER			NOT NULL	REFERENCES interest(interest_no),
    PRIMARY KEY(user_id)
);



CREATE TABLE letter(
    letter_no						NUMBER			NOT NULL,
    sender_id						VARCHAR2(20)		NOT NULL	REFERENCES users(user_id),
    receiver_id					VARCHAR2(20)		NOT NULL	REFERENCES users(user_id),
    send_date						DATE				NOT NULL,
    receive_date					DATE				NOT NULL,
    letter_detail					VARCHAR2(50)		NOT NULL,
    letter_title						VARCHAR2(25)		NOT NULL,
    PRIMARY KEY(letter_no)
);



CREATE TABLE chatting(
    chatting_no 					NUMBER 			NOT NULL,
    man_id	 					VARCHAR2(20) 		NOT NULL	 REFERENCES users(user_id),
    woman_id						VARCHAR2(20) 		NOT NULL	 REFERENCES users(user_id),
    chatting_date					 DATE 				NOT NULL,
    contact_meeting				CHAR(1) 			NOT NULL,
    PRIMARY KEY(chatting_no)
);



CREATE TABLE meeting ( 
   meeting_no					NUMBER			NOT NULL,
   role							CHAR(3)				NOT NULL,
   meeting_master_id				VARCHAR2(20)		NOT NULL   REFERENCES users(user_id),
   master_profile_img				VARCHAR2(50)		NOT NULL,   
   meeting_name					VARCHAR2(100)		NOT NULL,   
   title_img						VARCHAR2(50)		NOT NULL,   
   meeting_detail					VARCHAR2(300)		NOT NULL,   
   meeting_rule					VARCHAR2(300),
   meeting_interest				NUMBER			NOT NULL,
   meeting_location				VARCHAR2(200)		NOT NULL,   
   meeting_date					DATE,   
   meeting_day					VARCHAR2(10),
   meeting_time					VARCHAR2(30)		NOT NULL,
   snooze						CHAR(1)				NOT NULL,   
   meeting_dues					VARCHAR2(30),      
   meeting_views					NUMBER,   
   meeting_condition				CHAR(3)				NOT NULL,   
   shut_down_date				DATE,         
   meeting_crew_limit				NUMBER			NOT NULL,   
   PRIMARY KEY(meeting_no)
);

CREATE TABLE meeting_act ( 
   meeting_act_no				NUMBER			NOT NULL,
   meeting_no					NUMBER			NOT NULL   REFERENCES meeting(meeting_no),
   meeting_act_count				NUMBER			NOT NULL,   
   act_date						DATE				NOT NULL,   
   PRIMARY KEY(meeting_act_no)
);

CREATE TABLE meeting_crew_list ( 
   meeting_crew_no				NUMBER			NOT NULL,
   meeting_no					NUMBER			NOT NULL   REFERENCES meeting(meeting_no),
   crew_id						VARCHAR2(20)		NOT NULL   REFERENCES users(user_id),
   crew_nick_name				VARCHAR2(20)		NOT NULL,   
   role							CHAR(3)				NOT NULL,   
   profile_img						VARCHAR2(50)		NOT NULL,   
   interview_title					VARCHAR2(100)		NOT NULL,   
   interview						VARCHAR2(300)		NOT NULL,   
   crew_condition					CHAR(3)				NOT NULL,   
   PRIMARY KEY(meeting_crew_no) 
);

CREATE TABLE meeting_act_crew_list ( 
   act_crew_no					NUMBER			NOT NULL,
   meeting_act_no				NUMBER			NOT NULL   REFERENCES meeting_act(meeting_act_no),
   meeting_crew_no				NUMBER			NOT NULL   REFERENCES meeting_crew_list(meeting_crew_no),
   act_crew_id					VARCHAR2(20)		NOT NULL,   
   PRIMARY KEY(act_crew_no)
);




CREATE TABLE community(
    community_no					NUMBER			NOT NULL,
    community_writer_id			VARCHAR2(20)					REFERENCES users(user_id),
    meeting_no					NUMBER						REFERENCES meeting(meeting_no),
    category						CHAR(3)				NOT NULL,
    community_user_grade			CHAR(3)				NOT NULL,
    community_title				VARCHAR2(100)		NOT NULL,
    community_writer_nick_name	VARCHAR2(20)		NOT NULL,
    community_detail				CLOB				NOT NULL,
    community_write_date			DATE				NOT NULL,
    community_views				NUMBER			NOT NULL,
    community_like				NUMBER			NOT NULL,
    import_rank					CHAR(1)				NOT NULL,
    community_view_condition		CHAR(3)				NOT NULL,
    PRIMARY KEY(community_no)
);


CREATE TABLE UPLOAD(
    upload_no						NUMBER			NOT NULL,
    community_no					NUMBER						REFERENCES community(community_no),
    file_name						VARCHAR2(200)		NOT NULL,
    file_code						CHAR(3)				NOT NULL,
    PRIMARY KEY(upload_no)
);


CREATE TABLE COMMENTS(
    comment_no					NUMBER			NOT NULL,
    community_no					NUMBER						REFERENCES community(community_no),
    comment_writer_id				VARCHAR2(20)					REFERENCES users(user_id),
    comment_detail				VARCHAR2(300)		NOT NULL,
    comment_write_date			DATE				NOT NULL,
    comment_target_no			NUMBER,
    comment_view_condition		CHAR(3)				NOT NULL,
    PRIMARY KEY(comment_no)
);



ALTER TABLE COMMENTS
  ADD CONSTRAINT	fk_comment_target_no	 	FOREIGN KEY(comment_target_no)	REFERENCES comments(comment_no);



CREATE TABLE complain(
  complain_no				NUMBER			NOT NULL,
  complainer_id				VARCHAR2(20)		NOT NULL		REFERENCES users(user_id),
  defendant_id				VARCHAR2(20)		NOT NULL		REFERENCES users(user_id),
  meeting_no					NUMBER							REFERENCES meeting(meeting_no),
  community_no				NUMBER							REFERENCES community(community_no),
  comment_no				NUMBER							REFERENCES comments(comment_no),
  complain_detail				VARCHAR2(400)		NOT NULL,
  complain_type				CHAR(3)				NOT NULL,
  complain_kind				CHAR(2)				NOT NULL,
  complain_date				DATE				NOT NULL,
  complain_check_date		DATE,
  complain_state				CHAR(3),
  PRIMARY KEY(complain_no)
);




CREATE TABLE push_alam(
	push_alam_no			NUMBER		NOT NULL,
	push_set_user_id			VARCHAR2(20)	NOT NULL	REFERENCES users(user_id),
	letter_on_off				CHAR(1)			NOT NULL,
	comment_on_off			CHAR(1)			NOT NULL,
	meeting_apply_on_off	CHAR(1)			NOT NULL,
	regist_meeting_on_off	CHAR(1)			NOT NULL,
	PRIMARY KEY(push_alam_no)
);


CREATE TABLE push_alam_list(
	push_alam_list_no		NUMBER		NOT NULL,
	push_alam_no			NUMBER		NOT NULL	REFERENCES push_alam(push_alam_no),
	push_user_id				VARCHAR2(20)	NOT NULL,	
	push_detail				VARCHAR2(500)	NOT NULL,	
	push_date				DATE			NOT NULL, 	
	letter_no				NUMBER					REFERENCES letter(letter_no),
	community_no			NUMBER					REFERENCES community(community_no),
	meeting_no				NUMBER					REFERENCES meeting(meeting_no),
	comment_no			NUMBER					REFERENCES comments(comment_no),
	PRIMARY KEY(push_alam_list_no)
);


commit;



INSERT INTO interest VALUES (seq_interest_no.nextval,'아웃도어/여행');
INSERT INTO interest VALUES (seq_interest_no.nextval,'운동/스포츠');
INSERT INTO interest VALUES (seq_interest_no.nextval,'인문학/책/글');
INSERT INTO interest VALUES (seq_interest_no.nextval,'업종/직무');
INSERT INTO interest VALUES (seq_interest_no.nextval,'외국/언어');
INSERT INTO interest VALUES (seq_interest_no.nextval,'문화/공연/축제');
INSERT INTO interest VALUES (seq_interest_no.nextval,'음악/악기');
INSERT INTO interest VALUES (seq_interest_no.nextval,'공예/만들기');
INSERT INTO interest VALUES (seq_interest_no.nextval,'댄스/무용');
INSERT INTO interest VALUES (seq_interest_no.nextval,'봉사활동');
INSERT INTO interest VALUES (seq_interest_no.nextval,'사교/인맥');
INSERT INTO interest VALUES (seq_interest_no.nextval,'차/오토바이');
INSERT INTO interest VALUES (seq_interest_no.nextval,'사진/영상');
INSERT INTO interest VALUES (seq_interest_no.nextval,'야구관람');
INSERT INTO interest VALUES (seq_interest_no.nextval,'게임/오락');
INSERT INTO interest VALUES (seq_interest_no.nextval,'요리/제조');
INSERT INTO interest VALUES (seq_interest_no.nextval,'반려동물');
INSERT INTO interest VALUES (seq_interest_no.nextval,'가족/결혼');
INSERT INTO interest VALUES (seq_interest_no.nextval,'함께해요');

commit;


insert into location values (seq_location_no.nextval,'서울','강남구');
insert into location values (seq_location_no.nextval,'서울','강동구');
insert into location values (seq_location_no.nextval,'서울','강북구');
insert into location values (seq_location_no.nextval,'서울','강서구');
insert into location values (seq_location_no.nextval,'서울','관악구');
insert into location values (seq_location_no.nextval,'서울','광진구');
insert into location values (seq_location_no.nextval,'서울','구로구');
insert into location values (seq_location_no.nextval,'서울','금천구');
insert into location values (seq_location_no.nextval,'서울','노원구');
insert into location values (seq_location_no.nextval,'서울','도봉구');
insert into location values (seq_location_no.nextval,'서울','동대문구');
insert into location values (seq_location_no.nextval,'서울','동작구');
insert into location values (seq_location_no.nextval,'서울','마포구');
insert into location values (seq_location_no.nextval,'서울','서대문구');
insert into location values (seq_location_no.nextval,'서울','서초구');
insert into location values (seq_location_no.nextval,'서울','성동구');
insert into location values (seq_location_no.nextval,'서울','성북구');
insert into location values (seq_location_no.nextval,'서울','송파구');
insert into location values (seq_location_no.nextval,'서울','양천구');
insert into location values (seq_location_no.nextval,'서울','영등포구');
insert into location values (seq_location_no.nextval,'서울','용산구');
insert into location values (seq_location_no.nextval,'서울','은평구');
insert into location values (seq_location_no.nextval,'서울','종로구');
insert into location values (seq_location_no.nextval,'서울','중구');
insert into location values (seq_location_no.nextval,'서울','중랑구');

insert into location values (seq_location_no.nextval,'경기','가평군');
insert into location values (seq_location_no.nextval,'경기','고양시');
insert into location values (seq_location_no.nextval,'경기','고양시 덕양구');
insert into location values (seq_location_no.nextval,'경기','고양시 일산동구');
insert into location values (seq_location_no.nextval,'경기','고양시 일산서구');
insert into location values (seq_location_no.nextval,'경기','과천시');
insert into location values (seq_location_no.nextval,'경기','광명시');
insert into location values (seq_location_no.nextval,'경기','광주시');
insert into location values (seq_location_no.nextval,'경기','구리시');
insert into location values (seq_location_no.nextval,'경기','군포시');
insert into location values (seq_location_no.nextval,'경기','김포시');
insert into location values (seq_location_no.nextval,'경기','남양주시');
insert into location values (seq_location_no.nextval,'경기','동두천시');
insert into location values (seq_location_no.nextval,'경기','부천시');
insert into location values (seq_location_no.nextval,'경기','부천시 소사구');
insert into location values (seq_location_no.nextval,'경기','부천시 오정구');
insert into location values (seq_location_no.nextval,'경기','부천시 원미구');
insert into location values (seq_location_no.nextval,'경기','성남시');
insert into location values (seq_location_no.nextval,'경기','성남시 분당구');
insert into location values (seq_location_no.nextval,'경기','성남시 수정구');
insert into location values (seq_location_no.nextval,'경기','성남시 중원구');
insert into location values (seq_location_no.nextval,'경기','수원시');
insert into location values (seq_location_no.nextval,'경기','수원시 권선구');
insert into location values (seq_location_no.nextval,'경기','수원시 영통구');
insert into location values (seq_location_no.nextval,'경기','수원시 장안구');
insert into location values (seq_location_no.nextval,'경기','수원시 팔달구');
insert into location values (seq_location_no.nextval,'경기','시흥시');
insert into location values (seq_location_no.nextval,'경기','안산시');
insert into location values (seq_location_no.nextval,'경기','안산시 단원구');
insert into location values (seq_location_no.nextval,'경기','안산시 상록구');
insert into location values (seq_location_no.nextval,'경기','안성시');
insert into location values (seq_location_no.nextval,'경기','안양시');
insert into location values (seq_location_no.nextval,'경기','안양시 동안구');
insert into location values (seq_location_no.nextval,'경기','안양시 만안구');
insert into location values (seq_location_no.nextval,'경기','양주시');
insert into location values (seq_location_no.nextval,'경기','양평군');
insert into location values (seq_location_no.nextval,'경기','여주시');
insert into location values (seq_location_no.nextval,'경기','연천구');
insert into location values (seq_location_no.nextval,'경기','오산시');
insert into location values (seq_location_no.nextval,'경기','용인시');
insert into location values (seq_location_no.nextval,'경기','용인시 기흥구');
insert into location values (seq_location_no.nextval,'경기','용인시 수지구');
insert into location values (seq_location_no.nextval,'경기','용인시 처안구');
insert into location values (seq_location_no.nextval,'경기','의왕시');
insert into location values (seq_location_no.nextval,'경기','의정부시');
insert into location values (seq_location_no.nextval,'경기','이천시');
insert into location values (seq_location_no.nextval,'경기','파주시');
insert into location values (seq_location_no.nextval,'경기','평택시');
insert into location values (seq_location_no.nextval,'경기','포천시');
insert into location values (seq_location_no.nextval,'경기','하남시');
insert into location values (seq_location_no.nextval,'경기','화성시');

insert into location values (seq_location_no.nextval,'인천','강화군');
insert into location values (seq_location_no.nextval,'인천','계양구');
insert into location values (seq_location_no.nextval,'인천','남구');
insert into location values (seq_location_no.nextval,'인천','남동구');
insert into location values (seq_location_no.nextval,'인천','동구');
insert into location values (seq_location_no.nextval,'인천','부평구');
insert into location values (seq_location_no.nextval,'인천','서구');
insert into location values (seq_location_no.nextval,'인천','연수구');
insert into location values (seq_location_no.nextval,'인천','옹진군');
insert into location values (seq_location_no.nextval,'인천','중구');

insert into location values (seq_location_no.nextval,'부산','강서구');
insert into location values (seq_location_no.nextval,'부산','금정구');
insert into location values (seq_location_no.nextval,'부산','기장군');
insert into location values (seq_location_no.nextval,'부산','남구');
insert into location values (seq_location_no.nextval,'부산','동구');
insert into location values (seq_location_no.nextval,'부산','동래구');
insert into location values (seq_location_no.nextval,'부산','부산진구');
insert into location values (seq_location_no.nextval,'부산','북구');
insert into location values (seq_location_no.nextval,'부산','사상구');
insert into location values (seq_location_no.nextval,'부산','사하구');
insert into location values (seq_location_no.nextval,'부산','서구');
insert into location values (seq_location_no.nextval,'부산','수영구');
insert into location values (seq_location_no.nextval,'부산','연제구');
insert into location values (seq_location_no.nextval,'부산','영도구');
insert into location values (seq_location_no.nextval,'부산','중구');
insert into location values (seq_location_no.nextval,'부산','해운대구');

insert into location values (seq_location_no.nextval,'대구','남구');
insert into location values (seq_location_no.nextval,'대구','달서구');
insert into location values (seq_location_no.nextval,'대구','달성군');
insert into location values (seq_location_no.nextval,'대구','동구');
insert into location values (seq_location_no.nextval,'대구','북구');
insert into location values (seq_location_no.nextval,'대구','서구');
insert into location values (seq_location_no.nextval,'대구','수성구');
insert into location values (seq_location_no.nextval,'대구','중구');

insert into location values (seq_location_no.nextval,'광주','광산구');
insert into location values (seq_location_no.nextval,'광주','남구');
insert into location values (seq_location_no.nextval,'광주','동구');
insert into location values (seq_location_no.nextval,'광주','북구');
insert into location values (seq_location_no.nextval,'광주','서구');

insert into location values (seq_location_no.nextval,'대전','대덕구');
insert into location values (seq_location_no.nextval,'대전','동구');
insert into location values (seq_location_no.nextval,'대전','서구');
insert into location values (seq_location_no.nextval,'대전','유성구');
insert into location values (seq_location_no.nextval,'대전','중구');

insert into location values (seq_location_no.nextval,'울산','남구');
insert into location values (seq_location_no.nextval,'울산','동구');
insert into location values (seq_location_no.nextval,'울산','북구');
insert into location values (seq_location_no.nextval,'울산','울주구');
insert into location values (seq_location_no.nextval,'울산','중구');

insert into location values (seq_location_no.nextval,'세종','세종특별자치시');

insert into location values (seq_location_no.nextval,'강원','강릉시');
insert into location values (seq_location_no.nextval,'강원','고성군');
insert into location values (seq_location_no.nextval,'강원','동해시');
insert into location values (seq_location_no.nextval,'강원','삼척시');
insert into location values (seq_location_no.nextval,'강원','속초시');
insert into location values (seq_location_no.nextval,'강원','양구군');
insert into location values (seq_location_no.nextval,'강원','양양군');
insert into location values (seq_location_no.nextval,'강원','영월군');
insert into location values (seq_location_no.nextval,'강원','원주시');
insert into location values (seq_location_no.nextval,'강원','인제군');
insert into location values (seq_location_no.nextval,'강원','정선군');
insert into location values (seq_location_no.nextval,'강원','철원군');
insert into location values (seq_location_no.nextval,'강원','춘천시');
insert into location values (seq_location_no.nextval,'강원','태백시');
insert into location values (seq_location_no.nextval,'강원','평창군');
insert into location values (seq_location_no.nextval,'강원','홍천군');
insert into location values (seq_location_no.nextval,'강원','화천군');
insert into location values (seq_location_no.nextval,'강원','횡성군');

insert into location values (seq_location_no.nextval,'경남','거제시');
insert into location values (seq_location_no.nextval,'경남','거창군');
insert into location values (seq_location_no.nextval,'경남','고성군');
insert into location values (seq_location_no.nextval,'경남','김해시');
insert into location values (seq_location_no.nextval,'경남','남해군');
insert into location values (seq_location_no.nextval,'경남','밀양시');
insert into location values (seq_location_no.nextval,'경남','사천시');
insert into location values (seq_location_no.nextval,'경남','산청군');
insert into location values (seq_location_no.nextval,'경남','양산시');
insert into location values (seq_location_no.nextval,'경남','의령군');
insert into location values (seq_location_no.nextval,'경남','진주시');
insert into location values (seq_location_no.nextval,'경남','창녕군');
insert into location values (seq_location_no.nextval,'경남','창원시');
insert into location values (seq_location_no.nextval,'경남','창원시 마산합포구');
insert into location values (seq_location_no.nextval,'경남','창원시 마산회원구');
insert into location values (seq_location_no.nextval,'경남','창원시 성산구');
insert into location values (seq_location_no.nextval,'경남','창원시 의창구');
insert into location values (seq_location_no.nextval,'경남','창원시 진해구');
insert into location values (seq_location_no.nextval,'경남','통영시');
insert into location values (seq_location_no.nextval,'경남','하동군');
insert into location values (seq_location_no.nextval,'경남','함안군');
insert into location values (seq_location_no.nextval,'경남','함양군');
insert into location values (seq_location_no.nextval,'경남','합천군');

insert into location values (seq_location_no.nextval,'경북','경산시');
insert into location values (seq_location_no.nextval,'경북','경주시');
insert into location values (seq_location_no.nextval,'경북','고령군');
insert into location values (seq_location_no.nextval,'경북','구미시');
insert into location values (seq_location_no.nextval,'경북','군위군');
insert into location values (seq_location_no.nextval,'경북','김천시');
insert into location values (seq_location_no.nextval,'경북','문경시');
insert into location values (seq_location_no.nextval,'경북','봉화군');
insert into location values (seq_location_no.nextval,'경북','상주시');
insert into location values (seq_location_no.nextval,'경북','성주군');
insert into location values (seq_location_no.nextval,'경북','안동시');
insert into location values (seq_location_no.nextval,'경북','영덕군');
insert into location values (seq_location_no.nextval,'경북','영양군');
insert into location values (seq_location_no.nextval,'경북','영주시');
insert into location values (seq_location_no.nextval,'경북','영천시');
insert into location values (seq_location_no.nextval,'경북','예천군');
insert into location values (seq_location_no.nextval,'경북','울릉군');
insert into location values (seq_location_no.nextval,'경북','울진군');
insert into location values (seq_location_no.nextval,'경북','의성군');
insert into location values (seq_location_no.nextval,'경북','청도군');
insert into location values (seq_location_no.nextval,'경북','청송군');
insert into location values (seq_location_no.nextval,'경북','칠곡군');
insert into location values (seq_location_no.nextval,'경북','포항시');
insert into location values (seq_location_no.nextval,'경북','포항시 남구');
insert into location values (seq_location_no.nextval,'경북','포항시 북구');

insert into location values (seq_location_no.nextval,'전남','강진군');
insert into location values (seq_location_no.nextval,'전남','고흥군');
insert into location values (seq_location_no.nextval,'전남','곡성군');
insert into location values (seq_location_no.nextval,'전남','광양시');
insert into location values (seq_location_no.nextval,'전남','구례군');
insert into location values (seq_location_no.nextval,'전남','나주시');
insert into location values (seq_location_no.nextval,'전남','담양군');
insert into location values (seq_location_no.nextval,'전남','목포시');
insert into location values (seq_location_no.nextval,'전남','무안군');
insert into location values (seq_location_no.nextval,'전남','보성군');
insert into location values (seq_location_no.nextval,'전남','순천시');
insert into location values (seq_location_no.nextval,'전남','신안군');
insert into location values (seq_location_no.nextval,'전남','여수시');
insert into location values (seq_location_no.nextval,'전남','영광군');
insert into location values (seq_location_no.nextval,'전남','영암군');
insert into location values (seq_location_no.nextval,'전남','완도군');
insert into location values (seq_location_no.nextval,'전남','장성군');
insert into location values (seq_location_no.nextval,'전남','장흥군');
insert into location values (seq_location_no.nextval,'전남','진도군');
insert into location values (seq_location_no.nextval,'전남','함평군');
insert into location values (seq_location_no.nextval,'전남','해남군');
insert into location values (seq_location_no.nextval,'전남','화순군');

insert into location values (seq_location_no.nextval,'전북','고창군');
insert into location values (seq_location_no.nextval,'전북','군산시');
insert into location values (seq_location_no.nextval,'전북','김제시');
insert into location values (seq_location_no.nextval,'전북','남원시');
insert into location values (seq_location_no.nextval,'전북','무주군');
insert into location values (seq_location_no.nextval,'전북','부안군');
insert into location values (seq_location_no.nextval,'전북','순창군');
insert into location values (seq_location_no.nextval,'전북','완주군');
insert into location values (seq_location_no.nextval,'전북','익산시');
insert into location values (seq_location_no.nextval,'전북','임실군');
insert into location values (seq_location_no.nextval,'전북','장수군');
insert into location values (seq_location_no.nextval,'전북','전주시');
insert into location values (seq_location_no.nextval,'전북','전주시 덕진구');
insert into location values (seq_location_no.nextval,'전북','전주시 완산구');
insert into location values (seq_location_no.nextval,'전북','정읍시');
insert into location values (seq_location_no.nextval,'전북','진안군');

insert into location values (seq_location_no.nextval,'충남','계룡시');
insert into location values (seq_location_no.nextval,'충남','공주시');
insert into location values (seq_location_no.nextval,'충남','금산군');
insert into location values (seq_location_no.nextval,'충남','논산시');
insert into location values (seq_location_no.nextval,'충남','당진시');
insert into location values (seq_location_no.nextval,'충남','보령시');
insert into location values (seq_location_no.nextval,'충남','부여군');
insert into location values (seq_location_no.nextval,'충남','서산시');
insert into location values (seq_location_no.nextval,'충남','서천군');
insert into location values (seq_location_no.nextval,'충남','아산시');
insert into location values (seq_location_no.nextval,'충남','연기군');
insert into location values (seq_location_no.nextval,'충남','예산군');
insert into location values (seq_location_no.nextval,'충남','천안시');
insert into location values (seq_location_no.nextval,'충남','천안시 동남구');
insert into location values (seq_location_no.nextval,'충남','천안시 서북구');
insert into location values (seq_location_no.nextval,'충남','청양군');
insert into location values (seq_location_no.nextval,'충남','태안군');
insert into location values (seq_location_no.nextval,'충남','홍성군');

insert into location values (seq_location_no.nextval,'충북','괴산군');
insert into location values (seq_location_no.nextval,'충북','단양군');
insert into location values (seq_location_no.nextval,'충북','보은군');
insert into location values (seq_location_no.nextval,'충북','영동군');
insert into location values (seq_location_no.nextval,'충북','옥천군');
insert into location values (seq_location_no.nextval,'충북','음성군');
insert into location values (seq_location_no.nextval,'충북','제천시');
insert into location values (seq_location_no.nextval,'충북','증평군');
insert into location values (seq_location_no.nextval,'충북','진천군');
insert into location values (seq_location_no.nextval,'충북','청원군');
insert into location values (seq_location_no.nextval,'충북','청주시');
insert into location values (seq_location_no.nextval,'충북','청주시 상당구');
insert into location values (seq_location_no.nextval,'충북','청주시 서원구');
insert into location values (seq_location_no.nextval,'충북','청주시 청원구');
insert into location values (seq_location_no.nextval,'충북','청주시 흥덕구');
insert into location values (seq_location_no.nextval,'충북','충주시');

insert into location values (seq_location_no.nextval,'제주','서귀포시');
insert into location values (seq_location_no.nextval,'제주','제주시');

commit;



INSERT INTO type VALUES (seq_type_no.nextval, 'INTJ', 'INTJ.JPG');
INSERT INTO type VALUES (seq_type_no.nextval, 'INTP', 'INTP.JPG');
INSERT INTO type VALUES (seq_type_no.nextval, 'ENTJ', 'ENTJ.JPG');
INSERT INTO type VALUES (seq_type_no.nextval, 'ENTP', 'ENTP.JPG');

INSERT INTO type VALUES (seq_type_no.nextval, 'INFJ', 'INFJ.JPG');
INSERT INTO type VALUES (seq_type_no.nextval, 'INFP', 'INFP.JPG');
INSERT INTO type VALUES (seq_type_no.nextval, 'ENFJ', 'ENFJ.JPG');
INSERT INTO type VALUES (seq_type_no.nextval, 'ENFP', 'ENFP.JPG');

INSERT INTO type VALUES (seq_type_no.nextval, 'ISTJ', 'ISTJ.JPG');
INSERT INTO type VALUES (seq_type_no.nextval, 'ISFJ', 'ISFJ.JPG');
INSERT INTO type VALUES (seq_type_no.nextval, 'ESTJ', 'ESTJ.JPG');
INSERT INTO type VALUES (seq_type_no.nextval, 'ESFJ', 'ESFJ.JPG');

INSERT INTO type VALUES (seq_type_no.nextval, 'ISTP', 'ISTP.JPG');
INSERT INTO type VALUES (seq_type_no.nextval, 'ISFP', 'ISFP.JPG');
INSERT INTO type VALUES (seq_type_no.nextval, 'ESTP', 'ESTP.JPG');
INSERT INTO type VALUES (seq_type_no.nextval, 'ESFP', 'ESFP.JPG');

COMMIT;



INSERT INTO telepathy values (
		seq_telepathy_no.nextval, '선호하는 편의점은?', 'CU', 'GS', 'cu','gs');

INSERT INTO telepathy values (
		seq_telepathy_no.nextval, '좋아하는 계절은?', '여름', '겨울', 'summer', 'winter');

INSERT INTO telepathy values (
		seq_telepathy_no.nextval, '선호하는 스마트폰은?', '아이폰', '갤럭시', 'iphone', 'galaxy');

INSERT INTO telepathy values (
		seq_telepathy_no.nextval, '선호하는 SNS는?', 'Instagram', 'Facebook', 'instagram', 'facebook');

INSERT INTO telepathy values (
		seq_telepathy_no.nextval, '선호하는 영화 장르는?', '액션', '로맨스', 'action','romance');

INSERT INTO telepathy values (
		seq_telepathy_no.nextval, '선호하는 음료는?', '커피', '차(홍차,녹차)', 'coffee', 'tea');

INSERT INTO telepathy values (
		seq_telepathy_no.nextval, '좋아하는 놀이기구는?', '회전목마', '롤러코스터', 'carousel', 'rollercoaster');

INSERT INTO telepathy values (
		seq_telepathy_no.nextval, '쉬는 날에는?', '놀러 나간다', '집에서 쉰다', 'out', 'in');

INSERT INTO telepathy values (
		seq_telepathy_no.nextval, '좋아하는 차종은?', 'Benz', 'BMW', 'benz', 'bmw');

INSERT INTO telepathy values (
		seq_telepathy_no.nextval, '선호하는 주식은?', '밥', '빵', 'rice', 'bread');

INSERT INTO telepathy values (
		seq_telepathy_no.nextval, '선호하는 음식종류는?', '한식', '양식', 'korean', 'western');

INSERT INTO telepathy values (
		seq_telepathy_no.nextval, '선호하는 음식종류는?', '중식', '일식', 'chinese', 'japanese');

INSERT INTO telepathy values (
		seq_telepathy_no.nextval, '선호하는 여행방식은?', '충동', '계획', 'impulse', 'plan');

INSERT INTO telepathy values (
		seq_telepathy_no.nextval, '선호하는 여행은?', '국내', '해외', 'domestic', 'overseas');

INSERT INTO telepathy values (
		seq_telepathy_no.nextval, '선호하는 소설은?', '고전', '현대', 'classic','modern');

INSERT INTO telepathy values (
		seq_telepathy_no.nextval, '탕수육은?', '부먹', '찍먹', 'bumeog', 'jjigmeog');

INSERT INTO telepathy values (
		seq_telepathy_no.nextval, '좋아하는 탐정은?', '코난', '김전일', 'conan', 'kim');

INSERT INTO telepathy values (
		seq_telepathy_no.nextval, '선호하는 데이트 장소는?', '실내', '실외', 'indoor', 'outdoor');

INSERT INTO telepathy values (
		seq_telepathy_no.nextval, '좋아하는 패션은?', '캐쥬얼', '클래식', 'casualfashion', 'classicfashion');

INSERT INTO telepathy values (
		seq_telepathy_no.nextval, '좋아하는 치킨은?', '후라이드', '양념', 'krispy', 'seasoned');

INSERT INTO telepathy values (
		seq_telepathy_no.nextval, '선호하는 여행은?', '휴양', '관광', 'recreation', 'tourism');

INSERT INTO telepathy values (
		seq_telepathy_no.nextval, '선호하는 히어로는?', 'Marvel', 'DC', 'marvel', 'dc');

INSERT INTO telepathy values (
		seq_telepathy_no.nextval, '선호하는 주종은?', '소주', '맥주', 'soju','beer');

INSERT INTO telepathy values (
		seq_telepathy_no.nextval, '엄마 아빠중 더 좋은 사람은?', '엄마', '아빠', 'mother', 'father');

INSERT INTO telepathy values (
		seq_telepathy_no.nextval, '좋아하는 색상은?', '흰색', '검은색', 'white', 'black');

INSERT INTO telepathy values (
		seq_telepathy_no.nextval, '나의 주 활동 시간은?', '밤', '낮', 'night', 'day');

INSERT INTO telepathy values (
		seq_telepathy_no.nextval, '좋아하는 위인은?', '예수', '석가모니', 'jesus', 'buddha');

INSERT INTO telepathy values (
		seq_telepathy_no.nextval, '좋아하는 스포츠는?', '축구', '야구', 'soccer', 'baseball');

INSERT INTO telepathy values (
		seq_telepathy_no.nextval, '자주이용하는 대중교통은?', '버스', '지하철', 'bus', 'subway');

INSERT INTO telepathy values (
		seq_telepathy_no.nextval, '자주보는 TV 프로그램은?', '예능', '드라마', 'entertainment', 'drama');


commit;


INSERT INTO age_range VALUES (1, 20, 24);
INSERT INTO age_range VALUES (2, 25, 29);
INSERT INTO age_range VALUES (3, 30, 34);
INSERT INTO age_range VALUES (4, 35, 39);
INSERT INTO age_range VALUES (5, 40, 44);
INSERT INTO age_range VALUES (6, 45, 49);
INSERT INTO age_range(age_range_no, low_age) VALUES (7, 50);

COMMIT;


