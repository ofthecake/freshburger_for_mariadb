package com.myweb.persistence.order;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.myweb.domain.OrderVO;
import com.myweb.domain.PageVO;

@Repository
public class OrderDAO implements OrderDAORule {
	private static Logger logger = LoggerFactory.getLogger(OrderDAO.class);
	private final String NS = "OrderMapper.";
	
	@Inject
	private SqlSession sql;

	@Override
	public int insert(OrderVO ovo) {
		return sql.insert(NS+"reg", ovo);
	}

	@Override
	public List<OrderVO> selectList(PageVO pgvo) {
		return sql.selectList(NS+"list", pgvo);
	}

	@Override
	public OrderVO selectOne(String id) {
		return sql.selectOne(NS+"detail", id);
	}

	@Override
	public int selectOne(PageVO pgvo) {
		return sql.selectOne(NS+"tc", pgvo);
	}

}
