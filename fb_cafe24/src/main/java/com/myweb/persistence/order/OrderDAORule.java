package com.myweb.persistence.order;

import java.util.List;

import com.myweb.domain.OrderVO;
import com.myweb.domain.PageVO;

public interface OrderDAORule {
	public int insert(OrderVO ovo);
	public List<OrderVO> selectList(PageVO pgvo);
	public OrderVO selectOne(String id);
	public int selectOne(PageVO pgvo);
}
