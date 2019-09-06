<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Dam da :) </title>
    <link rel="stylesheet" href="/resources/css/bootstrap-theme.css" />
    <link rel="stylesheet" href="/resources/css/bootstrap.css" />
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Roboto&display=swap" rel="stylesheet">
    <!--middle font-->
    <link href="https://fonts.googleapis.com/css?family=Karma&display=swap" rel="stylesheet">
    <!--logo design-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.2/animate.min.css">
    <!--footer start-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Playfair+Display:400,700,900" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700" rel="stylesheet">
    <!--footer end-->
    <link rel="stylesheet" href="/resources/css/index.css" />
    <style type="text/css">

    </style>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/1.20.2/TweenMax.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/1.20.2/utils/Draggable.min.js"></script>
    <script type="text/javascript" src="/resources/js/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="/resources/js/bootstrap.js"></script>
    <script type="text/javascript">
        $(document).ready(function() {
            //navbar 상단고정
            var mainOffset = $('#navbarid').offset();
            $(window).scroll(function() {
                if ($(document).scrollTop() > mainOffset.top) {
                    $('#navbarid').addClass('navbar-fixed-top');
                } else {
                    $('#navbarid').removeClass('navbar-fixed-top');
                }
            });

            //화면사이즈
            resized();

            //top 클릭시 상단이동     
            $(function() {
	        $(window).scroll(function() {
	            if ($(this).scrollTop() > 10) {
	                $('#MOVE_TOP_BTN').fadeIn();
	            } else {
	                $('#MOVE_TOP_BTN').fadeOut();
	            }
	        });
	        
	        $("#MOVE_TOP_BTN").click(function() {
	            $('html, body').animate({
	                scrollTop : 0
	            }, 400);
	            return false;
	        });
		});
            /////////////////////////////////////////////////////////////////////////////


        });

        $(window).resize(function() {
            resized();
        });

      	//로그아웃 확인 모달
 		function logoutcf(){
	  	    var logoutModal = $("#logoutModal");
  	  		logoutModal.modal("show").css('top', '35%');
	  	    $("#logoutOk").click(function(){
	  	    	logoutModal.modal("hide");
	  	    });
	  	    $("#logoutCancel").click(function(){
	  	    	logoutModal.modal("hide");
	  	    });
 		}

        function resized() {
            var windowWidth = $(window).width();
            //창크기 1010 이하일 때
            if (windowWidth < 1010) {
                $('#container').css('display', 'none');
                $('.hid_middle').css('display', 'block');
                $('.logo-part').css('border-right', '0px');
            } else {
                $('.hid_middle').css('display', 'none');
                $('#container').css('display', 'block');
                $('.logo-part').css('border-right', '1px solid grey');
            }

            //창크기 840이하일 때 하단Fixed생성
            if (windowWidth < 840) {
                $('.navbar-right').css('display', 'none');
                $('.bottom_nav').css('display', 'block');
                $('.bottom_nav').addClass('navbar-fixed-bottom');
            } else {
                $('.navbar-right').css('display', 'block');
                $('.bottom_nav').css('display', 'none');
                $('.bottom_nav').removeClass('navbar-fixed-bottom');
            }

            //탑버튼용
            if(windowWidth < 840) {
            	$('a#MOVE_TOP_BTN').css('right','-6%').css('bottom','7%');
            }else{
            	$('a#MOVE_TOP_BTN').css('right','-2.5%').css('bottom','1%');
            }
        }
    </script>