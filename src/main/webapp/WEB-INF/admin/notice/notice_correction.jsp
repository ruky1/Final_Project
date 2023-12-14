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
<%
    // "num" 파라미터 값 가져오기
    String numParam = request.getParameter("num");

    // "num" 파라미터 값이 비어있지 않은 경우에만 작업 수행
    if (numParam != null && !numParam.isEmpty()) {
        // "num" 파라미터 값을 정수로 변환
        int numValue = Integer.parseInt(numParam);

        // 여기에 "numValue"를 사용하여 필요한 작업을 수행
        // 예를 들어, 해당 "num"에 해당하는 공지사항을 조회하거나 다양한 동적 작업 수행
%>
        <button class="check123 btn btn-outline-info" value="<%= numValue %>">수정</button>
        <input id="modalcheck" type="hidden" value=<%= numValue %>>
        <!-- 여기에 추가적인 내용을 표시하거나 작업 수행 -->


    <!-- 모달 창 -->
    <div id="myModal<%= numValue %>" class="modal">
        <div class="modal-content" style="width: 50%;">
        <span class="close" id="closeModal<%= numValue %>">&times;</span>
            <form action="a_notice_update" method="post">
		<table id="n_table" class="table table-bordered">
			<caption align="top"><b>공지사항 수정</b></caption>
			<tr>
				<th>이메일</th>
				<td>
					<input type="hidden" name="n_id" value="" class="n_id">
					<input type="hidden" name="n_num" value="" class="n_num">
					<input type="email" name="subject" class="n_email form-control"
					required="required" autofocus="autofocus" value="" readonly> 
				</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>
					<input type="text" name="n_name" class="n_name form-control"
					required="required" autofocus="autofocus" value="" readonly> 
				</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>
					<input type="text" name="n_title" value="" class="n_title form-control">
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<textarea name="n_content" class="n_content form-control"
					required="required" autofocus="autofocus" value="" style="height: 300px;"> </textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="submit" class="btn btn-outline-success">수정</button>
				</td>
			</tr>
		</table>
	</form>
        </div>
    </div>
<%
    }
%>
<script type="text/javascript">

    $(".check123").click(function(){
    	var num = $(this).val();
    	
    	
    	document.getElementById('myModal'+num).style.display = 'block';
    	
    	document.getElementById('closeModal'+num).addEventListener('click', function() {
        	document.getElementById('myModal'+num).style.display = 'none';
    	});
    	window.addEventListener('click', function(event) {
        	if (event.target === document.getElementById('myModal'+num)) {
            	document.getElementById('myModal'+num).style.display = 'none';
        	}
    	});
    	
    	$.ajax({
			type:"get",
			url:"a_notice_num",
			dataType:"json",
			data:{"num":num},
			success:function(res){
				$('.n_id').val(res.n_id);
				$('.n_email').val(res.n_email);
				$('.n_name').val(res.n_name);
				$('.n_title').val(res.n_title);
				$('.n_content').val(res.n_content);
				$('.n_num').val(res.n_num);
			}
		});
    });


	

</script>

</body>
</html>