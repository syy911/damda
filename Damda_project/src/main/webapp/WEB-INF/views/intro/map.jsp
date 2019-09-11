<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <jsp:include page="/resources/template/head.jsp"/>
    <style type="text/css">
		#title{
			margin-top:5%;
	      	margin-bottom:10%;
   		}
   		#title>h1{
	      	width:60%;
	      	text-align:center;
	      	margin:0px auto;
	      	padding-bottom:3%;
	      	font-size:30px;
   		}
   		.franchisee{
   			width:170px;
   			height:70px;
   		}
   		.franchisee>div:nth-child(1){
   			float:left;
   		}
   		.franchisee>div:nth-child(1)>img{
   			width:60px;
   			height:68px;
   		}
   		.franchisee>div:nth-child(2){
   			display:inline-block;
   			margin:10px 0px 0px 10px;
   		}
   		.franchisee>div:nth-child(2)>div:nth-child(1){
   			font-weight:bold;
   			font-size:16px;
   		}
   		.starRev{
   			font-size:13px;
   		}
   		.starRev>div:nth-child(1){
   			float:left;
   			margin:5px 0px 0px 0px;
   		}
   		.starRev>div:nth-child(2){
   			display:inline-block;
   			margin:0px 0px 0px 5px;
   		}
   		
   		/*별*/
   		.starR{
			margin:10px auto;
			background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat right 0;
			background-size: auto 100%;
			width: 10px;
			height: 10px;
			display: inline-block;
			text-indent: -9999px;
			cursor: pointer;
		}
		.starR.on{background-position:0 0;}
		/*테이블*/
		.rows{
			margin:0px 0px 30px 0px;
		}
		.franchiseeTable{
			border:1px solid black;
		}
		.franchiseeTable>div:nth-child(1){
		}
		.franchiseeTable>div:nth-child(1)>img{
			width:45px;
			height:45px;
			margin:10px 0px 10px 0px;
			float:left;
			display:inline-block;
		}
		.franchiseeTable>div:nth-child(1)>div{
			font-weight:bold;
			font-size:18px;
			margin:20px 0px 10px 10px;
			display:inline-block;
			color:#908b9d;
		}
		.franchiseeTable>div:nth-child(2)>div:nth-child(1){
			margin:10px 0px 0px 0px;
		}
		.franchiseeTable>div:nth-child(2)>div:nth-child(2){
			margin:5px 0px 10px 0px;
		}
		/*버튼*/
		#findfranchisee{
			border:2px solid #908b9d;
			cursor:pointer;
			font-size:18px;
			text-align:center;
			font-weight:bold;
			margin-top:6%;
			margin-bottom:5%;
		}
		#findfranchisee>div{
			margin:3px auto;
		}
    </style>
    <script type="text/javascript">
    	//1:홍대 2:신촌 3:명동 4:용산
		function findFrandchisee1(i){
			var mapContainer = document.getElementById('map'); // 지도를 표시할 div  
			if(i==1){
				var mapOption = {
					center: new kakao.maps.LatLng(37.555488, 126.923993),
					level: 2
				}
			}else if(i==2){
				var mapOption = {
					center: new kakao.maps.LatLng(37.557280, 126.936529),
					level: 2
				}
			}else if(i==3){
				var mapOption = {
					center: new kakao.maps.LatLng(37.564055, 126.984558),
					level: 2
				}
			}else if(i==4){
				var mapOption = {
					center: new kakao.maps.LatLng(37.537296, 126.965467),
					level: 2
				}
			}
			var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

			// 마커 이미지 바꾸기
			var imageSrc = '/resources/imgs/markerImg.png', // 마커이미지의 주소입니다    
		    imageSize = new kakao.maps.Size(55, 65), // 마커이미지의 크기입니다
		    imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

		 	// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
		    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);
			
			// 확대 축소 X
			map.setZoomable(false);
			// 마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
			var positions = [
			    {
			        content: '<div class="franchisee"><div><img src="/resources/imgs/7.jpg"/></div><div><div>담다 홍대점</div><div class="starRev"><div>4.7점</div><div><span class="starR on">별1</span><span class="starR on">별2</span><span class="starR on">별3</span><span class="starR on">별4</span><span class="starR">별5</span></div></div></div></div>',
			        latlng: new kakao.maps.LatLng(37.555488, 126.923993)
			    },
			    {
			        content: '<div class="franchisee"><div><img src="resources/imgs/s01.jpg"/></div><div><div>담다 신촌점</div><div class="starRev"><div>5점</div><div><span class="starR on">별1</span><span class="starR on">별2</span><span class="starR on">별3</span><span class="starR on">별4</span><span class="starR on">별5</span></div></div></div></div>', 
			        latlng: new kakao.maps.LatLng(37.557280, 126.936529)
			    },
			    {
			        content: '<div class="franchisee"><div><img src="resources/imgs/5.jpg"/></div><div><div>담다 명동점</div><div class="starRev"><div>4.1점</div><div><span class="starR on">별1</span><span class="starR on">별2</span><span class="starR on">별3</span><span class="starR on">별4</span><span class="starR">별5</span></div></div></div></div>', 
			        latlng: new kakao.maps.LatLng(37.564055, 126.984558)
			    },
			    {
			        content: '<div class="franchisee"><div><img src="resources/imgs/9.jpg"/></div><div><div>담다 용산점</div><div class="starRev"><div>4.4점</div><div><span class="starR on">별1</span><span class="starR on">별2</span><span class="starR on">별3</span><span class="starR on">별4</span><span class="starR">별5</span></div></div></div></div>', 
			        latlng: new kakao.maps.LatLng(37.537296, 126.965467)
			    }
			];
			//클릭시 스크롤 올라가게
			var offset = $('#thisScroll').offset();
			$('html, body').animate({scrollTop : offset.top}, 400);
			
			if(i==1){
				// 마커 생성후 지도에 표시
				var marker = new kakao.maps.Marker({
					map: map,	// 마커를 표시할 지도
					position: positions[0].latlng,
					image:markerImage
				});
				// 인포윈도우 생성후 지도에 표시
				var infowindow = new kakao.maps.InfoWindow({
					map: map,	// 인포윈도우 표시할 지도
					position: positions[0].latlng,
					content: positions[0].content
				});
			}else if(i==2){
				// 마커 생성후 지도에 표시
				var marker = new kakao.maps.Marker({
					map: map,	// 마커를 표시할 지도
					position: positions[1].latlng,
					image:markerImage
				});
				// 인포윈도우 생성후 지도에 표시
				var infowindow = new kakao.maps.InfoWindow({
					map: map,	// 인포윈도우 표시할 지도
					position: positions[1].latlng,
					content: positions[1].content
				});
			}else if(i==3){
				// 마커 생성후 지도에 표시
				var marker = new kakao.maps.Marker({
					map: map,	// 마커를 표시할 지도
					position: positions[2].latlng,
					image:markerImage
				});
				// 인포윈도우 생성후 지도에 표시
				var infowindow = new kakao.maps.InfoWindow({
					map: map,	// 인포윈도우 표시할 지도
					position: positions[2].latlng,
					content: positions[2].content
				});
			}else if(i==4){
				// 마커 생성후 지도에 표시
				var marker = new kakao.maps.Marker({
					map: map,	// 마커를 표시할 지도
					position: positions[3].latlng,
					image:markerImage
				});
				// 인포윈도우 생성후 지도에 표시
				var infowindow = new kakao.maps.InfoWindow({
					map: map,	// 인포윈도우 표시할 지도
					position: positions[3].latlng,
					content: positions[3].content
				});
			}
			infowindow.open(map, marker);
		}

    	
    	$(function(){
    		//마우스 올렸을 시 아이콘 변경
    		$('.franchiseeTable').mouseover(function(){
        		$(this).children().eq(0).children().eq(0).attr("src","/resources/icon/salad.png");
        		$(this).children().eq(2).children().css('border','2px solid #eca688').css('background-color','#eca688').css('color','white');
        	}).mouseleave(function(){
        		$(this).children().eq(0).children().eq(0).attr("src","/resources/icon/salad2.png");
        		$(this).children().eq(2).children().css('border','2px solid #908b9d').css('background-color','white').css('color','black');
            });
        });
    </script>
