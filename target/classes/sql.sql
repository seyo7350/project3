   drop table INSTA_MEMBER
   cascade constraint;
   
   drop sequence SEQ_INSTA_MEMBER
   
CREATE TABLE INSTA_MEMBER(
		SEQ NUMBER(8) PRIMARY KEY,
		ID VARCHAR2(50) NOT NULL,
		PWD VARCHAR2(50) NOT NULL,
		EMAIL VARCHAR2(50) NOT NULL,
		NAME VARCHAR2(50) NOT NULL,
		REGI_DATE DATE NOT NULL,
		OPEN NUMBER(2),
		PROFILE_IMAGE VARCHAR2(500)
		HOMEPAGE VARCHAR2(500)
	);

	CREATE SEQUENCE SEQ_INSTA_MEMBER;
	
	select * from INSTA_MEMBER
   
   update INSTA_MEMBER set pwd='11' where seq=1
   
   
   --팔로우 관련
   
CREATE TABLE INSTA_FOLLOW(
	SEQ NUMBER(8) PRIMARY KEY,
	MEMBER_SEQ NUMBER(8) NOT NULL,
	FOLLOW NUMBER(8) NOT NULL,	
	FOLLOW_CONNECT NUMBER(8) NOT NULL 
	);
	
CREATE SEQUENCE SEQ_INSTA_FOLLOW;

ALTER TABLE INSTA_FOLLOW
ADD CONSTRAINT FK_INSTA_FOLLOW_MEMBER_SEQ FOREIGN KEY(MEMBER_SEQ)
REFERENCES INSTA_MEMBER(SEQ);

ALTER TABLE INSTA_FOLLOW
ADD CONSTRAINT FK_INSTA_FOLLOW_FOLLOW FOREIGN KEY(FOLLOW)
REFERENCES INSTA_MEMBER(SEQ);	
 
DROP TABLE INSTA_FOLLOW
CASCADE CONSTRAINT;

DROP SEQUENCE SEQ_INSTA_FOLLOW;
