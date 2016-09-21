package sist.co.model;

import java.util.Date;

/*
	CREATE TABLE INSTA_PEED_REPLY(
		SEQ NUMBER(8) PRIMARY KEY,
		PEED_SEQ NUMBER(8) NOT NULL,
		MEMBER_SEQ NUMBER(8) NOT NULL,
		CONTENT VARCHAR2(4000),
		REGI_DATE DATE NOT NULL
	)
	
	ALTER TABLE INSTA_PEED_REPLY
	ADD CONSTRAINT FK_INSTA_PEED_REPLY_PEED_SEQ FOREIGN KEY(PEED_SEQ)
	REFERENCES INSTA_PEED(SEQ);

	ALTER TABLE INSTA_PEED_REPLY
	ADD CONSTRAINT FK_INSTA_PEED_REPLY_MEMBER_SEQ FOREIGN KEY(MEMBER_SEQ)
	REFERENCES INSTA_MEMBER(SEQ);

	CREATE SEQUENCE SEQ_INSTA_PEED_REPLY;
*/

public class PeedReplyDTO {

	private int seq;
	private int peed_seq;
	private int member_seq;
	private String content;
	private Date regi_date;
	
	public PeedReplyDTO() {
		// TODO Auto-generated constructor stub
	}

	public PeedReplyDTO(int seq, int peed_seq, int member_seq, String content, Date regi_date) {
		super();
		this.seq = seq;
		this.peed_seq = peed_seq;
		this.member_seq = member_seq;
		this.content = content;
		this.regi_date = regi_date;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public int getPeed_seq() {
		return peed_seq;
	}

	public void setPeed_seq(int peed_seq) {
		this.peed_seq = peed_seq;
	}

	public int getMember_seq() {
		return member_seq;
	}

	public void setMember_seq(int member_seq) {
		this.member_seq = member_seq;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getRegi_date() {
		return regi_date;
	}

	public void setRegi_date(Date regi_date) {
		this.regi_date = regi_date;
	}

	@Override
	public String toString() {
		return "Peed_Reply [seq=" + seq + ", peed_seq=" + peed_seq + ", member_seq=" + member_seq + ", content="
				+ content + ", regi_date=" + regi_date + "]";
	}
	
}
