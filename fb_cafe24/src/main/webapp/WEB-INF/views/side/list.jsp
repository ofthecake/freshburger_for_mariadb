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
             <h2 class="head-title wow fadeInUp">세트메뉴 사이드 관리</h2>
           </div>
         </div>
       </div>
     </div>
   </div>

<div style="margin-top: 120px; margin-bottom: 120px; text-align: center;">
	<c:choose>
		<c:when test="${ses.mtype gt 1 }">
		<table class="table table-hover">
	    <thead>
	      <tr>
	        <th>제품번호</th>
	        <th>사이드메뉴 이름</th>
	        <th>사이드메뉴 추가가격</th>
	        <th></th>
	      </tr>
	    </thead>
	    <tbody>
	    <c:forEach items="${list }" var="svo">
	      <c:if test="${svo.sno ne 1000}">
	      <tr>
	        <td>${svo.sno }</td>
	        <td>${svo.sname }</td>
	        <td>${svo.sprice }</td>
	        <td>
	          <button type="button" class="btn btn-dark del-btn">삭제</button>
	        </td>
	      </tr>
	      </c:if>
	    </c:forEach>
	    
	    <!-- 사이드 추가 모달 -->
	    <div class="modal fade" id="sideRegModal" data-backdrop="static">
		  <div class="modal-dialog modal-dialog-centered">
		    <div class="modal-content">
		      <!-- Modal body -->
		      <div class="modal-body" style="text-align: center">
		      	<label>사이드메뉴 이름:</label>
		        <input type="text" class="form-control" id="sideRegName" name="sideRegName" style="width: 80%; display: inline-block" required>
		        <br><label>사이드메뉴 추가가격:</label>
		        <input type="text" class="form-control" id="sideRegPrice" name="sideRegPrice" style="width: 80%; display: inline-block" required>
		      </div>
		      <!-- Modal footer -->
		      <div class="modal-footer">
		        <button type="button" class="btn btn-common" id="regSideBtn">사이드메뉴 추가</button>
		        <button type="button" id="closeBtn" class="btn btn-dark" data-dismiss="modal">닫기</button>
		      </div>	
		    </div>
		  </div>
		</div>
	    <!-- 사이드 추가 모달  끝-->
	        
	    </tbody>
	  </table>
	  
	  <button type="button" class="btn btn-common" data-toggle="modal" data-target="#sideRegModal">사이드상품추가</button>
	  
	  <form action="/side/remove" method="post" id="rmForm">
	  	<input type="hidden" name="sno">
	  </form>
	  
<script>
$(function() {
	
	$(document).on("click",".del-btn", function(e) {
		e.preventDefault();
		let sno_val = $(this).closest("tr").find("td").eq(0).text();
		console.log(sno_val);
		$("#rmForm > input[name=sno]").val(sno_val);
		$("#rmForm").submit();
		});
	
	$("#regSideBtn").on("click", function(e) {
		e.preventDefault();
		let sidename_val = $("#sideRegName").val();
		let sideprice_val = $("#sideRegPrice").val();
		$.ajax({
			url: "/side/register",
			type: "post",
			data: {sname: sidename_val, sprice: sideprice_val}
		}).done(function(result) {
			if(parseInt(result)==1){
				alert("등록됐습니다.");
				location.href = "/side/list";
			}else{
				alert("등록 실패.");
			}
		});
	});
	
});
</script>

		</c:when>
		<c:otherwise>
			<script>
				alert("관리자 로그인이 필요한 페이지 입니다!");
				location.replace("/product/list");
			</script>
		</c:otherwise>
	</c:choose>
</div>
  

<jsp:include page="../common/footer.jsp" />