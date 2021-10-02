package com.myweb.service.cart;

import java.util.List;

import com.myweb.domain.CartVO;


public interface CartServiceRule {
	public int register(CartVO ctvo);
	public List<CartVO> getList();
	public List<CartVO> getList(String id);	
	public int modify(CartVO ctvo);
	public int removeOne(int ctno);
	public int removeAll(String id);
	public CartVO detail(String id);
	public int sum(String id);
}
