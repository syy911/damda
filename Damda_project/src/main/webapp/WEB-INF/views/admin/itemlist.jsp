<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="/resources/template/head.jsp"/>
     <style type="text/css">
        #content {
            margin-top: 50px;
        }

        #content #admin_list input[type="radio"] {
            position: relative;
            top: 2px;
        }

        #content #admin_list label {
            margin-right: 20px;
            font-weight: 100;
        }

        #content #admin_list select {
            font-size: 14px;
            width: 150px;
        }

        #content #admin_list .select_div {
            margin-bottom: 20px;
        }


        /*checkbox_start*/
        #content #admin_list input[type="checkbox"] {
            display: none;
        }

        #content #admin_list input[type="checkbox"]+label {
            display: inline-block;
            width: 17px;
            height: 17px;
            background: white;
            cursor: pointer;
            border-radius: 3px;
            border: 1px solid #cccccc;
        }

        #content #admin_list input[type="checkbox"]:checked+label {
            background: url(/resources/icon/check.png) darksalmon no-repeat center/15px 15px;
            border: 0px;
        }

        /*checkbox_end*/
        #content #admin_list table {
            border-top: 2px solid darksalmon;
            border-bottom: 2px solid darksalmon;
            font-size: 12px;
            text-align: left;
        }

        #content #admin_list table th {
            text-align: left;
            height: 20px;

        }

        /*체크박스*/
        #content #admin_list .item th:nth-child(1) {
            width: 5%;
        }

        /*상품번호*/
        #content #admin_list .item th:nth-child(2) {
            width: 13%;
        }

        /*이미지*/
        #content #admin_list .item th:nth-child(3) {
            width: 8%;
        }

        /*상품명*/
        #content #admin_list .item th:nth-child(4) {
            width: 20%;

        }

        /*가격, 판매상태*/
        #content #admin_list .item th:nth-child(5),
        #content #admin_list .item th:nth-child(6) {
            width: 15%;
        }

        /*재고, 판매량*/
        #content #admin_list .item th:nth-child(7),
        #content #admin_list .item th:nth-child(8) {
            width: 7%;
        }

        #content #admin_list .item th:nth-child(9) {
            width: 10%;
        }

        #content #admin_list table img {
            width: 100%;
        }

        #content #admin_list table .delete_btn {
            width: 100px;
            height: 30px;
            background-color: white;
            border: 1px solid darksalmon;
            color: darksalmon;
        }

        #content #admin_list .addbtn_div {
            margin: 10px auto;
            width: 350px;
            float: right;
            margin-bottom: 80px;
        }
        
        #content #admin_list .add_btn {
            border: 1px solid darksalmon;
            background-color: darksalmon;
            color: white;
            width: 150px;
            height: 40px;
            font-size: 17px;
            display: inline-block;
            margin-left: 10px;
        }

        #content #admin_list table a {
            color: black;
            text-decoration: none;
        }

        #content #admin_list table input {
            border: 0px;
            width: 100%;
        }

        #content #admin_list table .btn_div p {
            display: inline-block;
            margin-right: 10px;
        }

        /*custom table*/
        /*체크박스*/
        #content #admin_list .custom th:nth-child(1) {
            width: 5%;
        }

        /*상품번호*/
        #content #admin_list .custom th:nth-child(2) {
            width: 15%;
        }

        /*이미지*/
        #content #admin_list .custom th:nth-child(3) {
            width: 8%;
        }

        /*상품명*/
        #content #admin_list .custom th:nth-child(4) {
            width: 22%;

        }

        /*가격, 판매상태, 카테고리*/
        #content #admin_list .custom th:nth-child(5),
        #content #admin_list .custom th:nth-child(6) {
            width: 15%;
        }

        #content #admin_list .custom th:nth-child(7) {
            width: 20%;

        }
        
    </style>
    
    
    <script type="text/javascript">
	$(document).ready(function() {
		//셀렉트박스 이것만 밖으로 뺌
		$('#customTable').hide();
		$('.selectcustom, .vegetable, .topping').hide();
		$('#pagination').hide();
		var selected = $('.selectall').val();
		console.log("selectd>>>"+selected);
		select_click();
		
		all_check();

        price_setting();

        check_info();

        ctg_setting();
        
	 });
      	//품절
        function none_stock(num) {
            var msg = '#itemStock' + num;
            var itemStock = $(msg).val();
            var soldout = '품절';
            console.log(itemStock);

            var msg2 = '.itemStock' + num;
            if (itemStock == 0) {
                $(msg2).html(soldout).css('color', 'red');
            } else {
                $(msg2).html(itemStock).css('color', 'black');
            }
        }


        //선택 개수, 전체 개수
        function check_info() {
            var chk_length = $('input[name=chk]:checkbox:checked').length;
            var td_length = $('.item tbody tr').length - 1; //맨아래 버튼행 빼고 계산
            var str = '전체선택 (' + chk_length + '/' + td_length + ')';
            $('.btn_div p').html(str);

            //커스텀테이블
            var chk_length2 = $('input[name=chk2]:checkbox:checked').length;
            var td_length2 = $('.custom tbody tr').length - 1;
            str = '전체선택 (' + chk_length2 + '/' + td_length2 + ')';
            $('#btn_div2 p').html(str);
        }

        //전체 선택
        function all_check() {
            $('#all_chk1').click(function() {
                if ($('#all_chk1').is(':checked')) {
                    $('input[name=chk], #all_chk2').prop('checked', true);
                } else {
                    $('input[name=chk], #all_chk2').prop('checked', false);
                }
            });
            $('#all_chk2').click(function() {
                if ($('#all_chk2').is(':checked')) {
                    $('input[name=chk], #all_chk1').prop('checked', true);
                } else {
                    $('input[name=chk], #all_chk1').prop('checked', false);
                }
            });

            $('#all_chk3').click(function() {
                if ($('#all_chk3').is(':checked')) {
                    $('input[name=chk2], #all_chk4').prop('checked', true);
                } else {
                    $('input[name=chk2], #all_chk4').prop('checked', false);
                }
            });

            $('#all_chk4').click(function() {
                if ($('#all_chk4').is(':checked')) {
                    $('input[name=chk2], #all_chk3').prop('checked', true);
                } else {
                    $('input[name=chk2], #all_chk3').prop('checked', false);
                }
            });

            $('input[type=checkbox]').click(function() {
                check_info();
            });
        }


        //가격세팅
        function price_setting() {
            //완제품테이블
            var length = $('.item tbody tr').length;
            console.log(length);

            for (var i = 1; i < length; i++) {
                total_price(i);
                none_stock(i);
            }

            //커스텀테이블
            
            //var length2 = $('.custom tbody tr').length;
            var lastNum = $('input[class=matenum]:last-child').val();//전체 숫
            
            for (var i = 1;i <=lastNum; i++) {
                if($('#matenum'+i+'').val()==i){
                	total_price2(i);
                    console.log("total_price2("+i+")");
                }
                
            }
        	
        }

        //가격 완제품 
        function total_price(num) {
            var num = num;

            //input의 val값구하기
            var input_msg = '#itemprice' + num;
            var price = $(input_msg).val();


            //가격*수량의 문자열 길이
            var length = price.length;

            //3자리 마다 ,들어간 형식으로 변환된 가격
            var price_view = price_viewer(price, length);

            //class는 p영역
            var p_msg = '.itemprice' + num;
            $(p_msg).html(price_view);
            console.log(price_view);
        }

        //가격 커스텀  
        function total_price2(num) {
            var num = num;
            var input_msg = '#customprice' + num;//input id
            
            
            var price = $(input_msg).val();//none
            console.log("ddd"+$('#customprice'+num).val());//undefine
            var length = price.length;

            var price_view = price_viewer(price, length);

            var p_msg = '.customprice' + num;
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


        //셀렉박스 선택이벤트
        function table_viewer() {
        	var val = $('.selectall').val();
            console.log(val);
            if (val == 'item') {
                $('#itemTable').css('display', 'inline-block');
                $('#customTable').hide();
                $('.selectitem').show();
            } else if (val == 'custom') {
                selected = $('.selectall').val();
                console.log("selectd>>>"+selected);
            	$('#pagination').show();
                $('#itemTable').hide();
                $('.selectitem').hide();
                $('#customTable').css('display', 'inline-block');
                $('.selectcustom').show();
                var custom_val = $('.selectcustom').val();

                if (custom_val == "vegetable") {
                    $('.vegetable').show();
                } else if (custom_val == "toppig") {
                    $('.topping').show();
                }
            }
        }

        //셀렉박스 클릭이벤트
        function  select_click(){
            $('select').click(function() {
                table_viewer();
            });
        }

        //카테고리 문자열로 세팅
        function ctg_setting() {
            //완제품테이블
            var length = $('.item tbody tr').length;
            for (var i = 1; i < length; i++) {
                ctg(i);
            }

            //커스텀테이블
            var lastNum = $('input[class=matenum]:last-child').val();//23
            var length2 = $('.custom tbody tr').length;
            for (var i = 1; i <=lastNum; i++) {
            	if($('#matenum'+i+'').val()==i){
            		ctg2(i);
                    custom_status(i);
                }
                
            }
        }

        //아이템 카테고리 DB값가져오기
        function ctg(num) {
            var num = num;
            //input의 val값구하기
            var input_id = '#itemCtg' + num;
            var ctg_val = $(input_id).val();
            console.log('아이템 카테고리값' + ctg_val);
            var ctg = "";
            //class는 p영역
            var p_class = '.itemCtg' + num;

            if (ctg_val == 1) {
                ctg = "샐러드";
            } else if (ctg_val == 2) {
                ctg = "디저트";
            } else if (ctg_val == 3) {
                ctg = "음료";
            }
            $(p_class).html(ctg);

        }

        //커스텀 카테고리 DB값가져오기
        function ctg2(num) {
            var num1 = num;
			console.log("ctg2(num)="+num);
            //input의 val값구하기
            var input_id = '#customCtg' + num;
            var ctg_val = $(input_id).val();//2-1
            var c_ctg = ctg_val.split('-');//2,1

            //문자열
            var ctg = "";

            //class는 p영역
            var p_class = '.customCtg' + num;



            if (c_ctg[0] == "1") {
                ctg = "야채";
                if (c_ctg[1] == "1") {
                    ctg += "-씁쓸한맛";
                } else if (c_ctg[1] == "2") {
                    ctg += "-아삭한맛";
                } else if (c_ctg[1] == "3") {
                    ctg += "-순한맛";
                } else if (c_ctg[1] == "4") {
                    ctg += "-매운맛";
                }
            } else if (c_ctg[0] == "2") {
                ctg = "토핑";
                if (c_ctg[1] == "1") {
                    ctg += "-고기/햄/생선";
                } else if (c_ctg[1] == "2") {
                    ctg += "-과일/치즈";
                }
            } else if (ctg_val == "3") {
                ctg = "소스";
            }
            $(p_class).html(ctg);

        }

        //커스텀 판매상태
        function custom_status(num) {
            var num = num;

            //input의 val값구하기
            var input_id = '#customstatus' + num;
            var ctg_val = $(input_id).val();

            //문자열
            var ctg = "";

            //class는 p영역
            var p_class = '.customstatus' + num;

            if (ctg_val == 0) {
                ctg = "판매중";
            } else if (ctg_val == 1) {
                ctg = "판매중지";
            }

            $(p_class).text(ctg);

            var p_val = $(p_class).text();

            if(p_val=="판매중지"){
                $(p_class).css('color','red');
            }
        }
        //페이징(이전버튼과 다음 버튼 활성화 )
		function fn_prev(page, range, rangeSize){
			var page = ((range-2)*rangeSize)+1;
			var range = range-1;
			var url="/admin/";
			url = url+"?page="+page;
			url = url+"&range="+range;
			location.href=url;
		}
		function fn_next(page, range, rangeSize){
			var page = parseInt((range*rangeSize))+1;
			var range = parseInt(range)+1;
			var url = "/admin/";
			url= url+"?page="+page;
			url = url+"&range="+range;
			location.href=url;
		}
		//페이징 번호클릭(제이쿼리로 클릭하면 이동)
		function fn_pagination(page,range,rangeSize,searchType,keyword){			
			var url="/admin/";
			url = url+"?page="+page;//넘어간페이지번호//이것만 비동기로 넘기면 될듯
			url = url+"&range="+range;//범위?			
			location.href="/admin/page"+page;
		}
		
		
    
    </script>
</head>
<body>
<jsp:include page="/resources/template/header.jsp"/>
			<!--start-->
            <div id="admin_list" class="col-md-offset-2 col-md-8 col-sm-12 col-xs-12">
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <input type="radio" name="group" id="ra1" checked />
                    <label for="ra1">전체</label>
                    <input type="radio" name="group" id="ra2" />
                    <label for="ra2">품절</label>
                    <input type="radio" name="group" id="ra3" />
                    <label for="ra3">판매중</label>
                    <input type="radio" name="group" id="ra4" />
                    <label for="ra4">판매중지</label>
                </div>
                <div class="col-md-12 col-sm-12 col-xs-12 select_div">
                    <select class="selectall">
                        <option id="optionItem" value="item" >완제품</option>
                        <option id="optionCustom" value="custom" >커스텀</option>
                    </select>
                    <select class="selectitem">
                        <option value="all">전체</option>
                        <option value="salad">샐러드</option>
                        <option value="dessert">디저트</option>
                        <option value="drink">음료</option>
                        <option value="best">베스트</option>
                    </select>
                    <select class="selectcustom">
                        <option value="all">전체</option>
                        <option value="vegetable">야채</option>
                        <option value="toppig">토핑</option>
                        <option value="source">소스</option>
                    </select>
                    <select class="vegetable">
                        <option value="all">전체</option>
                        <option value="veg1">씁쓸한맛</option>
                        <option value="veg2">아삭한맛</option>
                        <option value="veg3">순한맛</option>
                        <option value="veg4">매운맛</option>
                    </select>
                    <select class="topping">
                        <option value="all">전체</option>
                        <option value="main">고기/햄/생선</option>
                        <option value="side">과일/치즈</option>
                    </select>
                </div>
<div id="itemTable">
                <table class="table item">
                    <thead>
                        <tr>
                            <th>
                                <input type="checkbox" id="all_chk1" />
                                <label for="all_chk1"></label>
                            </th>
                            <th>상품번호</th>
                            <th>이미지</th>
                            <th>상품명</th>
                            <th>가격</th>
                            <th>판매상태</th>
                            <th>재고</th>
                            <th>판매량</th>
                            <th>카테고리</th>
                        </tr>
                    </thead>

                    <tbody>
                        <tr>
                            <td>
                                <input type="checkbox" name="chk" id="itemNum1" />
                                <label for="itemNum1"></label>
                            </td>
                            <td>
                                <a href="#">
                                    <input type="text" name="itemNum" id="itemNum" value="9876543214" readonly />
                                </a>
                            </td>
                            <td>
                                <a href="#">
                                    <img src="/resources/imgs/s01.jpg" />
                                </a>
                            </td>
                            <td>
                                <a href="#">
                                    <input type="text" name="itemName" id="itemName" value="상품이름" readonly />
                                </a>
                            </td>
                            <td>
                                <p class="itemprice1">원</p>
                                <input type="text" name="itemprice1" id="itemprice1" value="10000" readonly hidden />
                            </td>
                            <td>
                                <input type="text" name="itemStatus" id="itemStatus" value="판매중" readonly />
                            </td>
                            <td>
                                <p class="itemStock1">품절인지 아닌지</p>
                                <input type="text" name="itemStock" id="itemStock1" value="0" readonly hidden />
                            </td>
                            <td>
                                <input type="text" name="itemSales" id="itemSales" value="1" readonly />
                            </td>
                            <td>
                                <p class="itemCtg1">카테고리</p>
                                <input type="text" name="itemCtg1" id="itemCtg1" value="1" readonly hidden />
                            </td>
                        </tr>


                        <tr>
                            <td>
                                <input type="checkbox" name="chk" id="itemNum2" />
                                <label for="itemNum2"></label>
                            </td>
                            <td>
                                <a href="#">
                                    <input type="text" name="itemNum" id="itemNum" value="3132165" readonly />
                                </a>
                            </td>
                            <td>
                                <a href="#">
                                    <img src="/resources/imgs/s02.jpg" />
                                </a>
                            </td>
                            <td>
                                <a href="#">
                                    <input type="text" name="itemName" id="itemName" value="상품이름" readonly />
                                </a>
                            </td>
                            <td>
                                <p class="itemprice2">원</p>
                                <input type="text" name="itemprice2" id="itemprice2" value="123657" readonly hidden />
                            </td>
                            <td>
                                <input type="text" name="itemStatus" id="itemStatus" value="판매중" readonly />
                            </td>
                            <td>
                                <p class="itemStock2">품절인지 아닌지</p>
                                <input type="text" name="itemStock" id="itemStock2" value="5" readonly hidden />
                            </td>
                            <td>
                                <input type="text" name="itemSales" id="itemSales" value="0" readonly />
                            </td>
                            <td>
                                <p class="itemCtg2">카테고리</p>
                                <input type="text" name="itemCtg2" id="itemCtg2" value="2" readonly hidden />
                            </td>
                        </tr>


                        <tr>
                            <td>
                                <input type="checkbox" name="chk" id="itemNum3" />
                                <label for="itemNum3"></label>
                            </td>
                            <td>
                                <a href="#">
                                    <input type="text" name="itemNum" id="itemNum" value="123456" readonly />
                                </a>
                            </td>
                            <td>
                                <a href="#">
                                    <img src="/resources/imgs/s03.jpg" />
                                </a>
                            </td>
                            <td>
                                <a href="#">
                                    <input type="text" name="itemName" id="itemName" value="상품이름" readonly />
                                </a>
                            </td>
                            <td>
                                <p class="itemprice3">원</p>
                                <input type="text" name="itemprice3" id="itemprice3" value="654321" readonly hidden />
                            </td>
                            <td>
                                <input type="text" name="itemStatus" id="itemStatus" value="판매중" readonly />
                            </td>
                            <td>
                                <p class="itemStock3">품절인지 아닌지</p>
                                <input type="text" name="itemStock" id="itemStock3" value="3" readonly hidden />
                            </td>
                            <td>
                                <input type="text" name="itemSales" id="itemSales" value="1" readonly />
                            </td>
                            <td>
                                <p class="itemCtg3">카테고리</p>
                                <input type="text" name="itemCtg3" id="itemCtg3" value="3" readonly hidden />
                            </td>
                        </tr>


                        <tr>
                            <td>
                                <input type="checkbox" id="all_chk2" />
                                <label for="all_chk2"></label>
                            </td>
                            <td colspan="8" class="btn_div">
                                <p>전체선택(n/all)</p>
                                <button type="button" class="delete_btn">선택상품 삭제</button>

                            </td>
                        </tr>
                    </tbody>
                </table>
</div>                
<!-- ------------------------------------------------------------------------------------------------------- -->
<div id="customTable">
				<table class="table custom">
                    <thead>
                        <tr>
                            <th>
                                <input type="checkbox" id="all_chk3" />
                                <label for="all_chk3"></label>
                            </th>
                            <th>재료번호</th>
                            <th>이미지</th>
                            <th>상품명</th>
                            <th>가격</th>
                            <th>판매상태</th>
                            <th>카테고리</th>
                        </tr>

                    </thead>
                    <tbody>
                        
                        <c:forEach items="${matelist}" var="matelist">
	                        <tr>
	                            <td>
	                                <input type="checkbox" name="chk2" id="custoumNum${matelist.matenum }" />
	                                <label for="custoumNum${matelist.matenum }"></label>
	                            </td>
	                            <td>
	                                <a href="detail/${matelist.matenum}">
	                                    <input class="matenum" type="text" name="matenum${matelist.matenum}" id="matenum${matelist.matenum}" value="${matelist.matenum}" readonly />
	                                </a>
	                            </td>
	                            <td>
	                                <a href="detail/${matelist.matenum}">
	                                    <img src="/resources/imgs/s01.jpg" />
	                                </a>
	                            </td>
	                            <td>
	                                <a href="detail/${matelist.matenum}">
	                                    <input type="text" name="mateName${matelist.matenum}" id="mateName${matelist.matenum}" value="${matelist.mateName }" readonly />
	                                </a>
	                            </td>
	                            <td>
	                                <p class="customprice${matelist.matenum}">원</p>
	                                <input type="text" name="customprice${matelist.matenum}" id="customprice${matelist.matenum}" value="${matelist.mateprice }" readonly hidden />
	                            </td>
	                            <td>
	                                <p class="customstatus${matelist.matenum}">상태</p>
	                                <input type="text" name="customstatus${matelist.matenum }" id="customstatus${matelist.matenum }" value="${matelist.salestatus }" readonly hidden />
	                            </td>
	                            <td>
	                                <p class="customCtg${matelist.matenum }">카테</p>
	                                <input type="text" name="customCtg${matelist.matenum }" id="customCtg${matelist.matenum }" value="${matelist.matectg }" readonly hidden />
	                            </td>
	                        </tr>
                        </c:forEach>
                         <tr>
                            <td>
                                <input type="checkbox" id="all_chk4" />
                                <label for="all_chk4"></label>
                            </td>
                            <td colspan="6" class="btn_div" id="btn_div2">
                                <p>전체선택(n/all)</p>
                                <button type="button" class="delete_btn">선택상품 삭제</button>
                            </td>
                        </tr>
                    </tbody>
                </table>

				<!-- pagination{s} -->
				<nav aria-label="Page navigation" id="pagination">
					<ul class="pagination">
						<c:if test="${pagination.prev}">
							<li class="page-item">
							<a class="page-link" href="#" onClick="fn_prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}')">Previous</a>
							</li>
						</c:if>
						<c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="idx">
							<li class="page-item <c:out value="${pagination.page == idx ? 'active' : ''}"/> ">
							<a class="page-link" href="#" onClick="fn_pagination('${idx}', '${pagination.range}', '${pagination.rangeSize}')"> ${idx} </a>
							</li>
						</c:forEach>
						<c:if test="${pagination.next}">
							<li class="page-item">
							<a class="page-link" href="#" onClick="fn_next('${pagination.range}', '${pagination.range}', '${pagination.rangeSize}')" >Next</a>
							</li>
						</c:if>
					</ul>
				</nav>
</div>

                <div class="addbtn_div">
                    <button type="button" onclick="location.href='itemregi'" class="add_btn">상품등록</button>
                    <button type="button" onclick="location.href='materegi'" class="add_btn">커스텀재료등록</button>
                </div>			
				
            <!--end-->
<jsp:include page="/resources/template/footer.jsp"/>
</body>
</html>