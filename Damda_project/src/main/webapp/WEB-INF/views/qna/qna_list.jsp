<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
 	<jsp:include page="/resources/template/head.jsp"/> 
 	<style type="text/css">
 	#pgnameWrap {
 	border:thin solid rgb(200,200,200);
 	height: 45px;
 	width:125px;
 	margin: 0 auto;
 	}
 	#pgnameWrap h3 {
 	margin: 0px;
 	padding: 7px;
 	}
 	#qnaNotice {
 	background-color: #eeeeee;
 	}
 	#qnaNotice #subBack {
 	background-color: #ffe09c;
 	color:#ffffff;
 	border-radius: 8px;
 	width:160px;
 	margin: 30px auto;
 	padding: 10px;
 	}
 	#qnaTab th {
 	text-align: center;
 	}
 	#qnaTab #contentPw {
 	cursor: pointer;
 	}
 	#qnaTab .lock {
 	width: 20px;
 	height: 18px;
 	}
 	#categoryWrap {
 	margin-top: 20px;
 	}
 	#searchDesk div {
 	padding: 0px;
 	}
 	#deleteBtn {
 	cursor: pointer;
 	}
 	#pgBtn #pgBack {
 	display: none;
 	}
 	[name=deleteCheck],#delCheckAll {
	width: 20px; 
	height: 20px;
 	}
 	#confirmMessage h4 {
 	font-size: 1.7rem; 
 	}
 	</style>
 	<script type="text/javascript">
 	$(document).ready(function(){
 		//function들 하단부에 선언함
 		resized2();					//창크기조정할때 반응형 수정
 		categorySelect();			//문의카테고리 구분
 		searchSelect();				//검색
 		
 		//관리자계정으로들어왔을 때(같은 jsp&다른 주소)
 		//세션잡아서 json으로 만들어서 ajax로 보내서 세션따라 보여줄요소 결정(삭제버튼,체크상자)
 		//user view
 			var lastTh = $('table thead tr th:nth-child(7)');
 			var lastTd = $('table tbody tr td:nth-child(7)');
 			lastTh.hide();
 			lastTd.hide();
 		//admin view
 			lastTh.show();
 			lastTd.show();
		/* if() */
		
		//문의 글 비밀번호 입력
		$('#contentPw').click(function(){
  	    var pwModal = $("#pwconfirmModal");
  	  		pwModal.modal("show").css('top', '35%');
	  	    $("#pwconfirmOk").click(function(){
	  	    	console.log('글 접근 가능');/********************************************글삭제로직  */
	  	    });
	  	    $("#pwconfirmCancel").click(function(){
	  	  		pwModal.modal("hide");
	  	    });
 		});

 		//글 삭제시 전체 선택&해제(관리자)
 		$('#delCheckAll').click( function() {
 	    	$( 'table tbody tr td:last-child [name=deleteCheck]' ).prop( 'checked', this.checked );
 	     });
 		
 		//전체삭제&삭제 버튼 클릭
 		$('#deleteBtn').click(function(){
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
 		var backBtn = $('#pgBtn li:nth-child(2)').text();
 		var lastNum = $('table tbody tr:nth-child(10) td:nth-child(1)').text();
	 	if(backBtn != '1'){
	 		$('#pgBack').css('display','block');
	 	}
	 	if(lastNum == '1'){
	 		$('#pgForth').css('display','none');
	 	}
	
 	});//document.ready function end************************************************************** 		
	
 	//selectbox로 선택한 카테고리만 볼수있게(수정 이거 백에서 해야해)*******************************************수정
 	function categorySelect() {
	 	$('#category').click(function(){	
			var selected = $("#category option:selected").val();
		 	$("#qna-tab > table > tbody > tr").hide();
		 	
			if(selected=='전체'){
				$("#qnaTab > table > tbody > tr").show();		 		
		 	}else {
		 		var temp = $("#qnaTab  table  tbody tr td:nth-child(2):contains('" + selected  + "')");
		 		$(temp).parent().show();	
		 	}
	 	}); 
 	}
	
 	//검색(수정 이거 백에서 해야해)******************************************************************************수정
 	function searchSelect() {
 		$('#searchDesk').mouseover(function(){
 			console.log('123');
	 		var searchSelect = $('#searchSelect').val();
	 		var searchText = $("#searchText").val();
	 		$('#searchBtn').click(function(){
	 			if(searchSelect=="제목"){
	 				var subSearch = $("#qnaTab  table  tbody tr td:nth-child(3):contains('" + searchText  + "')");
			 		$(subSearch).parent().show();
	 			}/* else if(searchSelect=="내용"){
	 				var contentSearch = $("#qna-tab  table  tbody tr td:nth-child(2):contains('" + searchText  + "')");
			 		$(contentSearch).parent().show();
	 			} */else if(searchSelect=="글쓴이"){
	 				$("#qnaTab > table > tbody > tr").hide();
	 				console.log('456');
	 				var contentSearch = $("#qnaTab  table  tbody tr td:nth-child(4):contains('" + searchText  + "')");
			 		$(contentSearch).parent().show();
	 			}
	 		});
 			
 		});
 	}


 	//창크기 514px보다 작아졌을 때 폰트크기 고정(테이블 안부셔지게)
 	$(window).resize(function() {
        resized2();
    });
    function resized2() {
        var windowWidth = $(window).width();       	
            if(windowWidth < 540) {
            	$('#qnaTab').css('font-size','12px');
            }else{
            	$('#qnaTab').css('font-size','14px');
            	
            }
    }
 	</script>
</head>
<body>
    <!-- ***********************************header start*********************************** -->
	<jsp:include page="/resources/template/header.jsp"/>
   <!-- ***********************************content start*********************************** -->
	<div class="container-fluid text-center">
	    <div class="row">
	    	<div class="col-md-offset-1 col-md-10">
		    	<div class="col-md-12 col-sm-12 col-xs-12">
					<br /><br />
					<div id="pgnameWrap">
						<h3>Q&A</h3>
					</div>
					<br />
				</div>
				<div id="qnaNotice" class="col-md-12 col-sm-12 col-xs-12">
				<div id="subBack">안내 및 유의사항</div>
				* 주문 후 배송전/후 상품추가 및 타상품교환은 불가합니다.<br /> 
				* 추가,변경(교환)을 원하신다면 취소/반품후 새주문서 작성 부탁드립니다.<br /> 
				* 결제완료 순으로 배송되며, 세일로 결제가 늦어질 경우 조기품절이 될 수 있습니다.<br /> 
				<br /> 
				* 기본배송기간 : 1일~3일<br /> 
				* 이벤트(세일)기간 내 주문의 경우에는 기본배송일 이상 소요되며, 이벤트 종료 이후 순차 배송됩니다.<br />
				<br /><br /> 
				</div>
				<div id="categoryWrap" class="col-md-12 col-sm-12 col-xs-12 text-right">
					<select id="category" class="selectpicker"> 
						<option>전체</option> 
						<option>상품문의</option> 
						<option>배송문의</option> 
						<option>취소/변경문의</option> 
						<option>교환/반품문의</option> 
						<option>기타문의</option> 
					</select>
				</div>
				<div id="qnaTab" class="col-md-12 col-sm-12 col-xs-12">
					<br />
					<table class="table text-center">
						<thead>
							<tr>
								<th scope="col">No</th>
								<th scope="col">Category</th>
								<th scope="col">Subject</th>
								<th scope="col">Writer</th>
								<th scope="col">Date</th>
								<th scope="col">answer</th>
								<th><input type="checkbox" id="delCheckAll" class="custom-control-input"></th>
							</tr>
						</thead> 
						<tbody>
							<c:forEach items="${qnaList}" var="qnaList">
				                <tr>
				                    <td>${qnaList.qnaNum}</td>
				                    <td>${qnaList.qnaKind}</td>
				                    <td>${qnaList.qnaSub}</td>
				                    <td>${qnaList.userName}</td>
				                    <td>${qnaList.qnaDate}</td>
				                    <td>${qnaList.qnaStatus}</td>
				                    <td><input type="checkbox" name="deleteCheck" class="custom-control-input"></td>
				                </tr>
				       		</c:forEach>
<!-- 							<tr> -->
<!-- 								<td>4</td> -->
<!-- 								<td>취소/변경문의</td> -->
<!-- 								<td class="text-left"> -->
<!-- 									<a id="contentPw">전화드렸는데 빨리 취소해주세요 -->
<!-- 										<img class="lock" src="/resources/icon/lock.png"/> -->
<!-- 									</a> -->
<!-- 								</td> -->
<!-- 								<td>김**</td> -->
<!-- 								<td>2019-05-06</td> -->
<!-- 								<td>미답변</td> -->
<!-- 								<td><input type="checkbox" name="deleteCheck" class="custom-control-input"></td> -->
<!-- 							</tr> -->
<!-- 							<tr> -->
<!-- 								<td>3</td> -->
<!-- 								<td>기타문의</td> -->
<!-- 								<td class="text-left">알러지가 있어서 그런데 새우만 빼...<img class="lock" src="/resources/icon/lock.png"/></td> -->
<!-- 								<td>손**</td> -->
<!-- 								<td>2019-05-06</td> -->
<!-- 								<td>미답변</td> -->
<!-- 								<td><input type="checkbox" name="deleteCheck" class="custom-control-input"></td> -->
<!-- 							</tr> -->
<!-- 							<tr> -->
<!-- 								<td>2</td> -->
<!-- 								<td>배송문의</td> -->
<!-- 								<td class="text-left">최대한 빨리 배송하면 얼마나 걸리...<img class="lock" src="/resources/icon/lock.png"/></td> -->
<!-- 								<td>박**</td> -->
<!-- 								<td>2019-05-06</td> -->
<!-- 								<td>답변</td> -->
<!-- 								<td><input type="checkbox" name="deleteCheck" class="custom-control-input"></td> -->
<!-- 							</tr> -->
<!-- 							<tr> -->
<!-- 								<td>1</td> -->
<!-- 								<td>교환/반품문의</td> -->
<!-- 								<td class="text-left">커스텀 샐러드가 잘못왔어요<img class="lock" src="/resources/icon/lock.png"/></td> -->
<!-- 								<td>임**</td> -->
<!-- 								<td>2019-05-06</td> -->
<!-- 								<td>답변</td> -->
<!-- 								<td><input type="checkbox" name="deleteCheck" class="custom-control-input"></td> -->
<!-- 							</tr> -->
						</tbody>
					</table>
					</div>
						<div class="col-md-12 col-sm-12 col-xs-12 text-right">
							<a id="deleteBtn" class="btn btn-default">삭제</a>
							<a href="qna.insert" class="btn btn-default">글작성</a>
						</div>
						<div id="searchDesk" class="col-md-offset-4 col-sm-offset-4 col-xs-offset-4 col-md-4 col-sm-4 col-xs-4">
						<div class="col-sm-4">
						<select id="searchSelect" class="form-control"> 
						<option>제목</option> 
						<option>내용</option> 
						<option>글쓴이</option> 
						</select>
						</div>
						<div class="input-group col-sm-8">
						  <input id="searchText" type="text" class="form-control col-sm-8">
						  <span class="input-group-btn">
						    <button id="searchBtn" class="btn btn-secondary" type="button">검색</button>
						  </span>
						</div>
						</div>
				<div class="col-md-12 col-sm-12 col-xs-12"> 
					<ul id="pgBtn" class="pagination">
						<li id="pgBack"><a href="#"></a></li>
						<li><a href="#">1</a></li>
						<li><a href="#">2</a></li>
						<li><a href="#">3</a></li>
						<li><a href="#">4</a></li>
						<li><a href="#">5</a></li>
						<li id="pgForth"><a href="#">></a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
   <!-- 삭제 Modal confirm -->
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
	<!-- ----------------------------------------------------------------------------------- -->
	<!-- qna 비밀번호 Modal confirm -->
	<div class="modal" id="pwconfirmModal" style="display:none; z-index: 1050;">
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <div class="modal-body text-center" id="confirmMessage">
	            <br />
	            <p>이 글은 비밀글입니다.</p> 
	            <p>비밀번호를 입력하여 주세요.</p>
				<p>관리자는 확인버튼만 누르시면 됩니다.</p>
				<br />
	            <label for="pwQna">password</label>&nbsp;&nbsp;&nbsp;<input type="text" id="pwQna" name="pwQna">
	            </div>
	            <br />
	            <div class="modal-footer">
	                <button type="button" class="btn btn-default" id="pwconfirmOk">확인</button>
	                <button type="button" class="btn btn-default" id="pwconfirmCancel">취소</button>
	            </div>
	        </div>
	    </div>
	</div>
    <!-- ***********************************content end*********************************** -->
    <!-- ***********************************footer*********************************** -->
    <jsp:include page="/resources/template/footer.jsp"/>
</body></html>
				