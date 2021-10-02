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

import com.myweb.domain.BeverageVO;
import com.myweb.service.beverage.BeverageServiceRule;

@RequestMapping("/beverage/*")
@Controller
public class BeverageController {
	private static Logger logger = LoggerFactory.getLogger(BeverageController.class);

	@Inject
	private BeverageServiceRule bsv;
	
	@GetMapping("/list") 
	public void list(Model model) {
		 model.addAttribute("list", bsv.getList()); 
		 }
	
	@PostMapping("/remove") 
	public String remove(@RequestParam("bno") String bno, RedirectAttributes reAttr) {
		int isUp = bsv.remove(bno);
		reAttr.addFlashAttribute("result", isUp > 0 ? "음료삭제 성공" : "음료삭제 실패");
		return "redirect:/beverage/list"; 
		}
	
	@ResponseBody
	@PostMapping("/register")
	public String register(BeverageVO bvo) {
		int ctReg = bsv.register(bvo);
		return ctReg > 0 ? "1" : "0";
	}
	
	@GetMapping("/register")
	public void register(Model model) {
		model.addAttribute("list", bsv.getList());
	}
}
