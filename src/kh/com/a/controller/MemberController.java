package kh.com.a.controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonParseException;
import com.github.scribejava.core.model.OAuth2AccessToken;

import kh.com.a.model.BbsParam;
import kh.com.a.model.MemberDto;
import kh.com.a.service.MemberService;
import kh.com.a.util.JsonStringParse;
import kh.com.a.util.NaverLoginBO;

@Controller
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	/*NaverLoginBO*/
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;
	
	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}
	
	private JsonStringParse jsonparse = new JsonStringParse();
	
	@Autowired
	MemberService memberService;
	
	// 로그인 첫 화면 요청 메소드
	@RequestMapping(value = "login.do", method = RequestMethod.GET)
	public String login(Model model, HttpSession session) {
		logger.info("MemberController login " + new Date());
		
		/*네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationURl메소드 호출*/
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		
		//https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
		//redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
		System.out.println("네이버=" + naverAuthUrl);
		
		// 네이버
		model.addAttribute("url", naverAuthUrl);
		
		return "login.tiles";
	}
	
	@RequestMapping(value = "regi.do", method = RequestMethod.GET)
	public String regi(Model model) {
		logger.info("MemberController regi " + new Date());
		
		MemberDto dto = new MemberDto();
		dto.setNaver(0);
		model.addAttribute("login", dto);
		return "regi.tiles";
	}
	
	@RequestMapping(value = "regiAf.do", method = RequestMethod.POST)
	public String regiAf(MemberDto mem) throws Exception {
		logger.info("MemberController regiAf " + new Date());
		
		memberService.memberInsert(mem);
		
		return "redirect:/login.do";
	}
	
	@RequestMapping(value = "emailConfirm.do", method = RequestMethod.GET)
	public String emailConfirm(String email, Model model) throws Exception {
		logger.info("MemberController emailConfirm " + new Date());
		
		memberService.userAuth(email);
		
		model.addAttribute("email_check", 1);
		
		return "emailConfirm.tiles";
	}
	
	@ResponseBody
	@RequestMapping(value = "idcheck.do", produces = "application/String; charset=UTF-8", method = RequestMethod.POST)
	public String idcheck(String id){
		logger.info("MemberController idcheck " + new Date());
		
		System.out.println("id=" + id);
		
		String check = memberService.idcheck(id);
		String str = "";
		
		System.out.println("check=" + check);
		
		if(check == null){
			str = "OK";
		} else{
			str = "NO";
		}
		return str;
	}
	
	@ResponseBody
	@RequestMapping(value = "emailcheck.do", produces = "application/String; charset=UTF-8", method = RequestMethod.POST)
	public String emailcheck(String email) {
		logger.info("MemberController emailcheck " + new Date());
		
		String check = memberService.emailcheck(email);
		String str = "";
		
		System.out.println("check=" + check);
		
		if(check == null){
			str = "OK";
		} else{
			str = "NO";
		}
		return str;
	}
	
	@ResponseBody
	@RequestMapping(value = "phonecheck.do", produces = "application/String; charset=UTF-8", method = RequestMethod.POST)
	public String phonecheck(String phone) {
		logger.info("MemberController phonecheck " + new Date());
		
		String check = memberService.phonecheck(phone);
		String str = "";
		
		System.out.println("check=" + check);
		
		if(check == null){
			str = "OK";
		} else{
			str = "NO";
		}
		return str;
	}
	
	@RequestMapping(value = "loginAf.do", method = RequestMethod.POST)
	public String loginAf(MemberDto mem, HttpServletRequest request, Model model){
		logger.info("MemberController loginAf " + new Date());
		
		MemberDto login = memberService.login(mem);
		
		if(login != null && !login.getId().equals("")) {
			if(login.getAuthstatus() == 0) {
				model.addAttribute("email_check", 0);
				
				return "emailConfirm.tiles";
			} else if(login.getDel() == 1) {
				
				return "leave.tiles";
			}
			
			login.setNaver(0);
			request.getSession().setAttribute("login", login);
			
			return "main.tiles";
		} else {
			return "error.tiles";
		}
	}
	
	@RequestMapping(value = "findIdAndPwd.do", method = RequestMethod.GET)
	public String findId() {
		logger.info("MemberController findId " + new Date());
		
		return "findIdAndPwd.tiles";
	}
	
	@ResponseBody
	@RequestMapping(value = "findIdAf.do", produces = "application/String; charset=UTF-8", method = RequestMethod.POST)
	public String findIdAf(MemberDto mem) {
		logger.info("MemberController findIdAf " + new Date());
		
		MemberDto memdto = memberService.findId(mem); 
		String id = "";
		
		if(memdto != null) {
			id = memdto.getId();
			
			return id;
		} else {
			id = "NO";
			
			return id;
		}
	}
	
	@RequestMapping(value = "findPwd.do", method = RequestMethod.GET)
	public String findPwd() {
		logger.info("MemberController findPwd " + new Date());
		
		return "findPwd.tiles";
	}
	
	@RequestMapping(value = "findPwdAf.do", method = RequestMethod.POST)
	public String findPwd(MemberDto mem) throws Exception {
		logger.info("MemberController findPwdAf " + new Date());
		
		memberService.findPwd(mem);
		
		return "login.tiles";
	}
	
	@RequestMapping(value = "logout.do", method = RequestMethod.GET)
	public String logout(HttpServletRequest req) {
		logger.info("MemberController logout " + new Date());
		
		req.getSession().invalidate();
		
		return "main.tiles";
	}
	
	/*네이버 로그인 성공시 callback호출 메소드*/
	@RequestMapping(value = "naverIdCheck.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String naverIdCheck(Model model, @RequestParam String code,
							@RequestParam String state, HttpSession session) throws IOException {
		logger.info("naverIdCheck RUN() / Run Time: " + new Date());
		
		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBO.getAccessToken(session, code, state);
		// 로그인 사용자 정보를 읽어온다
		apiResult = naverLoginBO.getUserProfile(oauthToken);
		
		JSONObject jsonobj = jsonparse.stringToJson(apiResult, "response");
		String email = jsonparse.JsonToString(jsonobj, "email");
		String name = jsonparse.JsonToString(jsonobj, "name");
		
		/*int idx = email.indexOf("@");
		String spEmail = email.substring(0, idx);*/
		
		System.out.println("naver email=" + email);
		System.out.println("naver name=" + name);
		
		MemberDto mem = new MemberDto();
		mem.setId(email);
		mem.setName(name);
		mem.setEmail(email);
		mem.setNaver(0);
		
		int cnt = memberService.naverLoginCount(mem);
		if(cnt == 0) {
			memberService.naverLogin(mem);
			mem.setNaver(1);
		} else {
			mem = memberService.naverEmailCheck(mem);
			mem.setNaver(1);
		}

		System.out.println("mem=" + mem.toString());
		
		session.setAttribute("login", mem);
		model.addAttribute("login", mem);
		
		return "main.tiles";
	}
	
