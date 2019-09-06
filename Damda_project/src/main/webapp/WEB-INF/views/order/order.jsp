<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
   <meta charset="UTF-8">
   <jsp:include page="/resources/template/head.jsp"/>
    <style type="text/css">
        #content .table_div h2 {
            display: block;
            margin: 30px auto 10px auto;
            width: 120px;
        }
        
        #content .table_div h2+p {
            font-size: 11px;
            margin: 10px auto 50px auto;
            display: block;
            width: 180px;
        }
        

        #content .table_div h2+p+p {
            font-size: 14px;
            text-align:center;
            margin: 30px auto 20px auto;
            display: block;
        }

        #content table {
            font-size: 12px;
        }

        #content table tr th {
            text-align: center;
            border-top: 2px solid darksalmon;
            border-bottom: 1px;
        }

        #content table .info_td strong {
            position: relative;
            top: 75px;
            font-size: 15px;
        }

        #content table .info_td p {
            font-size: 13px;
        }

        #content table .info_td p,
        #content table .price_td p {
            position: relative;
        }

        #content table .price_td p {
            font-size: 15px;
        }

        #content table .ed_td button {
            position: relative;
        }

        #content table .delete_td img {
            position: relative;
            width: 40px;
            cursor: pointer;
        }

        #content table .ea_td div {
            width: 77px;
            display: block;
            margin: 0px auto;
        }

        #content table .total_price {
            font-size: 15px;
            text-align: right;
        }


        /*전체선택*/
        #content table tr th:nth-child(1) {
            width: 5%;
        }

        /*상품정보*/
        #content table tr th:nth-child(2) {
            width: 45%;
        }

        /*수량*/
        #content table tr th:nth-child(3) {
            width: 18%;
        }

        /*상품금액*/
        #content table tr th:nth-child(4) {
            width: 27%;
        }

        /*삭제*/
        #content table tr th:nth-child(5) {
            width: 5%;
        }



        /*이미지 칸*/
        #content table .img_td {
            width: 15%;
        }

        /*이미지칸 이미지*/
        #content table .cartimg {
            width: 100%;
        }


        #content table .info_td {
            text-align: left;
        }

        #content table .checkbox_td,
        #content table .ea_td,
        #content table .price_td {
            text-align: center;
        }

        #content table tbody tr:last-child {
            border-bottom: 2px solid darksalmon;
        }
        #content .btn_div {
            margin-bottom: 150px;
            text-align:center;
            
        }

        #content .btn_div div {
            display: inline-block;
            width: 5%;
            text-align: center;
            position: relative;
            top: 10px;
        }

        #content .btn_div p {
            display: inline-block;
            margin-right: 10px;
        }

        #content .btn_div button {
            border-radius: 0px;
            background-color: darksalmon;
            color: white;
        }

        #content .btn_div button:hover {
            background-color: darksalmon;
            color: white;
        }

        #content .btn_div input[type="submit"] {
            border-radius: 0px;
            background-color: darksalmon;
            color: white;
            float: right;
        }

        #content .btn_div input[type="submit"]:hover {
            font-weight: bold;
            border: 2px solid darksalmon;
        }
    </style>
   <script type="text/javascript">
   //날짜 기본값 오늘로 세팅
   	var today = new Date().toISOString().substring(0, 10);
   	
   	$(document).ready(function() {
   		$('#deliveDate').val(today);
   		$('#selectDel').show();
		$('#selectPick').hide();
   		$("input:radio[name=deliverOpt]").click(function(){
	   		if($('input[name=deliverOpt]:checked').val()=="1"){
	   			$('h3').text('배송지 입력');
	   			$('#selectDel').show();
				$('#selectPick').hide();
	   	   	}else if($('input[name=deliverOpt]:checked').val()=="0"){
		   	   	$('h3').text('수령점포 선택');
				$('#selectDel').hide();
				$('#selectPick').show();
	   	   	}
   		});
   	   	
   	});
   </script>
   
   <style type="text/css">
   .order-form h2{
   		margin-bottom:40px;
   }
   
	h1 {
		text-align:center;
  		margin: 0px auto;
		
	}
	
	.line{
		width: auto;
		height: 0px;
		border-bottom: 1px solid black;
		
	}
	
	
	.orderPic{
		width:100%;
		height:100%;
	}
	
	.tab { white-space: pre; }
	.basicInfo {font-weight:bold;}
	.priceAlign{text-align:right;}
	
	.listMore{
		display:inline-block;
		text-align:center;
		width:100%;
		height:20px;
		background-color: darksalmon;
        color: white;
        margin-bottom:50px;
	}
	
	.selectDel{
		display:inline-block;
		text-align:center;
		
		margin-top:30px;
		margin-bottom:20px;
		padding:10px 0px 10px 0px;
		border-radius: 5px;
		border:1px solid darksalmon;
		
	}
	
	.selectCharge{
		display:inline-block;
		text-align:center;
	}
	
	.selectAddr{
		display:inline-block;
		text-align:center;
	}
	
	.contentBox{
		display:inline-block;
		padding:20px 10px 20px 10px;
		width:100%;
		height: 100%;
	}
	
	.deliver-form{
		border-top: 2px solid darksalmon;
        border-bottom: 2px solid darksalmon;
        margin-bottom:150px;
	}
	
   </style>
    
