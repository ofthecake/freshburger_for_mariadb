package com.myweb.service.member;

import java.util.List;

import com.myweb.domain.MemberVO;
import com.myweb.domain.PageVO;

public interface MemberServiceRule {
	public int register(MemberVO mvo);
	public int checkId(String id);
	public int checkNickname(String nickname);
	public List<MemberVO> getList(PageVO pgvo);
	public MemberVO login(MemberVO mvo);
	public MemberVO detail(String id);
	public int modify(MemberVO mvo);
	public int remove(String id);
	public int memberType(MemberVO mvo);
	public int editPoint(MemberVO mvo);
	public int getTotalCount(PageVO pgvo);
}
