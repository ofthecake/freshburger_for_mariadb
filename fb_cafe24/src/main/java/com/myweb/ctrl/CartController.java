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

import com.myweb.domain.CartVO;
import com.myweb.orm.FileProcessor;
import com.myweb.service.beverage.BeverageServiceRule;
import com.myweb.service.cart.CartServiceRule;
import com.myweb.service.product.ProductServiceRule;
import com.myweb.service.side.SideServiceRule;

@RequestMapping("/cart/*")
@Controller
public class CartController {
	private static Logger logger = LoggerFactory.getLogger(CartController.class);

	@Inject
	private CartServiceRule ctsv;
	
	@Inject
	private ProductServiceRule psv;
	
	@Inject
	private SideServiceRule ssv;
	
	@Inject
	private BeverageServiceRule bsv;
	
	@Inject
	private FileProcessor fp;
	
	@ResponseBody
	@PostMapping("/removeAll") 
	public String removeAll(@RequestParam("id") String id) {
		int isUp = ctsv.removeAll(id);
		return isUp > 0 ? "1" : "0"; 
	}
	
	@ResponseBody
	@PostMapping("/removeOne") 
	public String removeOne(@RequestParam("ctno") int ctno) {
		int isUp = ctsv.removeOne(ctno);
		return isUp > 0 ? "1" : "0"; 
	}

	@PostMapping("/register") 
	public String register(Model model, RedirectAttributes reAttr, CartVO ctvo) {
		int isUp = ctsv.register(ctvo);
		reAttr.addFlashAttribute("result", isUp > 0 ? "상품등록 성공" : "상품등록 실패!");
		return "redirect:/cart/list?id="+ctvo.getId();
	}
	
	@GetMapping("/list") 
	public void list(Model model, @RequestParam("id") String id) {
		logger.info("/WEB-INF/views/cart/list.jsp");
		model.addAttribute("list", ctsv.getList(id));
		model.addAttribute("sum", ctsv.sum(id));
		model.addAttribute("plist", psv.getList());
		model.addAttribute("slist", ssv.getList());
		model.addAttribute("blist", bsv.getList());
		model.addAttribute("flist", fp.list_file());
		model.addAttribute("id", id);
		
	}
	 

}
