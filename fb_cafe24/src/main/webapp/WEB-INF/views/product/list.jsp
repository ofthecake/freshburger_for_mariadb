<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/nav.jsp" />


	<c:choose>
	  <c:when test="${ses.mtype ge 0 }">
	  
      <div id="hero-area" class="hero-area-bg">
        <div class="overlay"></div>
        <div class="container">
          <div class="row">
            <div class="col-md-12 col-sm-12">
              <div class="contents text-center">
                <h2 class="head-title wow fadeInUp">안녕하세요! ${ses.mnick }님!</h2>
                <p class="fadeInUp  wow" data-wow-delay="0.2s">사용가능한 적립금은  ${ses.mpoint }원입니다.</p>
              </div>
            </div>
          </div>
        </div>
      </div>
      
      <!-- 카테고리선택버튼 -->
      <form action="/product/list">
	    <div style="text-align: center; margin-top: 3%;">
	      <c:choose>
	        <c:when test="${clist.size() ne 0 }">
	          <c:forEach items="${clist }" var="cvo">
	          	<button type="submit" name="cno" value="${cvo.cno }" class="btn btn-common btn-lg" style=" margin-left: 3%; margin-right: 3%">${cvo.cname }</button>
	          </c:forEach>
	        </c:when>
	        <c:otherwise>
	      	<p>카테고리먼저 등록하세요</p>
	        </c:otherwise>
	      </c:choose>
	    </div>
      </form>
      <!-- 카테고리선택버튼  끝 -->
      
      <c:choose>
    	<c:when test="${list.size() ne 0 }">
		    <tbody>
		    
		      
		    
		    <!--상품리스트 시작 -->		    
		    <div id="list-card" class="card-columns" style="text-align: center; margin-top: 3%;">
		      <c:forEach items="${list }" var="pvo">
		        <!--카트 전달용 -->
		      	<form id="form${pvo.pno }" action="/cart/register" method="post">
		      	<input name="id" type="hidden" value="${ses.id }">
		      	<input id="inputPno${pvo.pno }" name="pno" type="hidden" value="${pvo.pno }">
		      	<input id="total${pvo.pno }" name="total" type="hidden" value="${pvo.pprice }">
		      	<input name="pcount" type="hidden" value="1">
		      	<input id="snoOnCart${pvo.pno }" name="sno" type="hidden" value="0">
		      	<input id="bnoOnCart${pvo.pno }" name="bno" type="hidden" value="0">
		      	<!--카트 전달용 끝 -->
		      	
		      	<!-- 제품 카드 시작 -->
				  <div class="card" style="width:400px; margin-top: 8%; margin-bottom: 10%">
				    <c:forEach items="${flist }" var="fvo">				 
				      <c:choose>
				        <c:when test="${pvo.pno eq fvo.pno }">
				    	  <img class="card-img-top" src="/upload/${fvo.savedir }/${fvo.uuid}_th_${fvo.fname}" alt="Card image" style="width:100%">
				        </c:when>				      
				      </c:choose>				  
				    </c:forEach>
				    <div class="card-body">
				      <p class="card-text" style="margin-bottom: 10%">${pvo.pname }</p>
				      <p class="card-text" style="margin-bottom: 10%">${pvo.pdesc }</p>
				      <p id="price${pvo.pno }" class="card-text" style="margin-bottom: 10%" >${pvo.pprice }</p>
				      <c:choose>
				        <c:when test="${pvo.cno eq 1}">
				          <button id="btnForSet" data-pno="${pvo.pno }" data-toggle="modal" data-target="#sideModal" type="button" class="btn btn-common btn-lg" style="width:100%">장바구니 추가</button>
				          <a id="beverBtn" data-pno="${pvo.pno }" data-toggle="modal" data-target="#beverModal" style="display: none"></a>
				          <button type="submit" id="sideBeverDoneBtn${pvo.pno }" class="btn btn-primary btn-lg" style="width:100%; display: none"></button>
		          		    
		          		    <!-- 사이드변경모달 -->
						    <div class="modal fade" id="sideModal" data-backdrop="static">
							  <div class="modal-dialog modal-dialog-centered">
							    <div class="modal-content">
							      <!-- Modal body -->
							      <div class="modal-body" style="text-align: center">
							      	<div id="sideRadioGroup">
						      	      <c:forEach items="${slist }" var="svo">
						      	        <div class="form-check">
									      <label class="form-check-label">
									        <c:if test="${svo.sno ne 1000}"><input type="radio" class="form-check-input" name="optradio" value="${svo.sno}">${svo.sname} +<p id="price${svo.sno}" style="display: inline-block;">${svo.sprice}</p>(추가금액)</c:if>
									      </label>
									    </div>
						      	      </c:forEach>
							      	</div>
							      </div>
							      <!-- Modal footer -->
							      <div class="modal-footer">
							      	<button type="button" id="sideCheckBtn" class="btn btn-danger">선택</button>
							      	<button type="button" id="sideCheckCloseBtn" class="btn btn-danger" data-dismiss="modal">메뉴취소</button>
							      </div>	
							    </div>
							  </div>
							</div>
							<!-- 사이드변경모달  끝-->
							
							<!-- 음료변경모달 -->
						    <div class="modal fade" id="beverModal" data-backdrop="static">
							  <div class="modal-dialog modal-dialog-centered">
							    <div class="modal-content">
							      <!-- Modal body -->
							      <div class="modal-body" style="text-align: center">
							      	<div id="beverRadioGroup">
						      	      <c:forEach items="${blist }" var="bvo">
						      	        <div class="form-check">
									      <label class="form-check-label">
									        <c:if test="${bvo.bno ne 1000}"><input type="radio" class="form-check-input" name="optradio" value="${bvo.bno}" checked>${bvo.bname} +<p id="price${bvo.bno}" style="display: inline-block;">${bvo.bprice}</p>(추가금액)</c:if>
									      </label>
									    </div>
						      	      </c:forEach>
							      	</div>
							      </div>
							      <!-- Modal footer -->
							      <div class="modal-footer">
							      	<button type="button" id="beverCheckBtn" class="btn btn-danger">선택</button>
							      	<button type="button" id="beverCheckCloseBtn" class="btn btn-danger" data-dismiss="modal">메뉴취소</button>
							      </div>	
							    </div>
							  </div>
							</div>
							<!-- 음료변경모달  끝-->
				        </c:when>
				        <c:otherwise>
				          <button type="submit" class="btn btn-common btn-lg" style="width:100%">장바구니 추가</button>
				        </c:otherwise>
				      </c:choose>
				    </div>
				  </div>
			    <!-- 제품 카드 끝 -->
			  	</form>
		      </c:forEach>
		    </div>
		    <!--상품리스트 끝 -->	
		    
