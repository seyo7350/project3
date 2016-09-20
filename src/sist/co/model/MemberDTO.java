package sist.co.model;

/*CREATE TABLE INSTA_MEMBER(
		SEQ NUMBER(8) PRIMARY KEY,
		ID VARCHAR2(50) NOT NULL,
		PWD VARCHAR2(50) NOT NULL,
		EMAIL VARCHAR2(50) NOT NULL,
		NAME VARCHAR2(50) NOT NULL,
		REGI_DATE DATE NOT NULL,
		OPEN NUMBER(2),
		PROFILE_IMAGE VARCHAR2(500)
		HOMEPAGE VARCHAR2(500)
	);

	CREATE SEQUENCE SEQ_INSTA_MEMBER;*/

import java.io.Serializable;
import java.util.Date;

public class MemberDTO implements Serializable{

	private int seq;
	private String id;
	private String pwd;
	private String email;
	private String name;
	private Date regi_date;
	private int open;
	private String profile_image;
	private String homepage;
	
	public MemberDTO() {
		// TODO Auto-generated constructor stub
	}

	public MemberDTO(int seq, String id, String pwd, String email, String name, Date regi_date, int open,
			String profile_image, String homepage) {
		super();
		this.seq = seq;
		this.id = id;
		this.pwd = pwd;
		this.email = email;
		this.name = name;
		this.regi_date = regi_date;
		this.open = open;
		this.profile_image = profile_image;
		this.homepage = homepage;
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

	public Date getRegi_date() {
		return regi_date;
	}

	public void setRegi_date(Date regi_date) {
		this.regi_date = regi_date;
	}

	public int getOpen() {
		return open;
	}

	public void setOpen(int open) {
		this.open = open;
	}

	public String getProfile_image() {
		return profile_image;
	}

	public void setProfile_image(String profile_image) {
		this.profile_image = profile_image;
	}

	public String getHomepage() {
		return homepage;
	}

	public void setHomepage(String homepage) {
		this.homepage = homepage;
	}

	@Override
	public String toString() {
		return "MemberDTO [seq=" + seq + ", id=" + id + ", pwd=" + pwd + ", email=" + email + ", name=" + name
				+ ", regi_date=" + regi_date + ", open=" + open + ", profile_image=" + profile_image + ", homepage="
				+ homepage + "]";
	}
	
	


	
}
