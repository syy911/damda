<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="/resources/template/head.jsp"/>
    <style type="text/css">
        #content .table_div h2 {
            display: block;
            margin: 30px auto 10px auto;
            width: 120px;
        }

        #content .table_div h2+p {
            font-size: 11px;
            margin: 10px auto 50px auto;
            display: block;
            width: 250px;
        }

        #content table {
            font-size: 12px;
        }

        #content table tr th {
            text-align: center;
            border-top: 2px solid darksalmon;
            border-bottom: 1px;
        }

        #content table .info_td strong {
            position: relative;
            top: 75px;
            font-size: 15px;
        }

        #content table .info_td p {
            font-size: 13px;
        }

        #content table .info_td p,
        #content table .price_td p {
            position: relative;
        }

        #content table .price_td p {
            font-size: 15px;
        }

        #content table .ed_td button {
            position: relative;
        }

        #content table .delete_td img {
            position: relative;
            width: 40px;
            cursor: pointer;
        }

        #content table .ea_td div {
            width: 77px;
            display: block;
            margin: 0px auto;
        }

        #content table .total_price {
            font-size: 15px;
            text-align: right;
        }


        /*전체선택*/
        #content table tr th:nth-child(1) {
            width: 5%;
        }

        /*상품정보*/
        #content table tr th:nth-child(2) {
            width: 55%;
        }

        /*수량*/
        #content table tr th:nth-child(3) {
            width: 18%;
        }

        /*상품금액*/
        #content table tr th:nth-child(4) {
            width: 17%;
        }

        /*삭제*/
        #content table tr th:nth-child(5) {
            width: 5%;
        }



        /*이미지 칸*/
        #content table .img_td {
            width: 15%;
        }

        /*이미지칸 이미지*/
        #content table .cartimg {
            width: 100%;
        }


        #content table .info_td {
            text-align: left;
        }

        #content table .checkbox_td,
        #content table .ea_td,
        #content table .price_td {
            text-align: center;
        }

        #content table tbody tr:last-child {
            border-bottom: 2px solid darksalmon;
        }


        /*checkbox_start*/
        #content input[type="checkbox"] {
            display: none;
        }

        #content input[type="checkbox"]+label {
            display: inline-block;
            width: 17px;
            height: 17px;
            background: white;
            cursor: pointer;
            border-radius: 3px;
            border: 1px solid #cccccc;
        }

        #content input[type="checkbox"]:checked+label {
            background: url(/resources/icon/check.png) darksalmon no-repeat center/15px 15px;
            border: 0px;
        }

        /*checkbox_end*/

        /*수랑버튼_start*/
        #content table button {
            background-color: white;
            border: 1px solid #cccccc;
            margin: 0px;
            width: 20px;
            height: 22px;
            line-height: 5px;
        }

        #content table .minus {
            position: relative;
            left: 4px;
        }

        #content table .plus {
            position: relative;
            left: -4px;
        }

        #content table input {
            border: 1px solid #cccccc;
            font-size: 12px;
            width: 30px;
            height: 22px;
            margin: 0px;
            text-align: center;
            position: relative;
        }

        /*수량버튼_end*/
        #content .btn_div {
            margin-bottom: 150px;
        }

        #content .btn_div div {
            display: inline-block;
            width: 5%;
            text-align: center;
            position: relative;
            top: 10px;
        }

        #content .btn_div p {
            display: inline-block;
            margin-right: 10px;
        }

        #content .btn_div button {
            border-radius: 0px;
        }

        #content .btn_div button:hover {
            background-color: darksalmon;
            color: white;
        }

        #content .btn_div input[type="submit"] {
            border-radius: 0px;
            background-color: darksalmon;
            color: white;
            float: right;
        }

        #content .btn_div input[type="submit"]:hover {
            font-weight: bold;
            border: 2px solid darksalmon;
        }
    </style>
    
    
    <script type="text/javascript">
        $(document).ready(function() {  
            grid();

            check_info();

            all_check();

            price_setting();

        });

        $(window).resize(function() {
            grid();
        });

        function grid() {
            var windowWidth = $(window).width();

            //md
            if (windowWidth >= 992) {
                $('td p').css('top', '40px');
                $('.plus, .minus, td strong, .delete_img').css('top', '35px');
                $('table input').css('top', '35px');
                $('.btn').addClass('btn-lg');
                $('.info_td strong, .price_td p, .total_price').css('font-size', '15px');
                $('.info_td p').css('font-size', '13px');
            } else {
                $('.btn').removeClass('btn-lg');

            }

            //sm
            if (windowWidth >= 768 && windowWidth < 992) {
                $('.delete_img').css('top', '25px');
                $('.plus, .minus, td p, td strong').css('top', '35px');
                $('table input').css('top', '35px');
                $('.info_td strong, .price_td p, .total_price').css('font-size', '14px');
                $('.info_td p').css('font-size', '12px');
                $('.btn_div').css('margin-bottom', '70px');
            } else {
                $('.btn_div').css('margin-bottom', '150px');

            }

            //xs
            if (windowWidth < 768) {
                $('.delete_img').css('top', '1px');
                $('.plus, .minus, td p, td strong').css('top', '7px');
                $('table input').css('top', '7px');
                $('.btn').addClass('btn-sm');
                $('.info_td strong, .price_td p, .total_price').css('font-size', '13px');
                $('.info_td p').css('font-size', '11px');
                $('.btn_div').css('margin-bottom', '50px');
            } else {
                $('.btn').removeClass('btn-sm');
                $('.btn_div').css('margin-bottom', '150px');

            }
        }

        //전체 선택
        function all_check() {

            $('#allitem1').click(function() {
                if ($('#allitem1').is(':checked')) {
                    $('input[type=checkbox]').prop('checked', true);
                } else {
                    $('input[type=checkbox]').prop('checked', false);
                }
            });

            $('#allitem2').click(function() {
                if ($('#allitem2').is(':checked')) {
                    $('input[type=checkbox]').prop('checked', true);
                } else {
                    $('input[type=checkbox]').prop('checked', false);
                }
            });

            $('input[type=checkbox]').click(function() {
                check_info();
            });
        }

        //선택 개수, 전체 개수
        function check_info() {
            var chk_length = $('input[name=chk]:checkbox:checked').length;
            var td_length = $('tbody tr').length - 1; //맨아래 총금액란은 빼고 계산
            var str = '전체선택 (' + chk_length + '/' + td_length + ')';
            $('.btn_div p').html(str);
        }

        //수량추가
        function minus_click(num) {
            var num = num;
            var minus_msg = '#minus' + num;
            var minus = $(minus_msg);
            var ea_msg = '#ea' + num;
            var ea = Number($(ea_msg).val());

            if (ea > 1) {
                $(ea_msg).val(--ea);
                total_price(ea, num);
            }

            price_setting();
        }

        function plus_click(num) {
            var num = num;
            var ea_msg = '#ea' + num;
            var ea = Number($(ea_msg).val());

            $(ea_msg).val(++ea);
            total_price(ea, num);

            price_setting();
        }

        //가격
        function total_price(ea, num) {
            var num = num;

            //input의 val값구하기
            var origin_input_msg = '#origin_itemno' + num;
            var price = $(origin_input_msg).val();

            //가격*수량의 문자열
            var totalPrice = price * ea + '';

            //가격*수량의 문자열 길이
            var length = totalPrice.length;

            //3자리 마다 ,들어간 형식으로 변환된 가격
            var price_view = price_viewer(totalPrice, length);

            //class는 p영역
            var p_msg = '.itemno' + num;
            $(p_msg).html(price_view);
            console.log(price_view);

            //합계금액 넘길 input
            var inputPrice = price * ea;
            var total_input_msg = '#total_itemno' + num;
            $(total_input_msg).val(inputPrice);
            console.log(inputPrice);
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

        function price_setting() {
            var length = $('tbody tr').length;

            //길이제한이 없는 배열생성
            var price_arr = [];
            price_arr[0] = 0;

            //strong에 넣을 금액들 Number형
            var s_price = 0;
            var s_delivery = 0;
            var s_total = 0;

            for (var i = 1; i < length; i++) {
                var ea_msg = '#ea' + i;
                var ea = $(ea_msg).val();
                //가격세팅
                total_price(ea, i);

                //hidden input 합계 가격
                var total_msg = '#total_itemno' + i;
                var price = $(total_msg).val();
                price_arr[i] = Number(price);

                //합계가격
                s_price += price_arr[i];
            }

            if (s_price < 50000) {
                s_delivery = 2500;
            }

            s_total = s_price + s_delivery;

            //문자열로 변경해서 함수이용
            s_price = s_price + "";
            var length2 = s_price.length;
            s_price = price_viewer(s_price, length2);

            s_delivery = s_delivery + "";
            var length1 = s_delivery.length;
            s_delivery = price_viewer(s_delivery, length1);

            s_total = s_total + "";
            var length3 = s_total.length;
            s_total = price_viewer(s_total, length3);



            //합계금액 + 배송비 = 최종금액 
            $('.price_strong').html(s_price); //합계금액
            $('.delivery_strong').html(s_delivery); //배송비
            $('.total_strong').html(s_total); //최종금액

        }
    </script>
</head>
<body>
<jsp:include page="/resources/template/header.jsp"/>
<!-- content start -->
		<div class="col-md-offset-2 col-md-8 table_div">
		    <h2>장바구니</h2>
		    <p>주문하실 상품명 및 수량을 정확하게 확인해주세요.</p>
		    <table class="table">
		        <thead>
		            <tr>
		                <th>
		                    <input type="checkbox" id="allitem1" />
		                    <label for="allitem1"></label>
		
		                </th>
		                <th colspan="2">상품정보</th>
		                <th>수량</th>
		                <th>상품금액</th>
		                <th></th>
		            </tr>
		        </thead>
		        <tbody>
		        <c:forEach items="${List}" var="List" varStatus="status">
		            <tr>
		                <td class="checkbox_td">
		                    <input type="checkbox" name="chk" id="${List.itemNum }" />
		                    <label for="${List.itemNum }"></label>
		                </td>
		                <td class="img_td">
		                    <img alt="cartimg" src="${List.photoPath }" class="cartimg" />
		                </td>
		                <td class="info_td">
		                    <strong>${List.itemName }</strong>
		                    <p>선택정보 : 수량 ${List.ea } 개</p>
		                </td>
		                <td class="ea_td">
		                    <div>
		                        <button class="minus" id="minus1" onclick="minus_click(${List.itemNum });">-</button>
		                        <input type="text" class="ea" name="ea" id="ea${List.itemNum }" value="${List.ea }" readonly />
		                        <button class="plus" id="plus1" onclick="plus_click(${List.itemNum });">+</button>
		                    </div>
		                </td>
		                <td class="price_td">
		                    <p class="itemno${List.itemNum }">상품가격오는 곳******************</p>
		                    <input type="hidden" name="origin_price" id="origin_itemno${List.itemNum }" value="${List.itemPrice }" />
		                    <input type="hidden" name="total_price" id="total_itemno${List.itemNum }" value="6000" />
		                </td>
		                <td class="delete_td">
		                    <img alt="deleteimg" src="/resources/icon/x.png" class="delete_img" />
		                </td>
		            </tr>
		        </c:forEach>
		            
		            <tr>
		                <td class="total_price" colspan="6">
		                    	상품구매금액 <strong class="price_strong">207,000원 </strong>+ 배송비 <strong class="delivery_strong">0원 </strong>= 합계 : <strong class="total_strong">207,000원</strong>
		                </td>
		            </tr>
		        </tbody>
		    </table>
		
		
		    <div class="btn_div">
		        <div>
		            <input type="checkbox" id="allitem2" />
		            <label for="allitem2"></label>
		        </div>
		        <p>전체선택(n/all)</p>
		        <button type="button" class="btn">선택 상품 삭제</button>
		        <button type="button" class="btn">전체 상품 삭제</button>
		        <input type="submit" class="btn" value="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;주문하기&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" />
		
		    </div>
		</div>
	

<!-- content end -->
<jsp:include page="/resources/template/footer.jsp"/>
</body>
</html>