</head>
<body>
	<jsp:include page="/resources/template/header.jsp"/>
	<div class="col-md-8 col-md-offset-2 col-sm-8 col-sm-offset-2 col-xs-10 col-xs-offset-1" id="title">
	    <h1 id="thisScroll">   매장 찾기   </h1>
	    <div class="row">
			<div id="map" style="margin:20px auto; width:100%; height:450px;"></div>
		</div>
		<br/><br/>
		<!-- 홍대점 -->
		<div class="rows">
			<div class="row franchiseeTable">
				<div class="col-md-3 col-sm-12">
					<img src="/resources/icon/salad2.png"/>
					<div>담다 홍대점</div>
				</div>
				<div class="col-md-6 col-sm-12">
					<div>서울특별시 마포구 서교동 어울마당로 124</div>
					<div>Tel.  050-71317-1341</div>
				</div>
				<div class="col-md-3 col-sm-12">
					<div class="col-md-8 col-md-offset-3" id="findfranchisee">
						<div onclick="findFrandchisee1(1)"><div>매장 찾기</div></div>
					</div>
				</div>
			</div>
		</div>
		<!-- 신촌점 -->
		<div class="rows">
			<div class="row franchiseeTable">
				<div class="col-md-3">
					<img src="/resources/icon/salad2.png"/>
					<div>담다 신촌점</div>
				</div>
				<div class="col-md-6">
					<div>서울특별시 서대문구 창천동 31-52</div>
					<div>Tel.  050-78951-1341</div>
				</div>
				<div class="col-md-3 col-sm-12">
					<div class="col-md-8 col-md-offset-3" id="findfranchisee">
						<div onclick="findFrandchisee1(2)">매장 찾기</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 명동점 -->
		<div class="rows">
			<div class="row franchiseeTable">
				<div class="col-md-3">
					<img src="/resources/icon/salad2.png"/>
					<div>담다 명동점</div>
				</div>
				<div class="col-md-6">
					<div>서울특별시 중구 명동 명동7길 6</div>
					<div>Tel.  02-336-1341</div>
				</div>
				<div class="col-md-3 col-sm-12">
					<div class="col-md-8 col-md-offset-3" id="findfranchisee">
						<div onclick="findFrandchisee1(3)">매장 찾기</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 대학로점 -->
		<div class="rows">
			<div class="row franchiseeTable">
				<div class="col-md-3">
					<img src="/resources/icon/salad2.png"/>
					<div>담다 용산점</div>
				</div>
				<div class="col-md-6">
					<div>서울특별시 용산구 원효로1동 원효로 210-1</div>
					<div>Tel.  02-486-1341</div>
				</div>
				<div class="col-md-3 col-sm-12">
					<div class="col-md-8 col-md-offset-3" id="findfranchisee">
						<div onclick="findFrandchisee1(4)">매장 찾기</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 지도 스크립트 start -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=cbbfd539916fc8d8bdca3da66620691e"></script>
	<script>
		var mapContainer = document.getElementById('map'); // 지도를 표시할 div  
		var mapOption = { 
		        center: new kakao.maps.LatLng(37.564055, 126.984558), // 지도의 중심좌표
		        level: 7 // 지도의 확대 레벨
		};
		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

		// 마커 이미지 바꾸기
		var imageSrc = '/resources/imgs/markerImg.png', // 마커이미지의 주소입니다    
	    imageSize = new kakao.maps.Size(55, 65), // 마커이미지의 크기입니다
	    imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
		
	 	// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
	    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);
	    
		// 마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
		var positions = [
		    {
		        content: '<div class="franchisee"><div><img src="/resources/imgs/s01.jpg"/></div><div><div>담다 신촌점</div><div class="starRev"><div>5점</div><div><span class="starR on">별1</span><span class="starR on">별2</span><span class="starR on">별3</span><span class="starR on">별4</span><span class="starR on">별5</span></div></div></div></div>', 
		        latlng: new kakao.maps.LatLng(37.557280, 126.936529)
		    },
		    {
		        content: '<div class="franchisee"><div><img src="/resources/imgs/5.jpg"/></div><div><div>담다 명동점</div><div class="starRev"><div>4.1점</div><div><span class="starR on">별1</span><span class="starR on">별2</span><span class="starR on">별3</span><span class="starR on">별4</span><span class="starR">별5</span></div></div></div></div>', 
		        latlng: new kakao.maps.LatLng(37.564055, 126.984558)
		    },
		    {
		        content: '<div class="franchisee"><div><img src="/resources/imgs/9.jpg"/></div><div><div>담다 용산점</div><div class="starRev"><div>4.4점</div><div><span class="starR on">별1</span><span class="starR on">별2</span><span class="starR on">별3</span><span class="starR on">별4</span><span class="starR">별5</span></div></div></div></div>', 
		        latlng: new kakao.maps.LatLng(37.537296, 126.965467)
		    },
		    {
		        content: '<div class="franchisee"><div><img src="/resources/imgs/7.jpg"/></div><div><div>담다 홍대점</div><div class="starRev"><div>4.7점</div><div><span class="starR on">별1</span><span class="starR on">별2</span><span class="starR on">별3</span><span class="starR on">별4</span><span class="starR">별5</span></div></div></div></div>',
		        latlng: new kakao.maps.LatLng(37.555488, 126.923993)
		    }
		];
		//확대 축소 X
		map.setZoomable(false);
		//중심좌표로 이동1
		var bounds = new kakao.maps.LatLngBounds();
		for (var i = 0; i < positions.length; i ++) {
		    // 마커를 생성합니다
		    var marker = new kakao.maps.Marker({
		        map: map, // 마커를 표시할 지도
		        position: positions[i].latlng, // 마커의 위치
		        image:markerImage
		    });
		    // 마커에 표시할 인포윈도우를 생성합니다 
		    var infowindow = new kakao.maps.InfoWindow({
		        content: positions[i].content // 인포윈도우에 표시할 내용
		    });
		    // 마커에 이벤트를 등록하는 함수 만들고 즉시 호출하여 클로저를 만듭니다
		    // 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
		    (function(marker, infowindow) {
		        // 마커에 mouseover 이벤트를 등록하고 마우스 오버 시 인포윈도우를 표시합니다 
		        kakao.maps.event.addListener(marker, 'mouseover', function() {
		            infowindow.open(map, marker);
		        });
		        // 마커에 mouseout 이벤트를 등록하고 마우스 아웃 시 인포윈도우를 닫습니다
		        kakao.maps.event.addListener(marker, 'mouseout', function() {
		            infowindow.close();
		        });
		    })(marker, infowindow);
		  	//중심좌표로 이동2
		    bounds.extend(positions[i].latlng);
		}
		//중심좌표로 이동3
		map.setBounds(bounds);
	</script>
	<!-- 지도 스크립트 end -->
	<jsp:include page="/resources/template/footer.jsp"/>
</body>
</html>