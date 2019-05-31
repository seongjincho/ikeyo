package kh.com.a.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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

import kh.com.a.model.MemberDto;
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
}
