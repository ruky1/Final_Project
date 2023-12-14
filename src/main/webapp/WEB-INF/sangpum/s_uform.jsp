<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Gamja+Flower&family=Nanum+Pen+Script&family=Noto+Serif+KR:wght@200&display=swap"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
</head>
<body>
	<section class="py-3">
		<div
			class="row gx-5 gx-lg-6 row-cols-3 cols-md-6 justify-content-center">
			<h3>상품정보 입력</h3>
		</div>
		<div
			class="row gx-5 gx-lg-6 row-cols-3 cols-md-6 justify-content-center">
			<form action="sangupdate" method="post" enctype="multipart/form-data">
				<input type="hidden" name="j_sangid" value="${dto.j_sangid }">
				<input type="hidden" name="member_id" value="${sessionScope.myid }">
				<input type="hidden" name="member_name"
					value="${sessionScope.myname }"> <input type="hidden"
					name="member_hp" value="${sessionScope.myhp }">
				<div class=form-control>
					<%-- <div class="Product_category">
						<div>카테고리</div>
						<div class="insert_content">
							<select name="j_category" class="form-control">
								<c:forEach var="category"
									items="${['mobile', 'digital', 'computer', 'camera', 'leisure', 'w_clothing', 'm_clothing', 'c_clothing', 'beauty', 'food', 'hobby', 'c_goods', 'h_goods', 'm_goods', 'cm_goods', 'interior', 'pet', 'etc']}">
									<option value="${category}"
										${dto.j_category eq category ? 'selected' : ''}>${category}</option>
								</c:forEach>
							</select>

						</div>
					</div> --%>
					<div class="Product_title">
						<div>상품명</div>
						<div class="insert_content">
							<input type="text" name="j_title" class="form-control"
								placeholder="판매할 상품명을 입력해주세요" required="required"
								value="${dto.j_title}">
						</div>
					</div>
					<div class="Product_price">
						<div>판매금액</div>
						<div class="insert_content">
							<input type="number" name="j_price" class="form-control"
								placeholder="금액을 입력해주세요" required="required"
								value="${dto.j_price}">
						</div>
					</div>
					<div class="Product_file">
						<div>사진</div>
						<div class="insert_content">
							<input type="file" name="j_file" class="form-control"
								multiple="multiple">
						</div>
					</div>
					<div class="Product_name">
						<div>주소</div>
						<div class="insert_content">
							<input type="text" readonly="readonly" name="j_addr"
								class="form-control" value="${dto.j_addr}">
							<!-- <input type="text" name="j_title" class="form-control" placeholder="상품명을 입력해주세요"
								required="required"> -->
						</div>
					</div>
					<div class="Product_content">
						<textarea name="j_explanation" class="form-control">${dto.j_explanation}</textarea>
					</div>
					<hr>
					<div align="center">
						<button type="submit" class="btn btn-outline-dark mt-auto"
							style="width: 150px;">수정</button>
						<button type="button" onclick="location.href=''"
							style="width: 150px;" class="btn btn-outline-dark mt-auto">미리보기</button>
						<!-- <button type="button" onclick="location.href='/'"
							style="width: 150px;" class="btn btn-outline-dark mt-auto">목록으로 이동</button> -->
					</div>
				</div>
			</form>
		</div>
	</section>
</body>
</html>