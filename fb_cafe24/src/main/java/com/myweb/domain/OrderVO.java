package com.myweb.domain;

public class OrderVO {
	private int ono;
	private int ordernum;
	private String saledate;
	private int amount;
	private String id;
	private String menu;
	
	public int getOno() {
		return ono;
	}
	public void setOno(int ono) {
		this.ono = ono;
	}
	public int getOrdernum() {
		return ordernum;
	}
	public void setOrdernum(int ordernum) {
		this.ordernum = ordernum;
	}
	public String getSaledate() {
		return saledate;
	}
	public void setSaledate(String saledate) {
		this.saledate = saledate;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getMenu() {
		return menu;
	}
	public void setMenu(String menu) {
		this.menu = menu;
	}
	@Override
	public String toString() {
		return "OrderVO [ono=" + ono + ", ordernum=" + ordernum + ", saledate=" + saledate + ", amount=" + amount
				+ ", id=" + id + ", menu=" + menu + "]";
	}
	
	

}
