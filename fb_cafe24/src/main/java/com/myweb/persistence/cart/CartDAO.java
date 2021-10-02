package com.myweb.persistence.cart;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.myweb.domain.CartVO;

@Repository
public class CartDAO implements CartDAORule {
	private static Logger logger = LoggerFactory.getLogger(CartDAO.class);
	private final String NS = "CartMapper.";
	
	@Inject
	private SqlSession sql;

	@Override
	public int insert(CartVO ctvo) {
		return sql.insert(NS+"reg", ctvo);
	}

	@Override
	public List<CartVO> selectList(String id) {
		return sql.selectList(NS+"list", id);
	}
	
	@Override
	public List<CartVO> selectList() {
		return sql.selectList(NS+"listAll");
	}

	@Override
	public int update(CartVO ctvo) {
		return sql.update(NS+"mod", ctvo);
	}
	
	@Override
	public int deleteOne(int ctno) {
		return sql.delete(NS+"delOne", ctno);
	}

	@Override
	public int deleteAll(String id) {
		return sql.delete(NS+"delAll", id);
	}
	
	@Override
	public CartVO selectOne(String id) {
		return sql.selectOne(NS+"detail", id);
	}

	@Override
	public int sum(String id) {
		return sql.selectOne(NS+"sum", id);
	}

}
