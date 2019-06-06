package kh.com.a.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {
	
	@RequestMapping(value="main.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String main() {
		
		return "main.tiles";
	}
	
	@RequestMapping(value="privacy1.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String privacy1() {
		
		return "privacy1.tiles";
	}

	
	@RequestMapping(value="privacy2.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String privacy2() {
		
		return "privacy2.tiles";
	}
	
	@RequestMapping(value="brandStory.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String brandStory() {
		
		return "brandStory.tiles";
	}
	
	
	
}
