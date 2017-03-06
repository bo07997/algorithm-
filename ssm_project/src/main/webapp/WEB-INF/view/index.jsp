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
    <title>My Blog Login</title>

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="${ctx}/resources/jQuery/jquery-1.10.0.js"></script>
    <script src="${ctx}/resources/jQuery/jquery.validate-1.13.1.js"></script> 
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
 <script >
var validate2=null
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
                        minlength: 4,
                        maxlength: 20
                    }
                  
                },
                messages: {
                	  username: {
                          required: "请输入用户名",
                          minlength: "用户名最少包含4个字符",
                          maxlength:"用户名最多包含20个字符"
                        },
                        password: {
                            required: "请输入密码",
                            minlength: "密码最少包含4个字符",
                            maxlength:"密码最多包含20个字符"
                          }
                	
                    
                  
                }
        
        });
        /*模态框的验证  */
        	 validate2  = $("#loginform2").validate({
         rules:{
                    username:{
                        required:true,
                        minlength: 4,
                        maxlength: 20
                    },
                    password:{
                        required:true,
                        minlength: 4,
                        maxlength: 20
                    },
                    password2:{
                        required:true,
                        minlength: 4,
                        maxlength: 20
                    }
                  
                },
                messages: {
                	  username: {
                          required: "请输入用户名",
                          minlength: "用户名最少包含4个字符",
                          maxlength:"用户名最多包含20个字符"
                        },
                        password: {
                            required: "请输入密码",
                            minlength: "密码最少包含4个字符",
                            maxlength:"密码最多包含20个字符"
                          },
                        password2: {
                            required: "请再次输入密码",
                            minlength: "确认密码最少包含4个字符",
                            maxlength:"确认密码最多包含20个字符"
                          }
                	
                    
                  
                }
        
        })
       
        	
      $("#login").click(function(e){
    	  //有错误信息，没值都被拦截
    	  if(validate.errorList.length>0|| $('#password').val()==""||$('#username').val()=="")
    		  return false;
    	
         
        	$.ajax({
        		type:"POST",
        		url:"${pageContext.request.contextPath}/User/UserLogin",
        		data:JSON.stringify({
        			"username": $("#username").val(),
        			"password":$("#password").val(),
        			"rootAuth":$("input[name='rootAuth']:checked").val()
        			}),
        		contentType: "application/json; charset=utf-8", 
        		dataType:"json",
        		success:function(user){
        			if(user.rootAuth==1){
        			//打开新的页面
        			window.location.href ="User/root";
        			}
        			else{
        				//打开新的页面
            			window.location.href ="Blog/home";
        			}
        		},
        	error:function(){
        		//错误信息处理，包括null，状态码不是200等
        		$('#error').replaceWith('<p id="error">账号或密码错误！<p>');
            }
        		
        	})
        })
        
        $("#uname").focusout(function() {
        	//清空已有警告信息
        	$("#error2").replaceWith('<p id="error2"  ><p>');
        	//有值不符合要求，没值都被拦截
      	  if($('#uname').val().length>3&&$('#uname').val()!=""){
      		  
      	 	$.ajax({
          		type:"POST",
          		url:"${ctx}/User/UserRegister",
          		data:JSON.stringify({
          			"username": $("#uname").val()
          			}),
          		contentType: "application/json; charset=utf-8", 
          		dataType:"json",
          		success:function(result){
          		if(result){
          			$("#error2").replaceWith('<p id="error2"  style="margin-left: 68px;color: red">该用户名已被占用！<p>');
          		}
          		else{
          			$("#error2").replaceWith('<p id="error2"  style="margin-left: 68px;color:green">可以使用该用户名！<p>');

          			}
          			
          		},
          	error:function(){
          		
              }
          		
          	})
      		  
      		  }
         
        });
        
        	$("#password3").focusout(function(){
        		//清空已有警告信息
        		$("#error3").replaceWith('<p id="error3" <p>');
        		//确认密码不一致
        		if($("#password3").val()!=$("#password2").val()){
        			$("#error3").replaceWith('<p id="error3"  style=" margin-left: 70px;color:red">两次输入密码不一致！<p>');
        		}
        	});
        	
        })
        function submit(id){
	
    	 if(validate2.errorList.length==0&& $('#password2').val()!=""&&$('#uname').val()!=""
    			 &&$('#error2')[0].innerText=="可以使用该用户名！"&&$('#error3')[0].innerText!="两次输入密码不一致！"){
    		 
     	document.getElementById(id).submit();
     	alert("插入成功！");
     	}
            	return false;
            	
     	}
     	

 </script>
<div>

<form id="loginform" class="navbar-form navbar logina"  onkeydown="if(event.keyCode==13)return false;" >
    <h2>UserLogin:</h2>
    <input type="text" class="form-control"  id="username" placeholder="username" name="username">
    <br><br>
     <input type="password" class="form-control" id="password"  placeholder="password" name="password">
     <br>
       <div style="margin-bottom:5px;margin-left:5px;margin-top:10px;">
   
                  <input name="rootAuth"  checked="checked" type="radio" value="0" >用户 &nbsp;&nbsp;&nbsp;
                  <input name="rootAuth" type="radio" value="1" >管理员
     </div> 
  <button id="login" type="button" class="btn btn-default navbar-btn" >login</button>
  <button type="text" class="btn btn-default navbar-btn " style=" margin-left: 62px" data-toggle="modal" data-target="#myModal">register</button>
<br>
<p id="error"><p>

</form>
</div>
 
<!--注册模态框  -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title" id="myModalLabel">register</h4>
      </div>
      <div class="modal-body">
       <form id="loginform2" class="navbar-form navbar "  Action="User/insertUser "  method="post">
    <label> 用户名:</label>
    <input id="uname" type="text" class="form-control"   placeholder="username" name="username" style="
    margin-left: 16px;"
    ><p id="error2" ><p>
    <br>
   <label> 真实姓名:</label> 
     <input type="text" class="form-control"  placeholder="realname" name="name">
     <br>
     
     <br>
    
     <label> 密码:</label> 
     <input id="password2" type="password" class="form-control"   placeholder="password" name="password" style="
    margin-left: 28px;">
     <br> <br>
     <label> 确认密码:</label> 
     <input id="password3" type="password" class="form-control"   placeholder="password" name="password2">
     <p id="error3"  ><p>
     <br>
  <!-- <button type="button" class="btn btn-default navbar-btn" >login</button>
  <button type="text" class="btn btn-default navbar-btn "  >register</button> -->
<br>
<p id="error"><p>

</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button"  onclick="submit('loginform2')" class="btn btn-primary">register</button>
      </div>
    </div>
  </div>
</div>



<footer class=" navbar-inverse navbar-fixed-bottom " style="height: 50px">
  <div class="">
    <a href="#" class="text-center">About us</a>
  </div>
</footer>

     

  

    
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    
	<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
	<script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
	<script type="text/javascript">
	//已经登录用户直接跳到自己界面
	var uId = ${loginuser.uId};
	var ctx ="${ctx}";
	$(document).ready(function(){
		if("${loginuser}"!=null)
			{
			 window.open ( ctx+"/Message/our_home/"+uId+"_0","_self");
			}
	})
	
	</script>
  </body>
</html>