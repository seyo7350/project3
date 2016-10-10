package sist.co.model;

public class FFDTO {
	private int seq;
	private int member_seq;
	private int follow;
	private String profile_image;
	private String id;
	private String name;
	private int follow_connect;
	
	public FFDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public FFDTO(int seq, int member_seq, int follow, String profile_image, String id, String name,
			int follow_connect) {
		super();
		this.seq = seq;
		this.member_seq = member_seq;
		this.follow = follow;
		this.profile_image = profile_image;
		this.id = id;
		this.name = name;
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

	public String getProfile_image() {
		return profile_image;
	}

	public void setProfile_image(String profile_image) {
		this.profile_image = profile_image;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getFollow_connect() {
		return follow_connect;
	}

	public void setFollow_connect(int follow_connect) {
		this.follow_connect = follow_connect;
	}

	@Override
	public String toString() {
		return "FFDTO [seq=" + seq + ", member_seq=" + member_seq + ", follow=" + follow + ", profile_image="
				+ profile_image + ", id=" + id + ", name=" + name + ", follow_connect=" + follow_connect + "]";
	}
	
	
}
