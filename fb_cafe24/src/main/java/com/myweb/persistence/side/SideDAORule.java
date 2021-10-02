package com.myweb.persistence.side;

import java.util.List;

import com.myweb.domain.SideVO;

public interface SideDAORule {
	public int insert(SideVO svo);
	public List<SideVO> selectList();
	public SideVO selectOne(int sno);
	public int getPrice(int sno);
	public int delete(String sno);
}