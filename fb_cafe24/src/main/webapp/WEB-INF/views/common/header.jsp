<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
  <head profile="http://www.w3.org/2005/10/profile">
  	<link rel="icon" type="image/png" href="http://example.com/myicon.png">
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="/resources/bootstrap/js/jquery-min.js"></script>
    <script src="/resources/bootstrap/js/popper.min.js"></script>
    <script src="/resources/bootstrap/js/bootstrap.min.js"></script>
    <script src="/resources/bootstrap/js/jquery.counterup.min.js"></script>
    <script src="/resources/bootstrap/js/waypoints.min.js"></script>
    <script src="/resources/bootstrap/js/owl.carousel.min.js"></script>
    <script src="/resources/bootstrap/js/wow.js"></script>
    <script src="/resources/bootstrap/js/jquery.easing.min.js"></script>  
    <script src="/resources/bootstrap/js/jquery.slicknav.js"></script>
    <script src="/resources/bootstrap/js/main.js"></script>

    <title>FreshBurger</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" type="text/css" href="/resources/bootstrap/css/bootstrap.min.css" >
    <!-- Icon -->
    <link rel="stylesheet" type="text/css" href="/resources/bootstrap/fonts/line-icons.css">
    <!-- Slicknav -->
    <link rel="stylesheet" type="text/css" href="/resources/bootstrap/css/slicknav.css">
    <!-- Owl carousel -->
    <link rel="stylesheet" type="text/css" href="/resources/bootstrap/css/owl.carousel.min.css">
    <!-- Animate -->
    <link rel="stylesheet" type="text/css" href="/resources/bootstrap/css/animate.css">
    <!-- Main Style -->
    <link rel="stylesheet" type="text/css" href="/resources/bootstrap/css/main.css">
    <!-- Responsive Style -->
    <link rel="stylesheet" type="text/css" href="/resources/bootstrap/css/responsive.css">
    
    <link rel="shortcut icon" href="#">

  </head>
  
    <body>
    
    <!-- 로그인 클릭시 모달 -->
    <div class="modal fade" id="myModal" data-backdrop="static">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
	      <!-- Modal body -->
	      <div class="modal-body" style="text-align: center">
	      	<label for="headerid">ID:</label>
	        <input type="text" class="form-control" id="headerid" placeholder="Enter id" name="headerid" style="width: 80%; display: inline-block" required>
	        <br><label for="headerpw">Password:</label>
	        <input type="password" class="form-control" id="headerpw" placeholder="Enter password" name="headerpw" style="width: 80%; display: inline-block" required>
	      </div>
	      <!-- Modal footer -->
	      <div class="modal-footer">
	      	<button type="button" id="loginBtn" class="btn btn-danger">Login</button>
	        <button type="button" id="closeBtn" class="btn btn-danger" data-dismiss="modal">Close</button>
	      </div>	
	    </div>
	  </div>
	</div>
	<!-- 로그인 클릭시 모달  끝-->
<script>
$(function() {
	
	$("#loginBtn").on("click", function(e) {
		let headerid_val = $("#headerid").val();
		let headerpw_val = $("#headerpw").val();
		$.ajax({
			url: "/member/login",
			type: "post",
			data: {id: headerid_val, pw: headerpw_val}
		}).done(function(result) {
			if(parseInt(result)==1){
				$("#myModal").modal("hide");
				alert("로그인 성공.");				
				location.href = "/product/list?cno=1";
			}else{
				alert("로그인 실패.");
			}
		});					
	});	
	
});
</script>
    
    <!-- Header Area wrapper Starts -->
    <header id="header-wrap">

