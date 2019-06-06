//현재 위치 추적 Start
function geoLocation()
{
     if (navigator.geolocation)
     {
          navigator.geolocation.getCurrentPosition(showPosition,showError);
     }
     else
     {
          alert("Geolocation is not supported by this browser.");
     }
}

var nLat;
var nLng;

//위치 추적 Success
function showPosition(position)
{
     nLat = position.coords.latitude;
     nLng = position.coords.longitude;
     console.log("nLat : "+nLat);
     console.log("nLng : "+nLng);

    //drawingmap.gs.js
    //map_initialize( nLat, nLng );

     
     myLocation(nLat, nLng);
     setCenter(nLat, nLng );

}
//위치 추적 Faile
function showError(error)
{
     switch (error.code)
     {
          case error.PERMISSION_DENIED:
               alert("User denied the request for Geolocation.");
               break;
          case error.POSITION_UNAVAILABLE:
               alert("Location information is unavailable.");
               break;
          case error.TIMEOUT:
               alert("The request to get user location timed out.");
               break;
          case error.UNKNOWN_ERROR:
               alert("An unknown error occurred.");
               break;
     }
}

