<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/nav.jsp" />

<%-- <c:choose> 
  <c:when test="${ses.mtype gt 1 }"> --%>

  <div id="hero-area" class="hero-area-bg" style=" margin-bottom: 50px;">
     <div class="overlay"></div>
     <div class="container">
       <div class="row">
         <div class="col-md-12 col-sm-12">
           <div class="contents text-center">
             <h2 class="head-title wow fadeInUp">주문 완료 됐습니다! 감사합니다!</h2>
           </div>
         </div>
       </div>
     </div>
   </div>
   
  <form action="/" method="post" style="margin-top: 120px; margin-bottom: 120px; display: grid; place-items: center;">	    
  	<div style="border: thick dotted red; width: 70%;">
  	  <div style="width: 100%; height: 200px; margin-top: 50px">
  	    <div style="width: 50%; height: 100%; float: left;">
  	      <h4 style="margin-top: 50px; text-align: center; width: 100%">주문번호</h4>
  	    </div>
  	    <div style="width: 50%; height: 100%; float: right;">
  	      <h4 style="margin-top: 50px; text-align: center; width: 100%">${ovo.ono }</h4>
  	    </div>
  	  </div>
  	  <div style="width: 100%; height: 200px;">
  	    <div style="width: 50%; height: 100%;float: left;">
  	      <h4 style="margin-top: 50px; text-align: center; width: 100%">주문내역</h4>
  	    </div>
  	    <div style="width: 50%; height: 100%; float: right;">
  	        <p>${ovo.menu }</p>  	        
  	    </div>
  	  </div>
  	  <div style="width: 100%; height: 200px;">
  	    <div style="width: 50%; height: 100%;float: left;">
  	      <h4 style="margin-top: 50px; text-align: center; width: 100%">결제금액</h4>
  	    </div>
  	    <div style="width: 50%; height: 100%; float: right;">
  	      <h4 style="margin-top: 50px; text-align: center; width: 100%">${ovo.amount }</h4>
  	    </div>
  	  </div>
  	  

	  
  	  
  	  
  	</div>

<%--     </c:when>
    <c:otherwise>
    <script>    
      alert("잘못된 접근 방식입니다.")
      location.href = "/";    
      </script>
    </c:otherwise>
	</c:choose> --%>
<script>
	
</script>
<jsp:include page="../common/footer.jsp" />