package com.myweb.service.product;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.myweb.domain.FilesVO;
import com.myweb.domain.PageVO;
import com.myweb.domain.ProductVO;
import com.myweb.persistence.files.FilesDAORule;
import com.myweb.persistence.product.ProductDAORule;


@Service
public class ProductService implements ProductServiceRule {
	private static Logger logger = LoggerFactory.getLogger(ProductService.class);
	
	@Inject
	private ProductDAORule pdao;
	@Inject
	private FilesDAORule fdao;

	@Override
	public int register(ProductVO pvo) {
		return pdao.insert(pvo);
	}

	@Override
	public List<ProductVO> getList() {
		return pdao.selectList();
	}
	
	@Override
	public List<ProductVO> getList(int cno) {
		return pdao.selectList(cno);
	}
	
	@Override
	public List<ProductVO> getList(PageVO pgvo) {
		return pdao.selectList(pgvo);
	}

	@Override
	public ProductVO detail(int pno) {
		ProductVO pvo = pdao.selectOne(pno);
		if(pvo != null) {
			List<FilesVO> flist = fdao.selectList(pno);
			pvo.setFlist(flist);
		}
		return pvo;
	}

	@Override
	public int modify(ProductVO pvo) {
		return pdao.update(pvo);
	}

	@Override
	public int remove(int pno) {
		return pdao.delete(pno);
	}

	@Override
	public int getCurrPno() {
		return pdao.selectOne();
	}

}
