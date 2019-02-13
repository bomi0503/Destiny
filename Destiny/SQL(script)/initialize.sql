
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



INSERT INTO interest VALUES (seq_interest_no.nextval,'�ƿ�����/����');
INSERT INTO interest VALUES (seq_interest_no.nextval,'�/������');
INSERT INTO interest VALUES (seq_interest_no.nextval,'�ι���/å/��');
INSERT INTO interest VALUES (seq_interest_no.nextval,'����/����');
INSERT INTO interest VALUES (seq_interest_no.nextval,'�ܱ�/���');
INSERT INTO interest VALUES (seq_interest_no.nextval,'��ȭ/����/����');
INSERT INTO interest VALUES (seq_interest_no.nextval,'����/�Ǳ�');
INSERT INTO interest VALUES (seq_interest_no.nextval,'����/�����');
INSERT INTO interest VALUES (seq_interest_no.nextval,'��/����');
INSERT INTO interest VALUES (seq_interest_no.nextval,'����Ȱ��');
INSERT INTO interest VALUES (seq_interest_no.nextval,'�米/�θ�');
INSERT INTO interest VALUES (seq_interest_no.nextval,'��/�������');
INSERT INTO interest VALUES (seq_interest_no.nextval,'����/����');
INSERT INTO interest VALUES (seq_interest_no.nextval,'�߱�����');
INSERT INTO interest VALUES (seq_interest_no.nextval,'����/����');
INSERT INTO interest VALUES (seq_interest_no.nextval,'�丮/����');
INSERT INTO interest VALUES (seq_interest_no.nextval,'�ݷ�����');
INSERT INTO interest VALUES (seq_interest_no.nextval,'����/��ȥ');
INSERT INTO interest VALUES (seq_interest_no.nextval,'�Բ��ؿ�');

commit;


insert into location values (seq_location_no.nextval,'����','������');
insert into location values (seq_location_no.nextval,'����','������');
insert into location values (seq_location_no.nextval,'����','���ϱ�');
insert into location values (seq_location_no.nextval,'����','������');
insert into location values (seq_location_no.nextval,'����','���Ǳ�');
insert into location values (seq_location_no.nextval,'����','������');
insert into location values (seq_location_no.nextval,'����','���α�');
insert into location values (seq_location_no.nextval,'����','��õ��');
insert into location values (seq_location_no.nextval,'����','�����');
insert into location values (seq_location_no.nextval,'����','������');
insert into location values (seq_location_no.nextval,'����','���빮��');
insert into location values (seq_location_no.nextval,'����','���۱�');
insert into location values (seq_location_no.nextval,'����','������');
insert into location values (seq_location_no.nextval,'����','���빮��');
insert into location values (seq_location_no.nextval,'����','���ʱ�');
insert into location values (seq_location_no.nextval,'����','������');
insert into location values (seq_location_no.nextval,'����','���ϱ�');
insert into location values (seq_location_no.nextval,'����','���ı�');
insert into location values (seq_location_no.nextval,'����','��õ��');
insert into location values (seq_location_no.nextval,'����','��������');
insert into location values (seq_location_no.nextval,'����','��걸');
insert into location values (seq_location_no.nextval,'����','����');
insert into location values (seq_location_no.nextval,'����','���α�');
insert into location values (seq_location_no.nextval,'����','�߱�');
insert into location values (seq_location_no.nextval,'����','�߶���');

