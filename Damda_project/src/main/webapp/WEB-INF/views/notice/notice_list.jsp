<%@page import="java.io.Console"%>
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
 	#noticePic {
	 	max-width: 100%;
	 	height: auto;
 	}
 	#noticeTab th {
 		text-align: center;
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
						<h3>공지사항</h3>
					</div>
					<br />
				</div>
				<div class="col-md-12 col-sm-12 col-xs-12">
					<img id="noticePic" src="/resources/imgs/notice.png" alt="notice_pic">
				</div>
				<div id="noticeTab" class="col-md-12 col-sm-12 col-xs-12">
					<br /><br />
					<table class="table text-center" id="noticetable">
						<thead>
							<tr>
								<th scope="col">No</th>
								<th scope="col" style="display:none;">NoSeq</th>
								<th scope="col">Subject</th>
								<th scope="col">Writer</th>
								<th scope="col">Date</th>
								<th scope="col">view</th>
								<th><input type="checkbox" id="delCheckAll" class="custom-control-input"></th>
							</tr>
						</thead> 
						<tbody>
							<c:forEach items="${map.noticeList }" var="noticeList">
								<tr>
									<td>${noticeList.bbsnum }</td>
									<td style="display:none;">${noticeList.bbsseq }</td>
									<td class="text-left"><a href="detail/${noticeList.bbsnum}">${noticeList.bbssub }</a></td>
									<td>${noticeList.bbswriter }</td>
									<td>${noticeList.bbsdate }</td>
									<td>${noticeList.bbsview }</td>
									<td><input type="checkbox" name="deleteCheck" class="custom-control-input"></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					</div>
					<%if(session.getAttribute("user_ctg")!=null){
						int user_ctg = (int)session.getAttribute("user_ctg");
						if(user_ctg == 0 || user_ctg == 1) {
					%>
					<div class="col-md-12 col-sm-12 col-xs-12 text-right">
						<a id="deleteBtn" class="btn btn-default">삭 제</a>
						<a href="insert" class="btn btn-default">글작성</a>
					</div>
					<% }
					}%>
				<!-- 페이징 시작 -->
				<div class="col-md-12 col-sm-12 col-xs-12"> 
				  <nav aria-label="Page navigation">
					<ul class="pagination">
					  <c:if test="${map.noticePager.curPage > 1}">
					  	<li><a href="javascript:list('${map.noticePager.curPage - 1 }')" aria-label="Previous">〈</a></li>
					  </c:if>
					  <c:forEach var="num" begin="${map.noticePager.blockBegin }" end="${map.noticePager.blockEnd}">
				  		<c:choose>
				  		  <c:when test="${num == map.noticePager.curPage }">
							<li><span>${num}</span></li>
				  		  </c:when>
				  		  <c:otherwise>
				  			<li><a href="javascript:list('${num }')">${num}</a></li>
				  		  </c:otherwise>
					  	</c:choose>
					  </c:forEach>
					  <c:if test="${map.noticePager.curPage < map.noticePager.totPage}">
					  	<li><a href="javascript:list('${map.noticePager.curPage + 1 }')" aria-label="Previous">〉</a></li>
					  </c:if>
				    </ul>
			      </nav>
				</div>
			  <!-- 페이징 끝 -->
			</div>
		</div>
	</div>
	<br/><br/>
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
</body>
<script type="text/javascript">
 	$(document).ready(function(){
 		resized2();
 		//관리자계정으로들어왔을 때(같은 jsp&다른 주소)
 		//세션잡아서 json으로 만들어서 ajax로 보내서 세션따라 보여줄요소 결정(삭제버튼,체크상자)
 		
 		//user view
		var lastTh = $('table thead tr th:nth-child(7)');
		var lastTd = $('table tbody tr td:nth-child(7)');
		lastTh.hide();
		lastTd.hide();

 		//admin view
 		var user_ctg = "<%=session.getAttribute("user_ctg") %>";
		if(user_ctg == 0 || user_ctg == 1){
			lastTh.show();
 			lastTd.show();
		}
		
		//글 삭제시 전체 선택&해제(관리자)
 		$('#delCheckAll').click( function() {
 	    	$( 'table tbody tr td:last-child [name=deleteCheck]' ).prop( 'checked', this.checked );
 	     });
 		
 		//전체삭제&삭제 버튼 클릭
 		$('#deleteBtn').click(function(){
	  	    var myModal = $("#confirmModal");
	  		myModal.modal("show").css('top', '35%');
	  	    $("#confirmOk").click(function(){
	  	    	var checkArr = new Array();
	  	    	var checkbox = $("input[name=deleteCheck]:checked");
	  	    	//체크된 체크박스의 값을 반복해 불러와 배열에 넣음
	  	    	checkbox.each(function(i){
		  	    	var tr=checkbox.parent().parent().eq(i);
					var td=tr.children();
					bbsseq=td.eq(1).text();
					checkArr.push(bbsseq);
		  	    });
			  	    
		  	    $.ajax({
					url:"/notice/delete",
					type:"POST",
					dataType: "text",
					traditional : true,
					data:{"delSeqNo" :checkArr},
					success : function(result){
						var checkbox = $("input[name=deleteCheck]:checked");
						var tr=checkbox.parent().parent();
						tr.remove();
					},
					error:function(request,status,error){
					    //alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
				});
	
		  	  	myModal.modal("hide");
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
			$('#pgBack').css('display','block');
	 	}
	 	if(lastNum == '1'){
	 		$('#pgForth').css('display','none');
	 	}
 		
 	});//document.ready function end************************************************************** 	
 	/*************************************************************/
 	function list(page){
		location.href = "${path}/notice/?curPage="+page;
 	}
 	/*************************************************************/
 	//창크기 514px보다 작아졌을 때 폰트크기 고정(테이블 안부셔지게)
 	$(window).resize(function() {
        resized2();
    });
    function resized2() {
        var windowWidth = $(window).width();
            if(windowWidth < 540) {
            	$('#noticeTab').css('font-size','12px');
            }else{
            	$('#noticeTab').css('font-size','14px');
            }
    }
</script>
</html>
				