package com.myweb.service.order;

import java.util.List;

import com.myweb.domain.OrderVO;
import com.myweb.domain.PageVO;

public interface OrderServiceRule {
	public int register(OrderVO ovo);
	public List<OrderVO> getList(PageVO pgvo);
	public OrderVO detail(String id);
	public int getTotalCount(PageVO pgvo);
}
