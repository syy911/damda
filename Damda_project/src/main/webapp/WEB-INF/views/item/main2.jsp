<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="/resources/template/head.jsp"/>
    <style type="text/css">
        #content h2 {
            text-align: center;
            margin: 40px auto;
        }

        #content .btn-group img {
            width: 10px;
            margin: 0px;
            position: relative;
            top: -3px;
        }

        #content .btn-toolbar {
            display: inline-block;
            margin: 30px auto;
        }

        #content .pagination>li>a {
            color: black;
        }

        #content .pagination>li>a:hover {
            font-weight: bold;
        }

        #content .thumbnail {
            border: 0px;
            box-shadow: none;
        }
        
        #content .thumbnail a{
        	text-decoration: none;
        	color: black;
        }

        #content .ctg_a>a {
            margin: 10px;
            width: 80px;
            height: 30px;
            line-height: 30px;
            text-align: center;
            display: inline-block;
        }

        #content .ctg_a>a:hover {
        	color: darksalmon;
            font-weight: bold;
            text-decoration: none;
            border-bottom: 2px solid;
        }

        #content .ctg_a>a img {
            width: 25px;
            position: relative;
            top: -5px;
            margin: 0px 5px;
        }

        #content .ctg_a>a:nth-child(2) img {
            top: -3px;
        }
        
		#content form{
			display: inline-block;
            float: right;
            width: 100px;
		}
        #content .item_align{
            display: inline-block;
            width: 100px;
            border: 0px;
            position: relative;
            top: 15px;
        }
        
        #content .caption p{
        	color: darksalmon;
        }
        
        #content .best_div{
        	background-color: darksalmon;
        	width: 45px;
        	height: 40px;
        	line-height: 40px;
        	color: white;
        	font-size: 16px;
        	text-align: center;
			position: relative;
			top: 40px;        
        }
        
        #content .best_ctg p{
        	color: darksalmon;
        	font-weight: bold;
        	display: inline-block;
        	font-size: 13px;
        } 
        
        #content .best_ctg .best_select{
        	float: right;
        	position: relative;
        	top: -1px;
        } 
        
        #content .best_ctg .best_pdiv{
			border-bottom: 2px solid darksalmon;        
        	display: inline-block;
        	width: 64px;
        	text-align: center;
        } 
        
        #content .ctg_div{
        	margin-bottom: 30px;	
        }
        
        #active_a{
        	color: darksalmon;
        	border-bottom: 2px solid;
        }
        
    </style>
    
    
	<script type="text/javascript">
	 	$(document).ready(function() {
	
	      url_ctg();
	
	      price_setting();
	      
	  	});
	  	
	 	function url_ctg(){
	 		//전체주소
	      console.log("url : "+$(location).attr('href'));
			var url = $(location).attr('href').split('/');
			var ctg_val = url[4].split('?');
			$('.best_ctg, .best_div').hide();
			
			if(ctg_val[0]=='salad'){
				$('h2').html('샐러드');
				$('.salad_a').attr('id', 'active_a');
				$('.dessert_a').css('color','black');
				$('.drink_a').css('color','black'); 
			}else if(ctg_val[0]=='dessert'){
				$('h2').html('디저트');
				$('.salad_a').css('color','black');
				$('.dessert_a').attr('id', 'active_a');
				$('.drink_a').css('color','black');
			}else if(ctg_val[0]=='drink'){
				$('h2').html('음료');
				$('.salad_a').css('color','black');
				$('.dessert_a').css('color','black');
				$('.drink_a').attr('id', 'active_a');
			}else if(ctg_val[0]=='best'){
				$('h2').html('베스트');
				$('.best_ctg, .best_div').show();
				$('.ctg_div').hide();
			}
	     }
	
	     //가격세팅
	     function price_setting() {
	         var itemName_arr = $('.item').get();
	         var length = itemName_arr.length;
	         console.log('요소: ' + itemName_arr, '길이: ' + length);
	
	         for (var i = 0; i < length; i++) {
	             var id = itemName_arr[i].value;
	             total_price(id);
	             console.log(id);
	         }
	     }
	
	     //가격 완제품 
	     function total_price(id) {
	         var input_id = '#'+id;
	         //input의 val값구하기
	         var price = $(input_id).val();
	         console.log(price);
	
	         //가격*수량의 문자열 길이
	         var length = price.length;
	
	         //3자리 마다 ,들어간 형식으로 변환된 가격
	         var price_view = price_viewer(price, length);
	
	         //class는 p영역
	         var p_msg = '.' + id;
	         $(p_msg).html(price_view);
	         console.log(price_view);
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

	      //select box 이벤트
	     function select_event() {
            var select_val = $('.item_align').val();
            console.log('select value: '+select_val);
            var url = window.location.pathname;
            console.log('url: '+url);
            var url_split = url.split('?');
            console.log('url2: '+url_split);
            
            $.ajax({
    			url:url_split[0]+"?select="+select_val,
    			type:'get',
    			data:"",
    			success: function(data){
    	        	console.log('success');
    	        	$('#select').load('salad');
    	        }
    		});
        }  
	 </script>
</head>
<body>
<jsp:include page="/resources/template/header.jsp"/>
<!-- content start -->
<h2></h2>
	<div class="col-md-offset-1 col-md-10 col-sm-12 ctg_div">
	    <div class="col-md-12 ctg_a">
	        <a href="/item/salad" class="salad_a"><img src="/resources/icon/salad.png" />샐러드</a>
	        <a href="/item/dessert" class="dessert_a"><img src="/resources/icon/dessert.png" />디저트</a>
	        <a href="/item/drink" class="drink_a"><img src="/resources/icon/drink.png" />음료</a>
	
			<form method="post">
<!--  		        <select class="item_align" name="itemalign" onchange="this.form.submit()" value="${itemalign}">-->
		        <select class="item_align" name="itemalign" onchange="select_event();" value="${itemalign}">
		            <option value="new">신상품순</option>
		            <option value="best">인기상품순</option>
		            <option value="cheap">낮은 가격순</option>
		            <option value="expen">높은 가격순</option>
		        </select>
			</form>
	    </div>
	</div>
	
	<div class="col-md-offset-1 col-md-10 col-sm-12 best_ctg">
	    <div class="col-md-12">
	    	<div class="best_pdiv">
	        	<p>전체보기</p>
	    	</div>
	
	        <select class="item_align best_select">
	            <option value="new">인기순</option>
	        </select>
	    </div>
	</div>

	<div class="select" id = "select">
	<%-- <jsp:include page="../item/list.jsp"/> --%>
	<c:set var="i" value="0"/>
	<c:set var="j" value="3"/>
		<c:forEach items="${List}" var="List" varStatus="status">
			<c:if test="${i%j==0 }">
				<div class="row col-md-offset-1 col-md-10 col-sm-12">
			</c:if>
	        <div class="col-xs-4 col-sm-4 col-md-4">
		        <div class="thumbnail">
		        	<a href="/item/detail?no=${List.itemNum}">
		        	<div class="best_div">best</div>
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
	
	<div class="row col-md-offset-5 col-md-4 col-sm-offset-4 col-sm-6 col-xs-offset-2 col-xs-8">
	    <ul class="pagination">
	        <li><a href="?p=0" aria-label="Previous">&laquo;</a></li>
	        
	        <!-- 현재 페이지가 0보다 작아질 경우 이전 버튼을 disabled하는 조건문 -->
	        <c:choose>
	        <c:when test="${p <= 0 }">
	        <li class="disabled"><a href="#">‹</a></li>
	        </c:when>
	        <c:otherwise>
	        <li><a href="?p=${p-1} ">‹</a></li>	        
	        </c:otherwise>
	        </c:choose>
	        
	        <!-- 해당하는 페이지로 갈 수 있는 버튼 -->
	        <c:forEach var="i" begin="0" end="${totalpage}">
	        <li><a href="?p=${i }">${i+1 }</a></li>
	        </c:forEach>
	        
	        <!-- 현재 페이지가 totalpage보다 커질 경우 다음 버튼을 disabled하는 조건문 -->
	        <c:choose>
	        <c:when test="${p >= totalpage }">
	        <li class="disabled"><a href="#">›</a></li>
	        </c:when>
	        <c:otherwise>
	        <li><a href="?p=${p+1 }">›</a></li>
	        </c:otherwise>
	        </c:choose>
	        
	        <li><a href="?p=${totalpage }" aria-label="Next">&raquo;</a></li>
	    </ul>
	</div>

<!-- content end -->
<jsp:include page="/resources/template/footer.jsp"/>
</body>


</html>