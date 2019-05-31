package kh.com.a.controller;

import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.com.a.model.NoticeDto;
import kh.com.a.model.NoticeParam;
import kh.com.a.service.NoticeService;

@Controller
public class NoticeController {
	
	private static final Logger logger 
		= LoggerFactory.getLogger(NoticeController.class);
	
	@Autowired
	NoticeService noticeService;
	
	@RequestMapping(value="noticelist.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String noticelist(Model model, NoticeParam param) {
		
		// paging 처리
		int sn = param.getPageNumber();
		int start = (sn) * param.getRecordCountPerPage() + 1;
		int end = (sn+1) * param.getRecordCountPerPage();
		
		param.setStart(start);
		param.setEnd(end);
		
		List<NoticeDto> noticelist = noticeService.getNoticeList(param);
		
		// 글의 총 갯수
		int totalRecordCount = noticeService.getNoticeCount(param);
		
		System.out.println("noticelist:" + noticelist.size());
		
		model.addAttribute("noticelist", noticelist);
		
		model.addAttribute("pageNumber", sn);
		model.addAttribute("pageCountPerScreen", 10);
		model.addAttribute("recordCountPerPage", param.getRecordCountPerPage());
		model.addAttribute("totalRecordCount", totalRecordCount);
		
		model.addAttribute("s_category", param.getS_category());
		model.addAttribute("s_keyword", param.getS_keyword());
		
		return "noticelist.tiles";
	}
	
	// noticewrite.do
	@RequestMapping(value="noticewrite.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String noticewrite() {
		return "noticewrite.tiles";
	}
	
	@RequestMapping(value="noticewriteAf.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String noticewriteAf(NoticeDto dto) {
		
		System.out.println(dto.toString());
		
		boolean b = noticeService.writeNotice(dto);
		
		if(b) {
			logger.info("글쓰기 성공" + new Date());
		}else {
			logger.info("글쓰기 실패" + new Date());
		}
		
		return "redirect:/noticelist.do";
		
	}
	
	@RequestMapping(value="noticeUpdate.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String noticeUpdate(int seq, Model model) {
		
		NoticeDto ndto = noticeService.updateNotice(seq);
		
		model.addAttribute("ndto", ndto);
		
		return "noticeUpdate.tiles";
	}
	
	@RequestMapping(value="noticeUpdateAf.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String noticeUpdateAf(NoticeDto dto, Model model) {
		
		System.out.println(dto.toString());
		boolean n = noticeService.updateNoticeAf(dto);
		
		if(n) {
			logger.info("글수정 성공" + new Date());
		}else {
			logger.info("글수정 실패" + new Date());
		}
		
		return "redirect:/noticelist.do";
	}
	
	@RequestMapping(value="noticeDelete.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String noticeDelete(int seq) {
		
		boolean n = noticeService.deleteNotice(seq);
		
		if(n) {
			logger.info("글 삭제 성공" + new Date());
		}else {
			logger.info("글 삭제 실패" + new Date());
		}
		
		return "redirect:/noticelist.do";
	}
	
	@ResponseBody
	@RequestMapping(value="noticeRead.do", method= {RequestMethod.GET, RequestMethod.POST})
	public int noticeRead(int seq) {
		System.out.println("seq:" + seq);
		
		noticeService.noticeRead(seq);
		int readcount = noticeService.getNoticeReadcount(seq);
		
		System.out.println("readcount:" + readcount);
		
		return readcount;
	}
	
}