insert into location values (seq_location_no.nextval,'���','����');
insert into location values (seq_location_no.nextval,'���','����');
insert into location values (seq_location_no.nextval,'���','���� ���籸');
insert into location values (seq_location_no.nextval,'���','���� �ϻ굿��');
insert into location values (seq_location_no.nextval,'���','���� �ϻ꼭��');
insert into location values (seq_location_no.nextval,'���','��õ��');
insert into location values (seq_location_no.nextval,'���','�����');
insert into location values (seq_location_no.nextval,'���','���ֽ�');
insert into location values (seq_location_no.nextval,'���','������');
insert into location values (seq_location_no.nextval,'���','������');
insert into location values (seq_location_no.nextval,'���','������');
insert into location values (seq_location_no.nextval,'���','�����ֽ�');
insert into location values (seq_location_no.nextval,'���','����õ��');
insert into location values (seq_location_no.nextval,'���','��õ��');
insert into location values (seq_location_no.nextval,'���','��õ�� �һ籸');
insert into location values (seq_location_no.nextval,'���','��õ�� ������');
insert into location values (seq_location_no.nextval,'���','��õ�� ���̱�');
insert into location values (seq_location_no.nextval,'���','������');
insert into location values (seq_location_no.nextval,'���','������ �д籸');
insert into location values (seq_location_no.nextval,'���','������ ������');
insert into location values (seq_location_no.nextval,'���','������ �߿���');
insert into location values (seq_location_no.nextval,'���','������');
insert into location values (seq_location_no.nextval,'���','������ �Ǽ���');
insert into location values (seq_location_no.nextval,'���','������ ���뱸');
insert into location values (seq_location_no.nextval,'���','������ ��ȱ�');
insert into location values (seq_location_no.nextval,'���','������ �ȴޱ�');
insert into location values (seq_location_no.nextval,'���','�����');
insert into location values (seq_location_no.nextval,'���','�Ȼ��');
insert into location values (seq_location_no.nextval,'���','�Ȼ�� �ܿ���');
insert into location values (seq_location_no.nextval,'���','�Ȼ�� ��ϱ�');
insert into location values (seq_location_no.nextval,'���','�ȼ���');
insert into location values (seq_location_no.nextval,'���','�Ⱦ��');
insert into location values (seq_location_no.nextval,'���','�Ⱦ�� ���ȱ�');
insert into location values (seq_location_no.nextval,'���','�Ⱦ�� ���ȱ�');
insert into location values (seq_location_no.nextval,'���','���ֽ�');
insert into location values (seq_location_no.nextval,'���','����');
insert into location values (seq_location_no.nextval,'���','���ֽ�');
insert into location values (seq_location_no.nextval,'���','��õ��');
insert into location values (seq_location_no.nextval,'���','�����');
insert into location values (seq_location_no.nextval,'���','���ν�');
insert into location values (seq_location_no.nextval,'���','���ν� ���ﱸ');
insert into location values (seq_location_no.nextval,'���','���ν� ������');
insert into location values (seq_location_no.nextval,'���','���ν� ó�ȱ�');
insert into location values (seq_location_no.nextval,'���','�ǿս�');
insert into location values (seq_location_no.nextval,'���','�����ν�');
insert into location values (seq_location_no.nextval,'���','��õ��');
insert into location values (seq_location_no.nextval,'���','���ֽ�');
insert into location values (seq_location_no.nextval,'���','���ý�');
insert into location values (seq_location_no.nextval,'���','��õ��');
insert into location values (seq_location_no.nextval,'���','�ϳ���');
insert into location values (seq_location_no.nextval,'���','ȭ����');

insert into location values (seq_location_no.nextval,'��õ','��ȭ��');
insert into location values (seq_location_no.nextval,'��õ','��籸');
insert into location values (seq_location_no.nextval,'��õ','����');
insert into location values (seq_location_no.nextval,'��õ','������');
insert into location values (seq_location_no.nextval,'��õ','����');
insert into location values (seq_location_no.nextval,'��õ','����');
insert into location values (seq_location_no.nextval,'��õ','����');
insert into location values (seq_location_no.nextval,'��õ','������');
insert into location values (seq_location_no.nextval,'��õ','������');
insert into location values (seq_location_no.nextval,'��õ','�߱�');

insert into location values (seq_location_no.nextval,'�λ�','������');
insert into location values (seq_location_no.nextval,'�λ�','������');
insert into location values (seq_location_no.nextval,'�λ�','���屺');
insert into location values (seq_location_no.nextval,'�λ�','����');
insert into location values (seq_location_no.nextval,'�λ�','����');
insert into location values (seq_location_no.nextval,'�λ�','������');
insert into location values (seq_location_no.nextval,'�λ�','�λ�����');
insert into location values (seq_location_no.nextval,'�λ�','�ϱ�');
insert into location values (seq_location_no.nextval,'�λ�','���');
insert into location values (seq_location_no.nextval,'�λ�','���ϱ�');
insert into location values (seq_location_no.nextval,'�λ�','����');
insert into location values (seq_location_no.nextval,'�λ�','������');
insert into location values (seq_location_no.nextval,'�λ�','������');
insert into location values (seq_location_no.nextval,'�λ�','������');
insert into location values (seq_location_no.nextval,'�λ�','�߱�');
insert into location values (seq_location_no.nextval,'�λ�','�ؿ�뱸');

