<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/nav.jsp" />

<div id="hero-area" class="hero-area-bg">
     <div class="overlay"></div>
     <div class="container">
       <div class="row">
         <div class="col-md-12 col-sm-12">
           <div class="contents text-center">
             <h2 class="head-title wow fadeInUp">회원 정보</h2>
           </div>
         </div>
       </div>
     </div>
   </div>

<c:choose>
	<c:when test="${ses.id eq mvo.id }">
	
	<form style="margin-top: 120px; margin-bottom: 120px; text-align: center;">
	    <div class="form-group">
	      <label for="id">ID:</label>
	      <input type="text" class="form-control" id="id" value="${mvo.id }" name="id" style="width: 40%; display: inline-block" readonly>
	    </div>
	    <div class="form-group">
	      <label for="name">이름:</label>
	      <input type="text" class="form-control" id="name" value="${mvo.mname }" name="mname" style="width: 40%; display: inline-block" readonly>
	    </div>
	    <div class="form-group">
	      <label for="nickname">닉네임:</label>
	      <input type="text" class="form-control" id="nickname" value="${mvo.mnick }" name="mnick" style="width: 40%; display: inline-block" readonly>
	    </div>
	    <div class="form-group">
	      <label for="birth">생일:</label>
	      <input type="text" class="form-control" id="birth" placeholder="Enter birth" name="mbirth" style="width: 40%; display: inline-block" readonly>
	    </div>
	    <div class="form-group">
	      <label for="regdate">회원가입일:</label>
	      <input type="text" class="form-control" id="regdate" value="${mvo.mregdate }" name="regdate" style="width: 40%; display: inline-block" readonly>
	    </div>
	    <div class="form-group">
	      <label for="point">보유 포인트:</label>
	      <input type="text" class="form-control" id="point" value="${mvo.mpoint }" name="point" style="width: 40%; display: inline-block" readonly>
	    </div>
	    <a href="/member/modify?id=${mvo.id }" class="btn btn-common primary-btn">수정</a>
	  </form>
<script>
$(function() {
  		$(document).on("click", ".primary-btn", function(){
  			let id_val = $(this).closest("tr").find("td").eq(0).text();
  			location.href="/member/modify?id="+id_val;
  		}); 

</script>
	</c:when>
	<c:otherwise>
		<script>
			alert("관리자 로그인이 필요한 페이지 입니다!");
			location.replace("/");
		</script>
	</c:otherwise>
</c:choose>
  

<jsp:include page="../common/footer.jsp" />