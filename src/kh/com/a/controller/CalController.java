package kh.com.a.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
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
import org.springframework.web.bind.annotation.ResponseBody;

import kh.com.a.model.CalendarDto;
import kh.com.a.model.MemberDto;
import kh.com.a.service.CalendarService;

@Controller
public class CalController {

private static final Logger logger = LoggerFactory.getLogger(CalController.class);
   
    @Autowired
    CalendarService calService;
   
   // calendar.do(달력출력)
   @RequestMapping(value = "calendar.do", method = {RequestMethod.GET, RequestMethod.POST})
   public String calendar(HttpSession session, Model model, String year, String month) {
      
      logger.info("CalController calendar "+ new Date());
      
      Calendar cal = Calendar.getInstance();
      if((year == null || year.equals("")) && (month == null || month.equals(""))) {
         year = String.valueOf(cal.get(Calendar.YEAR));
         month = String.valueOf(cal.get(Calendar.MONTH)+1);
      }
      
      System.out.println("year: " + year + ", month: " + month);
      
      if(month.length() <2) {
         month="0" + month;
         
      }
      
      // 쓴 내용 달력에 출력하기 위해 아래와 같이 추가 한다. 
      // 아이디 가져오기
      MemberDto mem = (MemberDto)session.getAttribute("login");
       if(mem==null) {
         return "redirect:/login.do";
         
       }
      
       // db처리
       CalendarDto dto = new CalendarDto(0, mem.getId(), year+month);
       List<CalendarDto> list = calService.getCalendarList(dto);
       model.addAttribute("list", list);
            
      model.addAttribute("year", year);
      model.addAttribute("month", month);
      
      return "calendar.tiles";
      
   }
   
   // 출석체크
   @ResponseBody
   @RequestMapping(value = "calwrite.do", method = {RequestMethod.GET, RequestMethod.POST})
   public void calwrite(Model model, CalendarDto dto, 
         String year, String month, String day,
         HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      
      logger.info("CalController calwrite "+ new Date());
      
      // dto : id, rdate 저장됨
      
      // 파라미터 값 month, day, hour, min 2자리가 아니라면 앞에 0을 붙여서 
      // 0 -> 02 이런식으로 바꿔주도록 한다. 
      
      if(month.length() < 2) {
         month ="0" + month;
      }
      
      if(day.length() < 2) {
         day ="0" + day;
      }
               
      String date = year + month + day;
      dto.setRdate(date);
      
      CalendarDto mem =  calService.gettoday(dto);
      
      req.setCharacterEncoding("UTF-8");
      
      if(mem == null) {  
         boolean isS = calService.calwrite(dto);
         
         System.out.println("출석체크 완료");
         
         resp.setContentType("text/html; charset=UTF-8");
         PrintWriter out = resp.getWriter();          
         out.println("<script>alert('출석체크 완료'); location.href='calendar.do';</script>");           
         out.flush();
      
      }else {      
         System.out.println("이미 출석되어 있습니다.");
         
         resp.setContentType("text/html; charset=UTF-8");
         PrintWriter out = resp.getWriter();          
         out.println("<script>alert('이미 출석되어 있습니다.'); location.href='calendar.do';</script>");           
         out.flush();
      }
      
      
   }
   
       // 같은 ID 몇개 인지 찾기
      @ResponseBody // -> ajax을 사용할 때 꼭 붙여줘야 한다!! 
      @RequestMapping(value = "getIdCount.do", method = {RequestMethod.GET, RequestMethod.POST})
      public String getIdCount(String id) {
         logger.info("CalController getIdCount "+ new Date());
         
         System.out.println("id : " + id);
         
         int count = calService.getIdCount(id);             
         System.out.println("count 수 : " + count);
         
         String msg = "";
         
         if(count == 15) {         
            msg = "YES";
      
            // 15개 이상이면  포인트 지급 
            boolean isS = calService.upPoint(id);
            
         }else {
            msg = "NO";
         }
         
         return msg;
      }
      
}