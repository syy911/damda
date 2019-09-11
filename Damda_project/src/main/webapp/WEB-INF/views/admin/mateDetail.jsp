<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
   <!-- 관리자만 접근가능한 페이지 공지사항 등록 & 수정 페이지 -->
    <meta charset="UTF-8">
    <jsp:include page="/resources/template/head.jsp"/>
    <style type="text/css">
    input,#contentNotice {
    border:0px;
    width: 100%;
    resize: none;
    }
    #pgnameWrap {
    height: 45px;
    width:200px;
    margin: 0 auto;
    }
    #pgnameWrap h3 {
    margin: 0px;
    padding: 7px;
    }
     
    .btn-file {
    position: relative;
    overflow: hidden;
    margin-left:25px;
	}
	
	.btn-file input[type=file] {
	    position: absolute;
	    top: 0;
	    right: 0;
	    min-width: 100%;
	    min-height: 100%;
	    font-size:100px;
	 	font-size: 100px;
	    text-align: right;
	    filter: alpha(opacity=0);
	    opacity: 0;
	    outline: none;
	    background: white;
	    cursor: inherit;
	    display: block;   
	 }
	thead tr:nth-child(1)>th{
		vertiacl-align: middle;
		line-height:180px;
	} 
	tbody tr:nth-child(2)>th{
		text-align:center;
		
	}
	
    </style>
    <script type="text/javascript">
    $(document).ready(function(){
       $('select').hide();
       $('#vegeSelect').hide();
       $('#toppingSelect').hide();
       resized2();
      
       //들어오는 세션따라 보이는 부분다르게(관리자 // USER)
       //들어오는 주소따라 등록버튼 동작 다름(백...?)
       //수정-등록 & 입력-등록
       //비동기로 입력,등록하고 성공하면 페이지 이동
       /*
       var url = window.location.pathname;
       var location = url.substring(url.lastIndexOf("/")+1);
       if(location=='notice.insert'){
            // location.replace('/notice');  
             console.log(location);
             $( 'input' ).removeAttr( 'value' );   
             $('#contentNotice').val('');
       }else if(location=='notice.update'){
          console.log(location);
          $( 'input' ).removeAttr( 'placeholder' );
       }
       */
      $('select').hide();
      
    });
    $(window).resize(function() {
        resized2();
    });
