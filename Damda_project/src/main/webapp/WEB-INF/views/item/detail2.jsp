<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="/resources/template/head.jsp"/>
        <style type="text/css">
        #content {
            margin: 20px 0px;
        }

        #content #itemimg {
            width: 100%;
        }

        #content .content_header p {
            display: inline-block;
        }

        #content .content_header .first_p {
            width: 40%;
        }

		#content .content_header #item_info {
            padding: 0px;
            margin-left: 40px;
        }
        
        #content .content_header #item_info #ea {
            height: 22px;
        }

        #content .content_header h3:nth-child(8),
        #content .content_header h3:nth-child(9),
        #content .content_header h3:nth-child(10) {
            display: inline-block;

        }

        #content .content_header .item_info:nth-child(7) button {
            background-color: white;
            border: 1px solid #cccccc;
            margin: 0px;
            width: 20px;
            height: 22.4px;
            line-height: 10px;
        }

        #content .content_header .minus {
            position: relative;
            left: 4px;
        }

        #content .content_header .plus {
            position: relative;
            left: -5px;
        }

        #content .content_header #ea {
            border: 1px solid #cccccc;
            font-size: 12px;
            width: 30px;
            height: 22px;
            margin: 0px;
            text-align: center;
        }
        
        #content .content_header button:nth-child(1) {
            background-color: darksalmon;
            border-radius: 0px;
        }

        #content .content_header button:nth-child(2) {
            border-radius: 0px;
            margin: 0px 10px;
            background-color: white;
            border: 1px solid #cdcdcd;
        }

        #content .content_header button img {
            width: 25px;
            position: relative;
            top: -2px
        }

        #content .line_div {
            margin-bottom: 50px;
            border-bottom: 1px solid #cdcdcd;
        }
        
        #content .content_content {
            z-index: -1;
        }

        #content .content_content img {
            width: 100%;
        }

        #content .content_bottom_info {
            margin-top: 20px;
            margin-bottom: 30px;
        }

        #content .content_bottom_info div {
            background-color: #eeeeee;
            border-top: 1px solid #cdcdcd;
            border-bottom: 1px solid #cdcdcd;
            border-right: 1px solid #cdcdcd;
            height: 40px;
            line-height: 40px;
            text-align: center;
            overflow: hidden;
        }


        #content .content_bottom_info div:nth-child(1),
        #content .content_bottom_info div:nth-child(6) {
            border: 0px;
            border-bottom: 1px solid #cdcdcd;
            background-color: white;
        }

        #content .content_bottom_info div:nth-child(2) {
            border-left: 1px solid #cdcdcd;
        }

        #content .content_bottom_info div h4 {
            margin: 0px;
        }

        /*상세내용 하단 정보 숨겨두기*/
        .content_change,
        .content_refund,
        .content_review {
            display: none;
        }

        /*리뷰*******************************************/
        #content .content_review ul {
            padding-left: 15px;
        }

        #content .content_review li {
            font-size: 11px;
        }

        #content .content_review select {
            border: 0px;
            float: right;
            font-size:12px;

        }

        #content .content_review table {
            font-size: 13px;
        }

        #content .content_review table tr:nth-child(2n-1) {
            text-align: center;
        }

        #content .content_review table tr:nth-child(2n) {
            text-align: left;
        }

        #content .content_review table tr th {
            text-align: center;
        }

        #content .content_review table tr th:nth-child(1) {
            width: 10%;
        }

        #content .content_review table tr th:nth-child(2) {
            width: 35%;
        }

        #content .content_review table tr th:nth-child(3) {
            width: 15%;
        }

        #content .content_review table tr th:nth-child(4) {
            width: 17%;
        }

        #content .content_review table tr th:nth-child(5) {
            width: 13%;
        }

        #content .content_review table tr td:nth-child(6) {
            width: 10%;
        }

        #content .content_review table img {
            width: 65%;
            display: inline-block;
            float: left;
        }

        #content .content_review table p {
            display: inline-block;
            margin: 10px;
        }

        #content .content_review table .toggler {
            display: none;
        }

        #content .content_review table .toggler1 {
            display: table-row;
        }
        
        #content .list_div{
        	margin-bottom: 50px;
        }

        #content .pagination>li>a {
            color: black;
        }

        #content .pagination>li>a:hover {
            font-weight: bold;
        }


        /*gird()***********************************************/
        #content .content_header .md_div {
            margin: 40px 0px;
        }

        #content .content_header .md_h3 {
            display: inline-block;
        }

        #content .content_header .md_btn {
            margin: 20px 0px;
            height: 70px;
        }

        #content .content_header .sm_div {
            margin: 20px 0px;

        }

        #content .content_header .xs_div {
            margin: 10px 0px;
        }

        .md_divline2 {
            display: none;
        }
	</style>
    <script type="text/javascript">
    
    $(document).ready(function() {
    	//그리드 적용
        grid();

        //테이블 내용 클릭시 보였다 안보이기
        table_content();

      	//합계 계산
        ea();

        //처음 값 세팅
        price(1);

		//웹브라우저 확인(파이어폭스만 적용됨.. 익스플로러는 다시 찾아볼 것)
        var agent = navigator.userAgent.toLowerCase();
        if (agent.indexOf("firefox") != -1){        	
			$('#ea').css('position','relative');
			$('#ea').css('top','-1px');
        }

    });

    $(window).resize(function() {
        grid();
    });

    function grid() {
        var windowWidth = $(window).width();

        //md
        if (windowWidth >= 992) {
            $('.item_info').addClass('md_div');
            $('.price_h3').addClass('md_h3');
            $('.btn-lg').addClass('md_btn');
            $('.md_divline1').removeClass('md_divline2');
            $('.content_bottom_info div').css('font-size', '13px');
            $('.btn').addClass('btn-lg');
            $('.btn img').css('width', '25px');
        } else {
            $('.item_info').removeClass('md_div');
            $('.price_h3').removeClass('md_h3');
            $('.btn-lg').removeClass('md_btn');
            $('.md_divline1').addClass('md_divline2');
            $('.btn').removeClass('btn-lg');
        }

        //sm
        if (windowWidth >= 768 && windowWidth < 992) {
            $('.item_info').addClass('sm_div');
            $('.md_divline1').addClass('md_divline2');
            $('table').css('font-size', '12px');
            $('.content_bottom_info div').css('font-size', '12px');
            $('.btn').addClass('btn-default');
            $('.btn img').css('width', '20px');
        } else {
            $('.item_info').removeClass('sm_div');
            $('.md_divline1').removeClass('md_divline2');
            $('table').css('font-size', '13px');
            $('.btn').removeClass('btn-default');
        }

        //xs
        if (windowWidth < 768) {
            $('.item_info').addClass('xs_div');
            $('.md_divline1').addClass('md_divline2');
            $('table').css('font-size', '11px');
            $('.content_bottom_info div').css('font-size', '11px');
            $('h4').css('margin-top', '50px');
            $('.btn').addClass('btn-sm');
            $('.btn img').css('width', '15px');
        } else {
            $('.item_info').removeClass('xs_div');
            $('.md_divline1').removeClass('md_divline2');
            $('h4').css('margin-top', '0px');
            $('.btn').removeClass('btn-sm');
        }
    }

    //리뷰 테이블 클릭이벤트
    function table_content() {
        $("tbody tr").click(function() {
            $(this).parents(".custom-table").find(".toggler1").removeClass("toggler1");
            $(this).parents("tbody").find(".toggler").addClass("toggler1");
            $(this).parents(".custom-table").find(".fa-minus-circle").removeClass("fa-minus-circle");
            $(this).parents("tbody").find(".fa-plus-circle").addClass("fa-minus-circle");
        });
    }

    //하단 정보 div
    function list_tab(id) {
        for (var i = 1; i < 5; i++) {
            var list_val = '#list_val' + i;
            var tab_con = '#tab_con' + i;
            $(list_val).hide();
            $(tab_con).css('background-color', '#eeeeee');
        }
        var list_val = '#list_val' + id;
        var tab_con = '#tab_con' + id;
        $(list_val).show();
        $(tab_con).css('background-color', '#cdcdcd');
    }

  //수량추가 가격계산
    function ea() {
        var ea = $('#ea').val();

        $('.minus').click(function() {
            if (ea > 1) {
                $('#ea').val(--ea);
            }
            price(ea);
        });

        $('.plus').click(function() {
            $('#ea').val(++ea);
            price(ea);
        });

    }

    //상단 상품가격, 하단 수량에따른 총가격계산
    function price(ea) {
        var price = $('#itemPrice').val();
        var length1 = price.length;
        var total = price * ea + '';
        var length2 = total.length;

        var itemPrice = price_viewer(price, length1);
        $('.itemPrice').html(itemPrice);

        var totalPrice = price_viewer(total, length2);
        $('.content_header h3:nth-child(9)').html(totalPrice);
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
            totalPrice = backPrice + ' 원';

            //1,000원~100,000원 단위
        } else if (length > 3 && length <= 6) {
            frontPrice = price.substring(0, length - 3);
            backPrice = price.substring(length - 3, length);
            totalPrice = frontPrice + ',' + backPrice + ' 원';

            //1,000,000원~100,000,000원 단위
        } else if (length > 6 && length <= 9) {
            frontPrice = price.substring(0, length - 6);
            middlePrice1 = price.substring(length - 6, length - 3);
            backPrice = price.substring(length - 3, length);
            totalPrice = frontPrice + ',' + middlePrice1 + ',' + backPrice + ' 원';

            //1,000,000,000원 ~100,000,000,000단위
        } else if (length > 9 && length <= 12) {
            frontPrice = price.substring(length - 12, length - 9);
            middlePrice1 = price.substring(length - 9, length - 6);
            middlePrice2 = price.substring(length - 6, length - 3);
            backPrice = price.substring(length - 3, length);
            totalPrice = frontPrice + ',' + middlePrice1 + ',' + middlePrice2 + ',' + backPrice + ' 원';

        }

        return totalPrice;
    }

    function sub(){

    }
    </script>
