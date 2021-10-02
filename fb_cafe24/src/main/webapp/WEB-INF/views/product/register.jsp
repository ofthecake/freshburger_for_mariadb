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
             <h2 class="head-title wow fadeInUp">상품 등록</h2>
           </div>
         </div>
       </div>
     </div>
   </div>

	  <c:choose>
		<c:when test="${ses.mtype gt 1 }">
		  	<form action="/product/register" method="post" enctype="multipart/form-data"
		  	  style="margin-top: 120px; margin-bottom: 120px; text-align: center; display: grid; place-items: center;">
		  	  <div style="border: thick dotted red; width: 70%;">
				<div class="form-group" style=" margin-top: 50px;">
			      <label for="productName">Product Category:</label>
			      <select id="cno" name="cno" class="form-control" style="width: 40%; display: inline-block;" >
			        <c:choose>
			          <c:when test="${list.size() ne 0 }">
			      	    <c:forEach items="${list }" var="cvo">
			      	 	  <option value="${cvo.cno }" >${cvo.cno }. ${cvo.cname }</option>
			      	    </c:forEach>
			      	  </c:when>
			      	  <c:otherwise>
			      	    <option >카테고리가 없습니다.</option>
			      	  </c:otherwise>
			        </c:choose>
				  </select>
			    </div>
			    <button type="button" class="btn btn-common btn-sm" data-toggle="modal" data-target="#categoryModal" id="ctAddBtn" style="margin-bottom: 50px;">카테고리 추가</button>
			    <div class="form-group">
			      <label for="productName">상품 이름:</label>
			      <input type="text" class="form-control" id="pname" placeholder="Enter Product Name" name="pname" style="width: 40%; display: inline-block;" required>
			    </div>
			    <div class="form-group">
			      <label for="productPrice">상품 가격:</label>
			      <input type="number" class="form-control" id="pprice" placeholder="Enter Product Price" name="pprice" style="width: 40%; display: inline-block;" required>
			    </div>
			    <div class="form-group">
			      <label for="productDesc">상품 설명:</label>
			      <textarea class="form-control" id="pdesc" placeholder="Enter Product Desc" name="pdesc" style="width: 40%; display: inline-block;" rows="2" cols="50" required></textarea>
			    </div>
			    <div class="form-group">
			      <label for="productImage">상품 사진:</label>
			      <input type="file" class="form-control" id="files" name="files" style="display: none;">
			      <button type="button" id="fileTrigger" class="btn btn-info">이미지첨부</button>
			    </div>
   			    <div class="form-group">
					<ul class="list-group" id="fileZone"></ul>
				</div>
			    <div class="form-group">
			      <label for="editer">편집자:</label>
			      <input type="text" class="form-control" value="${ses.mname }" id="mname" placeholder="Enter Product Desc" name="mname" style="width: 40%; display: inline-block;" readonly required>
			    </div>
			    <button type="submit" class="btn btn-common" style="margin-bottom: 50px;" >상품등록</button>
			    </div>
			  </form>
			  
			  <!-- 카테고리등록 클릭시 모달 -->
			  <div class="modal fade" id="categoryModal" data-backdrop="static">
			    <div class="modal-dialog modal-dialog-centered">
			      <div class="modal-content">
				    <div class="modal-body" style="text-align: center">
				    <label for="category">카테고리 추가:</label>
	  			    <input type="text" class="form-control" id="categoryName" placeholder="Enter C.N." name="categoryName" style="width: 80%; display: inline-block;" required>
		   		    </div>
				    <div class="modal-footer">
				      <button type="button" id="categoryAddBtn" class="btn btn-common">등록</button>
					  <button type="button" id="closeBtn" class="btn btn-dark" data-dismiss="modal">취소</button>
					</div>
			      </div>
			    </div>	
			  </div>
			  <!-- 카테고리등록 클릭시 모달 끝 -->
			  
		 </c:when>
		   <c:otherwise>
		  	  <script>
				alert("관리자 로그인이 필요한 페이지 입니다!");
				location.replace("/");
			  </script>
		   </c:otherwise>
	  </c:choose>
	  
<script>
$(function() {
	
	$("#categoryAddBtn").on("click", function(e) {
		e.preventDefault();
		let cname_val = $("#categoryName").val();
		$.ajax({
			url: "/category/register",
			type: "post",
			data: {cname: cname_val}
		}).done(function(result) {
			if(parseInt(result)==1){				
				$("#categoryModal").modal("hide");
				alert("카테고리 등록 성공.");
				location.href = "register";
			}else{
				alert("카테고리 등록 실패.");
			}
		});
	});
	
	$("#fileTrigger").on("click", function(e) {
		$("#files").click();
	});
	
});

let regExp = new RegExp("\.(exe|sh|bat|js|msi|dll)$");
let maxSize = 1048576; // 1MB

function fileValidation(fname, fsize){
	if(regExp.test(fname)){
		alert(fname + "는 허용되지 않는 파일 형식입니다!");
		return false;
	}else if(fsize > maxSize){
		alert("1MB 이하의 파일만 허용됩니다!");
		return false;
	}else{
		return true;
	}
	
}

$(document).on("change", "#files", function() {
	$("button[type=submit]").attr("disabled", false);
	let formObj = $("#files");
	let fileObjs = formObj[0].files;
	let fileZone = $("#fileZone");
	fileZone.html("");
	
	for (let fobj of fileObjs) {
		let li = '<li class="list-group-item d-flex justify-content-between align-items-center">';
		if(fileValidation(fobj.name, fobj.size)){
			// 정상출력
			li += fobj.name + '<span class="badge badge-success badge-pill">';
		}else{
			// 경고출력 후 서브밋 버튼 비활성화
			li += '<i class="fa fa-times-rectangle" style="font-size:24px;color:red"></i>';
			li += fobj.name + '<span class="badge badge-danger badge-pill">';
			$("button[type=submit]").attr("disabled", true);
		}
		li += fobj.size +' Byte</span></li>';
		fileZone.append(li);
	}
});
</script>
<jsp:include page="../common/footer.jsp" />