function resized2() {
        var windowWidth = $(window).width();
            if(windowWidth < 540) {
               console.log('why');
               $('#noticeTab .form-group').css('width','250px');
               
            }else{    
               $('#noticeTab .form-group').css('width','35%');
            }
    }
	$(function(){
	 //관리자 수정버튼
    $('#resetbtn,#submitbtn').hide();
    $('#editbtn').click(function(){
  	 	$('#editbtn,#deletebtn,#backbtn').hide();//수정삭제돌아가기hide
  		$('#resetbtn,#submitbtn').show();//등록취소show
  		$('#mateprice, #mateName').removeAttr('readonly');
  		 $('#customStatus, #customSelect').show();
         $('#vegeSelect').hide();
         $('#toppingSelect').hide();
         $('#matectg,#matestatus').hide();
        });
    $('#deletebtn').click(function(){
    	$('#myModal').on('shown.bs.modal', function () {
    		  $('#myInput').focus()
    		})
        });
})
function ctgChange(e){
	if(e.value=="1"){//vege
		$('#vegeSelect').show();
		$('#toppingSelect').hide();
		$('#vegeSelect').removeAttr("name").attr({name : "matectg"});
	}
	if(e.value=="2"){//topping
		$('#vegeSelect').hide();
		$('#toppingSelect').show();
		$('#toppingSelect').removeAttr("name").attr({name : "matectg"});
	}
	if(e.value=="3"){//sauce
		$('#customSelect').removeAttr("name").attr({name : "matectg"});
		$('#vegeSelect').hide();
		$('#toppingSelect').hide();
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
       <div class="col-md-offset-2 col-md-8">
         <form id="mateEdit"  method="post">
         <input type="hidden" name="method" value="put" id="method"/>
          <div class="col-md-12 col-sm-12 col-xs-12">
            <br /><br />
            <div id="pgnameWrap">
               <h3>커스텀 재료 등록</h3>
            </div>
            <br />
         </div>
        
         
         <div id="noticeTab" class="col-md-12 col-sm-12 col-xs-12">
            <br /><br />
            <table class="table text-left table-bordered">
            <thead>   
               <tr>
                  <th class="col-md-2 col-sm-2 col-xs-3">재료이미지</th>
                  <td class="col-md-10 col-sm-10 col-xs-9 InputImg">                  
					  <div class="file-field ImgField">
					    <!-- 썸네일 -->
					    <div class="mateThumb">
					    <!-- <p id="dd"">${mateone }</p>-->
					      <img class="inputImg" id="thImg" src="${mateone[0].photoPath }"/>
					    </div>					    
					    <div class="d-flex justify-content-center ImgBtn">
					      <span class="btn btn-default btn-file">
							   썸네일 이미지 찾기 <input type="hidden" class="img" id="mateImgth" name="file" />
							   <script>
							   $('#mateImgth').change(function(){
								   if(this.files && this.files[0]){
									   var reader = new FileReader;
									   reader.onload = function(data){
										   $('#thImg').attr("src",data.target.result);
										   $('#thImg').show();
										   }
									   reader.readAsDataURL(this.files[0]);
									   }
								   });	
							   </script>
							</span>
					    </div>    
					  </div>				
                  </td>
               </tr>
               <tr>
                  <th>재료번호</th>
                  <td>
                  	 <input type="text" id="matenum" name="matenum" value="${mateone[0].matenum }" readonly="readonly">
                  </td>
               </tr>
               <tr>
                  <th>재료명</th>
                  <td>
                  	 <input type="text" id="mateName" name="mateName" value="${mateone[0].mateName }" readonly="readonly">
                  </td>
               </tr>
               <tr>
                  <th>재료가격</th>
                  <td>
                   <input type="text" id="mateprice" name="mateprice" value="${mateone[0].mateprice }" readonly="readonly">
                   </td>
               </tr>
               <tr>
               		<th>재료 카테고리</th>
               		<td >
						<p id="matectg">               		
               			<c:set target="${mateone[0]}" property="matectg" var="ctg" value="${mateone[0].matectg }" />
									<c:choose>
									    <c:when test="${ctg eq '1-1'}">
											<c:out value="야채-씁쓸한 맛" />
										</c:when>
										<c:when test="${ctg eq '1-2'}">
											<c:out value="야채-아삭한 맛" />
										</c:when>
										<c:when test="${ctg eq '1-3'}">
											<c:out value="야채-순한 맛" />
										</c:when>
										<c:when test="${ctg eq '1-4'}">
											<c:out value="야채-매운 맛" />
										</c:when>
										<c:when test="${ctg eq '2-1'}">
											<c:out value="토핑-고기/햄/생선" />
										</c:when>
										<c:when test="${ctg eq '2-2'}">
											<c:out value="토핑-과일/치즈" />
										</c:when>
										<c:when test="${ctg eq '3'}">
											<c:out value="소스" />
										</c:when>
									</c:choose>
            				</p>
	               			<select name="customSelect" id="customSelect" onchange="ctgChange(this)">
						    	<option value="0">카테고리를 선택해주세요</option>
						    	<option name="1" value="1">야채</option>
						    	<option name="2" value="2">토핑</option>
						    	<option name="3" value="3">소스</option>
							</select>
							<select name="vegeSelect" id="vegeSelect">
								<option value="1-1">씁쓸한 맛</option>
								<option value="1-2">아삭한 맛</option>
								<option value="1-3">순한 맛</option>
								<option value="1-4">매운 맛</option>
							</select>
							<select name="toppingSelect" id="toppingSelect">
								<option value="2-1">고기/햄/생선</option>
								<option value="2-2">과일/치즈</option>
							</select>
					
               		</td>
               </tr>
               <tr>
               		<th>판매 상태</th>
               		<td ><p id="matestatus">
               			<c:set target="${mateone[0]}" property="salestatus" var="status" value="${mateone[0].salestatus}" />
									<c:choose>
									    <c:when test="${status eq 0}">
											<c:out value="판매중단" />
										</c:when>
										<c:when test="${status eq 1}">
											<c:out value="판매중" />
										</c:when>
									</c:choose>
               			</p>
               			<select name="customStatus" id="customStatus">
               				<option value="0">판매중단</option>
               				<option value="1">판매중</option>
               			</select>
               		</td>
               </tr>
               <tr>
               		<th>디텔</th>
					<td>
               		<div class="file-field ImgField">
					    <!-- 디테일 -->
					    <div class="mateDetail">
					      <img class="inputImg" id="deImg" src="${mateone[1].photoPath }"/>
					    </div>
					    <div class="d-flex justify-content-center ImgBtn">
					      <span class="btn btn-default btn-file">
							   디테일 이미지찾기 <input type="hidden" class="img" id="mateImgde" name="file2" />
							   <script>
							   $('#mateImgde').change(function(){
								   if(this.files && this.files[0]){
									   var reader = new FileReader;
									   reader.onload = function(data){
										   $('#deImg').attr("src",data.target.result);
										   $('#deImg').show();
										   }
									   reader.readAsDataURL(this.files[0]);
									   }
								   });	
							   </script>
							</span>
					    </div>    
					  </div>
					 </td>				
               </tr>        
            </thead>
         </table>
         </div>
         <!--- 페이지 따라 버튼동작 다름 --------------------------------------------------------------------------------------->
         <div class="col-md-12 col-sm-12 col-xs-12 text-right">
            <button type="button" onclick="editbtn" id="editbtn" class="btn btn-default">수정</button>
            <button type="button" id="backbtn" onclick="location.href='/admin/'" class="btn btn-default">목록으로</button>
         	<button type="button" class="btn btn-default" data-toggle="modal" data-target="#myModal" id="deletebtn">삭제</button>     	
         	<button type="submit" id="submitbtn" class="btn btn-default">등록</button>
         	<button type="reset"  id="resetbtn" class="btn btn-default">취소</button>
         </div>
         <!--------------------------------------------------------------------------------------------------------------------->
      
      </div>
   </div>
   </div>
    <!-- ***********************************content end*********************************** -->
    <!-- ***********************************footer*********************************** -->
    	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalLabel">게시글 삭제</h4>
		      </div>
		      <div class="modal-body">
		       	삭제하시겠습니까?
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
		        <button type="button" onclick="location.href='/admin/delete/${mateone[0].matenum }'"class="btn btn-primary">확인</button>
		      </div>
		    </div>
		  </div>
		</div>
	</form>
    <jsp:include page="/resources/template/footer.jsp"/>
</body></html>