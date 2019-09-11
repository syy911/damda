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
            width: 180px;
        }
        

        #content .table_div h2+p+p {
            font-size: 14px;
            text-aling:center;
            margin: 30px auto 20px auto;
            display: block;
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
            width: 45%;
        }

        /*수량*/
        #content table tr th:nth-child(3) {
            width: 18%;
        }

        /*상품금액*/
        #content table tr th:nth-child(4) {
            width: 27%;
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
        #content .btn_div {
            margin-bottom: 150px;
            text-align:center;
            
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
            background-color: darksalmon;
            color: white;
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

       
    </script>
</head>
<body>
<jsp:include page="/resources/template/header.jsp"/>
<!-- content start -->
		<div class="col-md-offset-2 col-md-8 table_div">
		    <h2>주문내역</h2>
		    <p>감사합니다. 주문이 완료되었습니다.</p>
		    <p>주문번호 : 15712213</p>
		    <table class="table">
		        <thead>
		            <tr>
		            	<th></th>
		                <th colspan="2">상품정보</th>
		                <th>수량</th>
		                <th>상품금액</th>
		                <th></th>
		            </tr>
		        </thead>
		        <tbody>
		            <tr>
		                <td class="img_td">
		                    <img alt="cartimg" src="/resources/imgs/s01.jpg" class="cartimg" />
		                </td>
		                <td colspan="2" class="info_td">
		                    <strong>상품이름</strong>
		                    <p>상품 옵션/선택정보</p>
		                </td>
		               <td class="price_td">
		              	 <p>1</p>
		               </td>
		                <td class="price_td">
		                    <p class="itemno1">6000원</p>
		                </td>
		            </tr>
		             <tr>
		                <td class="img_td">
		                    <img alt="cartimg" src="/resources/imgs/s02.jpg" class="cartimg" />
		                </td>
		                <td colspan="2" class="info_td">
		                    <strong>상품이름</strong>
		                    <p>상품 옵션/선택정보</p>
		                </td>
		               <td class="price_td">
		              	 <p>1</p>
		               </td>
		                <td class="price_td">
		                    <p class="itemno1">6000원</p>
		                </td>
		            </tr>
		             <tr>
		                <td class="img_td">
		                    <img alt="cartimg" src="/resources/imgs/s03.jpg" class="cartimg" />
		                </td>
		                <td colspan="2" class="info_td">
		                    <strong>상품이름</strong>
		                    <p>상품 옵션/선택정보</p>
		                </td>
		               <td class="price_td">
		              	 <p>1</p>
		               </td>
		                <td class="price_td">
		                    <p class="itemno1">6000원</p>
		                </td>
		            </tr>
		           
		        </tbody>
		    </table>
		
		
		    <div class="btn_div">
		        <button type="button" class="btn">메인으로 이동</button>
		        
		    </div>
		</div>
	

<!-- content end -->
<jsp:include page="/resources/template/footer.jsp"/>
</body>
</html>