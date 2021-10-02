package com.myweb.service.beverage;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.myweb.domain.BeverageVO;
import com.myweb.persistence.beverage.BeverageDAORule;

@Service
public class BeverageService implements BeverageServiceRule {
	private static Logger logger = LoggerFactory.getLogger(BeverageService.class);
	
	@Inject
	private BeverageDAORule bdao;

	@Override
	public int register(BeverageVO bvo) {
		return bdao.insert(bvo);
	}

	@Override
	public List<BeverageVO> getList() {
		return bdao.selectList();
	}

	@Override
	public int getPrice(int bno) {
		return bdao.getPrice(bno);
	}
	
	@Override
	public int remove(String bno) {
		return bdao.delete(bno);
	}

	@Override
	public BeverageVO detail(int bno) {
		return bdao.selectOne(bno);
	}

}
