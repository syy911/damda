<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
    <meta charset="UTF-8">
    <jsp:include page="/resources/template/head.jsp"/>
    <script type="text/javascript" src="/resources/js/fullpage.js" ></script>
	<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <style type="text/css">
    #fullpage{
    z-index:-9;
    }
	/* Style for our header texts
	* --------------------------------------- */
	h1{
		font-size: 5em;
		font-family: arial,helvetica;
		color: #fff;
		margin:0;
		padding:0;
	}
	/* Centered texts in each section
	* --------------------------------------- */
	.section{
		text-align:center;
	}
	/* Backgrounds will cover all the section
	* --------------------------------------- */
	#section0,
	#section1,
    #slide1,
    #slide2{
		background-size: cover;
		background-attachment: fixed;
	}
	/* Defining each sectino background and styles
	* --------------------------------------- */
	#section0{
		background-image: url('/resources/imgs/salad5.jpg');
	}
	#textbox{
		margin:10% auto;
		width:100%;
	}
	#title{
		top:10%;
		transform: translateY(-20%);
		position: relative;
		color:black;
		margin-bottom:10%;		
	}
	#introtext{
		margin-top:0%;
		width:400px;
		margin-bottom:30%;
	}
	#section1{
		background-image: url('/resources/imgs/salad3.jpg');
	}
	#howtobox{
		width:70%;
	}
	#title2{
		transform: translateY(-50%);
		position: relative;
		top:20%;
		margin-top:0 auto;
	}
	#introtextbox1{
		margin-top:20%;		
		width:80%;
		height:200px;
		padding:10% auto;
		border:5px double white;
		margin-bottom:20%;
		background-image:url('/resources/imgs/blackopacity.png');
	}
	h2{
		color:white;
		font-weight:bold;
	}
	#section2{
		background-image: url('/resources/imgs/salad8.jpg');
	}
	#title3{
		transform: translateY(-50%);
		position: relative;
		top:20%;
		margin-top:0 auto;
	}
	#introtextbox2{
		margin-top:20%;		
		width:80%;
		height:200px;
		padding:10% auto;
		border:5px double white;
		margin-bottom:10%;
		background-image:url('/resources/imgs/blackopacity.png');
	}
	.text{
		font-size:25px;
	}
	@media only screen and (max-width: 767px){
	  #section0{
	  	background-image:url('/resources/imgs/salmon.PNG');
	  }
	  #section1{
	  	background-image:url('/resources/imgs/green.PNG');
	  }
	  #section2{
	  	background-image:url('/resources/imgs/pink.PNG');
	  }
	  #title{
		top:10%;
		transform: translateY(20%);
		position: relative;
		color:white;
		margin-bottom:2%;
	  }
	  #textbox{
		margin:40% auto;
	  }
	  #howtobox{
	  	margin-top:30%;
	  	width:100%;
	  }
	  #introtext{
		margin-top:0%;
		width:100%;
		margin-bottom:30%;
	 }
	  #introtextbox1{
	  	margin-top:2%;		
		width:72%;
	  }
	  #introtextbox2{
	  margin-top:2%;	
	  	width:72%;
	  	margin-bottom:30%;
	  }	  
	  .text{
	  	font-size:20px;
	  	width:100%;
	  }
	}
    </style>
    <script type="text/javascript">
    
 </script>
</head>
<body>
    <!-- ***********************************header start*********************************** -->
   <jsp:include page="/resources/template/header_custom.jsp"/>
   <!-- ***********************************content start*********************************** -->
   <div id="fullpage">
	<div class="section " id="section0">
		<h1 id="title">Dam da.</h1>
		<div class="container" id="textbox">
			<div class="col-md-6 col-md-offset-3 col-xs-10 col-xs-offset-1">
				<img src="/resources/imgs/introtext.png" alt="" id="introtext">
			</div>			
		</div>
	</div>
	<div class="section" id="section1">
		<h1 id="title2">Buy Salad!</h1>
			<div class="row" id="howtobox">
				<div class="col-md-4 col-md-offset-4 col-xs-4 col-xs-offset-2" id="introtextbox1">
					<h2 class="text">1. 원하는 샐러드를 장바구니에 담기</h3>
					<h2 class="text">2. 장바구니 내역 결제</h3>
					<h2 class="text">3. 받을 날짜와 시간입력하고 배송신청!</h3>
				</div>	
			</div>
	</div>
	<div class="section" id="section2">
		<h1 id="title3">커스텀 샐러드</h1>
		 	<div class="row" id="howtobox">
				<div class="col-md-4 col-md-offset-4 col-xs-4 col-xs-offset-2" id="introtextbox2">
					<h2 class="text">1. 나만의 샐러드에 넣을 재료 선택</h3>
					<h2 class="text">2. 장바구니에 담고 나의 레시피로도 저장!</h3>
					<h2 class="text">3. 받을 날짜와 시간입력하고 배송신청!</h3>
				</div>			
			</div>
	</div>
</div>
<!-- 위로 올리지말것 -->
<script type="text/javascript" src="/resources/js/fullpage.js"></script>
<script type="text/javascript" src="/resources/js/examples.js"></script>
<script type="text/javascript">
    var myFullpage = new fullpage('#fullpage', {
        verticalCentered: false,
        //to avoid problems with css3 transforms and fixed elements in Chrome, as detailed here: https://github.com/alvarotrigo/fullPage.js/issues/208
        css3:false
    });
</script>
    <!-- ***********************************content end*********************************** -->
    <!-- ***********************************footer*********************************** -->
    <jsp:include page="/resources/template/footer.jsp"/>
</body>
</html>
