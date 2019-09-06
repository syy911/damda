<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <jsp:include page="/resources/template/head.jsp"/>
    <style type="text/css">
    #pgname-wrap {
	    border:thin solid rgb(200,200,200);
	    height: 45px;
	    width:125px;
	    margin: 0 auto;
    }
    #pgname-wrap h3 {
	    margin: 0px;
	    padding: 7px;
    }
    #notice-tab th {
    	text-align: center;
    }
    #del-btn {
    	cursor: pointer;
    }
    #pg-btn #pg-back {
    	display: none;
    }
    [name=del-check],#del-check-all {
		width: 20px; 
		height: 20px;
    }
    #confirmMessage h4 {
    	font-size: 1.7rem; 
    }
    /*아이템*/
    .itemList{
    	cursor: pointer;
    }
    /*아이템 디테일*/
    .itemDetail{
    	display:none;
    	text-align:left;
    }
    .itemDetail>td>div{
    	margin:10px 0px 10px 30px;
    }
    </style>
    <script type="text/javascript">
    	$(document).ready(function(){
			resized2();
			//관리자계정으로들어왔을 때(같은 jsp&다른 주소)
			//세션잡아서 json으로 만들어서 ajax로 보내서 세션따라 보여줄요소 결정(삭제버튼,체크상자)
			//user view
          	var lastTh = $('table thead tr th:nth-child(6)');
			var lastTd = $('table tbody tr td:nth-child(6)');
          	lastTh.hide();
          	lastTd.hide();
       		//admin view
          	/* lastTh.show();
          	lastTd.show(); */
      		/* if() */   
       		//글 삭제시 전체 선택&해제(관리자)
       		$('#del-check-all').click( function() {
           		$( 'table tbody tr td:last-child [name=del-check]' ).prop( 'checked', this.checked );
         	});
       
       		//전체삭제&삭제 버튼 클릭
       		$('#del-btn').click(function(){
         		var myModal = $("#confirmModal");
             	myModal.modal("show").css('top', '35%');
            	$("#confirmOk").click(function(){
               		console.log('체크한 글 비동기로 지우기');/********************************************글삭제로직  */
            	});
            	$("#confirmCancel").click(function(){
                	myModal.modal("hide");
            	});
       		});
       
       		//페이징 앞으로가기&뒤로가기 생기는 시점
       		//공지사항 리스트 10개씩 보여줄 것
       		//첫번째 페이지에선 뒤로가기버튼 hidden
       		//맨 마지막 페이지로 갔을때 앞으로가기버튼 hidden
       		var backBtn = $('#pg-btn li:nth-child(2)').text();
       		var lastNum = $('table tbody tr:nth-child(10) td:nth-child(1)').text();
       		if(backBtn != '1'){
          		$('#pg-back').css('display','block');
       		}
       		if(lastNum == '1'){
          		$('#pg-forth').css('display','none');
       		}

       		//눌렀을때 상세보이게
       		$('.itemList').click(function(){
				$('.itemDetail').slideUp(10);
				if(!$(this).next().is(":visible")){
					$(this).next().slideDown();
				}
           	});
       		
    	});//document.ready function end**************************************************************    

    	//창크기 514px보다 작아졌을 때 폰트크기 고정(테이블 안부셔지게)
    	$(window).resize(function() {
        	resized2();
    	});
    	function resized2() {
        	var windowWidth = $(window).width();
           	if(windowWidth < 540) {
       			$('#notice-tab').css('font-size','12px');
           	}else{
           		$('#notice-tab').css('font-size','14px');
           	}
    	}
    </script>
