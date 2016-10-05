package sist.co.model;
/*
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
 
 */


import java.io.Serializable;
import java.util.Date;

public class ThumbsUpDTO implements Serializable {

	private int seq;
	private int member_seq;
	private int peed_seq;
	private int like_state;
	private Date regi_date;
	
	public ThumbsUpDTO() {
		// TODO Auto-generated constructor stub
	}

	public ThumbsUpDTO(int seq, int member_seq, int peed_seq, int like_state, Date regi_date) {
		super();
		this.seq = seq;
		this.member_seq = member_seq;
		this.peed_seq = peed_seq;
		this.like_state = like_state;
		this.regi_date = regi_date;
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

	public int getPeed_seq() {
		return peed_seq;
	}

	public void setPeed_seq(int peed_seq) {
		this.peed_seq = peed_seq;
	}

	public int getLike_state() {
		return like_state;
	}

	public void setLike_state(int like_state) {
		this.like_state = like_state;
	}

	public Date getRegi_date() {
		return regi_date;
	}

	public void setRegi_date(Date regi_date) {
		this.regi_date = regi_date;
	}

	@Override
	public String toString() {
		return "ThumbsUpDTO [seq=" + seq + ", member_seq=" + member_seq + ", peed_seq=" + peed_seq + ", like_state="
				+ like_state + ", regi_date=" + regi_date + "]";
	}

}
