package kh.com.a.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.com.a.model.BbsParam;
import kh.com.a.model.InventoryDto;
import kh.com.a.model.MemoDto;
import kh.com.a.service.InventoryService;

@Controller
public class InventoryController {
	
	@Autowired
	InventoryService inventoryService;
	
	@RequestMapping(value ="inventorylist.do", method = {RequestMethod.GET, RequestMethod.POST })
	public String inventorylist(Model model, BbsParam param) {
		
	//List<InventoryDto> invenlist = inventoryService.getInventoryList();
		

		// paging 처리
		int sn = param.getPageNumber();
		int start = (sn) * param.getRecordCountPerPage() + 1;
		int end = (sn+1) * param.getRecordCountPerPage();
		
		param.setStart(start);
		param.setEnd(end);
		
		List<InventoryDto> invenlist = inventoryService.getInventoryPagingList(param);
		int totalRecordCount = inventoryService.getInventoryCount(param);
		
		model.addAttribute("invenlist", invenlist);
		model.addAttribute("pageNumber", sn);
		model.addAttribute("pageCountPerScreen", 10); 
		model.addAttribute("recordCountPerPage", param.getRecordCountPerPage());
		model.addAttribute("totalRecordCount", totalRecordCount);
		
		
		model.addAttribute("s_category", param.getS_category());
		model.addAttribute("s_keyword", param.getS_keyword());
		
		return "inventorylist.tiles";
	}
		
	
	
	@RequestMapping(value = "inventorywrite.do", method = {RequestMethod.GET, RequestMethod.POST })
	public String inventorywrite() {
		
		return "inventorywrite.tiles";
	}
	
	@RequestMapping(value = "inventorywriteAf.do", method = {RequestMethod.GET, RequestMethod.POST })
	public String inventorywriteAf(InventoryDto dto) {
		
		boolean isS = inventoryService.inventoryWrite(dto);
		
		System.out.println(dto.toString());
		
		if(isS) {
			System.out.println("인벤토리글쓰기 성공");
			return "redirect:/inventorylist.do"; 
		}else {
			System.out.println("인벤토리글쓰기 실패");
			return "redirect:/inventorywrite.do";
		}
		
		
	}
	
	@RequestMapping(value="inventorydetail.do", method = {RequestMethod.GET, RequestMethod.POST} )
	public String inventorydetail(InventoryDto dto, Model model) {
		
		System.out.println(dto.toString());
		
		InventoryDto inven = inventoryService.inventoryDetail(dto);
		model.addAttribute("inven", inven);
		
		List<MemoDto> memolist = inventoryService.getMemoList(dto);
		model.addAttribute("memolist", memolist);
		
		
		return "inventorydetail.tiles";
		
	}
	
	@ResponseBody
	@RequestMapping(value="inventoryCheck.do", 
					produces = "application/String; charset=utf-8",
				   method= {RequestMethod.GET, RequestMethod.POST})
	public String inventoryCheck(String model_id) {
		System.out.println("model_id:" + model_id);
		String str = inventoryService.inventoryCheck(model_id);
		System.out.println("str:" + str);
		
		String msg = "";
		if(str == null ) {
			msg = "OK";
			return msg;  
			
		}else {			
			
			msg = "이미 등록된 모델명입니다";
			return msg;  
		}
		
		
	}
	
	@RequestMapping(value="inventoryupdate.do", method={RequestMethod.GET, RequestMethod.POST})
	public String inventoryupdate(InventoryDto dto, Model model) {
		
		System.out.println(dto.toString());
		InventoryDto inven = inventoryService.inventoryDetail(dto);
		
		model.addAttribute("inven", inven);
		return "inventoryupdate.tiles";
	}
	
	@ResponseBody
	@RequestMapping(value="inventoryupdateAf.do",
				    produces = "application/String; charset=utf-8",
					method={RequestMethod.GET, RequestMethod.POST})
	public String inventoryupdateAf(InventoryDto dto) {
		
		boolean isS = inventoryService.inventoryUpdate(dto);
		
		
		if(isS) {
			String msg = "업데이트 성공";
			return msg; 
		}else {
			String msg = "업데이트 실패";
			return msg;  
		}
		

		
	
	}
	

	@ResponseBody
	@RequestMapping(value="inventorydelete.do",
				    produces = "application/String; charset=utf-8",
					method={RequestMethod.GET, RequestMethod.POST})
	public String inventorydelete(InventoryDto dto) {
		
		
		boolean isS = inventoryService.inventoryDelete(dto);
		
		if(isS) {
			String msg = "OK";
			return msg; 
		}else {
			String msg = "인벤토리 삭제 실패";
			return msg;  
		}
	}
	
	@ResponseBody
	@RequestMapping(value="memoWrite.do",
					produces = "application/String; charset=utf-8",
					method={RequestMethod.GET, RequestMethod.POST})
	public String memoWrite(MemoDto dto) {
		
		System.out.println(dto.toString());
		
		boolean isS = inventoryService.memoWrite(dto);
		
		if(isS) {
			String msg = "메모등록 완료";
			return msg; 
			
		}else {
			
			String msg = "메모등록 실패";
			return msg; 
		}
		
		
		   
	}
	
	
	@RequestMapping(value="memoUpdate.do",method={RequestMethod.GET, RequestMethod.POST})
	public String memoUpdate(MemoDto dto) {
		
		boolean isS = inventoryService.memoUpdate(dto);
		
		if(isS) {
			System.out.println("메모 업데이트 성공");
			return "redirect:/inventorydetail.do";
		}else {
			System.out.println("메모 업데이트 실패");
			return "redirect:/inventorydetail.do";
		}
	}
	
	
	@ResponseBody
	@RequestMapping(value="memoDelete.do",
					produces = "application/String; charset=utf-8",
					method={RequestMethod.GET, RequestMethod.POST})
	public String memoDelete(MemoDto dto,InventoryDto inven) {
		
		
		System.out.println(dto.toString());
		boolean isS = inventoryService.memoDelete(dto);
		
		
		
		if(isS) {
			
			String str = "메모 삭제 성공";
			return str;
		}else {
			String str = "메모 삭제 실패";
			return str;
		}
	}
	

		

		


}
