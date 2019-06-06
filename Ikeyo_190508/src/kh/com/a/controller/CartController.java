package kh.com.a.controller;

import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kh.com.a.model.CartDto;
import kh.com.a.model.MemberDto;
import kh.com.a.model.ProductDto;
import kh.com.a.service.CartService;

@Controller
public class CartController {

	private static final Logger logger = LoggerFactory.getLogger(CartController.class);
	
	@Autowired
	CartService cartService;
	
	// 리스트
	@RequestMapping(value = "cartList.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String cartlist(HttpSession session, Model model, HttpServletResponse response) throws Exception {
		logger.info("CartController cartList "+ new Date());
		
		List<CartDto> list = cartService.cartlist();	
		List<ProductDto> plist = cartService.pList();
		
		// 아이디 가져오기
		MemberDto mem = (MemberDto)session.getAttribute("login");
		if(mem==null) {
			response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('로그인 정보를 확인해주세요.'); location.href='login.do';</script>");
            out.flush();
								
		}
		
		model.addAttribute("cartlist", list);
		model.addAttribute("plist", plist);
		
		return "cartlist.tiles";
	
	}
	
	// 삭제
	@RequestMapping(value = "cartdel.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String wishDel(int seq)throws Exception {
		
		logger.info("WishController cartdel "+ new Date()); 
		
		System.out.println(seq);
		
		int isS = cartService.cartdel(seq);
		
		return "redirect:/cartList.do";
	
	}
	
	// 선택삭제
	@RequestMapping(value = "cartdeltt.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String cartdeltt(int[] seqq)throws Exception {
		
		logger.info("WishController cartdeltt "+ new Date()); 
		
		for(int i = 0; i<seqq.length; i++) {
			
			cartService.cartdeltt(seqq[i]);		
		}

		 return "redirect:/cartList.do";
	
	}
	
}
