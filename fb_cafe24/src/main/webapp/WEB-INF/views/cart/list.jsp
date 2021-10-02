<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/nav.jsp" />

<c:choose>
  <c:when test="${ses.id eq id }">

  <div id="hero-area" class="hero-area-bg" style=" margin-bottom: 50px;">
     <div class="overlay"></div>
     <div class="container">
       <div class="row">
         <div class="col-md-12 col-sm-12">
           <div class="contents text-center">
             <h2 class="head-title wow fadeInUp">장바구니</h2>
           </div>
         </div>
       </div>
     </div>
   </div>
   
  <form id="formOrder" action="/order/result" method="post" style="margin-top: 120px; margin-bottom: 120px; text-align: center;">
  	<input style="display: none" name="id" value="${ses.id }">
  	<input style="display: none" id="amount" name="amount" value="">
  	<input style="display: none" id="menuTotal" name="menuTotal" value="">   
	    <c:choose>
	      <c:when test="${list.size() ne 0 }">
	        <c:forEach items="${list }" var="ctvo">
	          <c:forEach items="${plist }" var="pvo">
	            <c:if test="${ctvo.pno eq pvo.pno }">
	              <div class="container-fluid" style="border: thick dotted red; overflow: hidden;">
		              <c:forEach items="${flist }" var="fvo">
		                <c:if test="${ctvo.pno eq fvo.pno }">
		                  <div class="float-left" style="margin-top: 5%">
			    	        <img src="/upload/${fvo.savedir }/${fvo.uuid}_th_${fvo.fname}" alt="Card image" style="height:100%;">
			    	      </div>
		                </c:if>
		              </c:forEach>
		    	      <div class="input-group mb-3" style="width: 40%; margin-left: 35%">
				        <h4 style="margin-top: 50px; width: 100%">상품</h4>
				          <h5 style="margin-left: 30%; margin-top: 20px">${pvo.pname }</h5>
				          <h5 style="margin-left: 40px; margin-top: 20px">${pvo.pprice }원</h5>

			            <!-- 추가사항 -->
			            <c:if test="${ctvo.sno ne 0}">
				          <h4 style="width: 100%; margin-top: 20px">추가사항</h4>
				          <c:forEach items="${slist }" var="svo">
				            <c:if test="${ctvo.sno eq svo.sno}">
				            <h5 style="margin-left: 35%; margin-top: 20px">${svo.sname }</h5>
				            <h5 style="margin-left: 40px; margin-top: 20px">+${svo.sprice }원</h5>
				            </c:if>
				          </c:forEach>
				          <c:forEach items="${blist }" var="bvo">
				            <c:if test="${ctvo.bno eq bvo.bno}">
				              <h5 style="margin-left: 35%; margin-top: 20px">${bvo.bname }</h5>
				              <h5 style="margin-left: 40px; margin-top: 20px">+${bvo.bprice }원</h5>
				            </c:if>
				          </c:forEach>
				          
			            </c:if>
			            <!-- 추가사항  끝-->
			            <h2 style="margin-top: 50px; width: 100%; margin-top: 20px">총 금액</h2>
			            <h5 style="width: 100%; margin-top: 20px">${ctvo.total }원</h5>
				      </div>
				      <div class="float-right" style="margin-bottom: 3%">
				        <button id="delOne" data-ctno="${ctvo.ctno }" type="button" class="btn btn-warning btn-lg">장바구니에서 제거</button>
				      </div>
			      </div>
	            </c:if>
		      </c:forEach>
	        </c:forEach>
	      
	        <div style="margin-top: 50px;">
	          <h1>총 금액: ${sum }원</h1>
	    	</div>
	    	<div style="width: 100%">
	    	  <button type="button" class="btn btn-common btn-lg" data-toggle="modal" data-target="#payModal" style="margin-top: 50px; width: 80%">결제하기</button>
	    	</div>
		    <button id="clearBtn" data-id="${ses.id }" type="button" class="btn btn-dark btn-lg" style="margin-top: 30px">장바구니 메뉴 전체 삭제</button>
	      </c:when>
	      
	      <c:otherwise>
	      	<div class="container-fluid" style="overflow: hidden;">
	      	  <h4>장바구니가 비었습니다.</h4>
	      	</div>
	      </c:otherwise>
	    </c:choose>
	  </form>
	  <!-- 로그인 클릭시 모달 -->
	    <div class="modal fade" id="payModal" data-backdrop="static">
		  <div class="modal-dialog modal-dialog-centered">
		    <div class="modal-content">
		      <!-- Modal body -->
		      <div class="modal-body" style="text-align: center">
		      	<h4 style="text-decoration: underline; text-underline-position:under; margin-top: 30px" >메뉴 총 금액</h4>
		      	<h3 id="payTotal">${sum }원</h3>
		      	<p><i>메뉴 총 금액의 5%가 적립됩니다.</i></p>
		      	<h4 style="text-decoration: underline; text-underline-position:under; margin-top: 30px" >보유 포인트</h4>
		      	<h3 id="ownPoint">${ses.mpoint }원</h3>
		      	<div class="input-group mb-3" style="margin-top: 30px">
				  <input id="payPoint" min="0" max="${ses.mpoint }" type="number" class="form-control" placeholder="사용할 포인트를 입력하세요(기본:0원)">
				  <div class="input-group-append" >
				    <button id="pointBtn" class="btn btn-common" type="button">포인트사용</button>
				  </div>
				</div>
		      	<h4 style="text-decoration: underline; text-underline-position:under; margin-top: 30px" >결제 할 금액</h4>
		      	<h3 id="payReal">${sum }원</h3>
		      </div>
		      <!-- Modal footer -->
		      <div class="modal-footer">
		      	<button type="button" id="payBtn" class="btn btn-common btn-lg">결제하기</button>
		        <button type="button" class="btn btn-dark btn-lg" data-dismiss="modal">돌아가기</button>
		      </div>	
		    </div>
		  </div>
		</div>
	  <!-- 로그인 클릭시 모달  끝-->
    </c:when>
    <c:otherwise>
    <script>    
      alert("잘못된 접근 방식입니다.")
      location.href = "/";    
      </script>
    </c:otherwise>
	</c:choose>
