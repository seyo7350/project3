--멤버

select * from INSTA_MEMBER

drop table INSTA_MEMBER
   cascade constraint;
   
   drop sequence SEQ_INSTA_MEMBER
   
CREATE TABLE INSTA_MEMBER(
		SEQ NUMBER(8) PRIMARY KEY,
		ID VARCHAR2(50) unique,
		PWD VARCHAR2(50) NOT NULL,
		EMAIL VARCHAR2(50) NOT NULL,
		NAME VARCHAR2(50) NOT NULL,
		REGI_DATE DATE NOT NULL,
		INTRO VARCHAR2(1000),
		PROFILE_IMAGE VARCHAR2(500),
		HOMEPAGE VARCHAR2(500)
	);

	CREATE SEQUENCE SEQ_INSTA_MEMBER
	
	--피드
DROP TABLE INSTA_PEED
CASCADE CONSTRAINT

DROP SEQUENCE SEQ_INSTA_PEED

CREATE TABLE INSTA_PEED(
	SEQ NUMBER(8) PRIMARY KEY,
	MEMBER_SEQ NUMBER(8) NOT NULL,
	MEMBER_ID VARCHAR2(50) NOT NULL,
	MEMBER_PROFILE_IMAGE VARCHAR2(500),
	IMAGE VARCHAR2(500) NOT NULL,
	PEED_LIKE NUMBER(38) NOT NULL,
	REGI_DATE DATE NOT NULL,
	CONTENT VARCHAR2(4000)
)

CREATE SEQUENCE SEQ_INSTA_PEED

ALTER TABLE INSTA_PEED
ADD CONSTRAINT FK_INSTA_PEED_MEMBER_SEQ FOREIGN KEY(MEMBER_SEQ)
REFERENCES INSTA_MEMBER(SEQ);

select * from INSTA_PEED

--피드댓글

DROP TABLE INSTA_PEED_REPLY
CASCADE CONSTRAINT

DROP SEQUENCE SEQ_INSTA_PEED_REPLY


CREATE TABLE INSTA_PEED_REPLY(
		SEQ NUMBER(8) PRIMARY KEY,
		PEED_SEQ NUMBER(8) NOT NULL,		
		MEMBER_SEQ NUMBER(8) NOT NULL,
		MEMBER_ID VARCHAR2(50) NOT NULL,
		CONTENT VARCHAR2(4000),
		REGI_DATE DATE NOT NULL
	)

CREATE SEQUENCE SEQ_INSTA_PEED_REPLY;
		
	ALTER TABLE INSTA_PEED_REPLY
	ADD CONSTRAINT FK_INSTA_PEED_REPLY_PEED_SEQ FOREIGN KEY(PEED_SEQ)
	REFERENCES INSTA_PEED(SEQ);

	ALTER TABLE INSTA_PEED_REPLY
	ADD CONSTRAINT FK_INSTA_PEED_REPLY_MEMBER_SEQ FOREIGN KEY(MEMBER_SEQ)
	REFERENCES INSTA_MEMBER(SEQ);
	
	ALTER TABLE INSTA_PEED_REPLY
	ADD CONSTRAINT FK_INSTA_PEED_REPLY_MEMBER_ID FOREIGN KEY(MEMBER_ID)
	REFERENCES INSTA_MEMBER(ID);

--팔로우
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

--해쉬
DROP TABLE INSTA_HASH
CASCADE CONSTRAINT;

DROP SEQUENCE SEQ_INSTA_HASH;

CREATE TABLE INSTA_HASH(
	SEQ NUMBER(8) PRIMARY KEY,
	HASH VARCHAR2(100) NOT NULL
)

CREATE SEQUENCE SEQ_INSTA_HASH



--해쉬서브
DROP TABLE INSTA_HASH_SUB
CASCADE CONSTRAINT;

DROP SEQUENCE SEQ_INSTA_HASH_SUB;

