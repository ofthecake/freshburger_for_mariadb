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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myweb.domain.CategoryVO;
import com.myweb.domain.FilesVO;
import com.myweb.domain.ProductVO;
import com.myweb.orm.FileProcessor;
import com.myweb.service.beverage.BeverageServiceRule;
import com.myweb.service.category.CategoryServiceRule;
import com.myweb.service.product.ProductServiceRule;
import com.myweb.service.side.SideServiceRule;

@RequestMapping("/product/*")
@Controller
public class ProductController {
	private static Logger logger = LoggerFactory.getLogger(ProductController.class);
	
	@Inject
	private CategoryServiceRule csv;
	
	@Inject
	private ProductServiceRule psv;
	
	@Inject
	private SideServiceRule ssv;
	
	@Inject
	private BeverageServiceRule bsv;
	
	@Inject
	private FileProcessor fp;
	
	@PostMapping("/remove")
	public String remove(@RequestParam("pno") int pno, RedirectAttributes reAttr) {
		fp.deleteFile(pno);
		int isUp = psv.remove(pno);
		reAttr.addFlashAttribute("result", isUp > 0 ? "상품삭제 성공" : "상품삭제 실패");
		return "redirect:/product/list?cno=1";
	}
	
	@PostMapping("/modify")
	public String modify(ProductVO pvo, RedirectAttributes reAttr,
			@RequestParam(name = "files", required = false)MultipartFile[] files) {
		int isUp = psv.modify(pvo);		
		if(isUp > 0 && files[0].getSize() > 0) {
			fp.deleteFile(pvo.getPno());
			isUp = fp.upload_file(files, pvo.getPno());
		}
		
		reAttr.addFlashAttribute("result", isUp > 0 ? "상품수정 성공" : "상품수정 실패");
		return "redirect:/product/list?cno=1";
	}
		
	@GetMapping("/modify")
	public void detail(Model model, @RequestParam("pno") int pno) {
		model.addAttribute("pvo", psv.detail(pno));
		model.addAttribute("list", csv.getList());
	}
	
	@GetMapping("/productIndex")
	public void index(Model model, int cno) {
		if(cno == 0) {
			model.addAttribute("list", psv.getList());
		}else {
			model.addAttribute("list", psv.getList(cno));
		}
		model.addAttribute("clist", csv.getList());
		
	}
	
	@GetMapping("/list")
	public void list(Model model, @RequestParam("cno") int cno) {
		model.addAttribute("list", psv.getList(cno));
		model.addAttribute("clist", csv.getList());
		model.addAttribute("slist", ssv.getList());
		model.addAttribute("blist", bsv.getList());
		model.addAttribute("flist", fp.list_file());
	}
	
	@PostMapping("/register")
	public String register(ProductVO pvo, RedirectAttributes reAttr,
			@RequestParam(name = "files", required = false)MultipartFile[] files) {
		int isUp = psv.register(pvo);
		if(isUp > 0) {
			if(files[0].getSize() > 0) {
				int pno = psv.getCurrPno();
				// 겟 커런트피노 -> psv.getCurrPno(pvo.getName); > 맵퍼수정
				isUp = fp.upload_file(files, pno);
			}
		}
		reAttr.addFlashAttribute("result", isUp > 0 ? "상품등록 성공" : "상품등록 실패!");
		return "redirect:/product/list?cno=1";
	}
	
	@GetMapping("/register")
	public void register(Model model) {
		logger.info("/WEB-INF/views/product/register.jsp");
		model.addAttribute("list", csv.getList());
	}
	
}