insert into location values (seq_location_no.nextval,'�뱸','����');
insert into location values (seq_location_no.nextval,'�뱸','�޼���');
insert into location values (seq_location_no.nextval,'�뱸','�޼���');
insert into location values (seq_location_no.nextval,'�뱸','����');
insert into location values (seq_location_no.nextval,'�뱸','�ϱ�');
insert into location values (seq_location_no.nextval,'�뱸','����');
insert into location values (seq_location_no.nextval,'�뱸','������');
insert into location values (seq_location_no.nextval,'�뱸','�߱�');

insert into location values (seq_location_no.nextval,'����','���걸');
insert into location values (seq_location_no.nextval,'����','����');
insert into location values (seq_location_no.nextval,'����','����');
insert into location values (seq_location_no.nextval,'����','�ϱ�');
insert into location values (seq_location_no.nextval,'����','����');

insert into location values (seq_location_no.nextval,'����','�����');
insert into location values (seq_location_no.nextval,'����','����');
insert into location values (seq_location_no.nextval,'����','����');
insert into location values (seq_location_no.nextval,'����','������');
insert into location values (seq_location_no.nextval,'����','�߱�');

insert into location values (seq_location_no.nextval,'���','����');
insert into location values (seq_location_no.nextval,'���','����');
insert into location values (seq_location_no.nextval,'���','�ϱ�');
insert into location values (seq_location_no.nextval,'���','���ֱ�');
insert into location values (seq_location_no.nextval,'���','�߱�');

insert into location values (seq_location_no.nextval,'����','����Ư����ġ��');

insert into location values (seq_location_no.nextval,'����','������');
insert into location values (seq_location_no.nextval,'����','����');
insert into location values (seq_location_no.nextval,'����','���ؽ�');
insert into location values (seq_location_no.nextval,'����','��ô��');
insert into location values (seq_location_no.nextval,'����','���ʽ�');
insert into location values (seq_location_no.nextval,'����','�籸��');
insert into location values (seq_location_no.nextval,'����','��籺');
insert into location values (seq_location_no.nextval,'����','������');
insert into location values (seq_location_no.nextval,'����','���ֽ�');
insert into location values (seq_location_no.nextval,'����','������');
insert into location values (seq_location_no.nextval,'����','������');
insert into location values (seq_location_no.nextval,'����','ö����');
insert into location values (seq_location_no.nextval,'����','��õ��');
insert into location values (seq_location_no.nextval,'����','�¹��');
insert into location values (seq_location_no.nextval,'����','��â��');
insert into location values (seq_location_no.nextval,'����','ȫõ��');
insert into location values (seq_location_no.nextval,'����','ȭõ��');
insert into location values (seq_location_no.nextval,'����','Ⱦ����');

insert into location values (seq_location_no.nextval,'�泲','������');
insert into location values (seq_location_no.nextval,'�泲','��â��');
insert into location values (seq_location_no.nextval,'�泲','����');
insert into location values (seq_location_no.nextval,'�泲','���ؽ�');
insert into location values (seq_location_no.nextval,'�泲','���ر�');
insert into location values (seq_location_no.nextval,'�泲','�о��');
insert into location values (seq_location_no.nextval,'�泲','��õ��');
insert into location values (seq_location_no.nextval,'�泲','��û��');
insert into location values (seq_location_no.nextval,'�泲','����');
insert into location values (seq_location_no.nextval,'�泲','�Ƿɱ�');
insert into location values (seq_location_no.nextval,'�泲','���ֽ�');
insert into location values (seq_location_no.nextval,'�泲','â�籺');
insert into location values (seq_location_no.nextval,'�泲','â����');
insert into location values (seq_location_no.nextval,'�泲','â���� ����������');
insert into location values (seq_location_no.nextval,'�泲','â���� ����ȸ����');
insert into location values (seq_location_no.nextval,'�泲','â���� ���걸');
insert into location values (seq_location_no.nextval,'�泲','â���� ��â��');
insert into location values (seq_location_no.nextval,'�泲','â���� ���ر�');
insert into location values (seq_location_no.nextval,'�泲','�뿵��');
insert into location values (seq_location_no.nextval,'�泲','�ϵ���');
insert into location values (seq_location_no.nextval,'�泲','�Ծȱ�');
insert into location values (seq_location_no.nextval,'�泲','�Ծ籺');
insert into location values (seq_location_no.nextval,'�泲','��õ��');