</head>
<body>
<jsp:include page="/resources/template/header.jsp"/>
<!-- content start -->
	<!--header-->
	<div class="col-md-12 col-sm-12 content_header">
	    <div class="col-md-offset-2 col-md-4 col-sm-4">
	        <img alt="itemimg" id="itemimg" src="${List.photoPath }" />
	    </div>
	    <div class="col-md-4 col-sm-7 col-xs-offset-1 col-xs-10" id="item_info">
	        <h3>${List.itemName }</h3>
	        <p>${List.itemCon }</p>
	        <div class="item_info">
	            <p class="first_p">판매가</p>
	            <p class="second_p itemPrice"> 원</p>
	            <input type="hidden" name="itemPrice" id="itemPrice" value="${List.itemPrice }" />
	        </div>
	        <div class="item_info">
	            <p class="first_p">판매단위</p>
	            <p class="second_p">1개</p>
	        </div>
	        <div class="item_info">
	            <p class="first_p">배송구분</p>
	            <p class="second_p">픽업/택배배송</p>
	        </div>
	        <div class="item_info">
	            <p class="first_p">원산지</p>
	            <p class="second_p">국내</p>
	        </div>
	        <div class="item_info">
	            <p class="first_p">구매수량</p>
	            <button class="minus">-</button>
	            <input type="text" readonly name="ea" id="ea" value="1" />
	            <button class="plus">+</button>
			</div>
            <h3 class="price_h3">총 상품금액 : &nbsp;</h3>
            <h3>총가격오는곳</h3>
            <input type="hidden" name="totalPrice" id="totalPrice"/>
            
	        <div class="btn_div">
	            <button type="button" class="btn btn-lg">
	                &nbsp;&nbsp;&nbsp;<img src="/resources/icon/cart.png" />장바구니 담기 &nbsp;&nbsp;</button>
	            <button type="button" class="btn btn-lg"><img src="/resources/icon/jjim.png" />찜&nbsp;</button>
	        </div>
	    </div>
	</div>
	
	<div class="line_div col-md-12 col-sm-12 col-xs-12">　</div>
	
	<!--content-->
	<div class="col-md-offset-2 col-md-8 col-sm-12 content_content">
	    <!--이미지 첨부로 내용이 추가되는 영역-->
	    <img src="${photoPath }">
	</div>
	
	<!--bottom-->
	<div class="col-md-offset-2 col-md-8 col-sm-12 content_bottom_info">
	    <div class="col-md-2 md_divline1">
	        <p>
	            　
	        </p>
	    </div>
	    <div class="col-md-2 col-sm-3 col-xs-3" onclick="list_tab(1)" id="tab_con1">
	        <p>
	            배송안내
	        </p>
	    </div>
	    <div class="col-md-2 col-sm-3 col-xs-3" onclick="list_tab(2)" id="tab_con2">
	        <p>
	            교환 및 반품 안내
	        </p>
	    </div>
	    <div class="col-md-2 col-sm-3 col-xs-3" onclick="list_tab(3)" id="tab_con3">
	        <p>
	            취소 및 환불 안내
	        </p>
	    </div>
	    <div class="col-md-2 col-sm-3 col-xs-3" onclick="list_tab(4)" id="tab_con4">
	        <p>
	            고객후기(${reviewCount })
	        </p>
	    </div>
	    <div class="col-md-2 md_divline1">
	        <p>
	            　
	        </p>
	    </div>
	</div>
	
	<!--delivery-->
	<div class="col-md-offset-2 col-md-8 col-sm-12 content_delivery" id="list_val1" class="list_div">
	    <h4 class="engfont">DELIVERY</h4>
	    <p>
	        배송관련 안내사항내용적어요
	    </p>
	
	</div>
	<!--delivery end-->
	
	
	<!--change-->
	<div class="col-md-offset-2 col-md-8 col-sm-12 content_change" id="list_val2" class="list_div">
	    <h4 class="engfont">CHANGE</h4>
	    <p>
	        교환 반품 안내사항내용적어요
	    </p>
	</div>
	<!--change end-->
	
	
	<!--refund-->
	<div class="col-md-offset-2 col-md-8 col-sm-12 content_refund" id="list_val3" class="list_div">
	    <h4 class="engfont">REFUND</h4>
	    <p>
	        취소 환불 안내사항내용적어요
	    </p>
	</div>
	<!--refund end-->
	
	
	<!--review-->
	<div class="col-md-offset-2 col-md-8 col-sm-12 content_review" id="list_val4" class="list_div">
	    <h4 class="engfont">REVIEW</h4>
	
	    <ul class="col-md-10">
	        <li>
	            상품에 대한 문의를 남기는 공간입니다. 해당 게시판의 성격과 다른 글은 사전동의 없이 담당 게시판으로 이동될 수 있습니다.
	        </li>
	        <li>
	            배송관련, 주문(취소/교환/환불)관련 문의 및 요청사항은 마이페이지 내 1:1 문의에 남겨주세요.
	        </li>
	    </ul>
	    <select class="col-md-2">
	        <option>최근등록순</option>
	        <option>좋아요많은순</option>
	    </select>
	    <table class="table custom-table">
	        <thead>
	            <tr>
	                <th>번호</th>
	                <th>제목</th>
	                <th>작성자</th>
	                <th>작성일</th>
	                <th colspan="2">좋아요</th>
	                <!-- <th>　</th> -->
	            </tr>
	        </thead>
	        
	        <c:forEach items="${reviewList}" var="reviewList">
	        <tbody>
	            <tr>
	                <td>${reviewList.reviewNum }</td>
	                <td class="${reviewList.reviewNum }">제목</td>
	                <td>${reviewList.userName }</td>
	                <td>${reviewList.date }</td>
	                <td>${reviewList.recommend }</td>
	                <td><a href="#">♡</a></td>
	            </tr>
	            <tr class="toggler">
	                <td colspan='6'>
	                <c:set var="photoPath" value="${reviewList.photoPath }"/>
	                <c:if test="${not empty photoPath}">
	                    <img src="${photoPath }" />
	                </c:if>
	                    <p id="${reviewList.reviewNum }" class="tbody_p">
	                       	 ${reviewList.reviewCon }
	                    </p>
	                </td>
	            </tr>
	        </tbody>
	        </c:forEach>	
	    </table>
	    
	    
	    
	    <div class="col-md-offset-4 col-md-5 col-sm-offset-4 col-sm-5 col-xs-offset-2 col-xs-8">
	        <ul class="pagination">
	        <li><a href="${URI}&p=0" aria-label="Previous">&laquo;</a></li>
	        
	        <!-- 현재 페이지가 0보다 작아질 경우 이전 버튼을 disabled하는 조건문 -->
	        <c:choose>
	        <c:when test="${p <= 0 }">
	        <li class="disabled"><a href="#">‹</a></li>
	        </c:when>
	        <c:otherwise>
	        <li><a href="${URI}&p=${p-1} ">‹</a></li>	        
	        </c:otherwise>
	        </c:choose>
	        
	        <!-- 해당하는 페이지로 갈 수 있는 버튼 -->
	        <c:forEach var="i" begin="0" end="${totalpage}">
	        <li><a href="${URI}&p=${i }">${i+1 }</a></li>
	        </c:forEach>
	        
	        <!-- 현재 페이지가 totalpage보다 커질 경우 다음 버튼을 disabled하는 조건문 -->
	        <c:choose>
	        <c:when test="${p >= totalpage }">
	        <li class="disabled"><a href="#">›</a></li>
	        </c:when>
	        <c:otherwise>
	        <li><a href="${URI}&p=${p+1 }">›</a></li>
	        </c:otherwise>
	        </c:choose>
	        
	        <li><a href="${URI}&p=${totalpage }" aria-label="Next">&raquo;</a></li>
	    </ul>
	    </div>
	
	</div>
	<!--review end-->

<!-- content end -->
<jsp:include page="/resources/template/footer.jsp"/>
</body>
</html>