package com.myweb.service.cart;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.myweb.domain.CartVO;
import com.myweb.persistence.cart.CartDAORule;


@Service
public class CartService implements CartServiceRule {
	private static Logger logger = LoggerFactory.getLogger(CartService.class);
	
	@Inject
	private CartDAORule ctdao;

	@Override
	public int register(CartVO ctvo) {
		return ctdao.insert(ctvo);
	}

	@Override
	public List<CartVO> getList() {
		return ctdao.selectList();
	}
	
	@Override
	public List<CartVO> getList(String id) {
		return ctdao.selectList(id);
	}

	@Override
	public int modify(CartVO ctvo) {
		return ctdao.update(ctvo);
	}

	@Override
	public int removeOne(int ctno) {
		return ctdao.deleteOne(ctno);
	}
	
	@Override
	public int removeAll(String id) {
		return ctdao.deleteAll(id);
	}

	@Override
	public CartVO detail(String id) {
		return ctdao.selectOne(id);
	}

	@Override
	public int sum(String id) {
		return ctdao.sum(id);
	}

}