insert into location values (seq_location_no.nextval,'���','����');
insert into location values (seq_location_no.nextval,'���','���ֽ�');
insert into location values (seq_location_no.nextval,'���','��ɱ�');
insert into location values (seq_location_no.nextval,'���','���̽�');
insert into location values (seq_location_no.nextval,'���','������');
insert into location values (seq_location_no.nextval,'���','��õ��');
insert into location values (seq_location_no.nextval,'���','�����');
insert into location values (seq_location_no.nextval,'���','��ȭ��');
insert into location values (seq_location_no.nextval,'���','���ֽ�');
insert into location values (seq_location_no.nextval,'���','���ֱ�');
insert into location values (seq_location_no.nextval,'���','�ȵ���');
insert into location values (seq_location_no.nextval,'���','������');
insert into location values (seq_location_no.nextval,'���','���籺');
insert into location values (seq_location_no.nextval,'���','���ֽ�');
insert into location values (seq_location_no.nextval,'���','��õ��');
insert into location values (seq_location_no.nextval,'���','��õ��');
insert into location values (seq_location_no.nextval,'���','�︪��');
insert into location values (seq_location_no.nextval,'���','������');
insert into location values (seq_location_no.nextval,'���','�Ǽ���');
insert into location values (seq_location_no.nextval,'���','û����');
insert into location values (seq_location_no.nextval,'���','û�۱�');
insert into location values (seq_location_no.nextval,'���','ĥ�');
insert into location values (seq_location_no.nextval,'���','���׽�');
insert into location values (seq_location_no.nextval,'���','���׽� ����');
insert into location values (seq_location_no.nextval,'���','���׽� �ϱ�');

insert into location values (seq_location_no.nextval,'����','������');
insert into location values (seq_location_no.nextval,'����','���ﱺ');
insert into location values (seq_location_no.nextval,'����','���');
insert into location values (seq_location_no.nextval,'����','�����');
insert into location values (seq_location_no.nextval,'����','���ʱ�');
insert into location values (seq_location_no.nextval,'����','���ֽ�');
insert into location values (seq_location_no.nextval,'����','��籺');
insert into location values (seq_location_no.nextval,'����','������');
insert into location values (seq_location_no.nextval,'����','���ȱ�');
insert into location values (seq_location_no.nextval,'����','������');
insert into location values (seq_location_no.nextval,'����','��õ��');
insert into location values (seq_location_no.nextval,'����','�žȱ�');
insert into location values (seq_location_no.nextval,'����','������');
insert into location values (seq_location_no.nextval,'����','������');
insert into location values (seq_location_no.nextval,'����','���ϱ�');
insert into location values (seq_location_no.nextval,'����','�ϵ���');
insert into location values (seq_location_no.nextval,'����','�强��');
insert into location values (seq_location_no.nextval,'����','���ﱺ');
insert into location values (seq_location_no.nextval,'����','������');
insert into location values (seq_location_no.nextval,'����','����');
insert into location values (seq_location_no.nextval,'����','�س���');
insert into location values (seq_location_no.nextval,'����','ȭ����');

insert into location values (seq_location_no.nextval,'����','��â��');
insert into location values (seq_location_no.nextval,'����','�����');
insert into location values (seq_location_no.nextval,'����','������');
insert into location values (seq_location_no.nextval,'����','������');
insert into location values (seq_location_no.nextval,'����','���ֱ�');
insert into location values (seq_location_no.nextval,'����','�ξȱ�');
insert into location values (seq_location_no.nextval,'����','��â��');
insert into location values (seq_location_no.nextval,'����','���ֱ�');
insert into location values (seq_location_no.nextval,'����','�ͻ��');
insert into location values (seq_location_no.nextval,'����','�ӽǱ�');
insert into location values (seq_location_no.nextval,'����','�����');
insert into location values (seq_location_no.nextval,'����','���ֽ�');
insert into location values (seq_location_no.nextval,'����','���ֽ� ������');
insert into location values (seq_location_no.nextval,'����','���ֽ� �ϻ걸');
insert into location values (seq_location_no.nextval,'����','������');
insert into location values (seq_location_no.nextval,'����','���ȱ�');

