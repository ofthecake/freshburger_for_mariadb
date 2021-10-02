package com.myweb.persistence.beverage;

import java.util.List;

import com.myweb.domain.BeverageVO;

public interface BeverageDAORule {
	public int insert(BeverageVO bvo);
	public List<BeverageVO> selectList();
	public BeverageVO selectOne(int bno);
	public int getPrice(int bno);
	public int delete(String bno);
}