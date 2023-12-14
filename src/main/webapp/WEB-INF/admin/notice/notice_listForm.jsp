<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Gaegu:wght@300&family=Nanum+Pen+Script&family=Sunflower:wght@300&display=swap" rel="stylesheet">
<link href="../../css/admin_notice.css" rel="stylesheet" />
<link rel="stylesheet" href="../../css/notice_styles.css">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
</head>
<body>

 <div><jsp:include page="notice_addForm.jsp"/></div>
	
	<section class="notice">
  <div class="page-title">
        <div class="container">
            <h3>공지사항</h3>
        </div>
    </div>

    <!-- board seach area -->
    <div id="board-search">
        <div class="container">
            <div class="search-window">
                <form action="">
                    <div class="search-wrap">
                        <label for="search" class="blind">공지사항 내용 검색</label>
                        <input id="search" type="search" name="" placeholder="검색어를 입력해주세요." value="">
                        <button type="submit" class="btn btn-dark">검색</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
   
  <!-- board list area -->
    <div id="board-list">
        <div class="container">
            <table class="board-table">
                <thead>
                <tr>
                    <th scope="col" class="th-num">번호</th>
                    <th scope="col" class="th-title">제목</th>
                    <th>작성자</th>
                    <th scope="col" class="th-date">등록일</th>
                    <th>수정/삭제</th>
                </tr>
                </thead>
                <tbody>
                <c:if test="${totalCount>0 }">
                <c:forEach var="n_dto" items="${list }" varStatus="i">
                <tr>
                    <td>${i.count }</td>
                    <th><jsp:include page="notice_detail.jsp">
						<jsp:param value="${n_dto.n_num }" name="num"/>
						<jsp:param value="${n_dto.n_title }" name="title"/>
					</jsp:include></th>
                    <td>${n_dto.n_name }</td>
                    <td><fmt:formatDate value="${n_dto.n_registration_date }" pattern="yyyy-MM-dd HH:mm"/></td>
                    <td align="center">
					<jsp:include page="notice_correction.jsp">
						<jsp:param value="${n_dto.n_num }" name="num"/>
					</jsp:include>
					<button type="button" class="n_del btn btn-outline-danger" num="${n_dto.n_num }" >삭제</button>
					</td>
                </tr>
                </c:forEach>
                </c:if>
                </tbody>
            </table>
            <!-- 페이지번호 출력 -->
	<c:if test="${totalCount>0 }">
		<div style=" text-align: center;">
			<ul class="pagination justify-content-center">
				<!-- 이전 -->
				<c:if test="${startPage>1 }">
					<li class="page-item"><a
						href="notice?currentPage=${startPage-1 }"></a></li>
				</c:if>
				<c:forEach var="pp" begin="${startPage }" end="${endPage }">
					<c:if test="${currentPage==pp }">
						<li class="page-item active"><a class="page-link"
							href="notice?currentPage=${pp }">${pp }</a></li>
					</c:if>
					<c:if test="${currentPage!=pp }">
						<li class="page-item"><a class="page-link"
							href="notice?currentPage=${pp }">${pp }</a></li>
					</c:if>
				</c:forEach>


				<!-- 다음 -->
				<c:if test="${endPage<totalPage }">
					<li class="page-item "><a class="page-link"
						href="notice.jsp?currentPage=${ endPage+1}>">다음</a></li>
				</c:if>
			</ul>
		</div>
	</c:if>
        </div>
    </div>

</section>
<script type="text/javascript">
	
	$(".n_del").click(function(){
		var num=$(this).attr("num");
		 var isConfirmed = confirm("삭제하시겠습니까?");
		if(isConfirmed){
			location.href="notice_delete?num="+num;
		}
		
	});
</script>
	
</body>
</html>