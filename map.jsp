<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>다음 지도 API</title>

	<style>
		body{
			margin:0px;
		}
           #map{
			   width:100vw; height: 100vh;
		   }
	</style>
</head>
<body>
	<div style= "position:absolute; z-index:9; padding:20px;">
		<button style="font-size:1.2m;" onclick="viewMarker();"> 마커보이기 </button>
	</div>
	<div id="map" ></div>

	<script src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=7159fa05fb54e6619dd9c92df182c1b6"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new kakao.maps.LatLng(37.56632, 126.97694), // 지도의 중심좌표
		        level: 2, // 지도의 확대 레벨
		        mapTypeId : kakao.maps.MapTypeId.ROADMAP // 지도종류
		    }; 

		// 지도를 생성한다 
		var map = new kakao.maps.Map(mapContainer, mapOption); 



		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(37.312658, 126.806349), // 지도의 중심좌표
        level: 4 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다



function viewMarker(){

// 마커가 표시될 위치입니다 
var markerPosition  = new kakao.maps.LatLng(37.312658, 126.806349); 
// 마커를 생성합니다
var marker = new kakao.maps.Marker({
    position: markerPosition
});

// 마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);

var iwContent = '<div style="padding:5px;">신안산대학교</div>'// 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
// 인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({ 
    content : iwContent 

		
});




  
// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
infowindow.open(map, marker);


// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
// marker.setMap(null); 

}
var positions = [
    {
        title: '세븐일레븐', 
        latlng: new kakao.maps.LatLng(37.314232, 126.815571)
    },
    {
        title: 'CU', 
        latlng: new kakao.maps.LatLng(37.314966, 126.818167)
    },
	{
        title: 'GS25',
        latlng: new kakao.maps.LatLng(37.307168, 126.815152)
    },
	{
        title: 'GS25',
        latlng: new kakao.maps.LatLng(37.309678, 126.813019)
    },
	{
        title: 'CU', 
        latlng: new kakao.maps.LatLng(37.310217, 126.815371)
    },
	{
        title: '미니스톱', 
        latlng: new kakao.maps.LatLng(37.307385, 126.813010)
    },
	{
        title: 'GS25그린빌점', 
        latlng: new kakao.maps.LatLng(37.305219, 126.809843)
    },
	{
        title: '이마트24', 
        latlng: new kakao.maps.LatLng(37.305185, 126.809645)
    },
	// 편의점


	{
        title: '뚜레쥬르', 
        latlng: new kakao.maps.LatLng(37.308771, 126.815315)
    },
	{
        title: '엔젤리너스',
        latlng: new kakao.maps.LatLng(37.308146, 126.815742)
    },
	//빵집
];

// 마커 이미지의 이미지 주소입니다
var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
    
for (var i = 0; i < positions.length; i ++) {
    
    // 마커 이미지의 이미지 크기 입니다
    var imageSize = new kakao.maps.Size(24, 35); 
    
    // 마커 이미지를 생성합니다    
    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
    
    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: positions[i].latlng, // 마커를 표시할 위치
        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
        image : markerImage // 마커 이미지 
    });
    var map = new kakao.maps.Map(mapContainer, mapOption);

// 마커가 표시될 위치입니다 
var markerPosition  = new kakao.maps.LatLng(37.312658, 126.806349); 

// 마커를 생성합니다
var marker = new kakao.maps.Marker({
    position: markerPosition
});

// 마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);

var iwContent = '<div style="padding:5px;">신안산대학교 <br><a href="https://map.kakao.com/link/map/Hello World!,37.312658, 126.806349" style="color:blue" target="_blank">큰지도보기</a> <a href="https://map.kakao.com/link/to/Hello World!,37.312658, 126.806349" style="color:blue" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
    iwPosition = new kakao.maps.LatLng(37.312658, 126.806349); //인포윈도우 표시 위치입니다

// 인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({
    position : iwPosition, 
    content : iwContent 
});
  
// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
infowindow.open(map, marker); 

}
	</script>
</body>
</html>