<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e95843617e74d0c3683cc8d8a73f71af&libraries=services,clusterer,drawing"></script>




<title>Insert title here</title>
</head>
<body>


<div align="center" style="margin-left:10%; margin-top:10%; margin-bottom:10%;">
<h3 >강동점</h3>
</div>	 	


<div id="map" style="margin-left:20%; margin-top:10%; margin-bottom:10%; border:2px solid deepskyblue; width:750px;height:500px;"></div>
<!-- <div id="map_canvas" style="width:100%;height:800px;"></div> -->

<div align="center" style="margin-left:20%; margin-top:10%; margin-bottom:10%; border:2px solid deepskyblue; width:750px;height:250px;">


<img alt="" src="./image/kd.jpg"  align="left" style="width:350px; height:200px; margin-left: 3%; margin-top: 3%; margin-bottom: 3%">

<pre style="height:220px; margin-left: 3%; margin-top: 10%; margin-bottom: 3%">
강동점
서울특별시 강동구 천호대로 1136 (성내동 379-2)
02-470-4100
</pre>
<br>


</div>





<script type="text/javascript">

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = {
    center: new daum.maps.LatLng(37.5338541,127.1353025), // 지도의 중심좌표
    level: 2 // 지도의 확대 레벨
};  

//지도를 생성합니다    
var map = new daum.maps.Map(mapContainer, mapOption); 

//주소-좌표 변환 객체를 생성합니다
var geocoder = new daum.maps.services.Geocoder();

//주소로 좌표를 검색합니다
geocoder.addressSearch('서울특별시 강동구 천호대로 1136', function(result, status) {

// 정상적으로 검색이 완료됐으면 
 if (status === daum.maps.services.Status.OK) {

    var coords = new daum.maps.LatLng(result[0].y, result[0].x);

    // 결과값으로 받은 위치를 마커로 표시합니다
    var marker = new daum.maps.Marker({
        map: map,
        position: coords
    });

    // 인포윈도우로 장소에 대한 설명을 표시합니다
    var infowindow = new daum.maps.InfoWindow({
        content: '<div style="width:150px; text-align:center; padding:6px 0;">강동점</div>'
    });
    infowindow.open(map, marker);

    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
    map.setCenter(coords);
} 
});    
</script>

</body>
</html>