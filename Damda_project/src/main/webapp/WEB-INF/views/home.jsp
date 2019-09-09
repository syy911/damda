<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="/resources/template/head.jsp"/>
 <style type="text/css">
        /*content********************************/
        #content h2 {
            text-align: center;
            margin: 80px auto 20px auto;
        }

        #content .thumbnail img {
            width: 100%;
        }

        #content .caption p {
            margin: 0px auto 0px 2px;
            font-weight: bold;
            font-size: 16px;
            color: darksalmon;
        }

        #content button {
            height: 55px;
        }

        #content .thumbnail {
        	z-index: 2;
            border: 0px;
            box-shadow: none;
        }
        
        #content .thumbnail a{
        	text-decoration: none;
        	color: black;
        }

        /*carousel*/
        #myCarousel .nav a small {
            display: block;
        }

        #myCarousel .nav {
            background: white;
        }

        .nav-justified>li>a {
            border-radius: 0px;
        }

        .nav-pills>li {
            border-bottom: 1px solid gray;
            border-left: 1px solid gray;

        }

        .nav-pills>li[data-slide-to="0"].active a {
            background-color: darksalmon;
        }

        .nav-pills>li[data-slide-to="1"].active a {
            background-color: darksalmon;
        }

        .nav-pills>li[data-slide-to="2"].active a {
            background-color: darksalmon;
        }

        .nav-pills>li[data-slide-to="3"].active a {
            background-color: darksalmon;
        }

        /*middleSection*/
        #row1 {
            background-image: url("/resources/imgs/bg.jpg");
            /* 	background-color: #0f5152; */
            height: 650px;
            font-family: 'Karma', serif;
            color: #ffffff;
            position: relative;
        }

        #row1 #middleName {
            color: #cde4b0;
        }

        #row1 #front1-wrap {
            position: absolute;
            top: -25px;
            left: 26px;
            opacity: 0;
            transform: scale(0.6);
        }

        #row1 #front2-wrap {
            position: absolute;
            top: 0px;
            left: 25px;
            opacity: 0;
            transform: scale(0.6);
        }

        #row1 #front3-wrap {
            position: absolute;
            top: -30px;
            left: -15px;
            opacity: 0;
            transform: scale(0.6);
        }

        #row1 img {
            cursor: pointer;
        }

        #row1 #bullet-journal {
            background-image: url("/resources/imgs/bullet-journal.png");
            background-repeat: no-repeat;
            width: 250px;
            height: 360px;
        }

        #row1 #bullet-journal ul {
            list-style: none;
            padding-left: 0px;
        }

        #row1 #bullet-journal ul li {
            cursor: pointer;

        }


        #row1 #bullet-journal ul li h2 {
            padding: 0px;
            margin: 50px;
        }

        #row1 #blank1 {
            height: 70px;
        }

        .addColor {
            color: #cde4b0;
        }

        .hid_middle {
            display: none;
        }

        .hid_middle img {
            width: 100%;
        }

        #container {
            margin: 0px auto 50px auto;
        }
        
     </style>
    
     <script type="text/javascript">
        $(document).ready(function() {
            //캐러샐
            $('#myCarousel').carousel({
                interval: 4000
            });

            var clickEvent = false;
            $('#myCarousel').on('click', '.nav a', function() {
                clickEvent = true;
                $('.nav li').removeClass('active');
                $(this).parent().addClass('active');
            }).on('slid.bs.carousel', function(e) {
                if (!clickEvent) {
                    var count = $('.nav').children().length - 1;
                    var current = $('.nav li.active');
                    current.removeClass('active').next().addClass('active');
                    var id = parseInt(current.data('slide-to'));
                    if (count == id) {
                        $('.nav li').first().addClass('active');
                    }
                }
                clickEvent = false;
            });

            //middleSection
            /* 커서따라서 이미지움직이기-parallax효과 ***************************/
            $("#row1 img").mousemove(function(e) {
                parallaxIt(e, "#row1 img", 100);
                // 		  parallaxIt(e, "#row1 #mainMiddle2", 100); 
                // 		  parallaxIt(e, "#row1 #mainMiddle3", 100);
            });

            function parallaxIt(e, target, movement) {
                var $this = $("#container");
                var relX = e.pageX - $this.offset().left;
                var relY = e.pageY - $this.offset().top;

                TweenMax.to(target, 1, {
                    x: (relX - $this.width() / 2) / $this.width() * movement,
                    y: (relY - $this.height() / 2) / $this.height() * movement,
                    ease: Power2.easeOut
                });
            }

            /*마우스 오버에 따라 바뀌는 이미지 이름을 가져오는 function ***************************/
            var fileValue1;
            var fileName1;
            var fileValue2;
            var fileName2;
            var fileValue3;
            var fileName3;

            function imgName() {
                fileValue1 = $('#mainMiddle1').attr("src").split("/");
                fileName1 = fileValue1[fileValue1.length - 1];
                fileValue2 = $('#mainMiddle2').attr("src").split("/");
                fileName2 = fileValue2[fileValue2.length - 1];
                fileValue3 = $('#mainMiddle3').attr("src").split("/");
                fileName3 = fileValue3[fileValue3.length - 1];
            }

            /*오른쪽 메뉴에 mouseover가 바뀔 때마다 해당 메뉴의 이미지로 바뀜 *************************/
            $('#bullet-journal ul').on("mouseover", "#salad", function() {
                imgName();
                $('#mainMiddle1').attr("src", $('#mainMiddle1').attr("src").replace(fileName1, "plate01.png"));
                $('#mainMiddle2').attr("src", $('#mainMiddle2').attr("src").replace(fileName2, "plate02.png"));
                $('#mainMiddle3').attr("src", $('#mainMiddle3').attr("src").replace(fileName3, "cutlery.png"));
                $('#front3').css('top', '-30px')
                    .css('left', '-15px');
            });
            $('#bullet-journal ul').on("mouseover", "#dessert", function() {
                imgName();
                $('#mainMiddle1').attr("src", $('#mainMiddle1').attr("src").replace(fileName1, "drinkingjelly.png"));
                $('#mainMiddle2').attr("src", $('#mainMiddle2').attr("src").replace(fileName2, "gyul.png"));
                $('#mainMiddle3').attr("src", $('#mainMiddle3').attr("src").replace(fileName3, "cookie.png"));
                $('#front3-wrap').css('top', '-30px')
                    .css('left', '50px');
            });

            $('#bullet-journal ul').on("mouseover", "#beverage", function() {
                imgName();
                $('#mainMiddle1').attr("src", $('#mainMiddle1').attr("src").replace(fileName1, "tea.png"));
                $('#mainMiddle2').attr("src", $('#mainMiddle2').attr("src").replace(fileName2, "soda.png"));
                $('#mainMiddle3').attr("src", $('#mainMiddle3').attr("src").replace(fileName3, "bluewater.png"));
                $('#front3-wrap').css('top', '-5px')
                    .css('left', '40px');
            });

            /*오른쪽 메뉴에 mouseenter가 바뀔 때마다 폰트 색이 바뀜 *************************/
            /*이미지 클릭시 생겼던 로고의 투명도가 리셋->0으로 돌아감 *************************/
            $('#bullet-journal ul #salad').mouseenter(function() {
                $('#dessert').removeClass("addColor");
                $('#beverage').removeClass("addColor");
                $('#salad').addClass("addColor");
                $('.front-wrap').css('opacity', '0');
            });
            $('#bullet-journal ul #dessert').mouseenter(function() {
                $('#salad').removeClass("addColor");
                $('#beverage').removeClass("addColor");
                $('#dessert').addClass("addColor");
                $('.front-wrap').css('opacity', '0');
            });
            $('#bullet-journal ul #beverage').mouseenter(function() {
                $('#salad').removeClass("addColor");
                $('#dessert').removeClass("addColor");
                $('#beverage').addClass("addColor");
                $('.front-wrap').css('opacity', '0');
            });

            /* 이미지의 외부영역을 클릭시 fade-In 됐던 로고 사라짐 *************************/
            $('html').click(function(e) {
                if (!$(e.target).hasClass("front-wrap")) {
                    $('.front-wrap').css('opacity', '0');
                }
            });

            /*이미지의 클릭시 로고 fade-In 등장 *************************/
            // 	페이지 이동시킬까..?
            $('#front1-wrap').click(function() {
                $(this).animate({
                    opacity: "1"
                }, 300);
                // 		 setTimeout(function(){ window.location = "#"; }, 300);
            });
            $('#front2-wrap').click(function() {
                $(this).animate({
                    opacity: "1"
                }, 300);
                // 		 setTimeout(function(){ window.location = "#"; }, 300);
            });
            $('#front3-wrap').click(function() {
                $(this).animate({
                    opacity: "1"
                }, 300);
                // 		 setTimeout(function(){ window.location = "#"; }, 300);
            });
            
            price_setting();

            btn_href();
        });//ready

        function btn_href(){

        	 $('.best_btn').click(function(){
 				location.href="/item/best";
             });

        	 $('.salad_btn').click(function(){
 				location.href="/item/salad";
             });

        	 $('.dessert_btn').click(function(){
 				location.href="/item/dessert";
             });

        	 $('.drink_btn').click(function(){
 				location.href="/item/drink";
             });
        }

	    //가격세팅
	    function price_setting() {
	         var itemName_arr = $('.itemNum').get();
	         var length = itemName_arr.length;
	
	         for (var i = 0; i < length; i++) {
	             var id = itemName_arr[i].value;
	             total_price(id);
	         }
	     }
	
	     //가격 완제품 
	     function total_price(id) {
	         var input_id = '#'+id;
	         //input의 val값구하기
	         var price = $(input_id).val();
	
	         //가격*수량의 문자열 길이
	         var length = price.length;
	
	         //3자리 마다 ,들어간 형식으로 변환된 가격
	         var price_view = price_viewer(price, length);
	
	         //class는 p영역
	         var p_msg = '.' + id;
	         $(p_msg).html(price_view);
	     }
	
	     //가격뷰어
	     function price_viewer(price, length) {
	         var frontPrice;
	         var middlePrice1;
	         var middlePrice2;
	         var backPrice;
	         var totalPrice;
	
	         //100원 단위
	         if (length >= 0 && length <= 3) {
	             backPrice = price.substring(length - 3, length);
	             totalPrice = backPrice + '원';
	
	             //1,000원~100,000원 단위
	         } else if (length > 3 && length <= 6) {
	             frontPrice = price.substring(0, length - 3);
	             backPrice = price.substring(length - 3, length);
	             totalPrice = frontPrice + ',' + backPrice + '원';
	
	             //1,000,000원~100,000,000원 단위
	         } else if (length > 6 && length <= 9) {
	             frontPrice = price.substring(0, length - 6);
	             middlePrice1 = price.substring(length - 6, length - 3);
	             backPrice = price.substring(length - 3, length);
	             totalPrice = frontPrice + ',' + middlePrice1 + ',' + backPrice + '원';
	
	             //1,000,000,000원 ~100,000,000,000단위
	         } else if (length > 9 && length <= 12) {
	             frontPrice = price.substring(length - 12, length - 9);
	             middlePrice1 = price.substring(length - 9, length - 6);
	             middlePrice2 = price.substring(length - 6, length - 3);
	             backPrice = price.substring(length - 3, length);
	             totalPrice = frontPrice + ',' + middlePrice1 + ',' + middlePrice2 + ',' + backPrice + '원';
	
	         }
	
	         return totalPrice;
	     }
    </script>
