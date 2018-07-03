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
<link rel="stylesheet" href="./resources/css/board-writeform.css">

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>

<script src="./resources/js/curvy-text.js"></script>
      
<script>

function contact() {

	var form = document.forms["write_form"];
	
	form.action = "contact"
	form.submit();
};

function boardList() {
	location.href="board";
}
	
</script>

</head>
<body>

  <div class="container">
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
                            <input name="title" type="text" value="${boardInfo.title}" readonly="readonly" />
                        </ul>
                    </li>
                    <!-- 게시물이 출력될 영역 -->
					<li>
						<ul>
							<textarea name="content" readonly="readonly">${boardInfo.content}</textarea>
						</ul>
					</li>
					
					<li>
						<ul>
							<li class="left" style="width:100%;"><a href="download?boardNum=${boardInfo.boardNum}">${boardInfo.originalFile}</a></li>
						</ul>
					</li>
				<input class="button" onclick="boardList()" type="button" value="목록"> <input class="button" name="write" type="submit" value="수정">
        </ul>

    </div><!-- /.container -->
    
    
    
    
    
  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src='http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js'></script>
<script src='http://cdnjs.cloudflare.com/ajax/libs/bootstrap-validator/0.4.5/js/bootstrapvalidator.min.js'></script>

  

    <script  src="./resources/js/index.js"></script>




</body>
</html>