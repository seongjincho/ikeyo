var mapContainer;

function map_initialize( myLat, myLng ) {
    console.log( "map_initialize2" );
    var position = new daum.maps.LatLng(myLat, myLng);

    mapContainer = new daum.maps.Map(document.getElementById('map'), mapOption = {
        center: position,
        level: 6,
        mapTypeId: daum.maps.MapTypeId.ROAD
    });

    DrawHumanMarker(myLat, myLng);

    DrawCircle(myLat, myLng, 500 );
    
    markers();
    

};

function DrawHumanMarker( lat, lng ){
    console.log( "DrawHumanMarker ");
    var imageSrc = './image/location.png', // 마커이미지의 주소입니다    
            imageSize = new daum.maps.Size(16, 25), // 마커이미지의 크기입니다
           imageOption = {offset: new daum.maps.Point(10, 25)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
    
    var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imageOption),
        markerPosition = new daum.maps.LatLng(lat, lng); // 마커가 표시될 위치입니다
    
    var poiDaumMarker = new daum.maps.Marker({
        position: markerPosition,
        image: markerImage // 마커이미지 설정 
    });

    poiDaumMarker.setMap(mapContainer);
}

var circle;
var circleList=[];

function DrawCircle( lat, lng, radius ){
    
    console.log( "DrawCircle");

    circle = new daum.maps.Circle({
        center : new daum.maps.LatLng(lat, lng),  // 원의 중심좌표 입니다 
        radius: radius, // 미터 단위의 원의 반지름입니다 
        strokeWeight: 5, // 선의 두께입니다 
        strokeColor: '#75B8FA', // 선의 색깔입니다
        strokeOpacity: 1, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
        strokeStyle: 'dashed', // 선의 스타일 입니다
        fillColor: '#CFE7FF', // 채우기 색깔입니다
        fillOpacity: 0.3  // 채우기 불투명도 입니다   
    }); 
            
    circle.setMap(mapContainer);
}

function markers() {
	


	 //마커를 표시할 위치와 title 객체 배열입니다 
	var positions = [
	    {
	        title: '롯데미아점', 
	        latlng: new daum.maps.LatLng( 37.614805, 127.030542 )
	    },
	    {
	        title: '용산점', 
	        latlng: new daum.maps.LatLng( 37.529042, 126.963974 )
	    },
	    {
	        title: '중곡점', 
	        latlng: new daum.maps.LatLng( 37.555999, 127.076147 )
	    },
	    {
	        title: '목동점',
	        latlng: new daum.maps.LatLng( 37.522020, 126.856219 )
	    },
	    {
	        title: '신도림점', 
	        latlng: new daum.maps.LatLng( 37.5068346, 126.8881425 )
	    },
	    {
	        title: '논현점 ', 
	        latlng: new daum.maps.LatLng( 37.5130004, 127.0247225 )
	    },
	    {
	        title: '강동점', 
	        latlng: new daum.maps.LatLng( 37.5338541, 127.1353025 )
	    },
	    {
	        title: '송파점', 
	        latlng: new daum.maps.LatLng( 37.4851445, 127.1200117 )
	    },
	    {
	        title: '은평점 ', 
	        latlng: new daum.maps.LatLng( 37.6138892, 126.9238401 )
	    }  
	          
	];

	// 마커 이미지의 이미지 주소입니다
	var imageSrc_ = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
	    
	for (var i = 0; i < positions.length; i ++) {
	    
	    // 마커 이미지의 이미지 크기 입니다
	    var imageSize_ = new daum.maps.Size(24, 35); 
	    
	    // 마커 이미지를 생성합니다    
	    var markerImage_ = new daum.maps.MarkerImage(imageSrc_, imageSize_); 
	    
	    // 마커를 생성합니다
	    var marker = new daum.maps.Marker({
	        map: map, // 마커를 표시할 지도
	        position: positions[i].latlng, // 마커를 표시할 위치
	        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
	        image : markerImage_ // 마커 이미지 
	    });
	} 

	 marker.setMap(map);
	
	}

