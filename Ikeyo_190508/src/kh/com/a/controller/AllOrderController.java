package kh.com.a.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.com.a.model.BbsParam;
import kh.com.a.model.Order_Dto;
import kh.com.a.model.Order_Sub_Dto;
import kh.com.a.service.AllOrderService;

@Controller
public class AllOrderController {

	@Autowired
	AllOrderService allOrderService;
	
	@RequestMapping(value ="allorderlist.do", method = {RequestMethod.GET, RequestMethod.POST })
	public String allorderlist(Model model, BbsParam param) {
		

		

		// paging 처리
		int sn = param.getPageNumber();
		int start = (sn) * param.getRecordCountPerPage() + 1;
		int end = (sn+1) * param.getRecordCountPerPage();
		
		param.setStart(start);
		param.setEnd(end);
		
		List<Order_Dto> orderlist = allOrderService.allOrderList(param);
		int totalRecordCount = allOrderService.getAllOrderCount(param);
		
		model.addAttribute("orderlist", orderlist);
		model.addAttribute("pageNumber", sn);
		model.addAttribute("pageCountPerScreen", 10); 
		model.addAttribute("recordCountPerPage", param.getRecordCountPerPage());
		model.addAttribute("totalRecordCount", totalRecordCount);
		
		
		model.addAttribute("s_category", param.getS_category());
		model.addAttribute("s_keyword", param.getS_keyword());
		
		return "allorderlist.tiles";
	}
	

	@RequestMapping(value ="allorderdetail.do", method = {RequestMethod.GET, RequestMethod.POST })
	public String allorderdetail(String order_num , Model model) {
		System.out.println("order_num:" + order_num);

		Order_Dto order_ = allOrderService.getDetail(order_num);
		System.out.println(order_.toString());
		List<Order_Sub_Dto> order_sub = allOrderService.getDetail_sub(order_num);
		System.out.println(order_sub.toString());
		
		model.addAttribute("order_", order_);
		model.addAttribute("order_sub", order_sub);
		
			return "allorderdetail.tiles";
		
	}
	
	@ResponseBody
	@RequestMapping(value="allorderupdate.do", 
					produces = "application/String; charset=utf-8",
				   method= {RequestMethod.GET, RequestMethod.POST})
	public String allorderupdate(String ord_seq) {
		System.out.println("ord_seq:" + ord_seq);
		boolean isS = allOrderService.deliInfoUpdate(ord_seq);
		
		
		String msg = "";
		if(isS) {
			System.out.println("배송상태 업데이트 성공");
			msg = "OK";
			return msg;  
			
		}else {			
			System.out.println("배송상태 업데이트 실패");
			msg = "실패맨";
			return msg;  
		}
		
		
	}
		
	
}
