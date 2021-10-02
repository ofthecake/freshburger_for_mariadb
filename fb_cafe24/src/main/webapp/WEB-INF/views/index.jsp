<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="common/header.jsp" />
<jsp:include page="common/nav.jsp" />

	  <c:choose>
	    <c:when test="${ses.mtype ge 1}">
		  <script>
			location.replace("/product/list?cno=1");
		  </script>
	    </c:when>
	    <c:otherwise>
	      	            <!-- Hero Area Start -->
	      <div id="hero-area" class="hero-area-bg">
	        <div class="overlay"></div>
	        <div class="container">
	          <div class="row">
	            <div class="col-md-12 col-sm-12">
	              <div class="contents text-center">
	                <h2 class="head-title wow fadeInUp">Welcome! It's Fresh Burger</h2>
	                <div class="header-button wow fadeInUp" data-wow-delay="1s">
	                  <br><br>
	                  <button type="button" class="btn btn-common btn-lg" data-toggle="modal" data-target="#myModal" id="loginModal">로그인</button>
	                  <c:if test="${ses eq null }"><button type="button" class="btn btn-common btn-lg" id="nonMemLoginBtn">비회원주문</button></c:if>
	                  <a href="/member/register" class="btn btn-border btn-lg">회원가입</a><br><br><br><br><br><br><br><br><br><br>
	                </div>
	                <form action="/member/nonmember" method="post" id="nonMemLoginForm"></form>
	              </div>
	            </div>
	          </div>
	        </div>
	      </div>
	<script>
		$(function() {
			
			$(document).on("click","#nonMemLoginBtn", function(e) {
				e.preventDefault();
				$("#nonMemLoginForm").submit();
				});	
		});
	</script>
	      <!-- Hero Area End -->
	    </c:otherwise>
	  </c:choose>


    
<jsp:include page="common/footer.jsp" />