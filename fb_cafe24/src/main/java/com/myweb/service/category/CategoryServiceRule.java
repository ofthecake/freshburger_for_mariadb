package com.myweb.service.category;

import java.util.List;

import com.myweb.domain.CategoryVO;
import com.myweb.domain.MemberVO;

public interface CategoryServiceRule {
	public int register(CategoryVO cvo);
	public List<CategoryVO> getList();
	public int modify(CategoryVO cvo);
	public int remove(int cno);
}
