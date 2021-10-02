package com.myweb.domain;

public class SideVO {
	private int sno;
	private String sname;
	private int sprice;
	private int shits;
	public int getSno() {
		return sno;
	}
	public void setSno(int sno) {
		this.sno = sno;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public int getSprice() {
		return sprice;
	}
	public void setSprice(int sprice) {
		this.sprice = sprice;
	}
	public int getShits() {
		return shits;
	}
	public void setShits(int shits) {
		this.shits = shits;
	}
	@Override
	public String toString() {
		return "SideVO [sno=" + sno + ", sname=" + sname + ", sprice=" + sprice + ", shits=" + shits + "]";
	}
	
	
	
}