</head>

<body>
   <jsp:include page="/resources/template/header.jsp"/>

    <!-- ***********************************content start*********************************** -->
    
      
        	<div class="container-fluid col-md-8 col-md-offset-2 order-form">
        	<br/>
        	<h1>주문하기</h1>
			<h2>내역</h2>
			<!-- 상품정보 출력 -->
		               <table class="table">
				        <thead>
				            <tr>
				            	<th></th>
				                <th colspan="2">상품정보</th>
				                <th>수량</th>
				                <th>상품금액</th>
				                <th></th>
				            </tr>
				        </thead>
				        <tbody>
				            <tr>
				                <td class="img_td">
				                    <img alt="cartimg" src="/resources/imgs/s01.jpg" class="cartimg" />
				                </td>
				                <td colspan="2" class="info_td">
				                    <strong>상품이름</strong>
				                    <p>상품 옵션/선택정보</p>
				                </td>
				               <td class="price_td">
				              	 <p>1</p>
				               </td>
				                <td class="price_td">
				                    <p class="itemno1">6000원</p>
				                </td>
				            </tr>
				             <tr>
				                <td class="img_td">
				                    <img alt="cartimg" src="/resources/imgs/s02.jpg" class="cartimg" />
				                </td>
				                <td colspan="2" class="info_td">
				                    <strong>상품이름</strong>
				                    <p>상품 옵션/선택정보</p>
				                </td>
				               <td class="price_td">
				              	 <p>1</p>
				               </td>
				                <td class="price_td">
				                    <p class="itemno1">6000원</p>
				                </td>
				            </tr>
				             <tr>
				                <td class="img_td">
				                    <img alt="cartimg" src="/resources/imgs/s03.jpg" class="cartimg" />
				                </td>
				                <td colspan="2" class="info_td">
				                    <strong>상품이름</strong>
				                    <p>상품 옵션/선택정보</p>
				                </td>
				               <td class="price_td">
				              	 <p>1</p>
				               </td>
				                <td class="price_td">
				                    <p class="itemno1">6000원</p>
				                </td>
				            </tr>
				           
				        </tbody>
				    </table>
       			<div class="listMore">
       				▼
       			</div>
       			
       		<!-- 상품정보 출력완료 -->
       			
			
       			
       			<h2>배송/픽업</h2>
				<br>
				<div class="col-md-12 deliver-form">
					<div class="col-md-8 col-md-offset-2 selectDel">
						<label class="radio-inline">
						<input type="radio" name="deliverOpt" value="1" checked>배송</label>
						<label class="radio-inline">
						<input type="radio" name="deliverOpt" value="0" >픽업</label>
					</div>
					
					<br/><br/><br/>
					
					<!-- 배송 선택시 폼 -->
					<div class="Deliver">
					<div class="col-md-8 col-md-offset-2">
						<h3>배송지 입력</h3>
						<div id="selectDel">
						<div class="col-md-12 selectAddr">
							<label class="radio-inline">
							<input type="radio" name="addrUpdate" checked>기본 주소지</label>
							<label class="radio-inline">
							<input type="radio" name="addrUpdate">새 주소</label>
						</div>
						</div>
					<br><br>
					<div class="contentBox">
						<form class="form-horizontal">
						  <div class="form-group">
						    <label for="userName" class="col-sm-2 control-label">이름</label>
						    <div class="col-sm-5 col-md-7">
						      <input type="text" class="form-control" id="userName" placeholder="이름">
						    </div>
						  </div>
						   <div class="form-group">
						    <label for="userPhone" class="col-sm-2 control-label">연락처</label>
						    <div class="col-sm-5 col-md-7">
						      <input type="tel" class="form-control" id="userPhone" placeholder="연락처" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}">
						    </div>
						  </div>
						  
						  <!-- 배송선택시 보이는 폼 -->
						  <div id="selectDel">
						   <div class="form-group">
						    <label for="userAddr" class="col-sm-2 control-label">주소</label>
						   		<div>
								    <div class="col-sm-7 col-xs-9">
									    <input type="text" class="form-control" id="addr1" placeholder="주소">
									</div>
								    <div class="col-sm-2 col-xs-3">
								      <button id="findAddr" class="btn btn-default">주소찾기</button>	
								    </div>
							 	</div>
							 	<div class="col-sm-offset-2 col-sm-7 col-md-7 ">
						     	 <input type="text" class="form-control" id="addr2" placeholder="상세주소">
						    	</div>
						  	</div>
						  	</div>
						  	<!-- 배송선택시 보이는 폼 end-->
						  	<!-- 픽업 선택시 보이는 폼 -->
						  	<div id="selectPick">
						  	<div class="form-group">
						  		  <label for="userName" class="col-sm-2 control-label">점포선택</label>
								   <div class="col-sm-5 col-md-7">
								  	<select class="form-control">
									  <option>강남본점</option>
									  <option>서초점</option>
									</select>
								   </div>
						  	</div>
						  	
						  <div class="form-group">
						    <label for="userName" class="col-sm-2 control-label">수령일</label>
						    <div class="col-sm-5 col-md-7">
						      <input type="date" class="form-control" id="deliveDate" placeholder="수령날짜">
						    </div>
						  </div>
						  <div class="form-group">
						    <label for="userName" class="col-sm-2 control-label">수령시간</label>
						    <div class="col-sm-5 col-md-7">
						      	<select class="form-control">
									  <option>09:30~10:30</option>
									  <option>10:30~11:30</option>
									  <option>11:30~12:30</option>
									  <option>12:30~13:30</option>
									  <option>13:30~14:30</option>
									  <option>14:30~15:30</option>
									  <option>15:30~16:30</option>
									  <option>16:30~17:30</option>
								</select>
						    </div>
						  </div>
					</div>
						<!-- 픽업 선택시 보이는 폼 end-->
						 <div class="form-group">
						    <label for="userName" class="col-sm-2 control-label">결제방법</label>
						   
						  	<div class="col-sm-offset-1 col-sm-7 col-md-7 ">
						  		<div class="selectCharge">
									<label class="radio-inline">
									<input type="radio" name="optradio" checked>카드</label>
									<label class="radio-inline">
									<input type="radio" name="optradio">휴대폰결제</label>
									<label class="radio-inline">
									<input type="radio" name="optradio">무통장입금</label>
								</div>
						  	</div>
						</div>
						  
						<br><br><br>
						  <div class="form-group">
						    <div class="col-sm-offset-4 col-sm-4">
						      <button type="submit" class="btn btn-default">결제하기</button>
						    </div>
						  </div>
						</form>
						</div>
					</div>
					
					</div>
					
				</div>
			</div><!-- container end -->
  
    <!-- ***********************************content end*********************************** -->



    <!-- ***********************************footer*********************************** -->
    
   <jsp:include page="/resources/template/footer.jsp"/>

</body></html>