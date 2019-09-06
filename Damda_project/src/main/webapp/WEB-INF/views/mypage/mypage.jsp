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
            width: 110px;
        }

        #content #content_content small {
            width: 240px;
        }

        #content #content_content table {
            margin-bottom: 10px;
            border: 1px solid #cccccc;
            border-collapse: collapse;
        }

        #content #content_content table th:nth-child(2) {
            border-bottom: 1px solid #cccccc;
        }

        #content #content_content table td,
        #content #content_content table th {
            padding: 10px;

        }

        #content #content_content table th a {
            display: inline-block;
            color: #343434;
            font-size: 17px;
            text-decoration: none;
            width: 100%;
        }

        #content #content_content table th a:hover {
            color: darksalmon;
        }

        #content #content_content table th a img {
            width: 15px;
            float: right;
            position: relative;
            top: 7px;
            left: 25px;
        }


        #content #content_content table img {
            width: 15%;
            float: left;
            margin-right: 20px;
        }

        #content #content_content label {
            font-size: 11px;
            font-weight: 100;
            width: 50px;
        }

        #content #content_content input {
            font-weight: bold;
            border: 0px;
            margin-bottom: 10px;
        }

        #content #content_content .date_h4 {
            margin-top: 20px;
            color: darksalmon;
        }

        #content #content_content .pagination {
            margin-bottom: 50px;
        }

        #content #content_content .pagination>li>a {
            color: black;
        }

        #content #content_content .pagination>li>a:hover {
            font-weight: bold;
        }
        
</style>

</head>

<body>
<jsp:include page="/resources/template/header.jsp"/>
<jsp:include page="/resources/template/mypage_header.jsp"/>
<!-- content start -->
 			<div id="content_aside" class="col-md-offset-2 col-md-2 col-sm-12 col-xs-12">
                <h2>마이페이지</h2>
                <ul>
                    <li class="active_menu">
                        <a href="/mypage/"><p class="active_menu">주문 내역</p></a>
                    </li>
                    <li>
                        <a href="/mypage/jjim"><p>찜</p></a>
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
               	<h3>주문내역</h3><small>지난 3년간의 주문 내역 조회가 가능합니다</small>
                <div>
                    <h4 class="date_h4">2019.07.20</h4>
                    <table>
                        <tr>
                            <th></th>
                            <th>
                                <a href="#">
                                    [custom]샐러드NO.1
                                    <img src="/resources/icon/rigth.png">
                                </a>
                            </th>
                            <th></th>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <img src="/resources/imgs/s01.jpg" />
                                <label for="oderNum">주문번호</label>
                                <input type="text" name="oderNum" id="oderNum" value="123456789123" readonly>
                                <br />
                                <label for="price">결제금액</label>
                                <input type="text" name="price" id="price" value="49,345원" readonly>
                                <br />
                                <label for="deliverStatus">주문상태</label>
                                <input type="text" name="deliverStatus" id="deliverStatus" value="배송완료" readonly>
                            </td>
                            <td></td>
                        </tr>
                    </table>



                    <h4 class="date_h4">2019.07.20</h4>
                    <table>
                        <tr>
                            <th></th>
                            <th>
                                <a href="#">
                                    [custom]샐러드NO.2
                                    <img src="/resources/icon/rigth.png">
                                </a>
                            </th>
                            <th></th>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <img src="/resources/imgs/s02.jpg" />
                                <label for="oderNum">주문번호</label>
                                <input type="text" name="oderNum" id="oderNum" value="123456789123" readonly>
                                <br />
                                <label for="price">결제금액</label>
                                <input type="text" name="price" id="price" value="49,345원" readonly>
                                <br />
                                <label for="deliverStatus">주문상태</label>
                                <input type="text" name="deliverStatus" id="deliverStatus" value="배송완료" readonly>
                            </td>
                            <td></td>
                        </tr>
                    </table>
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