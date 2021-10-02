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
             <h2 class="head-title wow fadeInUp">회원가입</h2>
           </div>
         </div>
       </div>
     </div>
   </div>
  
  <form action="/member/register" method="post" style="margin-top: 120px; margin-bottom: 120px; text-align: center; display: grid; place-items: center;">
	  <div style="border: thick dotted red; width: 70%;">
	    <div class="form-group"  style=" margin-top: 50px;">
	      <label for="id">아이디:</label>
	      <input type="text" class="form-control" id="id" placeholder="Enter id" name="id" style="width: 34%; display: inline-block" required>
	      <button type="button" class="btn btn-common btn-sm" id="checkId">중복확인</button>
	    </div>
	    <div class="form-group">
	      <label for="pw">비밀번호:</label>
	      <input type="password" class="form-control" id="pw" placeholder="Enter password" name="pw" style="width: 40%; display: inline-block" required>
	    </div>
	    <div class="form-group">
	      <label for="pw">비밀번호 확인:</label>
	      <input type="password" class="form-control" id="pw2" placeholder="Enter password" name="pw2" style="width: 35%; display: inline-block" required>
	      <span id="succAlert" style="display: none;" >비밀번호가 일치합니다.</span>
	      <span id="failAlert" style="display: none;" >비밀번호가 일치하지 않습니다.</span>
	    </div>
	    <div class="form-group">
	      <label for="name">이름:</label>
	      <input type="text" class="form-control" id="name" placeholder="Enter name" name="mname" style="width: 40%; display: inline-block" required>
	    </div>
	    <div class="form-group">
	      <label for="nickname">닉네임:</label>
	      <input type="text" class="form-control" id="nickname" placeholder="Enter Nickname" name="mnick" style="width: 32%; display: inline-block" required>
	      <button type="button" class="btn btn-common btn-sm" id="checkNickname">중복확인</button>
	    </div>
	    <p>닉네임은 한글 6글자 영어 12글자까지 가능합니다.</p><p id="bytes"></p>
	    <div class="form-group">
	      <label for="birth">생년월일:</label>
	      <input type="text" class="form-control" id="birth" placeholder="Enter birth" name="mbirth" style="width: 40%; display: inline-block" readonly>
	    </div>
	    <div class="form-group">
	      <input style="display: none" type="text" class="form-control" id="memberType" placeholder="Enter birth" name="mtype" value="1" readonly>
	    </div>
	    <button id="subBtn" type="submit" class="btn btn-common" style="margin-bottom: 50px;">회원가입</button>
	  </div>
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
    	
		$("#pw2").focusout(function (){
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
		
		$("#checkId").on("click", function(e) {
			e.preventDefault();
			let id_val = $("#id").val();
			$.ajax({
				url: "/member/checkId",
				type: "post",
				data: {id: id_val}
			}).done(function(result) {
				if(parseInt(result)==0){
					alert("사용 가능한 아이디입니다.");
					$("#pw").focus();
				}else{
					$("#id").val("");
					$("#id").focus();
					alert("중복되는 아이디입니다.");
				}
			});
		});
		
		$("#checkNickname").on("click", function(e) {
			e.preventDefault();
			let nickname_val = $("#nickname").val();
			$.ajax({
				url: "/member/checkNickname",
				type: "post",
				data: {nickname: nickname_val}
			}).done(function(result) {
				if(parseInt(result)==0){
					alert("사용 가능한 닉네임입니다.");
				}else{
					$("#nickname").val("");
					$("#nickname").focus();
					alert("중복되는 닉네임입니다.");
				}
			});
		});
		
			
		
	});
</script>
<jsp:include page="../common/footer.jsp" />