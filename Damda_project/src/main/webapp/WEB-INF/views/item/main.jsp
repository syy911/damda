<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<head>
<jsp:include page="/resources/template/head.jsp"/>
 <style type="text/css">
        #content h2 {
            text-align: center;
            margin: 40px auto;
        }

        #content .btn-group img {
            width: 10px;
            margin: 0px;
            position: relative;
            top: -3px;
        }

        #content .btn-toolbar {
            display: inline-block;
            margin: 30px auto;
        }

        #content .pagination>li>a {
            color: black;
        }

        #content .pagination>li>a:hover {
            font-weight: bold;
        }

        #content .thumbnail {
            border: 0px;
            box-shadow: none;
        }
        
        #content .thumbnail a{
        	text-decoration: none;
        	color: black;
        }

        #content .ctg_a>a {
            margin: 10px;
            width: 80px;
            height: 30px;
            line-height: 30px;
            text-align: center;
            display: inline-block;
        }

        #content .ctg_a>a:hover {
        	color: darksalmon;
            font-weight: bold;
            text-decoration: none;
            border-bottom: 2px solid;
        }

        #content .ctg_a>a img {
            width: 25px;
            position: relative;
            top: -5px;
            margin: 0px 5px;
        }

        #content .ctg_a>a:nth-child(2) img {
            top: -3px;
        }
        
		#content form{
			display: inline-block;
            float: right;
            width: 100px;
		}
        #content .item_align{
            display: inline-block;
            width: 100px;
            border: 0px;
            position: relative;
            top: 15px;
        }
        
        #content .caption p{
        	color: darksalmon;
        }
        
        #content .best_div{
        	background-color: darksalmon;
        	width: 45px;
        	height: 40px;
        	line-height: 40px;
        	color: white;
        	font-size: 16px;
        	text-align: center;
			position: relative;
			top: 40px;        
        }
        
        #content .best_ctg p{
        	color: darksalmon;
        	font-weight: bold;
        	display: inline-block;
        	font-size: 13px;
        } 
        
        #content .best_ctg .best_select{
        	float: right;
        	position: relative;
        	top: -1px;
        } 
        
        #content .best_ctg .best_pdiv{
			border-bottom: 2px solid darksalmon;        
        	display: inline-block;
        	width: 64px;
        	text-align: center;
        } 
        
        #content .ctg_div{
        	margin-bottom: 30px;	
        }
        
        #active_a{
        	color: darksalmon;
        	border-bottom: 2px solid;
        }
        
    </style>
	<script type="text/javascript">
	 	$(document).ready(function() {
	 	  select_event();
	 	  
	  	});
	 	
	      //select box 이벤트
	     function select_event() {
	    	var item = $('#item').val();
		    console.log(" >>> item : " + item);
		    
            var select_val = $('.item_align').val();
            console.log('select value: '+select_val);
            var url = window.location.pathname;
            console.log('url: '+url);
            var url_split = url.split('?');
            console.log('url_split: '+url_split);
            console.log('url_split[0]: '+url_split[0]);
            
            $.ajax({
    			url:url_split[0]+"?item="+item,
    			type:'get',
    			data:"",
    			success: function(data){
    	        	console.log('success');
    	        	$('#select').load(item+'?select='+select_val); 
    	        	console.log(item+'?select='+select_val);
    	        }
    		});
        }  
	       
	 </script>
</head>

<body>
<jsp:include page="/resources/template/header.jsp"/>
<!-- content start -->
<h2></h2>
<input type="hidden" id="item" value="${item }">
	<div class="col-md-offset-1 col-md-10 col-sm-12 ctg_div">
	    <div class="col-md-12 ctg_a">
	        <a href="/item/list?item=salad" class="salad_a"><img src="/resources/icon/salad.png" />샐러드</a>
	        <a href="/item/list?item=dessert" class="dessert_a"><img src="/resources/icon/dessert.png" />디저트</a>
	        <a href="/item/list?item=drink" class="drink_a"><img src="/resources/icon/drink.png" />음료</a>
	
			<form>
		        <select class="item_align" name="itemalign" onchange="select_event();" value="${itemalign}">
		            <option value="new">신상품순</option>
		            <option value="best">인기상품순</option>
		            <option value="cheap">낮은 가격순</option>
		            <option value="expen">높은 가격순</option>
		        </select>
			</form>
	    </div>
	</div>
	
	<div class="col-md-offset-1 col-md-10 col-sm-12 best_ctg">
	    <div class="col-md-12">
	    	<div class="best_pdiv">
	        	<p>전체보기</p>
	    	</div>
	
	        <select class="item_align best_select">
	            <option value="new">인기순</option>
	        </select>
	    </div>
	</div>
	<div id="select">
		<jsp:include page="list.jsp"/>
	</div>
<!-- content end -->
<jsp:include page="/resources/template/footer.jsp"/>
</body>
</html>