</head>
<body>
	<!-- ***********************************header start*********************************** -->
	<jsp:include page="/resources/template/header.jsp"/>
	<!-- ***********************************content start*********************************** -->
	<div class="container-fluid text-center">
	  <div id="content" class="row">
		<div class="col-md-offset-1 col-md-10">
		  <div class="col-md-12 col-sm-12 col-xs-12">
			<br /><br />
			<div id="pgname-wrap">
			  <h3>주문목록</h3>
			</div>
			<br />
		  </div>
		  <div id="notice-tab" class="col-md-12 col-sm-12 col-xs-12">
			<br /><br />
			<table class="table text-center">
			  <thead>
				<tr>
				  <th scope="col">No</th>
		 		  <th scope="col">주문자명</th>
		 		  <th scope="col">주문번호</th>
		 		  <th scope="col">배송상태</th>
		 		  <th>
		 		  	<input type="checkbox" id="del-check-all" class="custom-control-input"/>
		 		  </th>
				</tr>
			  </thead>
			  <tbody>
			  	<tr class="itemList">
			  	  <td>4</td>
			  	  <td>강미현</td>
			  	  <td>20190822-04</td>
			  	  <td>배송준비</td>
			  	  <td>
			  	  	<input type="checkbox" name="del-check" class="custom-control-input"/>
			  	  </td>
				</tr>
				<!-- 4번 상세 -->
			  	<tr class="itemDetail">
			  	  <td colspan="5">
			  	  	<div>
				  	  	주문자명  : 강미현 <br/>
				  	  	주문상품  : 연어샐러드 <br/>
				  	  	상품 가격 : 8,000원 <br/>
				  	  	주문 날짜 : 2019-08-22 <br/>
			  	  	</div>
			  	  </td>
				</tr>
				<tr class="itemList">
                  <td>3</td>
                  <td>이승은</td>
                  <td>20190822-03</td>
                  <td>배송준비</td>
                  <td>
                  	<input type="checkbox" name="del-check" class="custom-control-input"/>
                  </td>
                </tr>
				<!-- 3번 상세 -->
			  	<tr class="itemDetail">
			  	  <td colspan="5">
			  	  	<div>
				  	  	주문자명  : 이승은 <br/>
				  	  	주문상품  : 연어샐러드 <br/>
				  	  	상품 가격 : 8,000원 <br/>
				  	  	주문 날짜 : 2019-08-22 <br/>
			  	  	</div>
			  	  </td>
				</tr>
				<tr class="itemList">
                  <td>2</td>
                  <td>김경민</td>
                  <td>20190822-02</td>
                  <td>배송완료</td>
                  <td>
                  	<input type="checkbox" name="del-check" class="custom-control-input"/>
                  </td>
                </tr>
				<!-- 2번 상세 -->
			  	<tr class="itemDetail">
			  	  <td colspan="5">
			  	  	<div>
				  	  	주문자명  : 김경민 <br/>
				  	  	주문상품  : 연어샐러드 <br/>
				  	  	상품 가격 : 8,000원 <br/>
				  	  	주문 날짜 : 2019-08-22 <br/>
			  	  	</div>
			  	  </td>
				</tr>
				<tr class="itemList">
                  <td>1</td>
                  <td>박수연</td>
                  <td>20190822-01</td>
                  <td>배송완료</td>
                  <td>
                  	<input type="checkbox" name="del-check" class="custom-control-input"/>
                  </td>
                </tr>
				<!-- 1번 상세 -->
			  	<tr class="itemDetail">
			  	  <td colspan="5">
			  	  	<div>
				  	  	주문자명  : 박수연 <br/>
				  	  	주문상품  : 연어샐러드 <br/>
				  	  	상품 가격 : 8,000원 <br/>
				  	  	주문 날짜 : 2019-08-22 <br/>
			  	  	</div>
			  	  </td>
				</tr>
              </tbody>
			</table>
		  </div>
		  <div class="col-md-12 col-sm-12 col-xs-12 text-right">
			<a id="del-btn" class="btn btn-default">삭제</a>
			</div>
            <div class="col-md-12 col-sm-12 col-xs-12"> 
               <ul id="pg-btn" class="pagination">
                  <li id="pg-back"><a href="#"></a></li>
                  <li><a href="#">1</a></li>
                  <li><a href="#">2</a></li>
                  <li><a href="#">3</a></li>
                  <li><a href="#">4</a></li>
                  <li><a href="#">5</a></li>
                  <li id="pg-forth"><a href="#">></a></li>
               </ul>
            </div>
         </div>
      </div>
   </div>
   <!-- Modal confirm -->
   <div class="modal" id="confirmModal" style="display: none; z-index: 1050;">
       <div class="modal-dialog">
           <div class="modal-content">
               <div class="modal-body" id="confirmMessage">
                  <h4>선택한 항목을 삭제하시겠습니까?</h4>
               </div>
               <div class="modal-footer">
                   <button type="button" class="btn btn-default" id="confirmOk">확인</button>
                   <button type="button" class="btn btn-default" id="confirmCancel">취소</button>
               </div>
           </div>
       </div>
   </div>
    <!-- ***********************************content end*********************************** -->
    <!-- ***********************************footer*********************************** -->
    <jsp:include page="/resources/template/footer.jsp"/>
</body></html>