package com.myweb.persistence.category;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.myweb.domain.CategoryVO;
import com.myweb.domain.ProductVO;

@Repository
public class CategoryDAO implements CategoryDAORule {
	private static Logger logger = LoggerFactory.getLogger(CategoryDAO.class);
	private final String NS = "CategoryMapper.";
	
	@Inject
	private SqlSession sql;

	@Override
	public List<CategoryVO> selectList() {
		return sql.selectList(NS+"list");
	}

	@Override
	public int update(CategoryVO cvo) {
		return sql.update(NS+"mod", cvo);
	}

	@Override
	public int delete(int cno) {
		return sql.delete(NS+"del", cno);
	}

	@Override
	public int insert(CategoryVO cvo) {
		return sql.insert(NS+"reg", cvo);
	}



}
