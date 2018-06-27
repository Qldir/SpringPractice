<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
  <meta charset="UTF-8">
  <title>Sign in and Sign up  - Single Form</title>
  
  <link rel='stylesheet prefetch' href='https://fonts.googleapis.com/css?family=Open+Sans:400,700,300,600'>

      <link rel="stylesheet" href="./resources/css/style.css">
      <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
      <script src="./resources/js/curvy-text.js"></script>
      
<script>
	$(function(){
		
		$('.title').curvy({ in : {
				shuffle:true,
			  effect: 'curveIn'
          }
      });
	});
</script>
  
</head>

<body>
  <div class="cont_principal">
  <ul class="title">
  	<h2>Login Page</h2>
  </ul>
  <div class="cont_centrar">
  <div class="cont_login">
    <form action="">
    <div class="cont_tabs_login">
      <ul class='ul_tabs'>
        <li class="active"><a href="#" onclick="sign_in()">SIGN IN</a>
        <span class="linea_bajo_nom"></span>
        </li>
        <li><a href="#up" onclick="sign_up()">SIGN UP</a><span class="linea_bajo_nom"></span>
        </li>
      </ul>
      </div>
  <div class="cont_text_inputs">
    
    <input type="text" class="input_form_sign d_block active_inp" placeholder="ID" name="userid" />

    <input type="password" class="input_form_sign d_block  active_inp" placeholder="PASSWORD" name="userpwd" /> 
    
   <input type="text" class="input_form_sign " placeholder="NAME" name="name_us" />
   <input type="text" class="input_form_sign" placeholder="GENDER" name="gender" />
   <input type="text" class="input_form_sign" placeholder="HOBBY" name="hobby" />
   <input type="text" class="input_form_sign" placeholder="BIRTH" name="birth" />
   
   <input type="text" class="input_form_sign" placeholder="AGE" name="age" />
   <input type="text" class="input_form_sign" placeholder="PHONE" name="phone" />
   <input type="text" class="input_form_sign" placeholder="ADRESS" name="adress" />
   <input type="text" class="input_form_sign" placeholder="introduce" name="introduce" />
    
    <a href="#" class="link_forgot_pass d_block" >Forgot Password ?</a>    
<div class="terms_and_cons d_none">
    <p><input type="checkbox" name="terms_and_cons" /> <label for="terms_and_cons">Accept  Terms and Conditions.</label></p>
  
    </div>
      </div>
<div class="cont_btn">
     <button class="btn_sign">SIGN IN</button>
      
      </div>
      
    </form>
    </div>
    
  </div>
  

</div>
  
  

    <script  src="./resources/js/index.js"></script>




</body> time on the server is ${serverTime}. </P>
</body>
</html>
