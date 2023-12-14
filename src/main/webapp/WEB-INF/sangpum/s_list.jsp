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
<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.5.0/kakao.min.js"
  integrity="sha384-kYPsUbBPlktXsY6/oNHSUDZoTX6+YI51f63jCPEIPFP09ttByAdxd2mEjKuhdqn4" crossorigin="anonymous"></script>
  <script>
	Kakao.init('815178a1004a30c81fbcd7151ba42d6b');
</script>
</head>
<body>
	<!-- Section-->
	<section class="py-3">
		<div class="container px-4 px-lg-5 mt-5">
			<!-- 출력방식 설정 -->
			<div class="sort">
				<div class="sort_insert">
					<!-- <a href="/form">글쓰기</a> -->
					<c:if test="${sessionScope.loginok!=null }">
					 <a href="/form">
						<button style="color: black" class="write">
						<img src="../../img/writePost.png" style="width: 20px;">글쓰기</button>
					</a>
					</c:if>
				</div>			
				<div class="sort_listType">
					<!-- is Selected -->
					<span class="sort_card" onclick="cardShow()" title="카드 형식으로 보기">
						<svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="40px" height="40px" viewBox="0 0 92 92" enable-background="new 0 0 92 92" xml:space="preserve">
						<path id="XMLID_79_" d="M34.9,40.7H7.6c-3.1,0-5.6-2.5-5.6-5.6V13.6C2,10.5,4.5,8,7.6,8h27.3c3.1,0,5.6,2.5,5.6,5.6v21.5C40.5,38.2,38,40.7,34.9,40.7z M10,32.7h22.5V16H10V32.7z M84.4,40.7H57.1c-3.1,0-5.6-2.5-5.6-5.6V13.6c0-3.1,2.5-5.6,5.6-5.6h27.3c3.1,0,5.6,2.5,5.6,5.6v21.5C90,38.2,87.5,40.7,84.4,40.7z M59.5,32.7H82V16H59.5V32.7z M34.9,84H7.6C4.5,84,2,81.5,2,78.4V56.9c0-3.1,2.5-5.6,5.6-5.6h27.3c3.1,0,5.6,2.5,5.6,5.6v21.5C40.5,81.5,38,84,34.9,84z M10,76h22.5V59.3H10V76z M84.4,84H57.1c-3.1,0-5.6-2.5-5.6-5.6V56.9c0-3.1,2.5-5.6,5.6-5.6h27.3c3.1,0,5.6,2.5,5.6,5.6v21.5C90,81.5,87.5,84,84.4,84z M59.5,76H82V59.3H59.5V76z"/>
						</svg>
					</span>
					
					<span class="sort_list" onclick="listShow()" title="리스트 형식으로 보기">
						<svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="40px" height="40px" viewBox="0 0 92 92" enable-background="new 0 0 92 92" xml:space="preserve">
						<path id="XMLID_1308_" d="M25.6,14c0-2.8,2.2-5,5-5H86c2.8,0,5,2.2,5,5s-2.2,5-5,5H30.6C27.8,19,25.6,16.8,25.6,14z M86,41H30.6c-2.8,0-5,2.2-5,5s2.2,5,5,5H86c2.8,0,5-2.2,5-5S88.8,41,86,41z M86,73H30.6c-2.8,0-5,2.2-5,5s2.2,5,5,5H86c2.8,0,5-2.2,5-5S88.8,73,86,73z M9,39.4c-3.9,0-7,3.2-7,7.1s3.1,7.1,7,7.1c3.9,0,7-3.2,7-7.1S12.8,39.4,9,39.4z M9,7c-3.9,0-7,3.2-7,7.1c0,3.9,3.1,7.1,7,7.1c3.9,0,7-3.2,7-7.1C16,10.2,12.8,7,9,7z M9,70.8c-3.9,0-7,3.2-7,7.1C2,81.8,5.1,85,9,85c3.9,0,7-3.2,7-7.1C16,74,12.8,70.8,9,70.8z"/>
						</svg>
					</span>
					
					<span class="sort_addr" onclick="addrShow()" title="지역별 게시글 보기">
						<!-- <?xml version="1.0" encoding="utf-8"?>Uploaded to: SVG Repo, www.svgrepo.com, Generator: SVG Repo Mixer Tools -->
						<svg width="50px" height="50px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
						<path d="M12 6H12.01M9 20L3 17V4L5 5M9 20L15 17M9 20V14M15 17L21 20V7L19 6M15 17V14M15 6.2C15 7.96731 13.5 9.4 12 11C10.5 9.4 9 7.96731 9 6.2C9 4.43269 10.3431 3 12 3C13.6569 3 15 4.43269 15 6.2Z" stroke="#000000" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
						</svg>
					</span>
				</div>
			</div>
			
			<br>
			
			<!--지역 선택형 출력방식 / 기본값 : hide-->
			<section id="addrType" class="form-control">
				<div class="container">			
					<div class="row">
						<!-- 데이터셋을 활용하여 div안에 데이터 삽입 -->
						<div class="col-3 addr_option" data-j-addr="서울">서울특별시</div>
						<div class="col-3 addr_option" data-j-addr="경기">경기도</div>
						<div class="col-3 addr_option" data-j-addr="인천">인천광역시</div>
						<div class="col-3 addr_option" data-j-addr="대구">대구광역시</div>
						<div class="col-3 addr_option" data-j-addr="대전">대전광역시</div>
						<div class="col-3 addr_option" data-j-addr="광주">광주광역시</div>
						<div class="col-3 addr_option" data-j-addr="인천">인천광역시</div>
						<div class="col-3 addr_option" data-j-addr="울산">울산광역시</div>
						<div class="col-3 addr_option" data-j-addr="강원">강원도</div>
						<div class="col-3 addr_option" data-j-addr="충남">충청남도</div>
						<div class="col-3 addr_option" data-j-addr="충북">충청북도</div>
						<div class="col-3 addr_option" data-j-addr="경남">경상남도</div>
						<div class="col-3 addr_option" data-j-addr="경북">경상북도</div>
						<div class="col-3 addr_option" data-j-addr="전남">전라남도</div>
						<div class="col-3 addr_option" data-j-addr="전북">전라북도</div>
						<div class="col-3 addr_option" data-j-addr="제주">제주도</div>
					</div>
					<ul class="addr-type">
                       	
					</ul>
				</div>
			</section>	 
			
			<!-- 리스트형 출력방식 / 기본값 : hide-->
			<section id="listType" class="form-control">	
				<ul class="list-type">
					
				</ul>
				<div id="loadingList" align="center">
					<img src="../img_source/loading.gif" alt="loading">
				</div>
			</section>	 
			
			<!-- 카드형 출력방식 -->
			<div id="cardType" class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">     	 	
		     	<c:forEach var="dto" items="${list }">
		     	<div class="col mb-5">
		     		<div class="card h-100">
		     			<div class="card-img">
			                <c:if test="${dto.j_imageurl != 'no' }">
			     				<c:forTokens var="pho" items="${dto.j_imageurl }" delims="," begin="0" end="0">
			                		<img class="card-img-top" src="../img/${pho }" alt="..." />
			                	</c:forTokens>
			                </c:if> 
			                <c:if test="${dto.j_imageurl == 'no' }">
		                		<img class="card-img-top" src="../img/noimage.png" alt="..." />
			                </c:if>
		                </div> 
		                <div class="card-body p-4">
			            	<div class="text-center">
			            		<h5 class="fw-bolder card-title">${dto.j_title}</h5>
			            		<fmt:formatNumber value="${dto.j_price}" type="currency"/>
							</div>
						</div>
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							<div class="text-center">	
								<a class="btn btn-outline-dark mt-auto" href="/sangpum/detail?num=${dto.j_sangid }">상품보기</a>
							</div>
						</div>
					</div>
				</div>			
		     	</c:forEach>
	     	</div>
  	     	<br><br><br>
  	     	<div class="UI_option container">
	  	     	<c:if test="${totalPage>0 }">
					<div style="width: 30rem; text-align: center;" class="pageList">
						<ul class="pagination justify-content-center pageList"  id="pageList">
							<!-- 이전 -->
							<c:if test="${startPage>1 }">
								<li class="page-item"><a
									href="list?currentPage=${startPage-1 }"></a></li>
							</c:if>
							<c:forEach var="pp" begin="${startPage }" end="${endPage }">
								<c:if test="${currentPage==pp }">
									<li class="page-item active"><a class="page-link"
										href="list?currentPage=${pp }">${pp }</a></li>
								</c:if>
								<c:if test="${currentPage!=pp }">
									<li class="page-item"><a class="page-link"
										href="list?currentPage=${pp }">${pp }</a></li>
								</c:if>
							</c:forEach>
			
			
							<!-- 다음 -->
							<c:if test="${endPage<totalPage }">
								<li class="page-item "><a class="page-link"
									href="list.jsp?currentPage=${ endPage+1}>">다음</a></li>
							</c:if>
						</ul>
					</div>
				</c:if>
	  	     	
				<div class="kakao_inquiry">
				<div id="add-channel-button"></div>
				<div id="chat-channel-button"></div>			
			</div>
			</div>
		</div>
	</section>
