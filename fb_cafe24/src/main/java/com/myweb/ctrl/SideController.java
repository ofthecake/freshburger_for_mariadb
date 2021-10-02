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

import com.myweb.domain.SideVO;
import com.myweb.service.side.SideServiceRule;

@RequestMapping("/side/*")
@Controller
public class SideController {
	private static Logger logger = LoggerFactory.getLogger(SideController.class);

	@Inject
	private SideServiceRule ssv;
	
	@GetMapping("/list") 
	public void list(Model model) {
		 model.addAttribute("list", ssv.getList()); 
		 }
	
	@PostMapping("/remove") 
	public String remove(@RequestParam("sno") String sno, RedirectAttributes reAttr) {
		logger.info("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"+sno);
		int isUp = ssv.remove(sno);
		reAttr.addFlashAttribute("result", isUp > 0 ? "사이드삭제 성공" : "사이드삭제 실패");
		return "redirect:/side/list"; 
		}
	
	@ResponseBody
	@PostMapping("/register")
	public String register(SideVO svo) {
		int ctReg = ssv.register(svo);
		return ctReg > 0 ? "1" : "0";
	}
	
	@GetMapping("/register")
	public void register(Model model) {
		model.addAttribute("list", ssv.getList());
	}
}
