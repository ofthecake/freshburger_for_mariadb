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
             <h2 class="head-title wow fadeInUp">세트메뉴 음료 관리</h2>
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
	        <th>음료메뉴 이름</th>
	        <th>음료메뉴 추가가격</th>
	        <th></th>
	      </tr>
	    </thead>
	    <tbody>
	    <c:forEach items="${list }" var="bvo">
	      <c:if test="${bvo.bno ne 1000}">
	      <tr>
	        <td>${bvo.bno }</td>
	        <td>${bvo.bname }</td>
	        <td>${bvo.bprice }</td>
	        <td>
	          <button type="button" class="btn btn-dark del-btn">삭제</button>
	        </td>
	      </tr>
	      </c:if>
	    </c:forEach>
	    
	    <!-- 사이드 추가 모달 -->
	    <div class="modal fade" id="beverRegModal" data-backdrop="static">
		  <div class="modal-dialog modal-dialog-centered">
		    <div class="modal-content">
		      <!-- Modal body -->
		      <div class="modal-body" style="text-align: center">
		      	<label>음료 이름:</label>
		        <input type="text" class="form-control" id="beverRegName" name="beverRegName" style="width: 80%; display: inline-block" required>
		        <br><label>음료 추가가격:</label>
		        <input type="text" class="form-control" id="beverRegPrice" name="beverRegPrice" style="width: 80%; display: inline-block" required>
		      </div>
		      <!-- Modal footer -->
		      <div class="modal-footer">
		        <button type="button" class="btn btn-common" id="regBeverBtn">사이드메뉴 추가</button>
		        <button type="button" id="closeBtn" class="btn btn-dark" data-dismiss="modal">닫기</button>
		      </div>	
		    </div>
		  </div>
		</div>
	    <!-- 사이드 추가 모달  끝-->
	        
	    </tbody>
	  </table>
	  
	  <button type="button" class="btn btn-common" data-toggle="modal" data-target="#beverRegModal">사이드상품추가</button>
	  
	  <form action="/beverage/remove" method="post" id="rmForm">
	  	<input type="hidden" name="bno">
	  </form>
	  
<script>
$(function() {
	
	$(document).on("click",".del-btn", function(e) {
		e.preventDefault();
		let bno_val = $(this).closest("tr").find("td").eq(0).text();
		console.log(bno_val);
		$("#rmForm > input[name=bno]").val(bno_val);
		$("#rmForm").submit();
		});
	
	$("#regBeverBtn").on("click", function(e) {
		e.preventDefault();
		let bevername_val = $("#beverRegName").val();
		let beverprice_val = $("#beverRegPrice").val();
		$.ajax({
			url: "/beverage/register",
			type: "post",
			data: {bname: bevername_val, bprice: beverprice_val}
		}).done(function(result) {
			if(parseInt(result)==1){
				alert("등록됐습니다.");
				location.href = "/beverage/list";
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