</body>
<script>
  Kakao.Channel.createAddChannelButton({
    container: '#add-channel-button',
    channelPublicId: '_BpxgxjG',
  });
  Kakao.Channel.createChatButton({
	    container: '#chat-channel-button',
	    channelPublicId: '_BpxgxjG',
	  });
</script>
<script type="text/javascript">
let currentPage = 0;
// 감지 대상
const targetList = document.querySelector('#loadingList');

const observerList = new IntersectionObserver((entries) => {
  entries.forEach(entry => {
	  // 감지시 결과갑
    if (entry.isIntersecting) {
      console.log('Intersection detected. Loading next page.');

      let perpage = 8;
	  
	 // Ajax로 다음 페이지의 내용을 불러오는 함수
     const loadNextPage = () => {
    	    // 현재 페이지 번호를 사용하여 Ajax 요청을 보냄
          $.ajax({
            url: '/ajaxlist',
            type: 'GET',
            data: {
              option: "option",
              search: "search",
              startnum: currentPage * perpage,
              perpage: perpage
            },
            success: function(data) {
         	  	// console.log(data);
         	  	// console.log(currentPage);
    			var content="";							//리스트를 담을 content
    			
    			 $.each(data, function name(i, dto) {
    				function formatCurrency(price) {
 	            	    // 숫자를 통화 형식(3자리마다 쉼표)으로 형식화하는 함수
 	            	    return new Intl.NumberFormat('ko-KR', { style: 'currency', currency: 'KRW' }).format(price);
 	            	}
    				var images = dto.j_imageurl.split(",");
    		        var firstImageUrl = images.length > 0 ? images[0] : "noimage.png"; // 첫 번째 이미지사용

					function formatDate(dateString) {
    		        	const options = { year: 'numeric', month: '2-digit', day: '2-digit', hour: '2-digit', minute: '2-digit' };
    		        	const formattedDate = new Date(dateString).toLocaleDateString('ko-KR', options);
    		        	return formattedDate;
    		        }

    		         
    	              content += "<a href='/sangpum/detail?num=" + dto.j_sangid + "' class='list-data'>";
    	              content += "<li class='form-control'>";
    	              content += "<article>";
    	              content += "<div class='item-list-div'>";
    	             
    	              
    	              content += "<div class='item-list-img-area'>";
    	              
    	              content += "<img class='item-list-img' src='../img/" + firstImageUrl + "' alt='...'/>";
    	              content += "</div>";
    	              
    	              content += "<div class='item-list-content'>";
    	              content += "<h1 class='fw-bolder item-list-title'>" + dto.j_title + "</h1>";
    	              
    	              content += "<div class='info_between'>";
    	              content += "<div><h6 class='item-list-price'>" + formatCurrency(dto.j_price) + "</h6></div>";
    	              content += "<div>" + formatDate(dto.j_postdate)+ "</div>";
    	              content += "</div>";
    	              
    	              content += "<div class='explanation-area'><b class='explanation'>" + dto.j_explanation + "</b></div><br><br><br><br>";
    	              
    	              content += "<div class='info_between'>";
    	              content += "<div class='region-name'>" + dto.j_addr + "</div>";
    	              content += "<div> 관심 : " + dto.j_interest + " , 조회 : " + dto.j_readcount + "</div>";
    	              content += "</div>";
    	              
    	              content += "</div>";
    	              
    	              content += "</div>";
    	              
    	              content += "</article>";
    	              content += "</li>";
    	              content += "</a>";
    	            });
         	  	$('.list-type').append(content);
         	  	
         	  	if (data.length < perpage) {
                    // 데이터가 더 이상 없을 때 loading 숨김
                    $('#loadingList').hide();
                    document.getElementById("pageList").style.display = "none";
                  }
         	  	
         	  	currentPage++;
         	  	
         	  	console.log(currentPage)
          },
          error: function(xhr, status, error) {
            console.error('Error:', error);
          }
        });
          
      };

      // 다음 페이지 로딩 함수 호출
      loadNextPage();
    }
  });
});
observerList.observe(targetList);
</script>
<script type="text/javascript">
$(document).ready(function() {
    // 이벤트 핸들러 추가
    $('.addr_option').on('click', function() {
    	console.log('Click event triggered');
        // 클릭된 지역 값을 가져와서 selectedAddr에 할당
        let selectedAddr = $(this).data('j-addr');

        // 서버에 선택된 지역 값을 업데이트하기 위해 POST 요청
        $.ajax({
            url: '/ajaxaddr',
            type: 'GET',
            data: {
                option: "option",
                search: "search",
                startnum: 0, // 페이지 초기화
                perpage: 8,
                j_addr: selectedAddr // 선택된 지역 값 전달
            },
            success: function(data) {
                console.log(data);
                console.log(selectedAddr);
                var addrContent = "";

                function formatCurrency(price) {
                    // 숫자를 통화 형식(3자리마다 쉼표)으로 형식화하는 함수
                    return new Intl.NumberFormat('ko-KR', { style: 'currency', currency: 'KRW' }).format(price);
                }
				
                function formatDate(dateString) {
                    const options = { year: 'numeric', month: '2-digit', day: '2-digit', hour: '2-digit', minute: '2-digit' };
                    const formattedDate = new Date(dateString).toLocaleDateString('ko-KR', options);
                    return formattedDate;
                }

                
                // 처리 받은 데이터를 화면에 업데이트하는 함수 호출
                $.each(data, function name(i, dto) {
                    var images = dto.j_imageurl.split(",");
                    var firstImageUrl = images.length > 0 ? images[0] : "noimage.png"; // 첫 번째 이미지 URL

                   
                    addrContent += "<a href='/sangpum/detail?num=" + dto.j_sangid + "' class='list-data'>";
                    addrContent += "<li class='form-control'>";
                    addrContent += "<article>";
                    addrContent += "<div class='item-list-div'>";

                    addrContent += "<div class='item-list-img-area'>";
                    addrContent += "<img class='item-list-img' src='../img/" + firstImageUrl + "' alt='...'/>";
                    addrContent += "</div>";

                    addrContent += "<div class='item-list-content'>";
                    addrContent += "<h1 class='fw-bolder item-list-title'>" + dto.j_title + "</h1>";

                    addrContent += "<div class='info_between'>";
                    addrContent += "<div><h6 class='item-list-price'>" + formatCurrency(dto.j_price) + "</h6></div>";
                    addrContent += "<div>" + formatDate(dto.j_postdate) + "</div>";
                    addrContent += "</div>";

                    addrContent += "<div class='explanation-area'><b class='explanation'>" + dto.j_explanation + "</b></div><br><br><br><br>";

                    addrContent += "<div class='info_between'>";
                    addrContent += "<div class='region-name'>" + dto.j_addr + "</div>";
                    addrContent += "<div> 관심 : " + dto.j_interest + " , 조회 : " + dto.j_readcount + "</div>";
                    addrContent += "</div>";

                    addrContent += "</div>";

                    addrContent += "</div>";

                    addrContent += "</article>";
                    addrContent += "</li>";
                    addrContent += "</a>";
                });
                // 리스트의 기존 내용 제거
                document.getElementById("pageList").style.display = "none";
                $('.addr-type').empty();
                
                if(data.length > 0){
	              	// 업데이트된 내용 추가
	                $('.addr-type').append(addrContent);
                }
                if(data.length==0){
                	alert("등록된 게시글이 없습니다");
                	$('.addr-type').empty();
                	document.getElementById("pageList").style.display = "none";
                }
        		// 페이지 숫자를 초기화
        	    currentPage = 0;
            },
            error: function(xhr, status, error) {
                console.error('Error:', error);
            }
        });
    });
});
</script>
</html>