<script>
	$(function() {
		
		$('#sideModal').on('show.bs.modal', function (e) {
		    var pno = $(e.relatedTarget).data('pno');
		    console.log(pno);
		    var total = 0; 
		    
		    $("#sideCheckBtn").on("click", function(e) {
				e.preventDefault();
				let pno_val = $("#inputPno"+pno).val();
				let sno_val = $("#sideRadioGroup input:radio:checked").val();
				if(sno_val == null){
					alert("사이드메뉴를 골라주세요.")
				}else{
					$("#snoOnCart"+pno_val).val(sno_val);
					total += parseInt($("#price"+sno_val).html());
					$("#sideModal").modal("hide");
					$("#beverBtn").trigger("click");
				}
			});		
		    
		    $("#beverCheckBtn").on("click", function(e) {
				e.preventDefault();
				let pno_val = $("#inputPno"+pno).val();
				let bno_val = $("#beverRadioGroup input:radio:checked").val();
				if(bno_val == null){
					alert("음료를 골라주세요.")
				}else{
					$("#bnoOnCart"+pno_val).val(bno_val);
					total += parseInt($("#price"+bno_val).html()) + parseInt($("#price"+pno_val).html());
					$("#total"+pno_val).val(total);
					$("#beverModal").modal("hide");
					$("#form"+pno_val).submit();
				}
			});	
		    
		});
	});
</script>
		    
		    
		    </tbody>
    	</c:when>
    	<c:otherwise>
    		<tbody>
    			<tr>
    				<td colspan="5" class="text-center">
    					<h2>등록된 상품이 없습니다!</h2>
    				</td>
    			</tr>
    		</tbody>
    	</c:otherwise>
    </c:choose>
    
    </c:when>
	  <c:otherwise>
	    <script>
	    
	    alert("잘못된 접근 방식입니다.")
	    location.href = "/";
	    
	    </script>
	  </c:otherwise>
	</c:choose>


    
<jsp:include page="../common/footer.jsp" />