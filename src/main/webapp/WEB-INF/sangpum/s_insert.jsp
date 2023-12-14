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
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
			<form action="insert" method="post" enctype="multipart/form-data">
				<input type="hidden" name="member_id" value="${sessionScope.myid }">
				<input type="hidden" name="member_name" value="${sessionScope.myname }">
				<input type="hidden" name="member_hp" value="${sessionScope.myhp }">
				<div class=form-control>
					<div class="Product_category">
						<div>카테고리</div>
						<div class="insert_content">
							<select name="j_category" class="form-control">
								<option value="mobile">모바일</option>
								<option value="digital">디지털</option>
								<option value="computer">컴퓨터/주변기기</option>
								<option value="camera">전자제품/카메라</option>
								<option value="leisure">스포츠/레저</option>
								<option value="w_clothing">여성의류</option>		<!-- women's clothing -->
								<option value="m_clothing">남성의류</option>		<!-- men's clothing -->
								<option value="c_clothing">아동의류</option>		<!-- children's clothing -->
								<option value="beauty">뷰티/미용</option>
								<option value="food">식품</option>
								<option value="hobby">취미</option>
								<option value="c_goods ">굿즈/수집품</option>		<!-- Collectible_goods -->
								<option value="h_goods">생활용품</option>			<!-- Household_goods -->
								<option value="m_goods">잡화용품</option>			<!-- miscellaneous goods -->
								<option value="cm_goods">아동잡화</option>			<!-- Children's miscellaneous goods -->								
								<option value="interior">가구/인테리어</option>
								<option value="pet">반려동/식물</option>
								<option value="etc">기타</option>
							</select>
						</div>
					</div>
					<div class="Product_title">
						<div>상품명		</div>
						<div class="insert_content">
							<input type="text" name="j_title" class="form-control" placeholder="판매할 상품명을 입력해주세요"
								required="required">
						</div>					
					</div>	
					<div class="Product_price">
						<div>판매금액	</div>
						<div class="insert_content">
							<input type="number" name="j_price" class="form-control" placeholder="금액을 입력해주세요"
								required="required">
						</div>
					</div>					
					<div class="Product_file">
						<div>사진</div>
						<div class="insert_content">
							<input type="file" name="j_file" class="form-control" multiple="multiple">
						</div>
					</div>
					<div class="Product_name">
						<div>주소	</div>
						<div class="insert_content">
							<div class="insert_addr_area">
								<input type="text" class="postcode form-control" id="sample6_postcode" placeholder="우편번호" style="width: width: 4vw;">
								<input type="button" class="postcode_btn form-control" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" style="background-color: #D3D3D3; width: 8vw;"><br>
							</div>
							<input type="text" readonly="readonly"  name="j_addr" class="form-control" id="sample6_address" placeholder="주소" required="required"><br>
							<input type="hidden" id="sample6_detailAddress" placeholder="상세주소">
							<input type="hidden" id="sample6_extraAddress" placeholder="참고항목">
						</div>
					</div>		
					<div class="Product_content">
						<textarea name="j_explanation" class="form-control"></textarea>
					</div>
					<hr>
					<div align="center">
						<button type="submit" class="btn btn-outline-dark mt-auto" style="width: 150px;">저장</button>
						<!-- <button type="button" onclick="location.href=''"
							style="width: 150px;" class="btn btn-outline-dark mt-auto">미리보기</button> -->
						<!-- <button type="button" onclick="location.href='/'"
							style="width: 150px;" class="btn btn-outline-dark mt-auto">목록으로 이동</button> -->	
					</div>
				</div>
			</form>
		</div>
	</section>
</body>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
</html>