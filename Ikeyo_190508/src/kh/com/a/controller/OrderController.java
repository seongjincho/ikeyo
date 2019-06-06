package kh.com.a.controller;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
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
import kh.com.a.model.Order_Dto;
import kh.com.a.model.Order_Sub_Dto;
import kh.com.a.model.ProductDto;
import kh.com.a.service.OrderService;


@Controller
public class OrderController {

	private static final Logger logger = LoggerFactory.getLogger(OrderController.class);
	
	@Autowired
	OrderService orderService;
		
	// 리스트 
	@RequestMapping(value = "orderlist.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String orderlist(HttpSession session, Model model, int[] seqq) {
	                                                      
		logger.info("OrderController orderlist "+ new Date());
		
		// id가져오기
		MemberDto mem = (MemberDto)session.getAttribute("login");
		if(mem==null) {
			 return "redirect:/login.do";
		}
	    	
		List<CartDto> orderlist = new ArrayList<CartDto>();
		
		for(int i = 0; i < seqq.length; i++) {
			int sseq = seqq[i];
			CartDto dto = orderService.getOrder(sseq);
			System.out.println("여기?sseq:" + sseq);
			orderlist.add(dto);
		}
			
		//List<CartDto> orderlist = orderService.oneOrderlist(seq);	
		List<ProductDto> orderplist = orderService.orderpList();
		
		model.addAttribute("orderlist", orderlist);
		model.addAttribute("orderplist", orderplist);
	
		return "orderlist.tiles";		
		
	}
	
	// 주문정보
	@RequestMapping(value = "order.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String order(HttpSession session, Order_Dto dto, 
			String address1, String address2, String address3,
			int[] seqq) throws Exception {
		
		logger.info("OrderController order "+ new Date());
		
	    // id
		MemberDto mem = (MemberDto)session.getAttribute("login");
		if(mem==null) {
			 return "redirect:/login.do";
		}
		
		String id = mem.getId();
		dto.setId(id);	
		
		// 주문번호(랜덤)
		Calendar cal = Calendar.getInstance();
		 int year = cal.get(Calendar.YEAR);
		 String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		 String ymd = ym +  new DecimalFormat("00").format(cal.get(Calendar.DATE));
		 String subNum = "";
		
		for(int i = 1; i <= 6; i ++) {
			subNum += (int)(Math.random() * 10);
		}
		
		String order_num = ymd + "00" + subNum;
		dto.setOrder_num(order_num);
		
		// 배송상태
		int deli_info = 0; 
		dto.setDeli_info(deli_info);

		// 주소
		String addr1 = "";
		
		// 우편번호 있을때
		if(address1 != null && address1 != "") {
			addr1 = address1 + "/" + address2;
			
		// 우편번호 없을 때
		}else {
			addr1 = address2;
		}
		
		// 배송지 주소 세팅
		dto.setAddress1(addr1);
		System.out.println("addr1 : " + addr1);
		
		String addr2 = address3;
		dto.setAddress2(addr2);
		System.out.println("addr2 : " + addr2);
		
		// order DB에 넣어주는 쿼리
		orderService.order(dto);	
		System.out.println("여기? dto값 : " + dto.toString());
		
		// 장바구니에 담긴 모델을 하나씩 -> Order_Sub DB에 담는 for문
		// seqq[] == CART_SEQ의 배열(선택된 물건)
		for (int i = 0; i < seqq.length; i++) {
			 int sseq = seqq[i];
			 // 카트DTO를 seq를 이용해 불러옴.
			 CartDto cdto = orderService.getOrder(sseq);
			 System.out.println("!!cdto sseq: " + sseq);
			 
			 // Order_Sub 객체 생성
			 Order_Sub_Dto sdto = new Order_Sub_Dto();
			 // setter로 담아줌.
			 sdto.setModel_id(cdto.getModel_id());
			 sdto.setCount(cdto.getCount());
			 sdto.setOrder_num(order_num);
			 // Order_Sub DB에 기록.
			 orderService.orderdetail(sdto);
			 // 장바구니에서 삭제
			 orderService.cartdelete(sseq);
			 // 인벤토리의 재고수량에서 삭제.
			 orderService.minusCountInven(sdto);
		}

		// return "redirect:/payment.do";
		return "redirect:/payment.do?order_num="+order_num;
		
	}
	
	// 이동
	@RequestMapping(value = "payment.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String payment(HttpSession session, String order_num, Model model) throws Exception {
		
		logger.info("OrderController payment "+ new Date());
		
		// id
		MemberDto mem = (MemberDto)session.getAttribute("login");
		if(mem==null) {
			 return "redirect:/login.do";
		}
		
		/*
		List<Order_Dto> paymentlist = orderService.paymentlist(id);
		model.addAttribute("paymentlist", paymentlist);
		*/
		//String order_num = dto.getOrder_num();
		//model.addAttribute("order_num" , order_num);
		
		List<Order_Dto> paymentlistto = orderService.paymentlistto(order_num);
		model.addAttribute("paymentlist", paymentlistto);
		
		return "payment.tiles";
	}
	
	 // 결제완료
	@RequestMapping(value = "success.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String dellinfo(int ord_seq) {
		
		logger.info("OrderController dellinfo "+ new Date());
		
		boolean d = orderService.dellinfo(ord_seq);
		
		if(d) {
			System.out.println("변경 성공");
		}else {
			System.out.println("변경 실패ㅜㅜ");
		}
		
		return "success.tiles";
		
	}
	
	// 결재 진행시 취소
	@RequestMapping(value = "fail.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String fail() {
		
		return "redirect:/myorder.do";
		
	}
	
}
