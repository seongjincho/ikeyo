<%@page import="kh.com.a.model.CalendarDto"%>
<%@page import="kh.com.a.model.MemberDto"%>
<%@page import="kh.com.a.util.CalendarUtil"%>
<%@page import="java.util.List"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>calendar</title>

<!-- // ajax -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> 
<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>

<!-- content.css -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/content.css">

</head>
<body>

<%
Calendar cal = Calendar.getInstance();
cal.set(Calendar.DATE, 1);   // 1일

String syear = request.getParameter("year");
String smonth = request.getParameter("month");

int year = cal.get(Calendar.YEAR);
if(CalendarUtil.nvl(syear) == false){   
   year = Integer.parseInt(syear);
}

int month = cal.get(Calendar.MONTH) + 1;
if(CalendarUtil.nvl(smonth) == false){   
   month = Integer.parseInt(smonth);
}

if(month < 1){
   month = 12;
   year--;
}
if(month > 12){
   month = 1;
   year++;
}

cal.set(year, month - 1, 1);   // 연월일을 설정

// 요일
int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);
System.out.println("dayOfWeek:" + dayOfWeek);

String wdate = (year-1)+""+month;

String pp = String.format("<a href='%s?year=%d&month=%d'><img src='image/left.gif'></a>", 
      "calendar.do", year-1, month);                     
String p = String.format("<a href='%s?year=%d&month=%d'><img src='image/prec.gif'></a>", 
      "calendar.do", year, month-1);

String n = String.format("<a href='%s?year=%d&month=%d'><img src='image/next.gif'></a>", 
      "calendar.do", year, month+1);
String nn = String.format("<a href='%s?year=%d&month=%d'><img src='image/last.gif'></a>", 
      "calendar.do", year+1, month);

// 오늘날짜 설정(오늘날짜 색 표시해 주는 부분)!!
Calendar todaycal = Calendar.getInstance();
int tyear = todaycal.get(Calendar.YEAR);
int tmonth = todaycal.get(Calendar.MONTH);
int tday = todaycal.get(Calendar.DATE);

//오늘 날짜 
String today = year + "년 "+ month +"월 " + tday + "일"; 

// 출력확인! 
System.out.println("year : " + tyear + ", month : " + (tmonth+1) + ", day : " + tday);
System.out.println("today : " + today);

int startDate = cal.getMinimum(Calendar.DATE); // 해당 월의 첫날 
int endDate = cal.getActualMaximum(Calendar.DATE); // 해당 월의 마지막날

int count = 0;

MemberDto user = (MemberDto)session.getAttribute("login");

List<CalendarDto> list = (List<CalendarDto>)request.getAttribute("list");
%>

<div class="f_content" align="center" style="margin-bottom: 110%; margin-top: 7%; margin-left: 15%; margin-right: 5%;">
<div class="f2_content" style="background-color: white;">

<%-- <!-- // 로그아웃 & 로그인  후 정보(이름)-->
<c:if test="${login.id ne ''}">
   <a href="logout.do" title="로그아웃">[로그아웃]</a>&nbsp;&nbsp;&nbsp;
</c:if>

<c:if test="${login.name ne '' }">
   [${login.name }]님 환영합니다
</c:if> --%>

<div align="center" style="margin-right: 100px;"> 
 
  <img src="image/cal05.jpg" width="100%;" height="40%;">
  
<div style="background-color: #FFBF00;">
<br>
<table border="2" style="border-collapse: separate; border-spacing: 10 10px; background-color: white;">
<col width="140"><col width="140"><col width="140"><col width="140">
<col width="140"><col width="140"><col width="140">

<tr height="100" style="border: 2px solid gray;">
   <td colspan="7" align="center">
      <%=pp %>&nbsp;<%=p %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <font color="black" style="font-size: 50px; font-weight: bold;">
         <%=String.format("%d년&nbsp;&nbsp;%2d월", year, month) %>
      </font>&nbsp;&nbsp;
      <%=n %>&nbsp;<%=nn %>   
   </td>
</tr>

<tr align="center" style="font-weight: bold; background-color: #BDBDBD; color: #FAFAFA;" height="30">
   <td>일</td>
   <td>월</td>
   <td>화</td>
   <td>수</td>
   <td>목</td>
   <td>금</td>
   <td>토</td>
