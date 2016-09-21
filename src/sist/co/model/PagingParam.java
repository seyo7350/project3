package sist.co.model;

import java.io.Serializable;

public class PagingParam implements Serializable{	
	private int member_seq;
	private int peedCountPerPage = 5;
	private int index = 0;
	private int start = 1;
	private int end = 5;	
	
	public PagingParam() {
		// TODO Auto-generated constructor stub
	}

	public PagingParam(int member_seq, int peedCountPerPage, int index, int start, int end) {
		super();
		this.member_seq = member_seq;
		this.peedCountPerPage = peedCountPerPage;
		this.index = index;
		this.start = start;
		this.end = end;
	}

	public int getMember_seq() {
		return member_seq;
	}

	public void setMember_seq(int member_seq) {
		this.member_seq = member_seq;
	}

	public int getPeedCountPerPage() {
		return peedCountPerPage;
	}

	public void setPeedCountPerPage(int peedCountPerPage) {
		this.peedCountPerPage = peedCountPerPage;
	}

	public int getIndex() {
		return index;
	}

	public void setIndex(int index) {
		this.index = index;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	@Override
	public String toString() {
		return "PagingParam [member_seq=" + member_seq + ", peedCountPerPage=" + peedCountPerPage + ", index="
				+ index + ", start=" + start + ", end=" + end + "]";
	}

	
	
}
