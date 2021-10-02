<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
    
       <!-- Navbar Start -->
      <nav class="navbar navbar-expand-lg fixed-top scrolling-navbar indigo">
        <div class="container">
          <div class="navbar-header" style="max-width: 50%;">
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#main-navbar" aria-controls="main-navbar" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
              <span class="icon-menu"></span>
              <span class="icon-menu"></span>
              <span class="icon-menu"></span>
            </button>
            <a style="max-width: 50%;" href="/" class="navbar-brand" ><img src="/resources/bootstrap/img/logo.png" style="max-width: 100%;" alt=""></a>
          </div>
          
          <c:choose>
            <c:when test="${ses.mtype gt 1}">
	            <div class="collapse navbar-collapse" id="main-navbar">
	            <ul class="navbar-nav mr-auto w-100 justify-content-end clearfix">
	              <li class="nav-item active">
	                <a class="nav-link" href="/product/list?cno=1">주문</a>
	              </li>
	              <li class="nav-item">
	                <a class="nav-link" href="/member/detail?id=${ses.id }">내 정보</a>
	              </li>
	              <li class="nav-item dropdown">
	                <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	                  	관리자 <i class="lni-chevron-down"></i>
	                </a>
	                <div class="dropdown-menu">
	                  <a class="dropdown-item" href="/product/register">상품등록</a>
	                  <a class="dropdown-item" href="/side/list">세트사이드관리</a>
	                  <a class="dropdown-item" href="/beverage/list">세트음료관리</a>
	                  <a class="dropdown-item" href="/product/productIndex?cno=0">상품목록</a>
	                  <a class="dropdown-item" href="/member/list">회원정보</a>
	                  <a class="dropdown-item" href="/order/list">영수증조회</a>
	                </div>
	              </li>
	              <li class="nav-item">
	                <a class="nav-link" href="/cart/list?id=${ses.id }">장바구니</a>
	              </li>
	              <li class="nav-item">
	                <a class="nav-link" href="/member/logout">로그아웃</a>
	              </li>
	            </ul>
	            </div>
           	 </c:when>
            
            <c:when test="${ses.mtype le 1}">
	            <div class="collapse navbar-collapse" id="main-navbar">
	            <ul class="navbar-nav mr-auto w-100 justify-content-end clearfix">
	              <li class="nav-item active">
	                <a class="nav-link" href="/product/list?cno=1">주문</a>
	              </li>
		          <c:choose>
		            <c:when test="${ses.mtype eq 1}">
		              <li class="nav-item">
		                <a class="nav-link" href="/member/detail?id=${ses.id }">내 정보</a>
		              </li>
		              <li class="nav-item">
		                <a class="nav-link" href="/cart/list?id=${ses.id }">장바구니</a>
		              </li>
		              <li class="nav-item">
		                <a class="nav-link" href="/member/logout">로그아웃</a>
		              </li>
		            </c:when>
		            <c:otherwise>
		              <li class="nav-item">
		                <a class="nav-link" href="/cart/list?id=${ses.id }">장바구니</a>
		              </li>
		              <li class="nav-item">
		                <a class="nav-link" id="nonMemLogoutBtn">로그아웃</a>
		                <form action="/member/nMlogout" method="post" id="nonMemLogoutForm">
		                  <input type="hidden"  name="nMId" value="${ses.id }">
		                </form>
		              </li>
		            </c:otherwise>
		          </c:choose>
	            </ul>
	            </div>
            </c:when>
                        
            <c:otherwise>
	            <div class="collapse navbar-collapse" id="main-navbar">
	            <ul class="navbar-nav mr-auto w-100 justify-content-end clearfix">
	              <li class="nav-item">
	                <a class="nav-link" data-toggle="modal" data-target="#myModal" id="loginModal">로그인</a>
	              </li>
	              <li class="nav-item">
	                <a class="nav-link" href="/member/register">회원가입</a>
	              </li>
	            </ul>
	            </div>
            </c:otherwise>
            
          </c:choose>          
        </div> 

        <!-- Mobile Menu Start -->
        <ul class="mobile-menu">
        <c:choose>

            <c:when test="${ses.mtype gt 1}">
                <li>
	              <a class="active" href="/product/list?cno=1">주문</a>
	            </li>
	            <li>
	              <a href="/cart/list?id=${ses.id }">장바구니</a>
	            </li>
	            <li>
	              <a class="nav-link" href="/member/detail?id=${ses.id }">내 정보</a>
	            </li>
	            <li>
	              <a href="#">관리자</a>
	              <ul class="dropdown">
	                <li><a href="/product/register">상품등록</a></li>
	                <li><a href="/side/list">세트사이드관리</a></li>
	                <li><a href="/beverage/list">세트음료관리</a></li>
	                <li><a href="/product/productIndex">상품목록</a></li>
	                <li><a href="/member/list">회원목록</a></li>
	                <li><a href="/order/list">영수증조회</a></li>
	              </ul>
	            </li>
	            <li>
	              <a href="/member/logout">로그아웃</a>
	            </li>
            </c:when>
            
            <c:when test="${ses.mtype le 1}">
            	<li>
	              <a class="active" href="/product/list?cno=1">주문</a>
	            </li>
	            <li>
	              <a href="/cart/list?id=${ses.id }">장바구니</a>
	            </li>
	            <li>
	              <a href="/member/detail?id=${ses.id }">내 정보</a>
	            </li>
	            <c:choose>
		            <c:when test="${ses.mtype eq 1}">
		              <li>
		                <a href="/member/logout">로그아웃</a>
		              </li>
		            </c:when>
		            <c:otherwise>
		              <li>
		                <a class="nav-link" id="nonMemLogoutBtnMB">로그아웃</a>
		                <form action="/member/nMlogout" method="post" id="nonMemLogoutForm">
		                  <input type="hidden"  name="nMId" value="${ses.id }">
		                </form>
		              </li>
		            </c:otherwise>
		          </c:choose>
            </c:when>
              
             <c:otherwise>
	            <li>
	              <a class="nav-link" data-toggle="modal" data-target="#myModal" id="loginModal">로그인</a>
	            </li>
	            <li>
	              <a href="/member/register">회원가입</a>
	            </li>
	            
            </c:otherwise>
          </c:choose>
        </ul>
        <!-- Mobile Menu End -->
<script>
	$(function() {
		
		$(document).on("click","#nonMemLogoutBtn", function(e) {
			e.preventDefault();
			$("#nonMemLogoutForm").submit();
			});
		
		$(document).on("click","#nonMemLogoutBtnMB", function(e) {
			e.preventDefault();
			$("#nonMemLogoutForm").submit();
			});
		
	});
</script>
      </nav>      
      
      <!-- Navbar End -->