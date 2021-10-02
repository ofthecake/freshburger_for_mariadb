package com.myweb.service.order;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.myweb.domain.OrderVO;
import com.myweb.domain.PageVO;
import com.myweb.persistence.order.OrderDAORule;

@Service
public class OrderService implements OrderServiceRule {
	private static Logger logger = LoggerFactory.getLogger(OrderService.class);

	@Inject
	private OrderDAORule odao;
	
	@Override
	public int register(OrderVO ovo) {
		return odao.insert(ovo);
	}

	@Override
	public List<OrderVO> getList(PageVO pgvo) {
		return odao.selectList(pgvo);
	}

	@Override
	public OrderVO detail(String id) {
		return odao.selectOne(id);
	}

	@Override
	public int getTotalCount(PageVO pgvo) {
		return odao.selectOne(pgvo);
	}

}
