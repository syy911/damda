<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

        <!-- ***********************************header start*********************************** -->
    <div class="row">
        <div id="header">
            <a href="#">
                <div id="bowl">
                    <img src="/resources/imgs/bowl5.png" alt="" id="bowlimg">
                    <div id="text" class="animated bounceInDown delay-0s duration-4s">
                        <img src="/resources/imgs/mainlogo.png" alt="" id="logo_img">
                    </div>
                </div>
            </a>
        </div>

        <nav class="navbar navbar-default" id="navbarid">
            <div class="container-fluid" id="nav_design">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="/"><img alt="mainlogo" src="/resources/imgs/mainlogo.png" class="navlogo" /></a>
                </div>

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><img src="/resources/icon/allctg.png" class="allctgicon" />전체 카테고리<span class="caret"></span></a>
                            <ul class="dropdown-menu allctg_right" role="menu">
                                <li class="li1"><a href="/item/list?item=salad"><img src="/resources/icon/salad.png" />샐러드<img src="/resources/icon/right.png" class="rightimg img1" /></a></li>
                                <li class="divider"></li>
                                <li class="li2"><a href="/item/list?item=dessert"><img src="/resources/icon/dessert.png" class="dessertimg" />디저트<img src="/resources/icon/right.png" class="rightimg img2" /></a></li>
                                <li class="divider"></li>
                                <li class="li3"><a href="/item/list?item=drink"><img src="/resources/icon/drink.png" />음료<img src="/resources/icon/right.png" class="rightimg right img3" /></a></li>
                            </ul>
                        </li>
                        <li><a href="/item/list?item=best">베스트</a></li>
                        <li><a href="/custom/">커스텀</a></li>
                        <li><a href="/event/">이벤트</a></li>
                        <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">고객센터<span class="caret"></span></a>
                            <ul class="dropdown-menu menu_control" role="menu">
                                <li><a href="/notice/">공지사항</a></li>
                                <li class="divider"></li>
                                <li><a href="/qna/">문의사항</a></li>
                                <li class="divider"></li>
                                <li><a href="/notice/faq">FAQ</a></li>
                            </ul>
                        </li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
						<%
						if(session.getAttribute("userid")!=null){
						%><li><a onclick="logoutcf()" style="cursor:pointer;">로그아웃</a></li><%
						}else{
						%><li><a href="/login/">로그인</a></li>
                        <%}
						
						//0 마스터. 1관리자. 2로그인회원. 3비회원. 
                        //로그인 하지 않은 상태일때는 마이페이지 로그인 페이지로 이동
                        int user_ctg = 3; 
                        
                        //로그인하면 세션이 생김
                        if(session.getAttribute("user_ctg")!=null){
                        	user_ctg = (int)session.getAttribute("user_ctg");
                        }
                        
                        if(user_ctg == 3){ %>
                        <li class="dropdown">
                            <a href="/login/">마이페이지 <span class="caret"></span></a>
                        </li>
                        <%}else if(user_ctg == 2){ %>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">마이페이지 <span class="caret"></span></a>
                            <ul class="dropdown-menu menu_control" role="menu">
                                <li><a href="/mypage/">주문내역</a></li>
                                <li><a href="/mypage/jjim">찜</a></li>
                                <li><a href="/mypage/myrecipe">마이 레시피</a></li>
                                <li><a href="/mypage/qna">문의내역</a></li>
                                <li class="divider"></li>
                                <li><a href="/mypage/">개인정보</a></li>
                            </ul>
                        </li>
                        <%}else if(user_ctg == 1){  %>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">관리자페이지 <span class="caret"></span></a>
                            <ul class="dropdown-menu menu_control" role="menu">
                                <li><a href="#">주문관리</a></li>
                                <li><a href="#">상품관리</a></li>
                                <li><a href="#">회원관리</a></li>
                                <li class="divider"></li>
                                <li><a href="#">리뷰관리</a></li>
                                <li><a href="#">쿠폰관리</a></li>
                                <li class="divider"></li>
                                <li><a href="#">공지사항</a></li>
                                <li><a href="#">문의사항</a></li>
                                <li><a href="#">이벤트</a></li>

                            </ul>
                        </li>
                        <%}else if(user_ctg == 0){  %>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">마스터페이지 <span class="caret"></span></a>
                            <ul class="dropdown-menu menu_control" role="menu">
                                <li><a href="#">주문관리</a></li>
                                <li><a href="#">상품관리</a></li>
                                <li><a href="#">회원관리</a></li>
                                <li class="divider"></li>
                                <li><a href="#">리뷰관리</a></li>
                                <li><a href="#">쿠폰관리</a></li>
                                <li class="divider"></li>
                                <li><a href="#">공지사항</a></li>
                                <li><a href="#">문의사항</a></li>
                                <li><a href="#">이벤트</a></li>
                                <li class="divider"></li>
                                <li><a href="#">관리자등록</a></li>
                            </ul>
                        </li>
                        <%}
                        
						if(session.getAttribute("userid")!=null){%>
                        <li><a href="/mypage/cart">장바구니<img src="/resources/icon/cart.png" class="carticon"></a></li>
						<%}else{%>
                        <li><a href="/login/">장바구니<img src="/resources/icon/cart.png" class="carticon"></a></li>
                        <%} %>
                    </ul>
                </div><!-- /.navbar-collapse -->
            </div><!-- /.container-fluid -->
        </nav>
    </div>
    <!-- ***********************************header end*********************************** -->
    <!-- ***********************************content start*********************************** -->