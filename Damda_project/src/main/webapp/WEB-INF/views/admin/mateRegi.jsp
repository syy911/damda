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
    #noticeTab img {
    width: 13px;
    height: 15px;
    }
    #noticeTab tbody textarea {
    margin-top: 2%; 
    margin-bottom: 2%;
    }
    #noticeTab .form-group {
    width: 35%;
    height: 5px;
    margin-top: -7px;
    }
    #noticeTab #userfile {
    cursor: default;
    }
    #pgTransition img {
    width: 12px; 
    height: 8px;
    }
    #pgTransition a {
    color: rgb(0,0,0);
    }
    
    .itemThumb{
    background-color:gray;
    height:150px;
    width:150px;
    margin-bottom:10px;
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
       $('#vegeSelect').hide();
       $('#toppingSelect').hide();
       
       resized2();
       //들어오는 세션따라 보이는 부분다르게(관리자 // USER)
       //들어오는 주소따라 등록버튼 동작 다름(백...?)
       //수정-등록 & 입력-등록
       //비동기로 입력,등록하고 성공하면 페이지 이동
       var url = window.location.pathname;
       var location = url.substring(url.lastIndexOf("/")+1);
       if(location=='notice.insert'){
             /* location.replace('/notice');  */
             console.log(location);
             $( 'input' ).removeAttr( 'value' );   
             $('#contentNotice').val('');
       }else if(location=='notice.update'){
          console.log(location);
          $( 'input' ).removeAttr( 'placeholder' );
       }

       $('#cancleBtn').click(function(){
          window.location.replace('/admin/'); 
       });
       
       //첨부파일 이름 추출
       $("#fileInput").on('change', function(){  // 값이 변경되면
      if(window.FileReader){  // modern browser
         var filename = $(this)[0].files[0].name;
      } else {  // old IE
         var filename = $(this).val().split('/').pop().split('\\').pop();  // 파일명만 추출
      }
      // 추출한 파일명 삽입
      $("#userfile").val(filename);
   });
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
          <form id="eventINPUT" action="/admin/" method="post">
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
                  <td class="col-md-10 col-sm-10 col-xs-9">
                  
					  <div class="file-field">
					    <div class="itemThumb">
					      <img src="" />
					    </div>
					    <div class="d-flex justify-content-center">
					      <span class="btn btn-default btn-file">
							    이미지 찾기 <input type="file" id="gdsIms" name="file" />
							</span>
					    </div>
					  </div>
				
                  </td>
               </tr>
               <tr>
                  <th>재료명</th>
                  <td>
                  	 <input type="text" id="mateName" name="mateName" value="" placeholder="상품명을 입력해주세요">
                  </td>
               </tr>
               <tr>
                  <th>재료가격</th>
                  <td>
                   <input type="text" id="mateprice" name="mateprice" value="" placeholder="가격" >
                   </td>
               </tr>
               <tr>
               		<th>재료 카테고리</th>
               		<td><!--select name=option value-->
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
               		<td>
               			<select name="customStatus" id="customStatus">
               				<option value="0">판매중단</option>
               				<option value="1">판매중</option>
               			</select>
               		</td>
               </tr>               
            </thead>
         </table>
         </div>
         <div class="col-md-12 col-sm-12 col-xs-12 text-right">
            <button type="submit" id="okBtn" class="btn btn-default">등록</button>
            <button type="reset" id="cancleBtn" class="btn btn-default">취소</button>
         </div>
         </form>
      </div>
   </div>
   </div>
    <!-- ***********************************content end*********************************** -->
    <!-- ***********************************footer*********************************** -->
    <jsp:include page="/resources/template/footer.jsp"/>
</body></html>