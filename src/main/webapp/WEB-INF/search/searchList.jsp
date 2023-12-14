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
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">
<link
   href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Gamja+Flower&family=Nanum+Pen+Script&family=
   Noto+Serif+KR:wght@200&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<style>

#list{
	width:auto;
	height:auto;
	position: relative;
}

 #result2 {
        position: absolute;
        z-index: 1;
        background-color: white; /* 배경색을 흰색으로 지정해 겹치는 영역이 투명하지 않게 함 */
        margin-top: 5px; /* 검색창과의 간격 조절 */
        width: 200px; /* 결과 창의 폭 조절 */
    }

.sangpum{
	cursor : pointer;
	display : inline-block;
	width:250px;
	height:250px;
	margin: 20px;
}

.interest{
	cursor : pointer;
}


</style>
<script>
$(function(){

	
	// 현재 사용자의 아이디
    var i_id = $("#myid").val();
	//alert(i_id)
	
	
	
	$("#search2").keyup(function(e){
         
         var search=$(this).val();

         $.ajax({
            type:"get",
            dataType:"json",
            url:"/search/result",
            data:{"search":search},
            success:function(res){
               var s="";
               
               $.each(res,function(i,dto){
                   s+="<div class='eachdiv'>"
                   s+="<b onclick='selectSearch()' class='searchResult'>"+dto+"</b><br>"
                   s+="</div>"
                });
               
               if(search==""){
                  $("#result2").html("");
               }
               else{
                  $("#result2").html(s);
               }
            }
         });
      });


    $("#btnsearch2").click(async function (e) {
        console.log("Button clicked");
        

        var search = $("#search2").val(); // 검색어
        var option = $("#selOption").val(); // 필터
        var category = $("#category").val(); // 카테고리

        console.log("Search:", search);
        console.log("Option:", option);
        console.log("Category:", category);

        try {
            var countRes = await $.ajax({
                type: "get",
                dataType: "json",
                url: "/search/sangpumCount",
                data: { "search": search, "category": category }
            });

            console.log("Count Response:", countRes);

            var count = "<b>상품 " + countRes + "</b>";
            if (search == "" || countRes == 0) {
                $("#sangCount").html("<b>" + search + "에 대한 검색결과가 없습니다</b>");
            } else {
                $("#sangCount").html(count);
            }

            var listRes = await $.ajax({
                type: "get",
                dataType: "json",
                url: "/search/list",
                data: { "search": search, "option": option, "category": category }
            });

            console.log("List Response:", listRes);

            var s = "";
            var count = 1;

            for (const dto of listRes) {
                var i_sangpum = dto.j_sangid;
                var imagePaths = dto.j_imageurl.split(',');

                var result = await interestCount(i_id, i_sangpum);
                var aCount = await answerCount(i_sangpum);
                console.log("Interest Count Result:", result);
                console.log("Answer Count:", aCount);

                s += "<div style='display : inline-block;'>";
                s += "<div class='sangpum'>";
                s += "<input type='hidden' name='num' id='num' value='" + dto.j_sangid + "'>";
                s += "<img src='../img/" + imagePaths[0] + "' style='width:250px; height:250px'><br>";
                s += "<b>" + dto.j_title + "</b>";
                s += "<p>" + dto.j_explanation + "</p>";
                s += "<b>" + dto.j_price.toLocaleString('ko-KR', { style: 'currency', currency: 'KRW' }) + "</b>";
                s += "</div>";
                s += "<div style='margin-left:20px;'>";
                s += "<i class='bi bi-eye-fill'>" + dto.j_readcount + "</i>&nbsp;&nbsp;";
                s+= "<i class='bi bi-chat-left-dots-fill' style='margin-right : 10px'>" + aCount + "</i>";
                if (result == 1) {
                    s += "<i class='bi bi-heart-fill interest' style='color:red' num='" + dto.j_sangid + "'>" + dto.j_interest + "</i>";
                } else {
                    s += "<i class='bi bi-heart-fill interest' num='" + dto.j_sangid + "'>" + dto.j_interest + "</i>";
                }
                
                

                s += "</div>";
                s += "</div>";

                if (count % 4 == 0) {
                    s += "<br>";
                }

                count++;
            }

            if (search == "") {
                $("#list").html("");
            } else {
                console.log(s);
                $("#list").html(s);
            }
        } catch (error) {
            console.error("Error:", error);
        }
        
        $("#result2").html("");
    });
	
    //처음 검색 결과 창 진입 시 리스트 출력 
	$("#btnsearch2").click();
    
  
    
    $("#selOption").change(function(){
    	$("#btnsearch2").trigger("click");
    });
    
    $("#category").change(function(){
    	$("#btnsearch2").trigger("click");
    });
    
    $("#search2").keypress(function(e){
        //검색어 입력 후 엔터키 입력하면 조회버튼 클릭
        if(e.keyCode && e.keyCode == 13){
           $("#btnsearch2").trigger("click");
           return false;
        }

     });
    
    //하트누르면 1증가 및 db에 좋아요 여부 저장
    $(document).on ("click","i.interest", function(event){
    	var currentColor = $(this).css("color");
    	

    	var num = $(this).attr('num');
    	
    	//var i_id = $("#myid").val();
    	
    	var interest = $(this);

    	//alert(interest);
    	//alert(i_id);
    	//alert(num);

    	if (currentColor === "rgb(255, 0, 0)") {
             // 현재 색상이 빨간색인 경우 검은색으로 변경합니다.
             $(this).css("color", "black");
             $.ajax({
               type: "get",
               dataType:"html",
               url: "/interest/delete",
               data: {"i_id":i_id, "i_sangpum":num},
               success: function(data) {
                console.log("좋아요취소");
                  
               }
             });
             
             $.ajax({
             	   type:"get",
             	   dataType:"json",
             	   url:"/sangpum/minusInterest",
             	   data:{"num":num},
             	   success:function(res){
             		  interest.text(res.mInterest);
             		       		   
             	   }
                });
             
             
         } else {
             // 현재 색상이 빨간색이 아닌 경우 빨간색으로 변경합니다.
             $(this).css("color", "red");
             $.ajax({
               type: "get",
               dataType:"html",
               url: "/interest/insert",
               data: {"i_id":i_id, "i_sangpum":num},
               success: function(data) {
                console.log("좋아요클릭");
                  
               }
             });
             
             $.ajax({
           	   type:"get",
           	   dataType:"json",
           	   url:"/sangpum/plusInterest",
           	   data:{"num":num},
           	   success:function(res){
           		interest.text(res.pInterest);
           		       		   
           	   }
              });
         }

    });
    
    


});

