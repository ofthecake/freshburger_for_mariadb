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

<div style="margin-top: 120px; margin-bottom: 120px; text-align: center;">
	<div class="form-group float-left ml-3">
		<form action="/member/list" class="form-inline">
			<select class="form-control" name="range">
				<option value="">전체</option>
				<option value="i">아이디</option>
				<option value="n">이름</option>
				<option value="ni">닉네임</option>
				<option value="r">회원가입일</option>
			</select>
			<input class="form-control" type="text" placeholder="검색어 입력" name="keyword" value="">
			<button type="submit" class="btn btn-common">검색</button>
		</form>
	</div>
	<c:choose>
		<c:when test="${ses.mtype gt 1 }">
		<table class="table table-hover">
	    <thead>
	      <tr>
	        <th>ID</th>
	        <th>Name</th>
	        <th>Nickname</th>
	        <th>Regdate</th>
	        <th></th>
	      </tr>
	    </thead>
	    <tbody>
	    <c:forEach items="${list }" var="mvo">
	      <tr>
	        <td>${mvo.id }</td>
	        <td>${mvo.mname }</td>
	        <td>${mvo.mnick }</td>
	        <td>${mvo.mregdate }</td>
	        <td>
	        	<a href="/member/modify?id=${mvo.id }" 
	        	class="btn btn-warning mod-btn">수정</a>
	        	<button type="button" class="btn btn-dark del-btn">삭제</button>
	        </td>
	      </tr>
	    </c:forEach>      
	    </tbody>
		<tfoot>
	    	<tr>
	    		<td colspan="5">
	    			<jsp:include page="../common/pagingMem.jsp"/>
	    		</td>
	    	</tr>
	    </tfoot>
	  </table>
	  <form action="/member/remove" method="post" id="rmForm">
	  	<input type="hidden" name="id">
	  </form>
	<script>
	$(function() {
		$(document).on("click",".del-btn", function(e) {
			e.preventDefault();
			let id_val = $(this).closest("tr").find("td").eq(0).text();
			$("#rmForm > input[name=id]").val(id_val);
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