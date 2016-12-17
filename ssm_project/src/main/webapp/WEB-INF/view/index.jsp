<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Web QQ Login</title>

    <!-- 新 Bootstrap 核心 CSS 文件 -->
	<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
</head>
<style type="text/css">
.logina{
	 padding-left:600px;
    padding-top: 100px;
    }
    
    label.error {
    margin-left: 20px;
    color: red;
}
#error{
color:red;
}
	</style>
  <body>
<nav class="navbar navbar-default navbar-inverse navbar-static-top" role="navigation" >
  <div class="container">
   <h1 style="color:#fff" class="text-center">My Blog <small>Welcome!</small>
   </h1>
   
  </div>
</nav>

<div>
<form id="loginform" class="navbar-form navbar logina"  onkeydown="if(event.keyCode==13)return false;" >
    <h2>UserLogin:</h2>
    <input type="text" class="form-control"  id="username" placeholder="username" name="username">
    <br><br>
     <input type="password" class="form-control" id="password"  placeholder="password" name="password">
     <br>
  <button id="login" type="button" class="btn btn-default navbar-btn" >login</button>
  <button type="text" class="btn btn-default navbar-btn " style=" margin-left: 62px">register</button>
<br>
<p id="error"><p>

</form>
</div>

<footer class=" navbar-inverse navbar-fixed-bottom " style="height: 50px">
  <div class="">
    <a href="#" class="text-center">About us</a>
  </div>
</footer>

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
   <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="${ctx}/resources/jQuery/jquery-1.10.0.js"></script>
    <script src="${ctx}/resources/jQuery/jquery.validate-1.13.1.js"></script> 
     
 <script >
        $(document).ready(function(){
        	var validate  = $("#loginform").validate({
         rules:{
                    username:{
                        required:true,
                        minlength: 4,
                        maxlength: 20
                    },
                    password:{
                        required:true,
                        minlength: 5,
                        maxlength: 20
                    }
                  
                },
               
        
        
        })
        
      $("#login").click(function(e){
    	  //有错误信息，没值都被拦截
    	  if(validate.errorList.length>0|| $('#password').val()==""||$('#username').val()=="")
    		  return false;
    	/*   var mydata = '{"username":"' + $('#username').val() + '","password":"'  
          + $('#password').val() + '"}';   */
         
        	$.ajax({
        		type:"POST",
        		url:"${pageContext.request.contextPath}/User/UserLogin",
        		data:JSON.stringify({
        			"username": $("#username").val(),
        			"password":$("#password").val()
        			}),
        		contentType: "application/json; charset=utf-8", 
        		dataType:"json",
        		success:function(user){
        			//打开新的页面
        			window.location.href ="Blog/home";
        			
        		},
        	error:function(){
        		//错误信息处理，包括null，状态码不是200等
        		$('#error').replaceWith('<p id="error">账号或密码错误！<p>');
            }
        		
        	})
        })
        
        })
 </script>
  

    
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    
	<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
	<script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
  </body>
</html>