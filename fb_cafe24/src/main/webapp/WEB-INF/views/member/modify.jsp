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
             <h2 class="head-title wow fadeInUp">회원 정보 수정</h2>
           </div>
         </div>
       </div>
     </div>
   </div>

<c:choose>
	<c:when test="${ses.id eq mvo.id || ses.mtype gt 1 }">
		<form action="/member/modify" method="post" style="margin-top: 120px; margin-bottom: 120px; text-align: center;">
			<div class="form-group">			
				<label for="id">아이디:</label> <input type="text" class="form-control" 
				id="id" name="id" value="${mvo.id }" style="width: 40%; display: inline-block" readonly>
			</div>
			<div class="form-group">
				<label for="pw">비밀번호:</label> <input type="password" class="form-control" 
				id="pw" name="pw" value="${mvo.pw }" style="width: 40%; display: inline-block" required>
			</div>
			<c:if test="${ses.id eq mvo.id }">
			  <div class="form-group">
		        <label for="pw">비밀번호 확인:</label>
		        <input type="password" class="form-control" id="pw2" placeholder="Enter password" name="pw2" style="width: 35%; display: inline-block" required>
		        <span id="succAlert" style="display: none;" >비밀번호가 일치합니다.</span>
		        <span id="failAlert" style="display: none;" >비밀번호가 일치하지 않습니다.</span>
		      </div>
		    </c:if>
			<div class="form-group">
				<label for="mname">이름:</label> <input type="text" class="form-control" 
				id="name" name="mname" value="${mvo.mname }" style="width: 40%; display: inline-block" required>
			</div>
			<div class="form-group">
				<label for="nickname">닉네임:</label> <input type="text" class="form-control" 
				id="nickname" name="mnick" value="${mvo.mnick }" style="width: 40%; display: inline-block" required>
			</div>
			<p>닉네임은 한글 6글자 영어 12글자까지 가능합니다.</p><p id="bytes"></p>
			<div class="form-group">
				<label for="birth">생년월일:</label> <input type="text" class="form-control" 
				id="birth" name="mbirth" value="${mvo.mbirth }" style="width: 40%; display: inline-block" readonly>
			</div>
			<div class="form-group">
				<label for="regdate">회원가입일:</label> <input type="text" class="form-control" 
				id="regdate" name="mregdate" value="${mvo.mregdate }" style="width: 40%; display: inline-block" readonly>
			</div>
			<div class="form-group">
				<label for="point">보유 포인트:</label> <input type="text" class="form-control"
				id="point" name="mpoint" value="${mvo.mpoint }" style="width: 40%; display: inline-block" readonly>
			</div>
			<c:if test="${ses.mtype gt 1 }">
			 <div class="form-group">
				<label for="point">회원등급:</label> 
				<select class="form-control" id="mtype" name="mtype" style="width: 40%; display: inline-block" >
		          <option value="1">일반 회원</option> <option value="2">FB 직원</option>
		        </select>
			</div>
			</c:if>
			<!-- 세션유지용 member type  -->
<%-- 			<input type="hidden" name="mtype" value="${mvo.mtype }"> --%>
			<button id="subBtn" type="submit" class="btn btn-common" disabled='disabled'>수정완료</button>
			<button type="button" class="btn btn-dark del-btn">회원탈퇴</button>
			
		</form>
		
		<!-- 회원탈퇴용 히든 폼  -->
			<form action="/member/remove" method="post" id="rmForm">
		  	  <input type="hidden" name="delId">
		  	  <input type="hidden" name="mtype" value="${mvo.mtype }">
		    </form>
		
<script>	
		$(function() {
			
			var pattern_num = /[0-9]/;	// 숫자 
	    	var pattern_eng = /[a-zA-Z]/;	// 문자 
	    	var pattern_spc = /[~!@#$%^&*()_+|<>?:{}]/; // 특수문자
	    	var pattern_kor = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/; // 한글체크
	    	
	    	$("#id").keyup(function (){
	    		var str = $("#id").val();
	    		if(!(pattern_spc.test(str)) && !(pattern_kor.test(str))){
					return true
	        	}else{
	        		alert("알파벳과 숫자만 입력가능합니다.")
	        		$("#id").val("");
	        		return false
	        	}
	    	});
	    	
	    	$("#name").keyup(function (){
	    		var str = $("#name").val();
	    		if(!(pattern_spc.test(str)) && !(pattern_num.test(str))){
					return true
	        	}else{
	        		alert("알파벳과 한글만 입력가능합니다.")
	        		$("#name").val("");
	        		return false
	        	}
	    	});
	    	
	    	$("#nickname").keyup(function (){
	    		var str = $("#nickname").val();
	    		$("#bytes").html("현재 닉네임 길이 : "+getTextLength(str));
	    		if(getTextLength(str) >= 13){
	    			alert("글자수 초과.")
	        		$("#nickname").val("");
	        		return false
	    		}
	    		if(!(pattern_spc.test(str))){
					return true
	        	}else{
	        		alert("특수문자 사용이 안됩니다.")
	        		$("#nickname").val("");
	        		return false
	        	}
	    	});
	    	
	    	function getTextLength(str) {
	    	    var len = 0;
	    	    for (var i = 0; i < str.length; i++) {
	    	        if (escape(str.charAt(i)).length == 6) {
	    	            len++;
	    	        }
	    	        len++;
	    	    }
	    	    return len;
	    	}
			
			$("#pw2").keyup(function (){
			  var pw_val = $("#pw").val();
			  var pw2_val = $("#pw2").val();
				if(pw_val == pw2_val){
					$("#failAlert").css('display', 'none');
					$("#succAlert").css('display', 'inline-block');
					$("#subBtn").attr('disabled', false);
				}else{
					$("#succAlert").css('display', 'none');
					$("#failAlert").css('display', 'inline-block');
					$("#subBtn").attr('disabled', true);
				}
			});
			
		 	$(document).on("click",".del-btn", function(e) {
				e.preventDefault();
				let id_val = $("#id").val();
				$("#rmForm > input[name=delId]").val(id_val);
				$("#rmForm").submit();
			});
			
		});
</script>
		
	</c:when>
	<c:otherwise>
		<script>
			alert("권한이 없습니다!");
			location.replace("/");
		</script>
	</c:otherwise>
</c:choose>


<jsp:include page="../common/footer.jsp" />