insert into location values (seq_location_no.nextval,'�泲','����');
insert into location values (seq_location_no.nextval,'�泲','���ֽ�');
insert into location values (seq_location_no.nextval,'�泲','�ݻ걺');
insert into location values (seq_location_no.nextval,'�泲','����');
insert into location values (seq_location_no.nextval,'�泲','������');
insert into location values (seq_location_no.nextval,'�泲','���ɽ�');
insert into location values (seq_location_no.nextval,'�泲','�ο���');
insert into location values (seq_location_no.nextval,'�泲','�����');
insert into location values (seq_location_no.nextval,'�泲','��õ��');
insert into location values (seq_location_no.nextval,'�泲','�ƻ��');
insert into location values (seq_location_no.nextval,'�泲','���ⱺ');
insert into location values (seq_location_no.nextval,'�泲','���걺');
insert into location values (seq_location_no.nextval,'�泲','õ�Ƚ�');
insert into location values (seq_location_no.nextval,'�泲','õ�Ƚ� ������');
insert into location values (seq_location_no.nextval,'�泲','õ�Ƚ� ���ϱ�');
insert into location values (seq_location_no.nextval,'�泲','û�籺');
insert into location values (seq_location_no.nextval,'�泲','�¾ȱ�');
insert into location values (seq_location_no.nextval,'�泲','ȫ����');

insert into location values (seq_location_no.nextval,'���','���걺');
insert into location values (seq_location_no.nextval,'���','�ܾ籺');
insert into location values (seq_location_no.nextval,'���','������');
insert into location values (seq_location_no.nextval,'���','������');
insert into location values (seq_location_no.nextval,'���','��õ��');
insert into location values (seq_location_no.nextval,'���','������');
insert into location values (seq_location_no.nextval,'���','��õ��');
insert into location values (seq_location_no.nextval,'���','����');
insert into location values (seq_location_no.nextval,'���','��õ��');
insert into location values (seq_location_no.nextval,'���','û����');
insert into location values (seq_location_no.nextval,'���','û�ֽ�');
insert into location values (seq_location_no.nextval,'���','û�ֽ� ��籸');
insert into location values (seq_location_no.nextval,'���','û�ֽ� ������');
insert into location values (seq_location_no.nextval,'���','û�ֽ� û����');
insert into location values (seq_location_no.nextval,'���','û�ֽ� �����');
insert into location values (seq_location_no.nextval,'���','���ֽ�');

insert into location values (seq_location_no.nextval,'����','��������');
insert into location values (seq_location_no.nextval,'����','���ֽ�');

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
		seq_telepathy_no.nextval, '��ȣ�ϴ� ��������?', 'CU', 'GS', 'cu','gs');

INSERT INTO telepathy values (
		seq_telepathy_no.nextval, '�����ϴ� ������?', '����', '�ܿ�', 'summer', 'winter');

INSERT INTO telepathy values (
		seq_telepathy_no.nextval, '��ȣ�ϴ� ����Ʈ����?', '������', '������', 'iphone', 'galaxy');

INSERT INTO telepathy values (
		seq_telepathy_no.nextval, '��ȣ�ϴ� SNS��?', 'Instagram', 'Facebook', 'instagram', 'facebook');

INSERT INTO telepathy values (
		seq_telepathy_no.nextval, '��ȣ�ϴ� ��ȭ �帣��?', '�׼�', '�θǽ�', 'action','romance');

INSERT INTO telepathy values (
		seq_telepathy_no.nextval, '��ȣ�ϴ� �����?', 'Ŀ��', '��(ȫ��,����)', 'coffee', 'tea');

INSERT INTO telepathy values (
		seq_telepathy_no.nextval, '�����ϴ� ���̱ⱸ��?', 'ȸ����', '�ѷ��ڽ���', 'carousel', 'rollercoaster');

INSERT INTO telepathy values (
		seq_telepathy_no.nextval, '���� ������?', '� ������', '������ ����', 'out', 'in');

