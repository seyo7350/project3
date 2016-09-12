package sist.co.model;

/*CREATE TABLE INSTA_FOLLOW(
	SEQ NUMBER(8) PRIMARY KEY,
	MEMBER_SEQ NUMBER(8) NOT NULL,
	FOLLOW NUMBER(8) NOT NULL,	// 내가 친구추가한 사람의 멤버시퀀스
	FOLLOW_CONNECT NUMBER(8) NOT NULL //초기값이 1, 1일때 팔로우 0이면 끊어짐
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
 */

import java.io.Serializable;

public class FollowDTO implements Serializable{

	private int seq;
	private int member_seq;
	private int follow;
	private int follow_connect;
	
	public FollowDTO() {
		// TODO Auto-generated constructor stub
	}

	public FollowDTO(int seq, int member_seq, int follow, int follow_connect) {
		super();
		this.seq = seq;
		this.member_seq = member_seq;
		this.follow = follow;
		this.follow_connect = follow_connect;
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

	public int getFollow() {
		return follow;
	}

	public void setFollow(int follow) {
		this.follow = follow;
	}

	public int getFollow_connect() {
		return follow_connect;
	}

	public void setFollow_connect(int follow_connect) {
		this.follow_connect = follow_connect;
	}

	@Override
	public String toString() {
		return "FollowDTO [seq=" + seq + ", member_seq=" + member_seq + ", follow=" + follow + ", follow_connect="
				+ follow_connect + "]";
	}

	
	
}
