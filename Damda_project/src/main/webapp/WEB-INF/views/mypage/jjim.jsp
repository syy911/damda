<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/mypage.css" />
<jsp:include page="/resources/template/head.jsp"/>
<jsp:include page="/resources/template/mypage_head.jsp"/>
<style type="text/css">
        /*content area************************************/
        #content #content_content h3 {
            width: 30px;
        }

        #content #content_content small {
            width: 140px;
        }

        /*checkbox_start*/
        #content #content_content input[type="checkbox"] {
            display: none;
        }

        #content #content_content input[type="checkbox"]+label {
            display: inline-block;
            width: 17px;
            height: 17px;
            background: white;
            cursor: pointer;
            border-radius: 3px;
            border: 1px solid #cccccc;
        }

        #content #content_content input[type="checkbox"]:checked+label {
            background: url(/resources/icon/check.png) darksalmon no-repeat center/15px 15px;
            border: 0px;
        }

        /*checkbox_end*/

        /*pagination start*/
        #content #content_content .pagination {
            margin-bottom: 50px;
        }

        #content #content_content .pagination>li>a {
            color: black;
        }

        #content #content_content .pagination>li>a:hover {
            font-weight: bold;
        }

        /*pagination end*/



        #content #content_content table {
            text-align: center;
            margin-bottom: 20px;
            border-top: 2px solid darksalmon;
        }

        #content #content_content table th {
            text-align: center;
            height: 50px;
            border-bottom: 2px solid #cccccc;
        }

        #content #content_content table td {
            border-bottom: 1px solid #cccccc;

        }

        #content #content_content table th:nth-child(1) {
            width: 5%;
        }

        #content #content_content table th:nth-child(2) {
            width: 80%;
        }

        #content #content_content table th:nth-child(3) {
            width: 15%;
        }

        #content #content_content table td:nth-child(2) {
            width: 20%;
            padding: 10px;
        }

        #content #content_content table td:nth-child(3) {
            text-align: left;
        }

        #content #content_content table img {
            width: 100%;
        }

        #content #content_content table input[type="text"] {
            border: 0px;
            font-size: 17px;
            font-weight: bold;
            margin-left: 20px;
			cursor: pointer;
        }
        
        #content #content_content table p {
            font-size: 13px;
            margin-left: 20px;
        }

        #content #content_content table button {
            font-size: 13px;
            width: 100px;
            height: 30px;
            background-color: white;
            border: 1px solid darksalmon;
        }

        #content #content_content table button:nth-child(1) {
            background-color: darksalmon;
            color: white;
            margin-bottom: 3px;
        }

        #content #content_content table button:nth-child(2) {
            color: darksalmon;

        }

        #content #content_content .btn_div button {
            font-size: 15px;
            width: 150px;
            height: 40px;
            background-color: white;
            border: 1px solid darksalmon;
            float: right;
        }

        #content #content_content .btn_div button:nth-child(1) {
            background-color: darksalmon;
            color: white;
            margin-left: 10px;
        }

        #content #content_content .btn_div button:nth-child(2) {
            color: darksalmon;
        }
     
     	#content #content_content a{
     		color: black;
     	}
     	
     	#content #content_content a:hover{
     		color: darksalmon;
     	}
</style>


<script type="text/javascript">
$(document).ready(function() {
    all_check();

    price_setting();

    grid2();
    
});

$(window).resize(function() {
    grid2();
});

function grid2() {
    var windowWidth = $(window).width();

    //md
    if (windowWidth >= 992) {
        $('#content_content table').css('margin-top', '8px');
    } else {}

    //sm
    if (windowWidth >= 768 && windowWidth < 992) {
        $('#content_content table').css('margin-top', '50px');
    } else {}

    //xs
    if (windowWidth < 768) {
        $('#content_content table').css('margin-top', '50px');
    } else {}
}

//전체 선택
function all_check() {
    $('#all_chk').click(function() {
        if ($('#all_chk').is(':checked')) {
            $('input[type=checkbox]').prop('checked', true);
        } else {
            $('input[type=checkbox]').prop('checked', false);
        }
    });

}

//가격세팅
function price_setting() {
    var length = $('tbody tr').length + 1;

    for (var i = 1; i < length; i++) {
        total_price(i);
    }
}

