<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js" type="text/javascript"></script>


<link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css'>
<link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css'>
<link rel='stylesheet prefetch' href='http://cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.0/css/bootstrapValidator.min.css'>
<link rel="stylesheet" href="./resources/css/style.css">

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>

<script src="./resources/js/curvy-text.js"></script>
      
<script>

function contact() {

	var form = document.forms["login_form"];
	
	form.action = "contact"
	form.submit();
};


$(function(){
	
	$('.title').curvy({
		shuffle:true,
		effect: 'curveIn'
     });
});
	
	
</script>


</head>
<body>

  <div class="container">

    <form id="login_form" class="well form-horizontal" action="login" method="post">
<fieldset>

<!-- Form Name -->
<legend>Contact Us Today!</legend>
<!-- Text input-->

<div id="ultbl01">

<ul alt="table" class="ultable ultable-striped ultable-bordered ultable-hover">

 <li alt="thead">

  <ul alt="tr">

   <li alt="1">No</li>

   <li alt="2">제목</li>

   <li alt="3">작성자</li>

   <li alt="4">작성일</li>

   <li alt="5">조회</li>

  </ul>

 </li>

    <li alt="tbody">

     <ul alt="tr">

   <li alt="1">903</li>

        <li alt="2"><a href="#">금주의 공지 사항 입니다</a></li>

   <li alt="3">관리자</li>

   <li alt="4">17-07-29 09:00</li>

   <li alt="5">310</li>

  </ul>

     <ul alt="tr">

   <li alt="1">902</li>

        <li alt="2"><a href="#">금주의 공지 사항 입니다</a></li>

   <li alt="3">관리자</li>

   <li alt="4">17-07-28 09:00</li>

   <li alt="5">301</li>

  </ul>

     <ul alt="tr">

   <li alt="1">901</li>

        <li alt="2"><a href="#">금주의 공지 사항 입니다</a></li>

   <li alt="3">관리자</li>

   <li alt="4">17-07-27 09:00</li>

   <li alt="5">303</li>

  </ul>

    </li> 

</ul>

</div>


</fieldset>
</form>
</div>
    </div><!-- /.container -->
  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src='http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js'></script>
<script src='http://cdnjs.cloudflare.com/ajax/libs/bootstrap-validator/0.4.5/js/bootstrapvalidator.min.js'></script>

  

    <script  src="./resources/js/index.js"></script>




</body>
</html>