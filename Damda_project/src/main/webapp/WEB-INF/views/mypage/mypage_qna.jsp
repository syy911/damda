<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="/resources/template/head.jsp"/>
    <style type="text/css">
        #content .width_div {
            width: 100%;
            height: 250px;
            background-color: whitesmoke;
        }

        #content #content_header {
        	z-index:2;
            background-color: whitesmoke;
            padding-bottom: 50px;
            padding-top: 50px;
            margin-bottom: 20px;
        }

        #content #content_header>div {
            background-color: white;
            margin: 10px;
            height: 130px;
            color: gray;
        }


        #content #content_header #grade_div {
            border: 1px solid darksalmon;
            border-radius: 5px;
            width: 70px;
            height: 65px;
            line-height: 65px;
            text-align: center;
            font-size: 14px;
            font-weight: bold;
            color: darksalmon;
            display: inline-block;
            margin-top: 30px;
        }

        #content #content_header>div:nth-child(1) strong {
            position: relative;
            top: -15px;
            left: 0px;
            margin-left: 20px;
        }

        #content #content_header>div:nth-child(1) small {
            font-size: 13px;
            color: gray;
            position: relative;
            top: -15px;
            left: 0px;
            margin-left: 5px;
        }

        #content #content_header>div:nth-child(1) p {
            display: inline-block;
            position: relative;
            left: -70px;
            top: 12px;
        }

        #content #content_header #btn_div {
            width: 140px;
            display: inline-block;
            float: right;
            position: relative;
            top: 25px;
        }

        #content #content_header>div button {
            border: 0px;
            border-radius: 50px;
            background-color: #eeeeee;
            margin: 5px;
            font-size: 12px;
        }

        #content #content_header>div button:hover {
            background-color: darksalmon;
            color: white;
        }

        #content #content_header div img {
            position: relative;
            top: 17px;
            left: 12px;
            width: 15px;
        }

        #content #content_header p {
            font-size: 13px;
            color: gray;
            position: relative;
            top: 20px;
            left: 10px;

        }

        #content #content_header strong {
            color: darksalmon;
            font-size: 18px;
            position: relative;
            left: 10px;
            top: 20px;

        }

        #content #content_header small {
            color: #cecece;
            position: relative;
            top: 25px;
            left: 10px;
        }

        #content #content_header a,
        #content #content_header a:hover {
            text-decoration: none;
        }



        /*aside menu***********************************/
        #content #content_aside {
            z-index: 1;
            margin-bottom: 20px;
        }

        #content #content_aside img {
            width: 12px;
            float: right;
            position: relative;
            top: -40px;
            left: -10px;
        }

        #content #content_aside ul {
            list-style: none;
            padding: 0px;
            margin: 0px;
        }

        #content #content_aside ul li {
            border: 1px solid #cccccc;
            height: 50px;
            line-height: 50px;
            float: left;
        }

        #content #content_aside ul li:hover {
            background-color: #FBF5EF;
        }

        #content #content_aside ul li:nth-child(1),
        #content #content_aside ul li:nth-child(2),
        #content #content_aside ul li:nth-child(3),
        #content #content_aside ul li:nth-child(4) {
            border-bottom: 0px;
        }

        #content #content_aside ul li p {
            margin-left: 30px;
        }

        #content #content_aside ul li a {
            text-decoration: none;
            color: #565656;
        }

        #content #content_aside ul li a:hover {
            color: darksalmon;
            font-weight: bold;
        }

        #content #content_aside h2 {
            width: 150px;
        }

        #content #content_aside .active_menu {
            background-color: #FBF5EF;
            color: darksalmon;
            font-weight: bold;
        }

        /*content area************************************/
        #content #content_content h3 {
            width: 100px;
        }
        #qnaTab table tr th {
        text-align: center;
        }
        #content_content {
        margin-bottom: 400px; 
        }
    </style>
    <script type="text/javascript">
        $(document).ready(function() {
            grid();
//          	$('#isntQna').css('display','none');    //qna내역이 있을때 
//          	$('#isntQna').css('display','block');	//qna내역이 없을때(if)
		      
        });

        $(window).resize(function() {
            grid();
        });
 
        function grid() {
            var windowWidth = $(window).width();

            //md
            if (windowWidth >= 992) {
                $('#content_header>div:nth-child(2),#content_header>div:nth-child(3),#content_header>div:nth-child(4)').css('margin', '10px');
                $('#content_header>div:nth-child(2),#content_header>div:nth-child(3)').css('border-right', '0px');
                $('h2, h3').css({
                    display: 'inline-block',
                    marginTop: '50px',
                    marginBottom: '30px'
                });
                $('#content_aside li').css({
                    width: '90%',
                    textAlign: 'left'
                });
                $('#content_aside li:nth-child(1),#content_aside li:nth-child(2),#content_aside li:nth-child(3),#content_aside li:nth-child(4)').css({
                    borderRight: '1px solid #cccccc',
                    borderBottom: '0px'
                });
                $('#content_aside a').css('font-size', '13px');
                $('#content_aside p').css('margin-left', '30px');
            } else {

            }

            //sm
            if (windowWidth >= 768 && windowWidth < 992) {
                $('#content_header>div:nth-child(2),#content_header>div:nth-child(3),#content_header>div:nth-child(4)').css('margin', '0px');
                $('#content_header>div:nth-child(2),#content_header>div:nth-child(3)').css('border-right', '3px solid whitesmoke');
                $('h2, h3').css({
                    display: 'block',
                    margin: '20px auto'
                });
                $('#content_aside li').css({
                    width: '20%',
                    textAlign: 'center'
                });
                $('#content_aside li:nth-child(1),#content_aside li:nth-child(2),#content_aside li:nth-child(3),#content_aside li:nth-child(4)').css({
                    borderRight: '0px',
                    borderBottom: '1px solid #cccccc'
                });
                $('#content_aside a').css('font-size', '12px');
                $('#content_aside p').css('margin', '0px');
            } else {


            }

            //xs
            if (windowWidth < 768) {
                $('#content_header>div:nth-child(2),#content_header>div:nth-child(3),#content_header>div:nth-child(4)').css('margin', '0px');
                $('#content_header>div:nth-child(2),#content_header>div:nth-child(3)').css('border-right', '3px solid whitesmoke');
                $('h2, h3').css({
                    display: 'block',
                    margin: '20px auto'
                });
                $('#content_aside li').css('width', '20%');
                $('#content_aside li').css({
                    width: '20%',
                    textAlign: 'center'
                });
                $('#content_aside li:nth-child(1),#content_aside li:nth-child(2),#content_aside li:nth-child(3),#content_aside li:nth-child(4)').css({
                    borderRight: '0px',
                    borderBottom: '1px solid #cccccc'
                });
                $('#content_aside a').css('font-size', '11px');
                $('#content_aside p').css('margin', '0px');
            } else {


            }

            if (windowWidth < 1501) {
                $('.width_div').css('height', '405px');
                $('.margin_div2').addClass('col-md-11');
                $('.margin_div2').removeClass('col-md-5');
            } else {
                $('.width_div').css('height', '250px');
                $('.margin_div2').addClass('col-md-5');
                $('.margin_div2').removeClass('col-md-11');
            }
        }
    </script>
