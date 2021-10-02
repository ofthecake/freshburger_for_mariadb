package com.myweb.service.beverage;

import java.util.List;

import com.myweb.domain.BeverageVO;

public interface BeverageServiceRule {
	public int register(BeverageVO bvo);
	public List<BeverageVO> getList();
	public BeverageVO detail(int bno);
	public int getPrice(int bno);
	public int remove(String bno);
}
