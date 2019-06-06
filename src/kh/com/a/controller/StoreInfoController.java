package kh.com.a.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class StoreInfoController {
	
	@RequestMapping(value = "storeInfo.do", method= {RequestMethod.GET,RequestMethod.POST})
	public String StoreInfo() {
		  		
		
		return "storeInfo.tiles";
	}
	
	@RequestMapping(value = "findStore.do", method= {RequestMethod.GET,RequestMethod.POST})
	public String findStore(String local) {
		

		
		System.out.println("지역:" + local);
		String str = "";
		if(local.equals("용산점")) {
			str ="storeInfo_a.tiles";
			
		}else if(local.equals("중곡점")) {
			str ="storeInfo_b.tiles";
			
		}else if(local.equals("논현점")) {
			str ="storeInfo_c.tiles";
			
		}else if(local.equals("강동점")) {
			str ="storeInfo_d.tiles";
			
		}else if(local.equals("송파점")) {
			str ="storeInfo_e.tiles";
			
		}
		
		return str;
		
	}
	

	
	
}