</head>
<body>
<jsp:include page="/resources/template/header.jsp"/>
<!-- content start -->
            <div>
                <div id="content_header" class="col-md-offset-2 col-md-8 col-sm-12 col-xs-12">
                    <div class="col-md-5 margin_div2">
                        <div id="grade_div">일반</div>
                        <strong>박수연</strong><small>님</small>
                        <p>0.5%적립</p>
                        <div id="btn_div">
                            <button class="btn">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;전체등급 보기&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
                            <button class="btn">다음 달 예상등급 보기</button>
                        </div>
                    </div>
                    <div class="col-md-2 col-sm-4 col-xs-4 margin_div">
                        <p>적립금</p>
                        <a href="#">
                            <strong>2,467 원</strong><img alt="righticon" src="/resources/icon/rigth.png" />
                        </a>
                        <br />
                        <small>소멸 예정 0 원</small>
                    </div>
                    <div class="col-md-2 col-sm-4 col-xs-4 margin_div">
                        <p>쿠폰</p>
                        <a href="#">
                            <strong>3 개</strong><img alt="righticon" src="/resources/icon/rigth.png" />
                        </a>
                    </div>
                    <div class="col-md-2 col-sm-4 col-xs-4 margin_div">
                        <p>내가쓴글</p>
                        <a href="#">
                            <strong>이동하기</strong><img alt="righticon" src="/resources/icon/rigth.png" />
                        </a>
                    </div>
                </div>
            </div>


            <div id="content_aside" class="col-md-offset-2 col-md-2 col-sm-12 col-xs-12">
                <h2>마이페이지</h2>
                <ul>
                    <li>
                        <a href="/mypage/"><p>주문 내역</p></a>
                    </li>
                    <li>
                        <a href="/mypage/jjim"><p>찜</p></a>
                    </li>
                    <li>
                        <a href="/mypage/myrecipe"><p>마이 레시피</p></a>
                    </li>
                    <li class="active_menu">
                        <a href="/mypage/qna"><p class="active_menu">문의 내역</p></a>
                    </li>
                    <li>
                        <a href="/mypage/userinfo"><p>개인 정보 수정</p></a>
                    </li>
                </ul>
            </div>
            <div id="content_content" class="col-md-6">
                <h3>문의 내역</h3>    
                <div id="qnaTab" class="col-md-12 col-sm-12 col-xs-12">
					<table class="table text-center">
						<thead>
							<tr>
								<th scope="col">No</th>
								<th scope="col">Subject</th>
								<th scope="col">Writer</th>
								<th scope="col">Date</th>
								<th scope="col">answer</th>
							</tr>
						</thead>
						<tbody id="isntQna">
							<tr>
								<td colspan="5"><br /><br />게시물이 없습니다.<br /><br /><br /></td>
							</tr>
							<tr>
								<td colspan="5"></td>
							</tr>
						</tbody> 
						<tbody id="isQna">
							<tr>
								<td>4</td>
								<td class="text-left"><a href="qna.detail">전화드렸는데 빨리 취소해주세요</a></td>
								<td>김경민</td>
								<td>2019-08-18</td>
								<td>미답변</td>
							</tr>
							<tr>
								<td>3</td>
								<td class="text-left">배송예약날짜를 늦추고 싶어요</td>
								<td>김경민</td>
								<td>2019-06-18</td>
								<td>답변</td>
							</tr>
							<tr>
								<td>2</td>
								<td class="text-left">무통장 입금을 카드결제로 바꾸...</td>
								<td>김경민</td>
								<td>2019-02-08</td>
								<td>답변</td>
							</tr>
							<tr>
								<td>1</td>
								<td class="text-left">반품때문에 전화드렸었는데요</td>
								<td>김경민</td>
								<td>2019-01-26</td>
								<td>답변</td>
							</tr>
						</tbody>
					</table>
					</div>
            </div>

<!-- content end -->
<jsp:include page="/resources/template/footer.jsp"/>
</body>
</html>