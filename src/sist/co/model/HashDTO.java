package sist.co.model;

/*
CREATE TABLE INSTA_HASH(
	SEQ NUMBER(8) PRIMARY KEY,
	HASH VARCHAR2(100) NOT NULL
)

CREATE SEQUENCE SEQ_INSTA_HASH
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
