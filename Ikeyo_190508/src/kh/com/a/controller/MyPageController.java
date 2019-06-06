package kh.com.a.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kh.com.a.model.MemberDto;
import kh.com.a.model.Order_Dto;
import kh.com.a.model.Order_Sub_Dto;
import kh.com.a.model.PagingParam;
import kh.com.a.model.ProductDto;
import kh.com.a.model.QnADto;
import kh.com.a.model.ReviewDto;
import kh.com.a.service.MyPageService;

@Controller
public class MyPageController {
	private static final Logger logger = LoggerFactory.getLogger(MyPageController.class);
	
	@Autowired
	MyPageService myPageService;
	
	@RequestMapping(value = "myInfoGo.do", method = RequestMethod.GET)
	public String myInfoGo() {
		logger.info("myInfoGO() RUN! / Run Time: " + new Date());
		
		return "myInfoGo.tiles";
	}
	
	@RequestMapping(value = "myInfoGoAf.do", method = RequestMethod.POST)
	public String myInoGoAf(@RequestParam String pwd, HttpServletRequest req) {
		logger.info("myInfoGOAf() RUN! / Run Time: " + new Date());
		
		MemberDto dto = (MemberDto)req.getSession().getAttribute("login");
		dto.setPwd(pwd);
		
		System.out.println("myInfoGoAf RUN() id=" + dto.getId());
		System.out.println("myInfoGoAf RUN() pwd=" + dto.getPwd());
		
		MemberDto checkPwd = myPageService.checkPwd(dto);
		
		if(checkPwd == null) {
			return "errorPwd.tiles";
		} else {
			return "redirect:/myInfo.do";
		}
	}
	
	@RequestMapping(value = "myInfo.do", method = RequestMethod.GET)
	public String myInfo(Model model, HttpServletRequest req) {
		logger.info("myInfo() RUN! / Run Time: " + new Date());
		
		MemberDto dto = (MemberDto)req.getSession().getAttribute("login");
		
		MemberDto mem = myPageService.myInfo(dto);
		
		model.addAttribute("mem", mem);
		
		return "myInfo.tiles";
	}
	
