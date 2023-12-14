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
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
</head>
<body>

<!-- 모달 트리거 버튼 -->
    <button class="btn btn-outline-success" style="position: absolute; right: 10%;" id="modalButton">공지사항 추가</button>

    <!-- 모달 창 -->
    <div id="myModal" class="modal">
        <div class="modal-content" style="width: 50%;">
        <span class="close" id="closeModal">&times;</span>
            <form action="a_notice_insert" method="post">
		<table id="n_table" class="table table-bordered">
			<caption align="top"><b>공지사항 글쓰기</b></caption>
			<tr>
				<th>이메일</th>
				<td>
					<input type="hidden" name="n_id" value="${sessionScope.a_id }">
					<input type="email" name="subject" class="form-control"
					required="required" autofocus="autofocus" value="${sessionScope.a_email }" readonly> 
				</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>
					<input type="text" name="n_name" class="form-control"
					required="required" autofocus="autofocus" value="${sessionScope.a_name}" readonly> 
				</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>
					<input type="text" name="n_title" class="form-control">
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<textarea name="n_content" class="form-control"
					required="required" autofocus="autofocus" style="height: 300px;"> </textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="submit" class="btn btn-outline-success">등록</button>
				</td>
			</tr>
		</table>
	</form>
        </div>
    </div>

    
<script type="text/javascript">
//script.js
document.getElementById('modalButton').addEventListener('click', function() {
    document.getElementById('myModal').style.display = 'block';
});

document.getElementById('closeModal').addEventListener('click', function() {
    document.getElementById('myModal').style.display = 'none';
});

window.addEventListener('click', function(event) {
    if (event.target === document.getElementById('myModal')) {
        document.getElementById('myModal').style.display = 'none';
    }
});

</script>

</body>
</html>