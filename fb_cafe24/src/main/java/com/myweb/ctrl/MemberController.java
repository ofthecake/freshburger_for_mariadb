package com.myweb.ctrl;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myweb.domain.MemberVO;
import com.myweb.domain.PageVO;
import com.myweb.handler.PagingHandler;
import com.myweb.service.cart.CartServiceRule;
import com.myweb.service.member.MemberServiceRule;

import ch.qos.logback.core.pattern.parser.Parser;

@RequestMapping("/member/*")
@Controller
public class MemberController {
	private static Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Inject
	private MemberServiceRule msv;
	
	@Inject
	private CartServiceRule csv;
	
	@GetMapping("/logout")
	public String logout(RedirectAttributes reAttr, HttpSession ses) {
		ses.invalidate();
		reAttr.addFlashAttribute("result", "Logout Success");
		return "redirect:/";
	}
	
	@PostMapping("/nMlogout")
	public String nMlogout(@RequestParam("nMId")String id, RedirectAttributes reAttr, HttpSession ses) {		
		csv.removeAll(id);		
		int isUp = msv.remove(id);	
		if(isUp > 0) {			
			ses.invalidate();			
		}
		return "redirect:/";
	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam("delId")String id, @RequestParam("mtype")String mtype, HttpSession ses, RedirectAttributes reAttr) {
		int isUp = msv.remove(id);
		reAttr.addFlashAttribute("result", isUp > 0 ?
				"회원탈퇴됐습니다." : "회원탈퇴실패.");
		if(mtype.equals("1")) {			
			ses.invalidate();
			return "redirect:/";
		}else {
			return "redirect:/member/list";
		}
	}
	
	@PostMapping("/modify")
	public String modify(MemberVO mvo, RedirectAttributes reAttr, HttpSession ses) {
		int isUp = msv.modify(mvo);		 
		return "redirect:/";
	}
	
	@GetMapping("/modify")
	public void modify(@RequestParam("id")String id, Model model, HttpSession ses) {
		model.addAttribute("mvo", msv.detail(id));
	}
	
	@GetMapping("/detail")
	public void detail(@RequestParam("id")String id, Model model) {
		/* MemberVO isUp = msv.detail(id); */
		model.addAttribute("mvo", msv.detail(id));
	}
	
	@GetMapping("/list")
	public void list(Model model, PageVO pgvo) {
		model.addAttribute("list", msv.getList(pgvo));
		int totalCount = msv.getTotalCount(pgvo);
		model.addAttribute("pghdl", new PagingHandler(totalCount, pgvo));
	}	

	
	@PostMapping("/nonmember")
	public String nonmember(HttpSession ses, RedirectAttributes reAttr) {
		String tempMem = "mem"+(int)(Math.random()*1000);
		MemberVO mvo = new MemberVO("non"+tempMem, "비회원"+tempMem, 0);
		int isUp = msv.register(mvo);
		if(isUp > 0) {
			MemberVO info = msv.login(mvo);
			ses.setAttribute("ses", info);
			ses.setMaxInactiveInterval(10*60);
			reAttr.addFlashAttribute("비회원 로그인 성공");
			logger.info("비회원 로그인 성공");
		}else {
			reAttr.addFlashAttribute("비회원 로그인 실패");
			logger.info("비회원 로그인 실패");
		}
		
		return "redirect:/product/list?cno=1" ;
	}
	
	@ResponseBody
	@PostMapping("/login")
	public String login(MemberVO mvo, HttpSession ses) {
		MemberVO info = msv.login(mvo);
		if(info != null) {
			ses.setAttribute("ses", info);
			ses.setMaxInactiveInterval(10*60); // 10 min			
		}
		return ses.getAttribute("ses") != null ? "1": "0";
	}
	
	@GetMapping("/login")
	public void login() {
		logger.info("/WEB-INF/views/member/login.jsp");
	}
	
	@ResponseBody
	@PostMapping("/checkId")
	public String idCheck(@RequestParam("id") String id) {
		int isExist = msv.checkId(id);
		return isExist > 0 ? "1" : "0";
	}
	
	@ResponseBody
	@PostMapping("/checkNickname")
	public String nicknameCheck(@RequestParam("nickname") String nickname) {	
		int isExist = msv.checkNickname(nickname);
		return isExist > 0 ? "1" : "0";
	}
	
	@PostMapping("/register")
	public String register(MemberVO mvo, RedirectAttributes reAttr) {
		int isUp = msv.register(mvo);
		logger.info("%%%%%%%%%%%%%"+mvo.toString());
		reAttr.addFlashAttribute("result", isUp > 0 ? "Register Success" : "Register Fail");				
		return isUp > 0 ? "redirect:/" : "redirect:/member/register";
	}
	@GetMapping("/register")
	public void register() {
		logger.info("/WEB-INF/views/member/register.jsp - GET");
	}
}
