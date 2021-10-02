package com.myweb.persistence.side;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.myweb.domain.SideVO;

@Repository
public class SideDAO implements SideDAORule {
	private static Logger logger = LoggerFactory.getLogger(SideDAO.class);
	private final String NS = "SideMapper.";
	
	@Inject
	private SqlSession sql;

	@Override
	public int insert(SideVO svo) {
		return sql.insert(NS+"reg", svo);
	}

	@Override
	public int getPrice(int sno) {
		return sql.selectOne(NS+"price", sno);
	}
	
	@Override
	public List<SideVO> selectList() {
		return sql.selectList(NS+"list");
	}

	@Override
	public int delete(String sno) {
		return sql.delete(NS+"del", sno);
	}

	@Override
	public SideVO selectOne(int sno) {
		return sql.selectOne(NS+"detail", sno);
	}

}
