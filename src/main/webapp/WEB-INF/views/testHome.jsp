<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script>
function goodNight(){
	var input = document.getElementById('goodNight').value;
	var answer = input.indexOf("안녕");
	
	if(answer>-1){
		alert("잘자<br>");
	}
}

function hi(){
	var star='';
	
	 for(var i=0; i<5;i++){
		for(var j = 9; j>i; j--){
			star += ' ';
		}
		for(var k=0; k<2*i-1;k++){
			star += '*';
		}
		star +='\n';
	} 

	
	alert(star);
}

$(function(){
	
	$("#testButton").on('click',function(){
		
		var sourceText = document.getElementById('wordInput').value;
		var sourceLang = 'auto';
		var targetLang = 'ja';
		var urlt = "https://translate.googleapis.com/translate_a/single?client=gtx&sl=" 
            + sourceLang + "&tl=" + targetLang + "&dt=t&q=" + encodeURI(sourceText);
	
		$.ajax({
			url: urlt,
			type: "get",
			success: function(data){ //data.id (data가 vo인 경우)
				alert(data[0]);
			},
			error: function(data){
				alert("통신에러");
			}
			
		});
	});
	
});
</script>


</head>
<body>
<h1>AJAX</h1><br><br>
문장 : <input type="text" id="goodNight"><br>
	<input type="button" onclick="hi()" value="입력">
</body>
</html>