<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js" type="text/javascript"></script>
<link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css'>
<link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css'>
<link rel='stylesheet prefetch' href='http://cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.0/css/bootstrapValidator.min.css'>
<link rel="stylesheet" href="./resources/css/board.css">

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>

<script src="./resources/js/curvy-text.js"></script>
      
<script>

function currentPage(currentPage){
	var form = document.getElementById('board_form');
	var page = document.getElementById('page');
	page.value = currentPage;
	form.action = "board";
	form.submit();
};

function logout(){
	var form = document.getElementById('board_form');
	form.action = "logout";
	form.submit();
};

	
</script>

</head>
<body>

  <div class="container">
	<form id=board_form action="writeForm" method="get">
    <div id="mainWrapper">

		<ul id="title">
			<li><h2>자유게시판</h2></li>
		</ul>

        <ul>
            <!-- 게시판 목록  -->
            <li>
                <ul id ="ulTable">
                    <li>
                        <ul>
                            <li>No</li>
                            <li>제목</li>
                            <li>작성일</li>
                            <li>작성자</li>
                            <li>조회수</li>
                        </ul>
                    </li>
                    
                    <!-- 게시물이 출력될 영역 -->
                 <c:forEach var="board" items="${boardList}"> 
                    <li>
                        <ul>
                            <li>${board.boardNum}</li>
                            <li class="left"><a href="boardInfo?boardNum=${board.boardNum}">${board.title}</a></li>
                            <li>${board.regdate}</li>
                            <li>${board.userId}</li>
                            <li>${board.hitcount}</li>
                        </ul>
                    </li>
				</c:forEach>
					<li><input type="text" name="searchKeyword"> <input type="button" onclick="currentPage(1)" value="검색"></li>
     				<ul></ul>
     				
				<input type="hidden" name="page" id="page" />
				<input class="button2" name="pre" type="button" onclick="currentPage(${navi.currentPage-1})" value="이전페이지"/> 
				
				<c:forEach var="pageNum" begin="${navi.startPageGroup}" end="${navi.endPageGroup}">
					<a href="board?page=${pageNum}">${pageNum}</a>
				</c:forEach>
				
				<input class="button2" name="next" type="button" onclick="currentPage(${navi.currentPage+1})" value="다음페이지"/>
				<input class="button" name="logout" type="button" onclick="logout()" value="logout"/> <input class="button" name="write" type="submit" value="글쓰기"/>
       		 </ul>
       	</li>
      </ul>
    </div>


</form>


    </div><!-- /.container -->
    
   <%--  <a href="download?boardnum=${boardnum}"><h3>${board.originalname}</h3></a> --%>
    
    
    
  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src='http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js'></script>
<script src='http://cdnjs.cloudflare.com/ajax/libs/bootstrap-validator/0.4.5/js/bootstrapvalidator.min.js'></script>

  

    <script  src="./resources/js/index.js"></script>




</body>
</html>