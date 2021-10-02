<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/nav.jsp" />

<div id="hero-area" class="hero-area-bg" style=" margin-bottom: 50px;">
     <div class="overlay"></div>
     <div class="container">
       <div class="row">
         <div class="col-md-12 col-sm-12">
           <div class="contents text-center">
             <h2 class="head-title wow fadeInUp">상품 관리</h2>
           </div>
         </div>
       </div>
     </div>
   </div>

<div style="margin-top: 40px; margin-bottom: 120px; text-align: center;">
	
	<!-- 카테고리선택버튼 -->
      <form action="/product/productIndex">
	    <select class="form-control" name="cno" style="width: 20%; display: inline-block;">
		  <option value="0">전체</option>
		  <c:forEach items="${clist }" var="cvo">
		    <option value="${cvo.cno }">${cvo.cname }</option>
		  </c:forEach>
		</select>
		<button type="submit" class="btn btn-common" style="display: inline-block;">검색</button>
      </form>
    <!-- 카테고리선택버튼  끝 -->      
	
	<c:choose>
		<c:when test="${ses.mtype gt 1 }">
		<table class="table table-hover">
	    <thead>
	      <tr>
	        <th>카테고리넘버</th>
	        <th>상품번호</th>
	        <th>상품이름</th>
	        <th></th>
	      </tr>
	    </thead>
	    <tbody>
	    <c:forEach items="${list }" var="pvo">
	      <tr>
	        <td>${pvo.cno }</td>
	        <td>${pvo.pno }</td>
	        <td>${pvo.pname }</td>
	        <td>
	        	<a href="/product/modify?pno=${pvo.pno }" 
	        	class="btn btn-warning mod-btn">수정</a>
	        	<button type="button" class="btn btn-dark del-btn">삭제</button>
	        </td>
	      </tr>
	    </c:forEach>      
	    </tbody>
	<%--     <tfoot>
	    	<tr>
	    		<td colspan="5">
	    			<jsp:include page="../common/pagingMem.jsp"/>
	    		</td>
	    	</tr>
	    </tfoot> --%>
	  </table>
	  <form action="/product/remove" method="post" id="rmForm">
	  	<input type="hidden" name="pno">
	  </form>
	<script>
	$(function() {
	  		/* $(document).on("click", ".mod-btn", function(){
	  			let email_val = $(this).closest("tr").find("td").eq(0).text();
	  			location.href="/member/modify?email="+email_val;
	  		}); */
		$(document).on("click",".del-btn", function(e) {
			e.preventDefault();
			let pno_val = $(this).closest("tr").find("td").eq(1).text();
			$("#rmForm > input[name=pno]").val(pno_val);
			$("#rmForm").submit();
			});		
	});
	</script>
		</c:when>
		<c:otherwise>
			<script>
				alert("관리자 로그인이 필요한 페이지 입니다!");
				location.replace("/product/list?cno=1");
			</script>
		</c:otherwise>
	</c:choose>
</div>
  

<jsp:include page="../common/footer.jsp" />