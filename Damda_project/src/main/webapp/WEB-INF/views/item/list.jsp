<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<head>
<jsp:include page="/resources/template/head.jsp"/>
</head>
<script type="text/javascript">
	$(document).ready(function() {
		console.log(" >>>> list.jsp start");
	    price_setting();
	    url_ctg();
	});

	function url_ctg(){
		//전체주소
		var item = $('#item').val();
		
		$('.best_ctg, .best_div').hide();
		
		if(item=='salad'){
			$('h2').html('샐러드');
			$('.salad_a').attr('id', 'active_a');
			$('.dessert_a').css('color','black');
			$('.drink_a').css('color','black'); 
		}else if(item=='dessert'){
			$('h2').html('디저트');
			$('.salad_a').css('color','black');
			$('.dessert_a').attr('id', 'active_a');
			$('.drink_a').css('color','black');
		}else if(item=='drink'){
			$('h2').html('음료');
			$('.salad_a').css('color','black');
			$('.dessert_a').css('color','black');
			$('.drink_a').attr('id', 'active_a');
		}else if(item=='best'){
			$('h2').html('베스트');
			$('.best_ctg, .best_div').show();
			$('.ctg_div').hide();
		}
	}

	 //가격세팅
	 function price_setting() {
	     var itemName_arr = $('.item').get();
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
	 
	 //페이징 이벤트
     function onClickPage(page) {
    	var item = $('#item').val();
	    console.log(" >>> item : " + item);
    	/* var page = $('#page').val(); */
	    console.log(" >>> page : " + page);
	    
        var select_val = $('.item_align').val();
        console.log('select value: '+select_val);
        var url = window.location.pathname;
        console.log('url: '+url);
        var url_split = url.split('?');
        console.log('url2: '+url_split);

        $.ajax({
			url:url_split[0]+"?item="+item,
			type:'get',
			data:"",
			success: function(data){
	        	console.log('success');
	        	$('#select').load(item+'?select='+select_val+'&p='+page); 
	        }
		});
    }
</script>
<body>
<!-- content start -->
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
	
	<div class="row col-md-offset-5 col-md-4 col-sm-offset-4 col-sm-6 col-xs-offset-2 col-xs-8">
	    <ul class="pagination">
	        <li><a onclick = "onClickPage(0);" aria-label="Previous">&laquo;</a></li>
	        
	        <!-- 현재 페이지가 0보다 작아질 경우 이전 버튼을 disabled하는 조건문 -->
	        <c:choose>
	        <c:when test="${p <= 0 }">
	        <li class="disabled"><a href="#">‹</a></li>
	        </c:when>
	        <c:otherwise>
	        <li><a onclick = "onClickPage(${p-1 });">‹</a></li>	        
	        </c:otherwise>
	        </c:choose>
	        
	        <!-- 해당하는 페이지로 갈 수 있는 버튼 -->
	        <c:forEach var="i" begin="0" end="${totalpage}">
	        <li><a onclick = "onClickPage(${i });">${i+1 }</a></li>
	        </c:forEach>
	        
	        <!-- 현재 페이지가 totalpage보다 커질 경우 다음 버튼을 disabled하는 조건문 -->
	        <c:choose>
	        <c:when test="${p >= totalpage }">
	        <li class="disabled"><a href="#">›</a></li>
	        </c:when>
	        <c:otherwise>
	        <li><a onclick = "onClickPage(${p+1 });">›</a></li>
	        </c:otherwise>
	        </c:choose>
	        
	        <li><a onclick = "onClickPage(${totalpage });" aria-label="Next">&raquo;</a></li>
	    </ul>
	</div>
<!-- content end -->
</body>
</html>