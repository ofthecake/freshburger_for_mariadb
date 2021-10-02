package com.myweb.persistence.cart;

import java.util.List;

import com.myweb.domain.CartVO;

public interface CartDAORule {
	public int insert(CartVO ctvo);
	public List<CartVO> selectList();
	public List<CartVO> selectList(String id);
	public int update(CartVO ctvo);
	public int deleteOne(int ctno); //개별 삭제
	public int deleteAll(String id); //장바구니 비우기
	public CartVO selectOne(String id);
	public int sum(String id);
}