//  회원 관리 !! 
	@RequestMapping(value = "memberlist.do", method= {RequestMethod.GET,RequestMethod.POST})
	public String memberlist(Model model, BbsParam param) {
		
		
		
		// paging 처리
		int sn = param.getPageNumber();
		int start = (sn) * param.getRecordCountPerPage() + 1;
		int end = (sn+1) * param.getRecordCountPerPage();
		
		param.setStart(start);
		param.setEnd(end);
		
		List<MemberDto> memberlist = memberService.getMemberList(param); 
		int totalRecordCount = memberService.getMemberCount(param);
		
		model.addAttribute("memberlist", memberlist);
		model.addAttribute("pageNumber", sn);
		model.addAttribute("pageCountPerScreen", 10); 
		model.addAttribute("recordCountPerPage", param.getRecordCountPerPage());
		model.addAttribute("totalRecordCount", totalRecordCount);
		
		
		model.addAttribute("s_category", param.getS_category());
		model.addAttribute("s_keyword", param.getS_keyword());
		
		
		return "memberlist.tiles";
	}
	
	 @ResponseBody
	   @RequestMapping(value = "memberdel.do", produces = "application/String; charset=UTF-8", method = RequestMethod.POST)
	   public String memberDel(String id) {
	      
	      boolean isS = memberService.memberDel(id);
	      String str = "";
	      if(isS) {
	         
	         System.out.println(id + "회원 정보 삭제 성공 ");
	         str = "삭제 성공";
	         return str;
	      }else {
	         
	         System.out.println(id + "회원 정보 삭제 실패 ");
	         str = "실패맨";
	         return str;
	      }
	      
	   }

	
}
