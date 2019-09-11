<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

		        </div>
    </div>
    <!-- ***********************************content end*********************************** -->



    <!-- ***********************************footer*********************************** -->
    <footer class="container-fluid bg-grey py-5">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <div class="row">
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <div class="logo-part">
                            	<a href="/">
                                <img src="/resources/imgs/mainlogo.png" class="w-50 logo-footer">
                            	</a>
                                <p>서울특별시 서초구 강남대로 459 <br />(서초동, 백암빌딩)</p>
                                <p><strong>02-3486-9600</strong><br />

                                    AM 10:00 ~ PM 06:00 <br />
                                    LUNCH PM 12:00 ~ PM 01:00 <br />
                                                                                 주말,공휴일 휴무<br /><br />
                                </p>
                            </div>
                        </div>
                        <div class="col-md-6  col-sm-6 col-xs-12 px-4">
                            <h6> About Company</h6>
                            <p></p>
                            <a href="/intro/" class="btn-footer"> More Info </a><br>
                            <a href="/intro/map" class="btn-footer"> View Map</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="row">
                        <div class="col-md-6 col-sm-6 col-xs-12 px-4">
                            <h6> Damda Info</h6>
                            <div class="row ">
                                <div class="col-md-6  col-sm-6 col-xs-6 cur_none">
                                    <ul>
                                        <li> 상호명. </li>
                                        <li> 대표자. </li>
                                        <li> 사업자등록번호. </li>
                                        <li> 개인정보관리책임자. </li>
                                        <li> 통신판매신고번호. </li>
                                    </ul>
                                </div>
                                <div class="col-md-6 px-4 col-xs-6 cur_none">
                                    <ul>
                                        <li> 담다 주식회사 </li>
                                        <li> 조현정 </li>
                                        <li> 214-85-24928 </li>
                                        <li> 최종진 </li>
                                        <li> 제 서초-00098호 </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <h6> Newsletter</h6>
                            <div class="social">
                                <a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a>
                                <a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a>
                            </div>
                            <p>Copyright ⓒ Damda. All rights reserved. </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer> 
    
    <%
  	//0 마스터. 1관리자. 2로그인회원. 3비회원. 
    //로그인 하지 않은 상태일때는 마이페이지 로그인 페이지로 이동
    int user_ctg = 3; 
    
    //로그인하면 세션이 생김
    if(session.getAttribute("user_ctg")!=null){
    	user_ctg = (int)session.getAttribute("user_ctg");
    }
    %>
    <div class="row">
        <div class="bottom_nav">
            <ul>
    			<%
				if(session.getAttribute("userid")!=null){
				%><li><a onclick="logoutcf()" style="cursor:pointer;">로그아웃</a></li><%
				}else{%>
				<li><a href="/login/">로그인</a></li><%}
                if(user_ctg == 3){%>
                <li><a href="/login/">마이페이지</a></li>
                <%}else if(user_ctg == 2){ %>
                <li><a href="/mypage/">마이페이지</a></li>
                <%}else if(user_ctg == 1){ %>
               	<li><a href="#">관리자페이지</a></li>
               	<%}else if(user_ctg == 0){ %>
                <li><a href="#">마스터페이지</a></li>
                <%}%>
                <li><a href="/mypage/cart">장바구니<img src="/resources/icon/cart.png" class="carticon"></a></li>
            </ul>
        </div>
    </div>