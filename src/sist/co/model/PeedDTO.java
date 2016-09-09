package sist.co.model;

/*
CREATE TABLE INSTA_PEED(
	SEQ NUMBER(8) PRIMARY KEY,
	MEMBER_SEQ NUMBER(8) NOT NULL,
	IMAGE VARCHAR2(500) NOT NULL,
	PEED_LIKE NUMBER(38) NOT NULL,
	REGI_DATE DATE NOT NULL,
	CONTENT VARCHAR2(4000)
)

ALTER TABLE INSTA_PEED
ADD CONSTRAINT FK_INSTA_PEED_MEMBER_SEQ FOREIGN KEY(MEMBER_SEQ)
REFERENCES INSTA_MEMBER(SEQ);

CREATE SEQUENCE SEQ_INSTA_PEED;
*/

import java.util.Date;

public class PeedDTO {
	
	private int seq;
	private int member_seq;
	private String image;
	private int peed_like;
	private Date regi_date;
	private String content;
	
	public PeedDTO() {	}
	
	public PeedDTO(int seq, int member_seq, String image, int peed_like, Date regi_date, String content) {
		this.seq = seq;
		this.member_seq = member_seq;
		this.image = image;
		this.peed_like = peed_like;
		this.regi_date = regi_date;
		this.content = content;
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

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public int getPeed_like() {
		return peed_like;
	}

	public void setPeed_like(int peed_like) {
		this.peed_like = peed_like;
	}

	public Date getRegi_date() {
		return regi_date;
	}

	public void setRegi_date(Date regi_date) {
		this.regi_date = regi_date;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return "PeedDTO [seq=" + seq + ", member_seq=" + member_seq + ", image=" + image + ", peed_like=" + peed_like
				+ ", regi_date=" + regi_date + ", content=" + content + "]";
	}
	
}
