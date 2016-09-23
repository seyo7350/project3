package sist.co.model;

public class SearchDTO {
	private int state;		// 0:hash 1:member
	private int seq;
	private String image;
	private String top;
	private String bottom;
	public SearchDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public SearchDTO(int state, int seq, String top, String bottom) {
		super();
		this.state = state;
		this.seq = seq;
		this.top = top;
		this.bottom = bottom;
	}
	public SearchDTO(int state, int seq, String image, String top, String bottom) {
		super();
		this.state = state;
		this.seq = seq;
		this.image = image;
		this.top = top;
		this.bottom = bottom;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}	
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getTop() {
		return top;
	}
	public void setTop(String top) {
		this.top = top;
	}
	public String getBottom() {
		return bottom;
	}
	public void setBottom(String bottom) {
		this.bottom = bottom;
	}
	@Override
	public String toString() {
		return "SearchDTO [state=" + state + ", seq=" + seq + ", image=" + image + ", top=" + top + ", bottom=" + bottom
				+ "]";
	}
	
}
