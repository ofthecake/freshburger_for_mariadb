package com.myweb.domain;

import java.util.List;

public class ProductVO {
	private int pno;
	private String pname;
	private int pprice;
	private String pdesc;
	private String pregdate;
	private int phits;
	private int cno;
	private int sno;
	private int bno;
	private List<FilesVO> flist;
	
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public int getPprice() {
		return pprice;
	}
	public void setPprice(int pprice) {
		this.pprice = pprice;
	}
	public String getPdesc() {
		return pdesc;
	}
	public void setPdesc(String pdesc) {
		this.pdesc = pdesc;
	}
	public String getPregdate() {
		return pregdate;
	}
	public void setPregdate(String pregdate) {
		this.pregdate = pregdate;
	}

	public int getPhits() {
		return phits;
	}
	public void setPhits(int phits) {
		this.phits = phits;
	}
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	public int getSno() {
		return sno;
	}
	public void setSno(int sno) {
		this.sno = sno;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public List<FilesVO> getFlist() {
		return flist;
	}
	public void setFlist(List<FilesVO> flist) {
		this.flist = flist;
	}

	
	
}
