package sist.co.model;

import java.io.Serializable;

public class PagingParam implements Serializable{
	private int peed = 1;	// 1~5
	private int recordCountPerPage = 10;
	private int pageNumber = 0;
	private int start = 1;
	private int end = 10;	
	
	public PagingParam() {
		// TODO Auto-generated constructor stub
	}

	public PagingParam(int peed, int recordCountPerPage, int pageNumber, int start, int end) {
		super();
		this.peed = peed;
		this.recordCountPerPage = recordCountPerPage;
		this.pageNumber = pageNumber;
		this.start = start;
		this.end = end;
	}

	public int getPeed() {
		return peed;
	}

	public void setPeed(int peed) {
		this.peed = peed;
	}

	public int getRecordCountPerPage() {
		return recordCountPerPage;
	}

	public void setRecordCountPerPage(int recordCountPerPage) {
		this.recordCountPerPage = recordCountPerPage;
	}

	public int getPageNumber() {
		return pageNumber;
	}

	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
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
		return "PagingParam [peed=" + peed + ", recordCountPerPage=" + recordCountPerPage + ", pageNumber=" + pageNumber
				+ ", start=" + start + ", end=" + end + "]";
	}
	
	
}
