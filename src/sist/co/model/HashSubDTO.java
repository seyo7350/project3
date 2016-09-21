package sist.co.model;
/*
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
*/
public class HashSubDTO {
	private int seq;
	private int peed_seq;
	private int hash_seq;
	private int del;
	public HashSubDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public HashSubDTO(int seq, int peed_seq, int hash_seq, int del) {
		super();
		this.seq = seq;
		this.peed_seq = peed_seq;
		this.hash_seq = hash_seq;
		this.del = del;
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
	public int getHash_seq() {
		return hash_seq;
	}
	public void setHash_seq(int hash_seq) {
		this.hash_seq = hash_seq;
	}
	public int getDel() {
		return del;
	}
	public void setDel(int del) {
		this.del = del;
	}
	@Override
	public String toString() {
		return "HashSubDTO [seq=" + seq + ", peed_seq=" + peed_seq + ", hash_seq=" + hash_seq + ", del=" + del + "]";
	}
	
}
