package com.myweb.domain;

public class MemberVO {
	private String id;
	private String pw;
	private String mname;
	private String mnick;
	private String mregdate;
	private String mbirth;
	private int mtype;
	private int mpoint;
	
	public MemberVO() {
		super();
	}

	public MemberVO(String id, String mnick, int mtype) {
		super();
		this.id = id;
		this.pw = "default";
		this.mname = "default";
		this.mnick = mnick;
		this.mbirth = "";
		this.mtype = mtype;
		this.mpoint = 0;
	}

	public int getMpoint() {
		return mpoint;
	}

	public void setMpoint(int mpoint) {
		this.mpoint = mpoint;
	}

	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getMnick() {
		return mnick;
	}
	public void setMnick(String mnick) {
		this.mnick = mnick;
	}
	public String getMregdate() {
		return mregdate;
	}
	public void setMregdate(String mregdate) {
		this.mregdate = mregdate;
	}
	public String getMbirth() {
		return mbirth;
	}
	public void setMbirth(String mbirth) {
		this.mbirth = mbirth;
	}
	public int getMtype() {
		return mtype;
	}
	public void setMtype(int mtype) {
		this.mtype = mtype;
	}

	@Override
	public String toString() {
		return "MemberVO [id=" + id + ", pw=" + pw + ", mname=" + mname + ", mnick=" + mnick + ", mregdate=" + mregdate
				+ ", mbirth=" + mbirth + ", mtype=" + mtype + ", mpoint=" + mpoint + "]";
	}

	
}
