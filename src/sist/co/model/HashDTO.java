package sist.co.model;

/*
CREATE TABLE INSTA_HASH(
	SEQ NUMBER(8) PRIMARY KEY,
	HASH VARCHAR2(100) NOT NULL
)

CREATE SEQUENCE SEQ_INSTA_HASH

CREATE TABLE INSTA_HASH_SUB(
	SEQ NUMBER(8) PRIMARY KEY,
	PEED_SEQ NUMBER(8) NOT NULL,
	HASH_SEQ NUMBER(8) NOT NULL
)

CREATE SEQUENCE SEQ_INSTA_HASH_SUB

ALTER TABLE INSTA_HASH_SUB
ADD CONSTRAINT FK_INSTA_HASH_SUB_PEED_SEQ FOREIGN KEY(PEED_SEQ)
REFERENCES INSTA_PEED(SEQ);

ALTER TABLE INSTA_HASH_SUB
ADD CONSTRAINT FK_INSTA_HASH_SUB_HASH_SEQ FOREIGN KEY(HASH_SEQ)
REFERENCES INSTA_HASH(SEQ);
*/
public class HashDTO {
	private int seq;
	private String hash;
	public HashDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public HashDTO(int seq, String hash) {
		super();
		this.seq = seq;
		this.hash = hash;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getHash() {
		return hash;
	}
	public void setHash(String hash) {
		this.hash = hash;
	}
	@Override
	public String toString() {
		return "HashDTO [seq=" + seq + ", hash=" + hash + "]";
	}	

}
