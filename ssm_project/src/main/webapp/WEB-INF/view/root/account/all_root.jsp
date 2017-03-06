<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
	<meta http-equiv="content-type" content="text/html;charset=UTF-8">
	<link rel="stylesheet" type="text/css" href="${ctx}/resources/root/css/default.css" />
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="${ctx}/resources/jQuery/jquery-1.10.0.js"></script>

    <!-- 新 Bootstrap 核心 CSS 文件 -->
	<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
   <!-- 自己的JS -->
    <script src='${ctx}/resources/myjs/myjs.js'></script>
<style type="text/css">
* {
    background: none repeat scroll 0 0 transparent;
    border: 1 none;
    margin: 0;
    padding: 0;
    vertical-align: baseline;
	font-family:微软雅黑;
	overflow:hidden;
}
#navi{
	width:100%;
	position:relative;
	word-wrap:break-word;
	border-bottom:1px solid #065FB9;
	margin:0;
	padding:0;
	height:40px;
	line-height:40px;
	vertical-align:middle;
    background-image: -moz-linear-gradient(top,#EBEBEB, #BFBFBF);
    background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0, #EBEBEB),color-stop(1, 
#BFBFBF));
}
#naviDiv{
	font-size:14px;
	color:#333;
	padding-left:10px;
}
#tips{
	margin-top:10px;
	width:100%;
	height:40px;
}
#buttonGroup{
	padding-left:10px;
	float:left;
	height:35px;
}
.button{
	margin-top:20px;
	padding-left:10px;
	padding-right:10px;
	font-size:14px;
	width:70px;
	height:30px;
	line-height:30px;
	vertical-align:middle;
	text-align:center;
	cursor:pointer;
    border-color: #77D1F6;
    border-width: 1px;
    border-style: solid;
    border-radius: 6px 6px;
    -moz-box-shadow: 2px 2px 4px #282828;
    -webkit-box-shadow: 2px 2px 4px #282828;
    background-image: -moz-linear-gradient(top,#EBEBEB, #BFBFBF);
    background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0, #EBEBEB),color-stop(1, #BFBFBF));
}
#mainContainer{
	padding-left:10px;
	padding-right:10px;
	text-align:left;
	width:98%;
	font-size:16px;
}
</style>
<body>

<div id="navi">
	<div id='naviDiv'>
		<span><img src="${ctx}/resources/root/images/arror.gif" width="7" height="11" border="0" alt=""></span>&nbsp;用户管理<span>&nbsp;
		<span><img src="${ctx}/resources/root/images/arror.gif" width="7" height="11" border="0" alt=""></span>&nbsp;<a href="${ctx}/User/root/all_root">管理员</a><span>&nbsp;
	</div>
</div>

<div id="tips">
<div id="buttonGroup">
			
		
	</div>
</div>
<div id="mainContainer">
<!-- 从session中获取学生集合 -->
<!-- 从session中获取学生集合 -->
<table class="default"  style="width:1130px">
	<col width="5%">
	<col width="10%">
	<col width="20%">
	<col width="20%">
	<col width="10%">
	<col width="15%">
	<col width="20%">
	<tr class="title">
		<td>用户ID</td>
		<td>真实姓名</td>
		<td>账号</td>
		<td>密码</td>
		<td>职业</td>
		<td>手机</td>
		<td>操作</td>
	</tr>
	</table>
	</div>
	
	<div id="mainContainer" style="width:1130px; height:325px; overflow:scroll;">
  <table class="default" style="width:1130px; height:300px;" >
  <col width="5%">
	<col width="10%">
	<col width="20%">
	<col width="20%">
	<col width="10%">
	<col width="15%">
	<col width="20%">
	
	
	
	<!-- 遍历开始 -->
	<div id="root_users_messages" >
	 <c:forEach var="root_roots_message" items="${root_roots_messages}"   >
	 <tr class="list">
	 <td>${root_roots_message.uId }</td>
	 <td>${root_roots_message.name }</td>
	 <td>${root_roots_message.username }</td>
	 <td>${root_roots_message.password }</td>
	 <td>${root_roots_message.job }</td>
	 <td>${root_roots_message.phone }</td>
	 <td>
	 <a href="javascript:void(0);"  onclick="set_uId(${root_roots_message.uId },'${root_roots_message.name }','${root_roots_message.password }','${root_roots_message.job }','${root_roots_message.phone }')"data-toggle="modal" data-target="#update_root" title="修改">修改信息</a>
	 <a href="javascript:void(0);" onclick="del_root(${root_roots_message.uId })"  title="删除">删除</a>
	 </td>
	 </tr>
	 </c:forEach>
	 </div> 
	