INSERT INTO telepathy values (
		seq_telepathy_no.nextval, '�����ϴ� ������?', 'Benz', 'BMW', 'benz', 'bmw');

INSERT INTO telepathy values (
		seq_telepathy_no.nextval, '��ȣ�ϴ� �ֽ���?', '��', '��', 'rice', 'bread');

INSERT INTO telepathy values (
		seq_telepathy_no.nextval, '��ȣ�ϴ� ����������?', '�ѽ�', '���', 'korean', 'western');

INSERT INTO telepathy values (
		seq_telepathy_no.nextval, '��ȣ�ϴ� ����������?', '�߽�', '�Ͻ�', 'chinese', 'japanese');

INSERT INTO telepathy values (
		seq_telepathy_no.nextval, '��ȣ�ϴ� ��������?', '�浿', '��ȹ', 'impulse', 'plan');

INSERT INTO telepathy values (
		seq_telepathy_no.nextval, '��ȣ�ϴ� ������?', '����', '�ؿ�', 'domestic', 'overseas');

INSERT INTO telepathy values (
		seq_telepathy_no.nextval, '��ȣ�ϴ� �Ҽ���?', '����', '����', 'classic','modern');

INSERT INTO telepathy values (
		seq_telepathy_no.nextval, '��������?', '�θ�', '���', 'bumeog', 'jjigmeog');

INSERT INTO telepathy values (
		seq_telepathy_no.nextval, '�����ϴ� Ž����?', '�ڳ�', '������', 'conan', 'kim');

INSERT INTO telepathy values (
		seq_telepathy_no.nextval, '��ȣ�ϴ� ����Ʈ ��Ҵ�?', '�ǳ�', '�ǿ�', 'indoor', 'outdoor');

INSERT INTO telepathy values (
		seq_telepathy_no.nextval, '�����ϴ� �м���?', 'ĳ���', 'Ŭ����', 'casualfashion', 'classicfashion');

INSERT INTO telepathy values (
		seq_telepathy_no.nextval, '�����ϴ� ġŲ��?', '�Ķ��̵�', '���', 'krispy', 'seasoned');

INSERT INTO telepathy values (
		seq_telepathy_no.nextval, '��ȣ�ϴ� ������?', '�޾�', '����', 'recreation', 'tourism');

INSERT INTO telepathy values (
		seq_telepathy_no.nextval, '��ȣ�ϴ� ����δ�?', 'Marvel', 'DC', 'marvel', 'dc');

INSERT INTO telepathy values (
		seq_telepathy_no.nextval, '��ȣ�ϴ� ������?', '����', '����', 'soju','beer');

INSERT INTO telepathy values (
		seq_telepathy_no.nextval, '���� �ƺ��� �� ���� �����?', '����', '�ƺ�', 'mother', 'father');

INSERT INTO telepathy values (
		seq_telepathy_no.nextval, '�����ϴ� ������?', '���', '������', 'white', 'black');

INSERT INTO telepathy values (
		seq_telepathy_no.nextval, '���� �� Ȱ�� �ð���?', '��', '��', 'night', 'day');

INSERT INTO telepathy values (
		seq_telepathy_no.nextval, '�����ϴ� ������?', '����', '�������', 'jesus', 'buddha');

INSERT INTO telepathy values (
		seq_telepathy_no.nextval, '�����ϴ� ��������?', '�౸', '�߱�', 'soccer', 'baseball');

INSERT INTO telepathy values (
		seq_telepathy_no.nextval, '�����̿��ϴ� ���߱�����?', '����', '����ö', 'bus', 'subway');

INSERT INTO telepathy values (
		seq_telepathy_no.nextval, '���ֺ��� TV ���α׷���?', '����', '���', 'entertainment', 'drama');


commit;


INSERT INTO age_range VALUES (1, 20, 24);
INSERT INTO age_range VALUES (2, 25, 29);
INSERT INTO age_range VALUES (3, 30, 34);
INSERT INTO age_range VALUES (4, 35, 39);
INSERT INTO age_range VALUES (5, 40, 44);
INSERT INTO age_range VALUES (6, 45, 49);
INSERT INTO age_range(age_range_no, low_age) VALUES (7, 50);

COMMIT;


