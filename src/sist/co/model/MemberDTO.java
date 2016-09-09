package sist.co.model;

/*CREATE TABLE INSTAMEMBER(
		SEQ NUMBER(8) PRIMARY KEY,
		ID VARCHAR2(50) NOT NULL,
		PWD VARCHAR2(50) NOT NULL,
		EMAIL VARCHAR2(50) NOT NULL,
		NAME VARCHAR2(50) NOT NULL,
		REGIDATE DATE NOT NULL,
		OPEN NUMBER(2),
		PROFILEIMAGE VARCHAR2(500)
	);

	CREATE SEQUENCE SEQ_INSTAMEMBER;*/

import java.io.Serializable;

public class MemberDTO implements Serializable{

	private int seq;
	private String id;
	private String pwd;
	private String email;
	private String name;
	private String regidate;
	private int open;
	private String profileImage;
	
	public MemberDTO() {
		// TODO Auto-generated constructor stub
	}

	public MemberDTO(int seq, String id, String pwd, String email, String name, String regidate, int open,
			String profileImage) {
		super();
		this.seq = seq;
		this.id = id;
		this.pwd = pwd;
		this.email = email;
		this.name = name;
		this.regidate = regidate;
		this.open = open;
		this.profileImage = profileImage;
	}

	public MemberDTO(String id, String pwd, String email, String name) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.email = email;
		this.name = name;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getRegidate() {
		return regidate;
	}

	public void setRegidate(String regidate) {
		this.regidate = regidate;
	}

	public int getOpen() {
		return open;
	}

	public void setOpen(int open) {
		this.open = open;
	}

	public String getProfileImage() {
		return profileImage;
	}

	public void setProfileImage(String profileImage) {
		this.profileImage = profileImage;
	}

	@Override
	public String toString() {
		return "MemberDTO [seq=" + seq + ", id=" + id + ", pwd=" + pwd + ", email=" + email + ", name=" + name
				+ ", regidate=" + regidate + ", open=" + open + ", profileImage=" + profileImage + "]";
	}
	
	
}
