package kh.com.a.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kh.com.a.model.MemberDto;
import kh.com.a.model.PollBean;
import kh.com.a.model.PollDto;
import kh.com.a.model.PollSubDto;
import kh.com.a.model.Voter;
import kh.com.a.service.PollService;

@Controller
public class PollController {
	
	@Autowired
	PollService pollService;
	
	@RequestMapping(value = "polllist.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String polllist(HttpServletRequest req, Model model) {
		
		//model.addAttribute("doc_title", "투표 목록");
		
		String id = ((MemberDto)req.getSession().getAttribute("login")).getId();  // 한줄로 처리 
		
		List<PollDto> list = pollService.getPollAllList(id);
		model.addAttribute("plists", list);
		
		return "polllist.tiles";
	}
	
	@RequestMapping(value = "pollmake.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String pollmake(Model model) {

		
		return "pollmake.tiles";
	}
	
	@RequestMapping(value = "pollmakeAf.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String pollmakeAf(PollBean pbean) {

		pollService.makePoll(pbean);
		
		return "redirect:/polllist.do";
	}
	
	@RequestMapping(value = "polldetail.do" , method = {RequestMethod.GET, RequestMethod.POST})
	public String polldetail(PollDto poll, Model model) { 

		
		PollDto dto = pollService.getPoll(poll);  
		List<PollSubDto> list = pollService.getPollSubList(poll); 
		
		model.addAttribute("poll", dto);
		model.addAttribute("pollsublist", list);
		
		return "polldetail.tiles";
	}
	
	
	@RequestMapping(value = "polling.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String polling(Voter voter) {
	
		
		
		pollService.polling(voter);
		
		System.out.println(voter.toString());
		
		return "redirect:/polllist.do";
	}
	
	@RequestMapping(value = "pollresult.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String pollresult(PollDto poll, Model model) {

		
		// 통계
		PollDto dto = pollService.getPoll(poll);  //항목에 대한정보
		List<PollSubDto> list = pollService.getPollSubList(poll); //보기에 대한 정보
		
		model.addAttribute("poll", dto);
		model.addAttribute("pollsublist", list);
		
		
		return "pollresult.tiles";
	}
	

}
