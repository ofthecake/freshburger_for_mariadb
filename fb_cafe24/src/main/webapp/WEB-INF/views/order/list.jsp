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
                <h2 class="head-title wow fadeInUp">판매 내역</h2>
              </div>
            </div>
          </div>
        </div>
      </div>

<div style="margin-top: 120px; margin-bottom: 120px; text-align: center;">
	<div class="form-group float-left ml-3">
		<form action="/order/list" class="form-inline">
			<select class="form-control" name="range">
				<option value="">전체</option>
				<option value="n">주문번호</option>
				<option value="i">아이디</option>
				<option value="s">판매일시</option>
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
	        <th>주문번호</th>
	        <th>아이디</th>
	        <th>판매일시</th>
	        <th></th>
	      </tr>
	    </thead>
	    <tbody>
	    <c:forEach items="${list }" var="ovo">
	      <tr>
	        <td>${ovo.ordernum }</td>
	        <td>${ovo.id }</td>
	        <td>${ovo.saledate }</td>
	        <td>
        	  <button type="button" data-menu="${ovo.menu }" data-toggle="modal" data-target="#orderModal" class="btn btn-common">구매내역</button>
            </td>
	      </tr>
           <!-- 구매내역모달 -->
		    <div class="modal fade" id="orderModal" data-backdrop="static">
			  <div class="modal-dialog modal-dialog-centered">
			    <div class="modal-content">
			      <!-- Modal body -->
			      <div class="modal-body" style="text-align: center">
			      	<p id="modalText"></p>
			      </div>
			      <!-- Modal footer -->
			      <div class="modal-footer">
			        <button type="button" id="closeBtn" class="btn btn-danger" data-dismiss="modal">확인</button>
			      </div>	
			    </div>
			  </div>
			</div>
			<!--구매내역모달  끝-->
	    </c:forEach>
	    <script>
			$('#orderModal').on('show.bs.modal', function (e) {
				var menu = $(e.relatedTarget).data('menu');
				$('#modalText').html(menu);			    
			});
		</script>
	    </tbody>
		<tfoot>
	    	<tr>
	    		<td colspan="5">
	    			<jsp:include page="../common/pagingOrder.jsp"/>
	    		</td>
	    	</tr>
	    </tfoot>
	  </table>
		</c:when>
		<c:otherwise>
			<script>
				alert("관리자 로그인이 필요한 페이지 입니다!");
				location.replace("/");
			</script>
		</c:otherwise>
	</c:choose>
</div>
  

<jsp:include page="../common/footer.jsp" />