<script>
 	$(function() {
 		
 		$(document).on("click", ".btn-warning", function(){
			let ctno_obj = $(this);
			console.log("ctno_obj= "+ctno_obj);
			let ctno_val = ctno_obj.data("ctno");
			console.log("ctno_val= "+ctno_val);
			$.ajax({
				url: "/cart/removeOne",
				type: "post",
				data: {ctno: ctno_val}
			}).done(function(result){
				if(parseInt(result)==1){
					alert("장바구니에서 삭제됐습니다.");
					location.reload(true);
				}else{
					alert("장바구니 삭제 실패.");
					location.reload(true);
				}
			})
		});
 		
 		$(document).on("click", "#clearBtn", function(){
			let id_obj = $(this)
			let id_val = id_obj.data("id");
			$.ajax({
				url: "/cart/removeAll",
				type: "post",
				data: {id: id_val}
			}).done(function(result){
				if(parseInt(result)==1){
					alert("장바구니가 비었습니다.");
					location.href = "/product/list?cno=1";
				}else{
					alert("장바구니 삭제 실패.");
					location.reload(true);
				}
			})
		});
 		
 		$("#payPoint").on("change keyup paste", function (){
 			console.log("ctno_val= ");
 			var ownpoint_val = parseInt($("#ownPoint").html());
 			var usepoint_val = $("#payPoint").val();
 			var paytotal_val = $("#payTotal").html(); 
 			paytotal_val = parseInt(paytotal_val.slice(0, -1));
 			
 			if(usepoint_val > ownpoint_val){
 				alert("보유포인트가 부족합니다.");
 				$("#payPoint").val(0);
 			}else if(usepoint_val < 0){
 				alert("잘못된 값입니다.");
 				$("#payPoint").val(0);
 			}else if(usepoint_val > paytotal_val) {
 				alert("금액을 초과할 수 없습니다.");
 				$("#payPoint").val(0);
 			}
    	});
 		
 		$("#pointBtn").on("click", function(e) {
 			e.preventDefault();
 			var paytotal_val = $("#payTotal").html(); 
 			paytotal_val = parseInt(paytotal_val.slice(0, -1));
 			/* var paytotal_val = parseInt( $("#payTotal").html() ); */
 			var paypoint_val = $("#payPoint").val();
 			$("#payReal").html(paytotal_val-paypoint_val+"원");
 		});	
 		
 		$("#payBtn").on("click", function(e) {
 			e.preventDefault();
 			var paytotal_val = $("#payTotal").html();
 			paytotal_val = paytotal_val.slice(0, -1);
 			var amount_val = $("#payReal").html();
 			amount_val = amount_val.slice(0, -1);
 			$("#amount").val(amount_val);
 			$("#menuTotal").val(paytotal_val);
 			$("#formOrder").submit();
 		});	
 		
 		
	}); 
	
</script>
<jsp:include page="../common/footer.jsp" />