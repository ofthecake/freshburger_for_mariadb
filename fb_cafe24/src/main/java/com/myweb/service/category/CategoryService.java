package com.myweb.service.category;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.myweb.domain.CategoryVO;
import com.myweb.persistence.category.CategoryDAORule;

@Service
public class CategoryService implements CategoryServiceRule {
	private static Logger logger = LoggerFactory.getLogger(CategoryService.class);
	
	@Inject
	private CategoryDAORule cdao;

	@Override
	public List<CategoryVO> getList() {
		return cdao.selectList();
	}

	@Override
	public int modify(CategoryVO cvo) {
		return cdao.update(cvo);
	}

	@Override
	public int remove(int cno) {
		return cdao.delete(cno);
	}

	@Override
	public int register(CategoryVO cvo) {
		return cdao.insert(cvo);
	}




}