CREATE TABLE INSTA_HASH_SUB(
	SEQ NUMBER(8) PRIMARY KEY,
	PEED_SEQ NUMBER(8) NOT NULL,
	HASH_SEQ NUMBER(8) NOT NULL,
	DEL NUMBER(8) NOT NULL
)

CREATE SEQUENCE SEQ_INSTA_HASH_SUB

ALTER TABLE INSTA_HASH_SUB
ADD CONSTRAINT FK_INSTA_HASH_SUB_PEED_SEQ FOREIGN KEY(PEED_SEQ)
REFERENCES INSTA_PEED(SEQ);

ALTER TABLE INSTA_HASH_SUB
ADD CONSTRAINT FK_INSTA_HASH_SUB_HASH_SEQ FOREIGN KEY(HASH_SEQ)
REFERENCES INSTA_HASH(SEQ);

--알림
select * from INSTA_NOTICE

DROP TABLE INSTA_NOTICE
CASCADE CONSTRAINT

DROP SEQUENCE SEQ_INSTA_NOTICE
 
 CREATE TABLE INSTA_NOTICE(
      SEQ NUMBER(8) PRIMARY KEY,
      MEMBER_SEQ NUMBER(8) NOT NULL,
      WHO_SEQ NUMBER(8) NOT NULL,
      WHO_ID VARCHAR2(500) NOT NULL,
      WHO_PROFILE VARCHAR2(500),
      WHAT NUMBER(8) NOT NULL,
      PEED_SEQ NUMBER(8),
      PEED_IMAGE VARCHAR2(500),
      REGI_DATE DATE NOT NULL,
      READ_CONFIRM NUMBER(8) NOT NULL
  )
  
CREATE SEQUENCE SEQ_INSTA_NOTICE;
  
ALTER TABLE INSTA_NOTICE
ADD CONSTRAINT FK_INSTA_NOTICE_MEMBER_SEQ FOREIGN KEY(MEMBER_SEQ)
REFERENCES INSTA_MEMBER(SEQ);  
 
ALTER TABLE INSTA_NOTICE
ADD CONSTRAINT FK_INSTA_NOTICE_WHO_SEQ FOREIGN KEY(WHO_SEQ)
REFERENCES INSTA_MEMBER(SEQ); 

--좋아요
CREATE TABLE INSTA_THUMBSUP(
	SEQ NUMBER(8) PRIMARY KEY,
	MEMBER_SEQ NUMBER(8) NOT NULL,
	PEED_SEQ NUMBER(8) NOT NULL,
	LIKE_STATE NUMBER(3) NOT NULL,
	REGI_DATE DATE NOT NULL
);

CREATE SEQUENCE SEQ_INSTA_THUMBSUP;

ALTER TABLE INSTA_THUMBSUP
ADD CONSTRAINT FK_INSTA_THUMBSUP_MEMBER_SEQ FOREIGN KEY(MEMBER_SEQ)
REFERENCES INSTA_MEMBER(SEQ);

ALTER TABLE INSTA_THUMBSUP
ADD CONSTRAINT FK_INSTA_THUMBSUP_PEED_SEQ FOREIGN KEY(PEED_SEQ)
REFERENCES INSTA_PEED(SEQ);

DROP TABLE INSTA_THUMBSUP CASCADE CONSTRAINTS;

DROP SEQUENCE SEQ_INSTA_THUMBSUP


	  	SELECT FOLLOW.SEQ AS SEQ, FOLLOW.MEMBER_SEQ AS MEMBER_SEQ, MEMBER.PROFILE_IMAGE AS PROFILE_IMAGE, MEMBER.ID AS ID, MEMBER.NAME AS NAME, FOLLOW.FOLLOW_CONNECT AS FOLLOW_CONNECT
		FROM INSTA_MEMBER MEMBER JOIN INSTA_FOLLOW FOLLOW
		ON MEMBER.SEQ = FOLLOW.MEMBER_SEQ
		WHERE FOLLOW.FOLLOW =1 AND FOLLOW.FOLLOW_CONNECT = 1