//가격
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
<jsp:include page="/resources/template/mypage_header.jsp"/>
<!-- content start -->
 			<div id="content_aside" class="col-md-offset-2 col-md-2 col-sm-12 col-xs-12">
                <h2>마이페이지</h2>
                <ul>
                    <li>
                        <a href="/mypage/"><p>주문 내역</p></a>
                    </li>
                    <li class="active_menu">
                        <a href="/mypage/jjim"><p class="active_menu">찜</p></a>
                    </li>
                    <li>
                        <a href="/mypage/myrecipe"><p>마이 레시피</p></a>
                    </li>
                    <li>
                        <a href="/mypage/qna"><p>문의 내역</p></a>
                    </li>
                    <li>
                        <a href="/mypage/userinfo"><p>개인 정보 수정</p></a>
                    </li>
                </ul>
            </div>
            
            
             <div id="content_content" class="col-md-6">
                <h3>찜</h3><small>찜해두신 상품 목록입니다</small>
                <table>
                    <thead>
                        <tr>
                            <th>
                                <input type="checkbox" id="all_chk" />
                                <label for="all_chk"></label>
                            </th>
                            <th colspan="2">상품정보</th>
                            <th>선택</th>
                        </tr>
                    </thead>

                    <tbody>
                        <tr>
                            <td>
                                <input type="checkbox" name="chk" id="itemnum1" />
                                <label for="itemnum1"></label>
                            </td>
                            <td>
                                <a href="#"><img src="/resources/imgs/s01.jpg" /></a>
                            </td>
                            <td>
                                <a href="#"><input type="text" name="itemname" id="itemname" value="[custom]샐러드 No.1" readonly /></a>
                                <p class="itemprice1">원</p>
                                <input type="hidden" name="itemprice1" id="itemprice1" value="5500" readonly />
                            </td>
                            <td>
                                <button type="button">장바구니 담기</button>
                                <button type="button">삭제</button>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input type="checkbox" name="chk" id="itemnum2" />
                                <label for="itemnum2"></label>
                            </td>
                            <td>
                                <a href="#"><img src="/resources/imgs/s02.jpg" /></a>
                            </td>
                            <td>
                                <a href="#"><input type="text" name="itemname" id="itemname" value="[custom]샐러드 No.1" readonly /></a>
                                <p class="itemprice2">원</p>
                                <input type="hidden" name="itemprice2" id="itemprice2" value="15900" readonly />
                            </td>
                            <td>
                                <button type="button">장바구니 담기</button>
                                <button type="button">삭제</button>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input type="checkbox" name="chk" id="itemnum3" />
                                <label for="itemnum3"></label>
                            </td>
                            <td>
                                <a href="#"><img src="/resources/imgs/s03.jpg" /></a>
                            </td>
                            <td>
                                <a href="#"><input type="text" name="itemname" id="itemname" value="[custom]샐러드 No.1" readonly /></a>
                                <p class="itemprice3">원</p>
                                <input type="hidden" name="itemprice3" id="itemprice3" value="1225500" readonly />
                            </td>
                            <td>
                                <button type="button">장바구니 담기</button>
                                <button type="button">삭제</button>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input type="checkbox" name="chk" id="itemnum4" />
                                <label for="itemnum4"></label>
                            </td>
                            <td>
                                <a href="#"><img src="/resources/imgs/s04.PNG" /></a>
                            </td>
                            <td>
                                <a href="#"><input type="text" name="itemname" id="itemname" value="[custom]샐러드 No.1" readonly /></a>
                                <p class="itemprice4">원</p>
                                <input type="hidden" name="itemprice4" id="itemprice4" value="7000" readonly />
                            </td>
                            <td>
                                <button type="button">장바구니 담기</button>
                                <button type="button">삭제</button>
                            </td>
                        </tr>

                    </tbody>
                </table>

                <div class="btn_div">
                    <button type="button">전체 주문하기</button>
                    <button type="button">선택삭제</button>
                </div>

                <div class="col-md-offset-3 col-md-9 col-sm-offset-4 col-sm-6 col-xs-offset-2 col-xs-8">
                    <ul class="pagination">
                        <li>
                            <a href="#" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                        <li><a href="#">1</a></li>
                        <li><a href="#">2</a></li>
                        <li><a href="#">3</a></li>
                        <li><a href="#">4</a></li>
                        <li><a href="#">5</a></li>
                        <li>
                            <a href="#" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>

<!-- content end -->
<jsp:include page="/resources/template/footer.jsp"/>
</body>
</html>