$(document).on("click","div.sangpum", function(event){
	
	var num = $(this).find('#num').val();
	//alert(num)
	location.href="../sangpum/detail?num=" + num;
});

async function interestCount(i_id, i_sangpum){
	
	return new Promise(function(resolve, reject) {
        $.ajax({
            type: "get",
            dataType: "html",
            url: "/interest/count",
            data: {"i_id": i_id, "i_sangpum": i_sangpum},
            success: function(res) {
                console.log(res);
                resolve(res);
            },
            error: function(error) {
                reject(error);
            }
        });
    });
}

async function answerCount(i_sangpum){
	return new Promise(function(resolve, reject){
		$.ajax({
			type:"get",
			dataType:"html",
			url:"/answer/getAnswerCount",
			data:{"num":i_sangpum},
			success:function(res){
				console.log(res);
                resolve(res);
            },
            error: function(error) {
                reject(error);
            }
		});
	});
}




function selectSearch() {
    $(document).on("click","b.searchResult",function(event){
       var s=$(this).html();
       //alert(s);
       
       $("#search2").val(s);
       $("#result2").html("");
    });
 }



</script>
</head>
<body>
<div class="container"> <!-- 내용을 중앙에 정렬하기 위한 컨테이너 추가 -->
    <div class="row justify-content-center">
      <div class="col-md-6"> <!-- 필요에 따라 컬럼 너비를 조절합니다. -->
  <div class="input-group w-75">
  	  <input type="hidden" id="myid" value="${sessionScope.myid }">
      <input type="search" class="form-control rounded" placeholder="Search" aria-label="Search" aria-describedby="search-addon"
       id="search2" autocomplete="off" value="${search }" style="width:200px"/>
      <input type="button" value="검색" id="btnsearch2" class="btn btn-dark">
      
      
      <select id="category" class="form-select" style="margin-left:50px; width:100px;">
      							<option value="all" selected="selected">전체</option>
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
  
  <div id="result2"></div>
  </div>
  </div>
  </div>
  
     
     <div id=search>
     	<div id="sangCount" style="margin-top : 50px; margin-left:280px;"></div>
     	
     	<select id="selOption" class="form-select" aria-label="Default select example" style="float : right; margin-right:200px; width:100px;">
  			<option value="j_readcount" selected>인기순</option>
  			<option value="j_interest">좋아요순</option>
  			<option value="j_price">높은 가격순</option>
  			<option value="J_PRICE">낮은 가격순</option>
  			<option value="j_postdate">등록일순</option>
		</select>
     	<div id="list" style="margin-top : 20px; margin-left:260px;">
     	
     	</div>
     	
     </div>
</body>
</html>