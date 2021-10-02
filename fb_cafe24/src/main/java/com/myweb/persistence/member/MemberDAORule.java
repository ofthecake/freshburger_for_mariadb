package com.myweb.persistence.member;

import java.util.List;

import com.myweb.domain.MemberVO;
import com.myweb.domain.PageVO;

public interface MemberDAORule {
	 public int insert(MemberVO mvo);
	 public int selectId(String id);
	 public int selectNickname(String nickname);
	 public List<MemberVO> selectList(PageVO pgvo);
	 public MemberVO selectOne(MemberVO mvo);
	 public MemberVO selectOne(String id);
	 public int update(MemberVO mvo);
	 public int delete(String id);
	 public int type(MemberVO mvo);
	 public int point(MemberVO mvo);
	 public int selectOne(PageVO pgvo);
}