</head>
<body>
<jsp:include page="/resources/template/header.jsp"/>
<!-- content start -->
	<div class="row">
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
		<!-- Wrapper for slides -->
	        <div class="carousel-inner">
	            <div class="item active">
	                <img src="/resources/imgs/mainSlider01.png">
	            </div>
	            <!-- End Item -->
	            <div class="item">
	                <img src="/resources/imgs/mainSlider02.png">
	            </div>
	            <!-- End Item -->
	            <div class="item">
	                <img src="/resources/imgs/mainSlider03.png">
	            </div>
	            <!-- End Item -->
	            <div class="item">
	                <img src="/resources/imgs/mainSlider04.png">
	            </div>
	            <!-- End Item -->
	        </div>
	        <!-- End Carousel Inner -->
	        <ul class="nav nav-pills nav-justified">
	            <li data-target="#myCarousel" data-slide-to="0" class="active"><a href="#">바른 샐러드 6종<br /><small>건강하게 맛있게 간편하게!</small></a></li>
	            <li data-target="#myCarousel" data-slide-to="1"><a href="#">Dam da. 리뷰이벤트<br /><small>나만의 샐러드 레시피를 공유하고 50000포인트 받아가자!</small></a></li>
	            <li data-target="#myCarousel" data-slide-to="2"><a href="#">커스텀샐러드<br /><small>'원하는 재료'를 선택하여 나만의 샐러드를 만들어보세요!</small></a></li>
	            <li data-target="#myCarousel" data-slide-to="3"><a href="#">신규가입혜택<br /><small>Dam da. 신규가입회원을 위한 다양한 혜택</small></a></li>
	        </ul>
	    </div>
	    <!-- End Carousel -->
	</div>
	
	
	<!--middle upper content------------------------------------------->
	<div id="container" class="conainter-fluid col-md-12">
	    <div id="row1" class="row text-center">
	        <div id="middleName" class="col-md-4 col-md-offset-4">
	            <h3>· ALL CATEGORIES ·</h3>
	        </div>
	        <div class="col-md-6">
	            <!-- 움직이는 첫번째 음식-salad menu ---------------------------->
	            <div id="plate01-wrap" class="col-md-4 col-md-offset-4">
	                <img id="mainMiddle1" alt="plate01" src="/resources/imgs/plate01.png" />
	                <div id="front1-wrap" class="front-wrap">
	                    <img id="front1" src="/resources/imgs/hoverAni.png" />
	                </div>
	            </div>
	
	            <!-- 움직이는 두번째 음식-salad menu ---------------------------->
	            <div id="plate02-wrap" class="col-md-4 col-md-offset-7">
	                <img id="mainMiddle2" alt="plate02" src="/resources/imgs/plate02.png" />
	                <div id="front2-wrap" class="front-wrap">
	                    <img id="front2" src="/resources/imgs/hoverAni.png" />
	                </div>
	            </div>
	
	            <!-- 움직이는 세번째 음식-salad menu ---------------------------->
	            <div id="cutlery-wrap" id="mainMiddle3" class="col-md-4 col-md-offset-4">
	                <img id="mainMiddle3" alt="cutlery" src="/resources/imgs/cutlery.png" />
	                <div id="front3-wrap" class="front-wrap">
	                    <img id="front3" src="/resources/imgs/hoverAni.png" />
	                </div>
	            </div>
	        </div>
	        <div id="row2" class="row text-center">
	            <div class="col-md-6">
	                <!-- 오른쪽 All Categories ---------------------------->
	                <div id="blank1" class="col-md-12"></div>
	                <div id="bullet-journal" class="col-md-4 col-md-offset-2">
	                    <br />
	                    <ul>
	                        <li id="salad">
	                            <h2>SALAD</h2>
	                        </li>
	                        <li id="dessert">
	                            <h2>DESSERT</h2>
	                        </li>
	                        <li id="beverage">
	                            <h2>BEVERAGE</h2>
	                        </li>
	                    </ul>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>
	<div class="row hid_middle">
	    <div class="col-md-12">
	        <img src="/resources/imgs/middle_s.jpg" />
	    </div>
	</div>
	<!--middle upper content end------------------------------------------->
	
	
	<h2>BEST</h2>
	<c:set var="i" value="0"/>
	<c:set var="j" value="3"/>
	<div>
		<c:forEach items="${List}" var="List" varStatus="status">
			<c:if test="${i%j==0 }">
				<div class="row col-md-offset-1 col-md-10 col-sm-12">
			</c:if>
	        <div class="col-xs-4 col-sm-4 col-md-4">
		        <div class="thumbnail">
		        	<a href="/item/detail?no=${List.itemNum}">
		            <img src="${List.photoPath}" />
		            </a>
		            <div class="caption">
		                <a href="/item/detail?no=${List.itemNum}">
		                <h3>${List.itemName}</h3>
		                </a>
		                <a href="/item/detail?no=${List.itemNum}">
		                <p class="${List.itemNum}">가격변환</p>
			        	</a>
		                <input type="text" id="${List.itemNum}" value="${List.itemPrice }" hidden="hidden"/>
		                <input type="text" class="itemNum" value="${List.itemNum }" hidden="hidden"/>
		            </div>
		        </div>
		    </div>
	    	<c:if test="${i%j==j-1 }">
				</div>
	    	</c:if>
	    	<c:set var="i" value="${i+1 }"/>
		</c:forEach>
	</div>
	
	<div class="row">
	    <div class="col-md-offset-5 col-md-2">
	        <button type="button" class="btn btn-default btn-lg btn-block best_btn">베스트상품 전체보기<img src="/resources/icon/rigth.png" style="width: 15px" /></button>
	    </div>
	</div>
	
	
	<%-- 
	<h2>NEW</h2>
	<c:set var="i" value="0"/>
	<c:set var="j" value="3"/>
	<div>
		<c:forEach items="${List}" var="List" varStatus="status">
			<c:if test="${i%j==0 }">
				<div class="row col-md-offset-1 col-md-10 col-sm-12">
			</c:if>
	        <div class="col-xs-4 col-sm-4 col-md-4">
		        <div class="thumbnail">
		        	<a href="/item/detail?no=${List.itemNum}">
		            <img src="${List.photoPath}" />
		            </a>
		            <div class="caption">
		                <a href="/item/detail?no=${List.itemNum}">
		                <h3>${List.itemName}</h3>
		                </a>
		                <a href="/item/detail?no=${List.itemNum}">
		                <p class="${List.itemNum}">가격변환</p>
			        	</a>
		                <input type="text" id="${List.itemNum}" value="${List.itemPrice }" hidden="hidden"/>
		                <input type="text" class="item" value="${List.itemNum }" hidden="hidden"/>
		            </div>
		        </div>
		    </div>
	    	<c:if test="${i%j==j-1 }">
				</div>
	    	</c:if>
	    	<c:set var="i" value="${i+1 }"/>
		</c:forEach>
	</div> 
	<div class="row">
	    <div class="col-md-offset-5 col-md-2">
	        <button type="button" class="btn btn-default btn-lg btn-block">신상품 전체보기<img src="/resources/icon/rigth.png" style="width: 15px" /></button>
	    </div>
	</div>
	--%>
	
	<h2>SALAD</h2>
	<c:set var="i" value="0"/>
	<c:set var="j" value="3"/>
	<div>
		<c:forEach items="${List1}" var="List" varStatus="status">
			<c:if test="${i%j==0 }">
				<div class="row col-md-offset-1 col-md-10 col-sm-12">
			</c:if>
	        <div class="col-xs-4 col-sm-4 col-md-4">
		        <div class="thumbnail">
		        	<a href="/item/detail?no=${List.itemNum}">
		            <img src="${List.photoPath}" />
		            </a>
		            <div class="caption">
		                <a href="/item/detail?no=${List.itemNum}">
		                <h3>${List.itemName}</h3>
		                </a>
		                <a href="/item/detail?no=${List.itemNum}">
		                <p class="${List.itemNum}">가격변환</p>
			        	</a>
		                <input type="text" id="${List.itemNum}" value="${List.itemPrice }" hidden="hidden"/>
		                <input type="text" class="itemNum" value="${List.itemNum }" hidden="hidden"/>
		            </div>
		        </div>
		    </div>
	    	<c:if test="${i%j==j-1 }">
				</div>
	    	</c:if>
	    	<c:set var="i" value="${i+1 }"/>
		</c:forEach>
	</div>
	
	<div class="row">
	    <div class="col-md-offset-5 col-md-2">
	        <button type="button" class="btn btn-default btn-lg btn-block salad_btn">샐러드 전체보기<img src="/resources/icon/rigth.png" style="width: 15px" /></button>
	    </div>
	</div>
	
	<h2>DESSERT</h2>
	<c:set var="i" value="0"/>
	<c:set var="j" value="3"/>
	<div>
		<c:forEach items="${List2}" var="List" varStatus="status">
			<c:if test="${i%j==0 }">
				<div class="row col-md-offset-1 col-md-10 col-sm-12">
			</c:if>
	        <div class="col-xs-4 col-sm-4 col-md-4">
		        <div class="thumbnail">
		        	<a href="/item/detail?no=${List.itemNum}">
		            <img src="${List.photoPath}" />
		            </a>
		            <div class="caption">
		                <a href="/item/detail?no=${List.itemNum}">
		                <h3>${List.itemName}</h3>
		                </a>
		                <a href="/item/detail?no=${List.itemNum}">
		                <p class="${List.itemNum}">가격변환</p>
			        	</a>
		                <input type="text" id="${List.itemNum}" value="${List.itemPrice }" hidden="hidden"/>
		                <input type="text" class="itemNum" value="${List.itemNum }" hidden="hidden"/>
		            </div>
		        </div>
		    </div>
	    	<c:if test="${i%j==j-1 }">
				</div>
	    	</c:if>
	    	<c:set var="i" value="${i+1 }"/>
		</c:forEach>
	</div>
	
	<div class="row">
	    <div class="col-md-offset-5 col-md-2">
	        <button type="button" class="btn btn-default btn-lg btn-block dessert_btn">디저트 전체보기<img src="/resources/icon/rigth.png" style="width: 15px" /></button>
	    </div>
	</div>
	
	<h2>DRINK</h2>
	<c:set var="i" value="0"/>
	<c:set var="j" value="3"/>
	<div>
		<c:forEach items="${List3}" var="List" varStatus="status">
			<c:if test="${i%j==0 }">
				<div class="row col-md-offset-1 col-md-10 col-sm-12">
			</c:if>
	        <div class="col-xs-4 col-sm-4 col-md-4">
		        <div class="thumbnail">
		        	<a href="/item/detail?no=${List.itemNum}">
		            <img src="${List.photoPath}" />
		            </a>
		            <div class="caption">
		                <a href="/item/detail?no=${List.itemNum}">
		                <h3>${List.itemName}</h3>
		                </a>
		                <a href="/item/detail?no=${List.itemNum}">
		                <p class="${List.itemNum}">가격변환</p>
			        	</a>
		                <input type="text" id="${List.itemNum}" value="${List.itemPrice }" hidden="hidden"/>
		                <input type="text" class="itemNum" value="${List.itemNum }" hidden="hidden"/>
		            </div>
		        </div>
		    </div>
	    	<c:if test="${i%j==j-1 }">
				</div>
	    	</c:if>
	    	<c:set var="i" value="${i+1 }"/>
		</c:forEach>
	</div>
	
	<div class="row">
	    <div class="col-md-offset-5 col-md-2">
	        <button type="button" class="btn btn-default btn-lg btn-block best_btn">음료 전체보기<img src="/resources/icon/rigth.png" style="width: 15px" /></button>
	    </div>
	</div>

<!-- content end -->
<jsp:include page="/resources/template/footer.jsp"/>
</body>
</html>