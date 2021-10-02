package com.myweb.service.side;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.myweb.domain.SideVO;
import com.myweb.persistence.side.SideDAORule;

@Service
public class SideService implements SideServiceRule {
	private static Logger logger = LoggerFactory.getLogger(SideService.class);
	
	@Inject
	private SideDAORule sdao;

	@Override
	public int register(SideVO svo) {
		return sdao.insert(svo);
	}

	@Override
	public List<SideVO> getList() {
		return sdao.selectList();
	}

	@Override
	public int getPrice(int sno) {
		return sdao.getPrice(sno);
	}
	
	@Override
	public int remove(String sno) {
		return sdao.delete(sno);
	}

	@Override
	public SideVO detail(int sno) {
		return sdao.selectOne(sno);
	}
}
