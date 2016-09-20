package sist.co.model;

public class SearchDTO {
	private int state;		// 0:hash 1:member
	private String image;
	private String top;
	private String bottom;
	public SearchDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public SearchDTO(int state, String top, String bottom) {
		super();
		this.state = state;
		this.top = top;
		this.bottom = bottom;
	}
	public SearchDTO(int state, String image, String top, String bottom) {
		super();
		this.state = state;
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
		return "SearchDTO [state=" + state + ", image=" + image + ", top=" + top + ", bottom=" + bottom + "]";
	}
	
	
}