</tr>

<tr height="120" valign="top">
<%
// 윗쪽의 빈칸
for(int i = 1;i < dayOfWeek; i++){
   count++;
   %>   
   <td>&nbsp;</td>   
   <%
}

//날짜
int lastDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);

for(int i = 1;i <= lastDay; i++){
   String bgcolor = (today.equals(year + "년 "+ month +"월 "+ i + "일"))? "white" : "#FFFFFF";
   String color = (count%7 == 0 || count%7 == 6)? "red" : "black";
   count++;
   %>
   <td bgcolor="<%=bgcolor %>"><font size="3" color=<%=color %> style="font-weight: bold;">
       <%=CalendarUtil.caltoday(year, month, i) %></font><br>&nbsp;&nbsp;
       <%=CalendarUtil.makeTable(year, month, i, list) %>
   </td>
   <%
   if((i + dayOfWeek - 1) % 7 == 0 && i != lastDay){
      %>   
      </tr>
      <tr height="120" align="left" valign="top">
      <%
   }   

}
   
//밑의 빈칸
for(int i = 0; i < (7 - (dayOfWeek + lastDay - 1) % 7 ) % 7; i++){
   %>   
   <td>&nbsp;</td>   
   <%
   count++;
}
%>   
</tr>

</table>

<br><br>
</div>


<div style="background-color: #FFBF00;" align="left">

<div style="background-color: #FFBF00;">
<img alt="" src="image/n01.jpg" style="margin-left: 10%;">
<br>

<label style="margin-left: 130px;">
<!-- // 접속보상확인 -->
<button type="button" class="btn btn-outline-secondary" id="_btnGetId" onclick="disable(this)">접속보상</button>
</label>

<!-- // 한번 실행 후 실행 안되게 막음 -->    
<script type="text/javascript">
function disable(ctr) {
   ctr.disabled = true;
}
</script>


<!-- 오늘날짜,시간 & 출석체크 버튼  -->
<%
String day = request.getParameter("day");

int thour = cal.get(Calendar.HOUR_OF_DAY);
int tmin = cal.get(Calendar.MINUTE);
%>

<img alt="" src="image/n02.jpg" style="margin-left: 32%;">

<div style="margin-left: 70%;">

<form id="frm" method="post">
	<h5 style="margin-left: 10%;">"현재 시간"</h5>
	<!-- // db에 넣기 위해  id값을 가져와야 함 -->
   <input type="hidden" name="id" id="_id" value="<%=user.getId() %>">
   
   <%=tyear %>년&nbsp;<%=tmonth+1 %>월&nbsp;<%=tday %>일&nbsp;<%=thour %>시&nbsp;<%=tmin %>분
   <input type="hidden" name="year" value="<%=tyear %>">
   <input type="hidden" name="month" value="<%=tmonth+1 %>">
   <input type="hidden" name="day" value="<%=tday %>">   
   <input type="hidden" name="hour" value="<%=thour %>">
   <input type="hidden" name="min" value="<%=tmin %>">
   <br><br>
   
  <!-- // 출석체크 -->
 <!--   <button type="submit" onclick="btncheck()">
     <img alt="" src="image/stamp_01.png">
   </button>
   	 -->
   <img alt="" src="image/stamp_01.png" onclick="btncheck()">
   
</form>
</div>

</div>

<br><br><br>
</div>

</div>  <!-- // center -->

</div>
</div>


<script type="text/javascript">
function btncheck() {
	
	// alert("테스트");
	$("#frm").attr("action", "calwrite.do").submit();
	
}
</script>

<!-- // 포인트 지급  -->
<script type="text/javascript">

$("#_btnGetId").click(function () {   
  // alert("포인트 지급 테스트");
   
   $.ajax({
      type:"post",
      url:"getIdCount.do",      
      data:{ id:$("#_id").val() },
      async:true,
      success:function(msg){   
         
         if(msg== 'YES'){            
            alert("포인트 지급완료");
            
         }else{
            alert("출석일수가 모자랍니다.");
            
         }      
      },
      error:function(){
         alert("error");   
      }      
      
   });
   
});
</script>



</body>
</html>
