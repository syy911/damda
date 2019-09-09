<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="/resources/template/head.jsp"/>
<script type="text/javascript">
$(document).ready(function() {
	console.log(" >>>> d_list.jsp start");
	reviewCon_sub();
	table_content();
});

//리뷰 테이블 클릭이벤트
function table_content() {
    $("tbody tr").click(function() {
        $(this).parents(".custom-table").find(".toggler1").removeClass("toggler1");
        $(this).parents("tbody").find(".toggler").addClass("toggler1");
        $(this).parents(".custom-table").find(".fa-minus-circle").removeClass("fa-minus-circle");
        $(this).parents("tbody").find(".fa-plus-circle").addClass("fa-minus-circle");
    });
}

//review content -> sub 출력해오기
function reviewCon_sub() {
    var length = $('tbody').length + 1;

    for (var i = 1; i < length; i++) {
        var p_class = ".tbody_p" + i;
        var p_id = $(p_class).attr('id');
        var p = '#' + p_id;
        var td = '.' + p_id;
        var p_val = $(p).text().trim();
        if(p_val.length>15){
        	p_val = p_val.substring(0, 15) + '...';
        }
        $(td).text(p_val);
    }
}

//페이징 이벤트
function onClickPage(page) {
	 //hidden val
    var no = $('#reviewalign').val();
    console.log(" >>> reviewalign : " + reviewalign);
    var no = $('#no').val();
    console.log(" >>> no : " + no);
    
   //select val
   var select_val = $('.reviewalign').val();
   console.log('select value: '+select_val);
   var url = window.location.href;
   console.log('url: ' + url);
   var length = url.length;
   console.log('url length: ' + length);
   var url_substring = '';
   if (length == 38) {
       url_substring = url.substring(length - 17, length);
   } else if (length == 39) {
       url_substring = url.substring(length - 18, length);
   } else if (length == 40) {
       url_substring = url.substring(length - 19, length);
   } else if (length == 41) {
       url_substring = url.substring(length - 20, length);
   }
   console.log(url_substring);
   $.ajax({
		url:url_substring+"&align="+reviewalign,
		type:'get',
		data:"",
		success: function(data){
        	console.log('success');
        	$('#review_div').load('/item/review?no='+no+'&align='+select_val+'&p='+page); 
        }
	});
}

</script>
</head>
<body>
	    <table class="table custom-table">
	        <thead>
	            <tr>
	                <th>번호</th>
	                <th>제목</th>
	                <th>작성자</th>
	                <th>작성일</th>
	                <th colspan="2">좋아요</th>
	                <!-- <th>　</th> -->
	            </tr>
	        </thead>
	        
	        <c:forEach items="${reviewList}" var="reviewList" varStatus="status">
                <c:set var="photoPath" value="${reviewList.photoPath }"/>
		        <tbody>
		            <tr>
		                <td>${status.count }</td>
		                <td class="${reviewList.reviewNum }">제목 </td>
		                <td>${reviewList.userName }</td>
		                <td>${reviewList.date }</td>
		                <td>${reviewList.recommend }</td>
		                <td><a href="#">♡</a></td>
		            </tr>
		            <tr class="toggler">
		                <td colspan='6'>
		                <c:if test="${not empty photoPath}">
		                    <img src="${photoPath }" />
		                </c:if>
		                    <p id="${reviewList.reviewNum }" class="tbody_p${status.count }">
		                       	 ${reviewList.reviewCon }
		                    </p>
		                </td>
		            </tr>
		        </tbody>
	        </c:forEach>	
	    </table>
	    
	    
	    
	    <div class="col-md-offset-4 col-md-5 col-sm-offset-4 col-sm-5 col-xs-offset-2 col-xs-8">
	        <ul class="pagination">
		        <li><a onclick = "onClickPage(0);" aria-label="Previous">&laquo;</a></li>
		        
		        <!-- 현재 페이지가 0보다 작아질 경우 이전 버튼을 disabled하는 조건문 -->
		        <c:choose>
		        <c:when test="${p <= 0 }">
		        <li class="disabled"><a href="#">‹</a></li>
		        </c:when>
		        <c:otherwise>
		        <li><a onclick = "onClickPage(${p-1 });">‹</a></li>	        
		        </c:otherwise>
		        </c:choose>
		        
		        <!-- 해당하는 페이지로 갈 수 있는 버튼 -->
		        <c:forEach var="i" begin="0" end="${totalpage}">
		        <li><a onclick = "onClickPage(${i });">${i+1 }</a></li>
		        </c:forEach>
		        
		        <!-- 현재 페이지가 totalpage보다 커질 경우 다음 버튼을 disabled하는 조건문 -->
		        <c:choose>
		        <c:when test="${p >= totalpage }">
		        <li class="disabled"><a href="#">›</a></li>
		        </c:when>
		        <c:otherwise>
		        <li><a onclick = "onClickPage(${p+1 });">›</a></li>
		        </c:otherwise>
		        </c:choose>
		        
		        <li><a onclick = "onClickPage(${totalpage });" aria-label="Next">&raquo;</a></li>
		    </ul>
	    </div>
</body>
</html>