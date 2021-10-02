package com.myweb.persistence.beverage;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.myweb.domain.BeverageVO;

@Repository
public class BeverageDAO implements BeverageDAORule {
	private static Logger logger = LoggerFactory.getLogger(BeverageDAO.class);
	private final String NS = "BeverageMapper.";
	
	@Inject
	private SqlSession sql;

	@Override
	public int insert(BeverageVO bvo) {
		return sql.insert(NS+"reg", bvo);
	}

	@Override
	public int getPrice(int bno) {
		return sql.selectOne(NS+"price", bno);
	}
	
	@Override
	public List<BeverageVO> selectList() {
		return sql.selectList(NS+"list");
	}

	@Override
	public int delete(String bno) {
		return sql.delete(NS+"del", bno);
	}

	@Override
	public BeverageVO selectOne(int bno) {
		return sql.selectOne(NS+"detail", bno);
	}


}