	@RequestMapping(value = "myInfoAf.do", method = {RequestMethod.POST})
	public String myInfoAf(MemberDto dto) {
		logger.info("myInfoAf() RUN! / Run Time: " + new Date());
		
		MemberDto mem = myPageService.myPhone(dto);
		String check = myPageService.phoneCheck(dto);
		boolean b = false;
		
		if(mem != null) {
			b = myPageService.myInfoUp(dto);	// 폰 번호를 변경 안할시
		} else {
			if(check == null){
				b = myPageService.myInfoUpdate(dto);	// 폰 번호 변경시
			}
		}
		if(b) {
			return "redirect:/main.do";
		} else {
			return "myInfo.do";
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "myInfoPhone.do", method = RequestMethod.POST)
	public Map<String, Object> phonecheck(MemberDto dto, Model model) {
		logger.info("myInfoPhone() RUN! / Run Time: " + new Date());
		
		System.out.println("phone=" + dto.getPhone());
		
		MemberDto mem = myPageService.myPhone(dto);
		
		String check = myPageService.phoneCheck(dto);
		String str = "";
		Map<String, Object> map = new HashMap<>();
		
		if(mem != null) {
			str = "MYPHONE";
			map.put("MY", str);
		} else {
			if(check == null){
				str = "OK";
				map.put("OK", str);
			} else{
				str = "NO";
				map.put("NO", str);
			}
		}
		return map;
	}
	
	@RequestMapping(value = "myReview.do", method = {RequestMethod.GET})
	public String myReview(Model model, HttpSession session, PagingParam param) {
		logger.info("myReview() RUN! / Run Time: " + new Date());
		
		MemberDto mem = (MemberDto)session.getAttribute("login");
		
		int sn = param.getPageNumber();
		int start = (sn) * param.getRecordCountPerPage()+1;
		int end = (sn+1) * param.getRecordCountPerPage();
		
		System.out.println("sn : " + sn);
		System.out.println("start : " + start);
		System.out.println("end : " + end);
		
		param.setStart(start);
		param.setEnd(end);
		param.setId(mem.getId());
		
		List<ReviewDto> review = myPageService.getReviewPagingList(param);
				//myPageService.getReviewList(mem);
		int totalRecordCount = myPageService.getReviewCount(mem);
		List<ProductDto> product = new ArrayList<>();
		ProductDto dto = new ProductDto();
		
		for(int i=0, n=review.size(); i<n; i++) {
			ReviewDto r = review.get(i);
			System.out.println("review=" + r.toString());
			dto = myPageService.getProductList(r);
			System.out.println("product=" + dto.toString());
			product.add(dto);
		}
		
		model.addAttribute("pageNumber", sn);
		model.addAttribute("pageCountPerScreen", 8);
		model.addAttribute("recordCountPerPage", param.getRecordCountPerPage());
		model.addAttribute("totalRecordCount", totalRecordCount);
		model.addAttribute("review", review);
		model.addAttribute("product", product);
		
		return "myReview.tiles";
	}
	
	//pdReview modal
	@ResponseBody
	@RequestMapping(value = "modalReview.do", method = {RequestMethod.POST})
	public ReviewDto modalReview(@RequestParam("rev_seq") int rev_seq) {
		logger.info("modalReview() RUN! / Run Time: " + new Date());
		
		System.out.println("rev_seq=" + rev_seq);
		ReviewDto review = myPageService.getReviewModal(rev_seq);
		
		return review;
	}
	
	@RequestMapping(value = "myQnA.do", method = {RequestMethod.GET})
	public String myQnA(Model model, HttpSession session, PagingParam param) {
		logger.info("myQnA() RUN! / Run Time: " + new Date());
		
		MemberDto mem = (MemberDto)session.getAttribute("login");
		
		int sn = param.getPageNumber();
		int start = (sn) * param.getRecordCountPerPage()+1;
		int end = (sn+1) * param.getRecordCountPerPage();
		
		System.out.println("sn : " + sn);
		System.out.println("start : " + start);
		System.out.println("end : " + end);
		
		param.setStart(start);
		param.setEnd(end);
		param.setId(mem.getId());
		
		List<QnADto> qna = myPageService.getQnAPagingList(param);
				//myPageService.getQnAList(mem);
		int totalRecordCount = myPageService.getQnACount(mem);
		List<ProductDto> product = new ArrayList<>();
		ProductDto dto = new ProductDto();
		
		for(int i=0, n=qna.size(); i<n; i++) {
			QnADto r = qna.get(i);
			dto = myPageService.getProdList(r);
			product.add(dto);
		}
		
		model.addAttribute("pageNumber", sn);
		model.addAttribute("pageCountPerScreen", 8);
		model.addAttribute("recordCountPerPage", param.getRecordCountPerPage());
		model.addAttribute("totalRecordCount", totalRecordCount);
		model.addAttribute("qna", qna);
		model.addAttribute("product", product);
		
		return "myQnA.tiles";
	}
	
	@RequestMapping(value = "myorder.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String myorder(Model model, HttpServletRequest req) {
		logger.info("myorder() RUN! / Run Time: " + new Date());
		
		MemberDto mem = (MemberDto)req.getSession().getAttribute("login");
		
		if(mem == null) {
			return "redirect:/login.do";
		}else{
			String id = mem.getId();
			List<Order_Dto> orderlist = myPageService.myorderpage(id);
			List<Order_Sub_Dto> sublist = new ArrayList<>();
			if(!orderlist.isEmpty()) {
				for(int i = 0; i < orderlist.size(); i++) {
					Order_Dto tmpdto = orderlist.get(i);
					String orderNum = tmpdto.getOrder_num();
					List<Order_Sub_Dto> tmplist = myPageService.getMySubOrder(orderNum);
					System.out.println("tmplist사이즈:" + tmplist.size());
					sublist.addAll(tmplist);
				}
			}
			
			model.addAttribute("orderlist", orderlist);
			model.addAttribute("sublist", sublist);
			
			System.out.println("sublist.size() : " + sublist.size());
			for(int i = 0; i < sublist.size(); i++) {
				System.out.println(sublist.get(i).toString());
			}
			
			return "myorder.tiles";
			
		}
	}

	// 마이페이지에서 결제창가기
	@RequestMapping(value = "payment_.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String payment_(HttpSession session, String order_num, Model model) throws Exception {
		
		logger.info("OrderController payment_ "+ new Date());
		
		// id
		MemberDto mem = (MemberDto)session.getAttribute("login");
		if(mem==null) {
			 return "redirect:/login.do";
		}
		
		List<Order_Dto> paymentlist = myPageService.paymentlist_(order_num);
		
		model.addAttribute("paymentlist", paymentlist);
		
		return "payment.tiles";
		
	}
	
	
	// 마이페이지(주문내역) -> 주문취소
	@RequestMapping(value = "orderCancel.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String orderCancel(String order_num) {
		
		logger.info("OrderController orderCancel "+ new Date());
		
		// 수량 추가해주기(order_num -> 리스트로 가져오기 -> 모델명, 수량 추가해주기)
		List<Order_Sub_Dto> sublist = myPageService.getMySubOrder(order_num);
		
		for(int i = 0; i < sublist.size(); i++) {
			Order_Sub_Dto subdto = sublist.get(i);
			myPageService.plusCountInven(subdto);
		}
		
		// sub테이블 삭제(order_num) // order테이블 삭제(order_num)
		myPageService.deleteOrder(order_num);
		
		return "redirect:/myorder.do";
	}
	
/*	// 마이페이지(주문내역) -> 구매확정(3)
	@RequestMapping(value = "orderFix.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String orderFix(String order_num) {
		
		logger.info("OrderController orderCancel "+ new Date());
		
		myPageService.orderFix(order_num);
		
		return "redirect:/myorder.do";
	}*/
	
	
	   // 마이페이지(주문내역) -> 구매확정(3) + 포인트 plus 까지 같이 
	   @RequestMapping(value = "orderFix.do", method = {RequestMethod.GET, RequestMethod.POST})
	   public String orderFix(String order_num, HttpSession session, HttpServletRequest request, int total_price) throws IOException {
	      
	      logger.info("OrderController orderFix "+ new Date());
	      
	     
	        
	      System.out.println("order_num:" + order_num);
	      myPageService.orderFix(order_num);
	      MemberDto dto = (MemberDto)session.getAttribute("login");

	      int point = dto.getPoint() + (int)(total_price * 0.01);
	      System.out.println("현재 포인트:" + point);
	      dto.setPoint(point);
	      
	      if(point >= 100000) {  //vvip
	         
	         dto.setGrade("vvip");
	         
	      }else if( point >= 10000 ) { //vip
	         
	         dto.setGrade("vip");
	         
	      }else { //일반 
	         
	         dto.setGrade("일반");
	         
	      }
	      
	      
	      
	      System.out.println(dto.toString());
	      boolean isS = myPageService.pointGradeUp(dto);
	      MemberDto login = myPageService.newSession(dto);
	      request.getSession().setAttribute("login", login);
	      
	   /*   response.setContentType("text/html; charset=UTF-8");
	      PrintWriter out = response.getWriter();
	      out.println("<script>alert("+dto.getGrade() +"); location.href='myorder.do'; </script>;");
	      out.flush();
*/
	      
	      return "redirect:/myorder.do";
	   }
	
	
	
}
