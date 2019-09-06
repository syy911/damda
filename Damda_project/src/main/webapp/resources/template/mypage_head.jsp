<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
        $(document).ready(function() {
            grid();

        });

        $(window).resize(function() {
            grid();
        });

        function grid() {
            var windowWidth = $(window).width();

            //md
            if (windowWidth >= 992) {
                $('#content_header>div:nth-child(2),#content_header>div:nth-child(3),#content_header>div:nth-child(4)').css('margin', '10px');
                $('#content_header>div:nth-child(2),#content_header>div:nth-child(3)').css('border-right', '0px');
                $('h2, h3').css({
                    display: 'inline-block',
                    marginTop: '50px',
                    marginBottom: '30px'
                });
                $('#content_aside li').css({
                    width: '90%',
                    textAlign: 'left'
                });
                $('#content_aside li:nth-child(1),#content_aside li:nth-child(2),#content_aside li:nth-child(3),#content_aside li:nth-child(4)').css({
                    borderRight: '1px solid #cccccc',
                    borderBottom: '0px'
                });
                $('#content_aside a').css('font-size', '13px');
                $('#content_aside p').css('margin-left', '30px');
                $('#content_content input').css('margin-bottom', '10px');
                $('#content_content small').css({
                    display: 'inline-block'
                });
                /////////////////////////////////////////////////////////////////////////////////
            } else {

            }

            //sm
            if (windowWidth >= 768 && windowWidth < 992) {
                $('#content_header>div:nth-child(2),#content_header>div:nth-child(3),#content_header>div:nth-child(4)').css('margin', '0px');
                $('#content_header>div:nth-child(2),#content_header>div:nth-child(3)').css('border-right', '3px solid whitesmoke');
                $('h2, h3').css({
                    display: 'block',
                    margin: '20px auto'
                });
                $('#content_aside li').css({
                    width: '20%',
                    textAlign: 'center'
                });
                $('#content_aside li:nth-child(1),#content_aside li:nth-child(2),#content_aside li:nth-child(3),#content_aside li:nth-child(4)').css({
                    borderRight: '0px',
                    borderBottom: '1px solid #cccccc'
                });
                $('#content_aside a').css('font-size', '12px');
                $('#content_aside p').css('margin', '0px');
                $('#content_content input').css('margin-bottom', '7px');
                $('#content_content small').css({
                    display: 'block',
                    marginRight: 'auto',
                    marginLeft: 'auto'
                });
                ///////////////////////////////////////////////////////////////////////

            } else {


            }

            //xs
            if (windowWidth < 768) {
                $('#content_header>div:nth-child(2),#content_header>div:nth-child(3),#content_header>div:nth-child(4)').css('margin', '0px');
                $('#content_header>div:nth-child(2),#content_header>div:nth-child(3)').css('border-right', '3px solid whitesmoke');
                $('h2, h3').css({
                    display: 'block',
                    margin: '20px auto'
                });
                $('#content_aside li').css('width', '20%');
                $('#content_aside li').css({
                    width: '20%',
                    textAlign: 'center'
                });
                $('#content_aside li:nth-child(1),#content_aside li:nth-child(2),#content_aside li:nth-child(3),#content_aside li:nth-child(4)').css({
                    borderRight: '0px',
                    borderBottom: '1px solid #cccccc'
                });
                $('#content_aside a').css('font-size', '11px');
                $('#content_aside p').css('margin', '0px');
                $('#content_content input').css('margin-bottom', '3px');
                $('#content_content small').css({
                    display: 'block',
                    marginRight: 'auto',
                    marginLeft: 'auto'
                });
                //////////////////////////////////////////////////////////////////////////////
            } else {


            }

            if (windowWidth < 1501) {
                $('.width_div').css('height', '405px');
                $('.margin_div2').addClass('col-md-12');
                $('.margin_div2').removeClass('col-md-5');
                //////////////////////////////////////////////
            } else {
                $('.width_div').css('height', '250px');
                $('.margin_div2').addClass('col-md-5');
                $('.margin_div2').removeClass('col-md-12');
                /////////////////////////////////////////////////
            }
        }
    </script>