<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Title</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
</head>
<script>
	function deleteRow(idx){
		if(confirm("정말로 삭제하시겠습니까?")){
			location.href="delete.do?idx="+idx;
		}
	}
</script>
<body>
<div class="container">
	<h3 class="text-center">방명록(한줄게시판)</h3>
	
	<!-- 검색 기능 처리 -->
	<div class="text-center">
	<form method="get">
		<select name="searchField">
			<option value="contents">내용</option>
			<option value="name">작성자</option>
		</select>
		<input type="text" name="searchTxt" />
		<input type="submit" value="검색" />
	</form>
	</div>
	
	
	<!-- 글쓰기 버튼 및 로그인/로그아웃 버튼 -->
	<div class="text-right">
		<!-- 
			EL의 내장객체인 sessionScope를 통해 세션영역에
			저장된 속성이 있는지 확인함.
			단, 영역에 저장된 속성명이 유일할 경우 내장객체는
			생략할 수 있으므로 필수사항은 아니다.
		 -->
		<c:choose>
			<c:when test="${not empty sessionScope.siteUserInfo }">
				<!-- 세션영역에 속성이 있을 떄, 즉 로그인 되었을 때 -->
				<button class="btn btn-danger" onclick="location.href='logout.do';">
					로그아웃
				</button>
			</c:when>
			<c:otherwise>
				<!-- 로그인되지 않았을 때 -->
				<button class="btn btn-info" onclick="location.href='login.do';">
					로그인
				</button>
			</c:otherwise>
		</c:choose>
		&nbsp;&nbsp;
		<button class="btn btn-success" onclick="location.href='write.do';">
			방명록쓰기
		</button>
	</div>
	
	
	
	
	<!-- 방명록 반복 부분 s -->
	<c:forEach items="${lists }" var="row">		
		<div class="border mt-2 mb-2">
			<div class="media">
				<div class="media-left mr-3">
					<img src="../images/img_avatar3.png" class="media-object" style="width:60px">
				</div>
				<div class="media-body">
					<h4 class="media-heading">작성자:${row.name }(${row.id })</h4>
					<p>${row.contents }</p>
				</div>	  
				<!--  수정,삭제버튼 -->
				<div class="media-right">
					<!-- 작성자 본인만 수정/삭제 버튼 노출 -->
					<c:if test="${sessionScope.siteUserInfo.id eq row.id }">
						<button class="btn btn-primary" 
							onclick="location.href='modify.do?idx=${row.idx}';">
							수정
						</button>
						<!-- 삭제 버튼 누르면 idx값을 JS함수로 전달 -->
						<button class="btn btn-danger" 
							onclick="javascript:deleteRow(${row.idx });">
							삭제
						</button>
					</c:if>
				</div>
			</div>
		</div>
	</c:forEach>
	
	<!-- 방명록 반복 부분 e -->
	<ul class="pagination justify-content-center">
		${pagingImg }
	</ul>
</div>

</body>
</html>