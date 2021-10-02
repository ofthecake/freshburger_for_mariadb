package com.myweb.service.member;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.myweb.domain.MemberVO;
import com.myweb.domain.PageVO;
import com.myweb.persistence.member.MemberDAORule;

@Service
public class MemberService implements MemberServiceRule {
	private static Logger logger = LoggerFactory.getLogger(MemberService.class);
	
	@Inject
	private MemberDAORule mdao;

	@Override
	public int register(MemberVO mvo) {
		return mdao.insert(mvo);
	}

	@Override
	public int checkId(String id) {
		return mdao.selectId(id);
	}

	@Override
	public List<MemberVO> getList(PageVO pgvo) {
		return mdao.selectList(pgvo);
	}

	@Override
	public MemberVO login(MemberVO mvo) {
		return mdao.selectOne(mvo);
	}

	@Override
	public MemberVO detail(String id) {
		return mdao.selectOne(id);
	}

	@Override
	public int modify(MemberVO mvo) {
		return mdao.update(mvo);
	}

	@Override
	public int remove(String id) {
		return mdao.delete(id);
	}

	@Override
	public int checkNickname(String nickname) {
		return mdao.selectNickname(nickname);
	}

	@Override
	public int memberType(MemberVO mvo) {
		return mdao.type(mvo);
	}

	@Override
	public int editPoint(MemberVO mvo) {
		return mdao.point(mvo);
	}

	@Override
	public int getTotalCount(PageVO pgvo) {
		return mdao.selectOne(pgvo);
	}



}
