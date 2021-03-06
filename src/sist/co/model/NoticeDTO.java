package sist.co.model;
/*
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
 */

import java.util.Date;

public class NoticeDTO {
	
	private int seq;
	private int member_seq;
	private int who_seq;
	private String who_id;
	private String who_profile;
	private int what;
	private int peed_seq;
	private String peed_image;
	private Date regi_date;
	private int read_confirm;
	
	
	public NoticeDTO(){
	}


	public int getSeq() {
		return seq;
	}


	public void setSeq(int seq) {
		this.seq = seq;
	}


	public int getMember_seq() {
		return member_seq;
	}


	public void setMember_seq(int member_seq) {
		this.member_seq = member_seq;
	}


	public int getWho_seq() {
		return who_seq;
	}


	public void setWho_seq(int who_seq) {
		this.who_seq = who_seq;
	}


	public String getWho_id() {
		return who_id;
	}


	public void setWho_id(String who_id) {
		this.who_id = who_id;
	}


	public String getWho_profile() {
		return who_profile;
	}


	public void setWho_profile(String who_profile) {
		this.who_profile = who_profile;
	}


	public int getWhat() {
		return what;
	}


	public void setWhat(int what) {
		this.what = what;
	}


	public int getPeed_seq() {
		return peed_seq;
	}


	public void setPeed_seq(int peed_seq) {
		this.peed_seq = peed_seq;
	}


	public String getPeed_image() {
		return peed_image;
	}


	public void setPeed_image(String peed_image) {
		this.peed_image = peed_image;
	}


	public Date getRegi_date() {
		return regi_date;
	}


	public void setRegi_date(Date regi_date) {
		this.regi_date = regi_date;
	}


	public int getRead_confirm() {
		return read_confirm;
	}


	public void setRead_confirm(int read_confirm) {
		this.read_confirm = read_confirm;
	}


	@Override
	public String toString() {
		return "NoticeDTO [seq=" + seq + ", member_seq=" + member_seq + ", who_seq=" + who_seq + ", who_id=" + who_id
				+ ", who_profile=" + who_profile + ", what=" + what + ", peed_seq=" + peed_seq + ", peed_image="
				+ peed_image + ", regi_date=" + regi_date + ", read_confirm=" + read_confirm + "]";
	}


	public NoticeDTO(int seq, int member_seq, int who_seq, String who_id, String who_profile, int what, int peed_seq,
			String peed_image, Date regi_date, int read_confirm) {
		super();
		this.seq = seq;
		this.member_seq = member_seq;
		this.who_seq = who_seq;
		this.who_id = who_id;
		this.who_profile = who_profile;
		this.what = what;
		this.peed_seq = peed_seq;
		this.peed_image = peed_image;
		this.regi_date = regi_date;
		this.read_confirm = read_confirm;
	}


	
	
	
	
}