<!--root信息修改 模态框  -->
<div class="modal fade" id="update_root" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title" id="jobexperienceModalLabel">修改管理员信息</h4>
      </div>
      <div class="modal-body">
       <form id="updateform"  Action="${ctx}/User/root/update_root"  method="POST">
       <div >
       <label>用户编号:</label>
       <input type="text" class="form-control"  readonly="readonly" style ="width:250px" id="uId" placeholder="uId" name="user.uId">
       </div>
        <div style="float:left">
       <label>真实姓名:</label>
       <input type="text" class="form-control"  style ="width:250px" id="realname" placeholder="realname" name="user.name">
       </div>
       <div style="float:right">
       <label>密码:</label>
       <input  type="text" class="form-control"  style ="width:250px" id="password"  placeholder="password" name="user.password">
       </div>
       <div style="float:left">
       <label>职业:</label>
       <input type="text" class="form-control"  style ="width:250px" id="job"  placeholder="job" name="job">
      </div>
       <div style="float:right">
       <label>联系方式:</label>
       <input type="text" class="form-control"  style ="width:250px" id="contact"  placeholder="contact" name="contact">
       </div>
    
    </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button"  onclick="submit('updateform')" class="btn btn-primary">confirm</button>
      </div>
    </div>
  </div>
</div>

</div>

	<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
	<script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
	<script type="text/javascript">
	var ctx = "${ctx}";
	//提交表
	 function submit(id){
		 
	     	document.getElementById(id).submit();
	            	
	     	}
	//设置用户Id
	function   set_uId(uId,name,password,job,phone){
		$('#uId').val(uId);
		$('#realname').val(name);
		$('#password').val(password);
		$('#job').val(job);
		$('#contact').val(phone);
	}
	//删除用户
function   del_root(uId){
    		 if(confirm("你确定要删除吗？"))
    			     {
    			 
    			 $.ajax({
    	        		type:"GET",
    	        		url:ctx+"/User/root/deleteroot/"+uId,
    	        		contentType: "application/json; charset=utf-8", 
    	        		dataType:"json",
    	        		success:function(result){
    	        			if(result==true){
    	        			//打开新的页面
    	        			 window.location.reload();
    	        			 alert("删除成功！");
    	        			}
    	        			else{
    	        				//打开新的页面
    		        			 window.location.reload();
    	    	        		alert("删除操作出现错误！");
    	        			}
    	        		},
    	        	error:function(){
    	        		//打开新的页面
	        			 window.location.reload();
    	        		alert("删除操作出现错误！");
    	        	
    	            }
    	        		
    	        	
    	        })
    			    }
    	}
//升为管理员
function   beManager(uId){
    		 if(confirm("你确定要提升该用户权限吗？"))
    			     {
    			 
    			 $.ajax({
    	        		type:"GET",
    	        		url:ctx+"/User/root/beManager/"+uId,
    	        		contentType: "application/json; charset=utf-8", 
    	        		dataType:"json",
    	        		success:function(result){
    	        			if(result==true){
        	        			//打开新的页面
        	        			 window.location.reload();
        	        			 alert("提升权限成功！");
        	        			}
        	        			else{
        	        				//打开新的页面
        		        			 window.location.reload();
        	    	        		alert("提升权限操作出现错误！");
        	        			}
    	        		},
    	        	error:function(){
    	        		//打开新的页面
	        			 window.location.reload();
    	        		alert("提升权限操作出现错误！");
    	        	
    	            }
    	        		
    	        	
    	        })
    			    }
    	}
</script>
</body>