package com.myweb.ctrl;

import java.util.List;

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
import com.myweb.domain.MemberVO;
import com.myweb.domain.OrderVO;
import com.myweb.domain.PageVO;
import com.myweb.handler.PagingHandler;
import com.myweb.service.beverage.BeverageServiceRule;
import com.myweb.service.cart.CartServiceRule;
import com.myweb.service.member.MemberServiceRule;
import com.myweb.service.order.OrderServiceRule;
import com.myweb.service.product.ProductServiceRule;
import com.myweb.service.side.SideServiceRule;

@RequestMapping("/order/*")
@Controller
public class OrderController {
	private static Logger logger = LoggerFactory.getLogger(OrderController.class);

	@Inject
	private OrderServiceRule osv;
	
	@Inject
	private CartServiceRule ctsv;
	
	@Inject
	private ProductServiceRule psv;
	
	@Inject
	private SideServiceRule ssv;
	
	@Inject
	private BeverageServiceRule bsv;
	
	@Inject
	private MemberServiceRule msv;
	
	@GetMapping("list")
	public void list(Model model, PageVO pgvo) {
		model.addAttribute("list", osv.getList(pgvo));
		int totalCount = osv.getTotalCount(pgvo);
		model.addAttribute("pghdl", new PagingHandler(totalCount, pgvo));
	}
	 
	@PostMapping("/result")
	public void result(OrderVO ovo, Model model, HttpSession ses, @RequestParam("menuTotal") int menuTotal) {
		String id = ovo.getId();

		List<CartVO> list = ctsv.getList(id);
		String menu = "";
		String pname = "";
		String sname = "";
		String bname = "";
		if(list.size() > 0) {
			for(CartVO ctvo : list) {
				pname = psv.detail(ctvo.getPno()).getPname() + ",";
				if(ctvo.getSno() != 0) {
					sname = ssv.detail(ctvo.getSno()).getSname() + ",";
				}
				if(ctvo.getBno() != 0) {
					bname = bsv.detail(ctvo.getBno()).getBname() + ".";
				}
				menu += pname + sname  + bname;
			}
			ovo.setMenu(menu);
		}
		
		int isUp = osv.register(ovo); 
		
		if(isUp > 0) { 			
			model.addAttribute("ovo", osv.detail(id));
			ctsv.removeAll(id);
			String preId = id.substring(0, 2);
			
			if(preId.equals("no")) {
				isUp = msv.remove(id);		
				if(isUp > 0) {			
					ses.invalidate();
				} 
			}else {
				int ownPoint = msv.detail(id).getMpoint();
				int usePoint = menuTotal-ovo.getAmount();
				MemberVO mvo = msv.detail(id);
				mvo.setMpoint((ownPoint-usePoint)+(menuTotal * 1/20));
				msv.editPoint(mvo);
				ses.invalidate();
			}
		}		 
	}
}
