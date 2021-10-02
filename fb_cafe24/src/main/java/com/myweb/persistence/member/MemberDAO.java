package com.myweb.persistence.member;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.myweb.domain.MemberVO;
import com.myweb.domain.PageVO;

@Repository
public class MemberDAO implements MemberDAORule {
	private static Logger logger = LoggerFactory.getLogger(MemberDAO.class);
	private final String NS = "MemberMapper.";
	
	@Inject
	private SqlSession sql;
	
	@Override
	public int insert(MemberVO mvo) {
		return sql.insert(NS+"reg", mvo);
	}

	@Override
	public List<MemberVO> selectList(PageVO pgvo) {
		return sql.selectList(NS+"list", pgvo);
	}

	@Override
	public MemberVO selectOne(MemberVO mvo) {
		return sql.selectOne(NS+"login", mvo);
	}

	@Override
	public MemberVO selectOne(String id) {
		return sql.selectOne(NS+"detail", id);
	}

	@Override
	public int update(MemberVO mvo) {
		return sql.update(NS+"mod", mvo);
	}

	@Override
	public int delete(String id) {
		return sql.delete(NS+"del", id);
	}

	@Override
	public int selectId(String id) {
		return sql.selectOne(NS+"checkId", id);
	}

	@Override
	public int selectNickname(String nickname) {
		return sql.selectOne(NS+"checkNickname", nickname);
	}

	@Override
	public int type(MemberVO mvo) {
		return sql.update(NS+"type", mvo);
	}

	@Override
	public int point(MemberVO mvo) {
		return sql.update(NS+"point", mvo);
	}

	@Override
	public int selectOne(PageVO pgvo) {
		return sql.selectOne(NS+"tc", pgvo);
	}
}
