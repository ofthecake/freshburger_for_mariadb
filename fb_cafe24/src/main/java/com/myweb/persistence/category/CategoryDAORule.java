package com.myweb.persistence.category;

import java.util.List;

import com.myweb.domain.CategoryVO;
import com.myweb.domain.ProductVO;

public interface CategoryDAORule {
	public int insert(CategoryVO cvo);
	public List<CategoryVO> selectList();
	public int update(CategoryVO cvo);
	public int delete(int cno);
}
