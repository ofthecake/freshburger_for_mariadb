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

import com.myweb.domain.CategoryVO;
import com.myweb.domain.ProductVO;
import com.myweb.service.category.CategoryServiceRule;
import com.myweb.service.product.ProductServiceRule;

@RequestMapping("/category/*")
@Controller
public class CategoryController {
	private static Logger logger = LoggerFactory.getLogger(CategoryController.class);

	@Inject
	private CategoryServiceRule csv;
	
	/*
	 * @PostMapping("/remove") public String remove(@RequestParam("pno") int pno,
	 * RedirectAttributes reAttr) {
	 * 
	 * reAttr.addFlashAttribute("result", isUp > 0 ? "상품삭제 성공" : "상품삭제 실패"); return
	 * "redirect:/product/list"; }
	 * 
	 * @PostMapping("/modify") public String modify(ProductVO pvo,
	 * RedirectAttributes reAttr) {
	 * 
	 * reAttr.addFlashAttribute("result", isUp > 0 ? "상품수정 성공" : "상품수정 실패"); return
	 * "redirect:/product/detail?pno="+ pvo.getPno(); }
	 * 
	 * @GetMapping({"/detail", "/modify"}) public void detail(Model
	 * model, @RequestParam("pno") int pno) { model.addAttribute("pvo",
	 * psv.detail(pno)); }
	 * 
	 * @GetMapping("/list") public void list(Model model, CategoryVO cvo) {
	 * model.addAttribute("categoryList", csv.getList()); model.addAttribute("list",
	 * psv.getList()); }
	 */
	
	/*
	 * @ResponseBody
	 * 
	 * @PostMapping("/register") public String register(@RequestParam("cname")
	 * String cname) { logger.info("들어온 cname의 값%%%%%%%%%%%%%%%%%"+cname); int ctReg
	 * = csv.register(cname); logger.info("%%%%%%%%%%%%%%%%%"+ctReg); return ctReg >
	 * 0 ? "1" : "0"; }
	 */
	
	@ResponseBody
	@PostMapping("/register")
	public String register(CategoryVO cvo) {
		int ctReg = csv.register(cvo);
		return ctReg > 0 ? "1" : "0";
	}	
}
