package com.bit.pro.vo;

import java.sql.Date;

public class NoticeVo {
	private int bbsnum;
	private int bbsseq;
	private String bbssub;
	private String bbscon;
	private String bbswriter;
	private Date bbsdate;
	private int bbsview;
	
	public NoticeVo() {
		// TODO Auto-generated constructor stub
	}

	public NoticeVo(int bbsnum,int bbsseq, String bbssub, String bbscon, String bbswriter, Date bbsdate, int bbsview) {
		super();
		this.bbsnum = bbsnum;
		this.bbsseq = bbsseq;
		this.bbssub = bbssub;
		this.bbscon = bbscon;
		this.bbswriter = bbswriter;
		this.bbsdate = bbsdate;
		this.bbsview = bbsview;
	}
	
	public int getBbsnum() {
		return bbsnum;
	}

	public void setBbsnum(int bbsnum) {
		this.bbsnum = bbsnum;
	}

	public int getBbsseq() {
		return bbsseq;
	}

	public void setBbsseq(int bbsseq) {
		this.bbsseq = bbsseq;
	}

	public String getBbssub() {
		return bbssub;
	}

	public void setBbssub(String bbssub) {
		this.bbssub = bbssub;
	}

	public String getBbscon() {
		return bbscon;
	}

	public void setBbscon(String bbscon) {
		this.bbscon = bbscon;
	}

	public String getBbswriter() {
		return bbswriter;
	}

	public void setBbswriter(String bbswriter) {
		this.bbswriter = bbswriter;
	}

	public Date getBbsdate() {
		return bbsdate;
	}

	public void setBbsdate(Date bbsdate) {
		this.bbsdate = bbsdate;
	}

	public int getBbsview() {
		return bbsview;
	}

	public void setBbsview(int bbsview) {
		this.bbsview = bbsview;
	}


	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((bbscon == null) ? 0 : bbscon.hashCode());
		result = prime * result + ((bbsdate == null) ? 0 : bbsdate.hashCode());
		result = prime * result + bbsnum;
		result = prime * result + bbsseq;
		result = prime * result + ((bbssub == null) ? 0 : bbssub.hashCode());
		result = prime * result + bbsview;
		result = prime * result + ((bbswriter == null) ? 0 : bbswriter.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		NoticeVo other = (NoticeVo) obj;
		if (bbscon == null) {
			if (other.bbscon != null)
				return false;
		} else if (!bbscon.equals(other.bbscon))
			return false;
		if (bbsdate == null) {
			if (other.bbsdate != null)
				return false;
		} else if (!bbsdate.equals(other.bbsdate))
			return false;
		if (bbsnum != other.bbsnum)
			return false;
		if (bbsseq != other.bbsseq)
			return false;
		if (bbssub == null) {
			if (other.bbssub != null)
				return false;
		} else if (!bbssub.equals(other.bbssub))
			return false;
		if (bbsview != other.bbsview)
			return false;
		if (bbswriter == null) {
			if (other.bbswriter != null)
				return false;
		} else if (!bbswriter.equals(other.bbswriter))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "NoticeVo [bbsnum=" + bbsnum + ", bbsseq=" + bbsseq + ", bbssub=" + bbssub + ", bbscon=" + bbscon
				+ ", bbswriter=" + bbswriter + ", bbsview=" + bbsview + "]";
	}
}