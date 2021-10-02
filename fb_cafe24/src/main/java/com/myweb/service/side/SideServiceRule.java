package com.myweb.service.side;

import java.util.List;

import com.myweb.domain.SideVO;

public interface SideServiceRule {
	public int register(SideVO svo);
	public List<SideVO> getList();
	public SideVO detail(int sno);
	public int getPrice(int sno);
	public int remove(String sno);
}
