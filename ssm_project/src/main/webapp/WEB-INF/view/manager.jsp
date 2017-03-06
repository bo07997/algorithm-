<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <c:set var="ctx" value="${pageContext.request.contextPath}" />  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Web QQ Login</title>
 <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="${ctx}/resources/jQuery/jquery-1.10.0.js"></script>
    <!-- 自己的JS -->
    <script src='${ctx}/resources/myjs/myjs.js'></script>
    <!-- 新 Bootstrap 核心 CSS 文件 -->
	<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
</head>
<style type="text/css">

	#wrap {
    display: block;
    width: 960px;
    margin: 0 auto;
    text-align: left;
}
/*	用户头部*/
	.head {
    display: block;
    height: 97px;
    overflow: hidden;
    margin-bottom: 50px;

		
}
	.head .user_info {
    float: left;
    margin: 6px 0 0 0;
}
	.head .user_info dt{
		float: left;
	}
	.head .user_info li{
		float: left;
	}
	.user_name{
	  margin-left: 20px;
      margin-right: 30px;
		
	}
	.feed_link{
	  margin-left: 40px;
		display: table-cell;
		
    margin-top: 32px;


	}
	
/*	管理栏*/
	.tabs_header {
    position: relative;
    height: 39px;
    overflow: hidden;
    margin-bottom: 15px;
}

	.tabs_header a{
		
    
    margin-left: 20px;
    margin-right: 20px;
	}
/*	选择框*/
.h_status {
    margin-bottom: 8px;
    padding: 5px;
    border-bottom: 1px solid #F5F5F5;
    color: #999;
    margin-left: 20px;

}
.tdleft {
    text-align: left;
    padding-left: 6px;
}
#img{
 width:100px;
 height:100px;
 background:#fff000;
}
#img img{
width:100%;
height:100%
}
.h_status {
    margin-bottom: 8px;
    padding: 5px;
    border-bottom: 1px solid #F5F5F5;
    color: #999;
}
.pipe {
    padding: 0 0.4em;
    color: #ddd;
}
#lstBox {
    width: 100%;
}
#lstBox .tdleft {
    text-align: left;
    padding-left: 6px;
}
#lstBox th {
    text-align: center;
    font-weight: bold;
    border-bottom: solid 1px #ccc;
    padding: 6px 2px;
}
#lstBox .altitem td {
    background-color: #f9f9f9;
}
#lstBox .tdleft {
    text-align: left;
    padding-left: 6px;
}
.altitem{
    height: 55px;

}
.recon{
  height: 55px;
 padding-top: 10px;
 
}
	</style>
  <body>
<nav class="navbar navbar-default navbar-inverse navbar-static-top" role="navigation" >
  <div class="container">
   <h1 style="color:#fff" class="text-center">My Blog<small>Welcome!</small>
   </h1>
   
  </div>
</nav>


 <div id="wrap">
  
   <div class="head">

            <div class="user_info">
                <dl>
                    <dt><a href="${ctx }/Message/toMessage/${loginuser.uId}" >
                     <div id="image">
            <img src="${ctx }${message.head}" style="width:100px"/>
              </div>
        </a></dt>
                    <dd>
                        <ul>
                            <li class="user_name"><a href="${ctx }/Message/toMessage/${loginuser.uId}" class="user_name">${user.username }</a><span>${user.name }的博客</span></li>
                            <li>
                            	
                            </li>
                            <li class="feed_link"><a href="${ctx }/Message/toMessage/${loginuser.uId}">个人主页</a>|<a href="${ctx }/Message/our_home/${id}_0">我的博客</a></li>
                        </ul>
                    </dd>
                </dl>
            </div>

           
        </div>
        
<!--       管理栏 -->
<nav class="navbar navbar-default second_nav_size navbar-static-top" role="navigation" style="" >
  <div  >
    <ul class="nav navbar-nav" >
        <li id="m1"><a href="${ctx }/Message/manager/${id}/1_0">文章管理</a></li>
        <li id="m2"><a href="${ctx }/Message/manager/${id}/2_0">类别管理</a></li>
        <li id="m3"><a href="${ctx }/Message/manager/${id}/3_0">评论管理</a></li>
        <li id="m4"><a href="${ctx }/Message/manager/${id}/4_0">草稿箱</a></li>
         <li id="m5"><a href="${ctx }/Message/manager/${id}/5_0">回收站</a></li>
          
       </ul>
       <button  class="btn btn-primary"  style="text-aligen:right;height: 41px;
       margin-left: 420px;margin-top: 5px;"  onclick="open_write('${ctx}','${loginuser.uId }')">写新文章</button>
  </div>
</nav>

    <!--  用if标签控制前端的数据显示，此时属性为文章管理-->
      <c:if test="${managercate==1 }">
<!--        选择框-->
        <div id="sel_div" class="h_status">
类别：     
 
<select id="selCat">
<option value="0"     >全部&nbsp;&nbsp;&nbsp;&nbsp;</option>

<c:forEach var="categorie"  items="${categories}" >
                 

 <c:choose>
       <c:when test="${categorie.cId==cId}">
           <option selected = "selected" value="${categorie.cId } "   >  ${categorie.cateName } (${ categorie.blogCount})</option>
       </c:when>
      
       <c:otherwise>
            <option value="${categorie.cId } "   >  ${categorie.cateName } (${ categorie.blogCount})</option>
       </c:otherwise>
</c:choose>      
                
</c:forEach>
</select>


类型：<select id="selType"><option value="all">全部&nbsp;&nbsp;&nbsp;&nbsp;</option><option value="original">原创</option><option value="repost">转载</option><option value="translated">翻译</option>
</select>&nbsp;

属性:<select id="selBoleArticle"><option value="">请选择&nbsp;&nbsp;&nbsp;&nbsp;</option><option value="allbole">全部&nbsp;&nbsp;&nbsp;&nbsp;</option><option value="allcomment">@博乐文章</option><option value="otherbole">其他文章</option></select>&nbsp;
<span id="selBolePanle" style="display:none">博乐:<select id="selBole"><option value="allcomment">全部&nbsp;&nbsp;&nbsp;&nbsp;</option><option value="nocheckcomment">未审核</option><option value="checknotpasscomment">审核未通过</option><option value="comment">已点评</option><option value="nocomment">未点评</option></select>&nbsp;</span>

</div>

<!--数据表-->
<div class="table-responsive ">
  <table class="table table-hover">
    <tbody><tr class=""><th class="tdleft">标题</th><th style="width:50px;">状态</th><th style="width:50px;">阅读</th><th style="width:50px;">评论</th><th style="width:70px;">评论权限</th><th style="width:170px;">操作</th>
          </tr>
          <c:forEach var="blog"  items="${blogs}" >
          <tr class=""><td class="tdleft"><a href="${ctx }/Blog/oneblog/${blog.bId }" target="_blank"> ${blog.bTitle } </a>
          <span class="gray">（${blog.dayChinese }）</span></td>
          <td>&nbsp;</td><td>${blog.readTimes }</td><td>${blog.commontTimes }</td>
          
          <c:if test="${blog.commontAuth==true }">
          <td><a href="javascript:void(0);"  onclick="commonauth(${blog.bId},'blog',${blog.commontAuth})"      class="lock">禁止评论</a></td>
         </c:if>
           <c:if test="${blog.commontAuth==false }">
          <td><a  href="javascript:void(0);"  onclick="commonauth(${blog.bId},'blog',${blog.commontAuth})"      class="lock">允许评论</a></td>
         </c:if>
         
          <td><a href="${ctx }/Blog/postedit/blog/${blog.bId }">编辑</a> | 
          <a href="javascript:void(0);"  onclick="del(${blog.bId },'${ctx }','blog')" title="删除">删除</a> | 
          <a href="javascript:void(0);" data-toggle="modal"  onclick="setbId(${blog.bId },'blog')" data-target="#SmallToCate" class="cat">分类</a></td></tr>
       </c:forEach>
</tbody>
  </table>
</div>

</c:if> 
<!-- 文章管理的模态框（Modal） -->  
<div class="modal fade bs-example-modal-sm" id="SmallToCate" tabindex="-1" role="dialog" aria-labelledby="SmallToEdit" aria-hidden="true">  
    <div class="modal-dialog">  
        <div class="modal-content">  
            <div class="modal-header">  
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>  
                <h4 class="modal-title" id="myModalLabel">修改类别</h4>  
            </div>  
            <div class="modal-body">  
              <div>
				<p class="subtit">个人分类 [<a href="${ctx }/Message/manager/${loginuser.uId}/2_0" target="_blank">编辑分类</a>]</p>
				<div class="radioBox ">
				<c:forEach var="categorie"  items="${categories}" >
				<input type="radio" name="catebyUser_model" id="my_${categorie.cId }" value="${categorie.cId }"><label for="radChl1">${categorie.cateName }</label>
				</c:forEach>
				</div>
</div>  
              
            </div>  
            <div class="modal-footer">  
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>  
                <button type="button" class="btn btn-primary" onclick="update_blogCate()" >提交更改</button>  
            </div>  
        </div>  
        <!-- /.modal-content -->  
    </div>  
    <!-- /.modal --> 
</div> 

<!--  用if标签控制前端的数据显示，此时属性为类别管理-->
<c:if test="${managercate==2 }">
<!--数据表-->
<div class="table-responsive ">
  <table class="table table-hover">
    <tbody>
          <tr><th class="tdleft">类别</th><th style="width:120px;">文章</th><th style="width:100px;">操作</th></tr>
       <c:forEach var="categorie"  items="${categories}" >
       <tr  class="over"><td class="tdleft"><span id="cate_${categorie.cId }" >${categorie.cateName }</span></td>
       <td><a href="${ctx }/Message/our_home/${id}_${categorie.cId }" style="color:red"  target="_blank">${categorie.blogCount }</a></td>
       <td><a href="#'${categorie.cId }'" onclick="doExec('cate_${categorie.cId }',${categorie.cId })" data-toggle="modal" data-target="#SmallToEdit">编辑</a> | <a href="javascript:void(0);" name="del" onclick="delcate(${categorie.cId },'${ctx }')"  title="删除">删除</a></tr>
       </c:forEach>
</tbody>
  </table>
</div>
<div style="margin-bottom:200px">
<input type="text" name="cateName" id="addCate"  style=" height: 32px;"/>   
<button type="button" class="btn btn-primary"  onclick="addCate(${loginuser.uId})">添加分类</button>
</div>
</c:if>

<!-- 分类管理的模态框（Modal） -->  
<div class="modal fade bs-example-modal-sm" id="SmallToEdit" tabindex="-1" role="dialog" aria-labelledby="SmallToEdit" aria-hidden="true">  
    <div class="modal-dialog">  
        <div class="modal-content">  
            <div class="modal-header">  
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>  
                <h4 class="modal-title" id="myModalLabel">修改类别</h4>  
            </div>  
            <div class="modal-body">  
                类别：<input type="text" name="cateName" id="cateName_model" />   
              
            </div>  
            <div class="modal-footer">  
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>  
                <button type="button" class="btn btn-primary" onclick="update()">提交更改</button>  
            </div>  
        </div>  
        <!-- /.modal-content -->  
    </div>  
    <!-- /.modal --> 
</div> 


<!--  用if标签控制前端的数据显示，此时属性为评论管理-->
<c:if test="${managercate==3 }">
<!--数据表-->
<div class="h_status">
<a href="${ctx }/Message/manager/${id}/3_0" class="active">我文章的评论</a><span class="pipe">|</span><a href="${ctx }/Message/manager/${id}/3_1">我发表的评论</a>
</div>
<table id="lstBox" cellspacing="0">
<thead>
<tr><th class="tdleft" style="width:426px;">标题</th><th style="width:140px;">作者</th><th style="width:140px;">时间</th><th style="width:100px;">操作</th></tr>
</thead>
<tbody>
<c:forEach var="comment_Blog_User"  items="${comment_Blog_Users}" >
<tr  id ="comment1_${comment_Blog_User.commentId}"class="altitem">
<td class="tdleft">RE: <a href="${ctx }/Blog/oneblog/${comment_Blog_User.bId }#articleComment" target="_blank">${comment_Blog_User.bTitle}</a></td>
<td style="text-align:center"><a href="${ctx }/Message/our_home/${comment_Blog_User.uId }_0" class="user_name" target="_blank">${comment_Blog_User.name}</a></td>
<td>${comment_Blog_User.time}</td><td><a class="del" style="margin-left: 47px;" href="javascript:void(0);" onclick="delcomment( '${ctx }',${comment_Blog_User.commentId})" >删除</a></td></tr>
<tr id ="comment2_${comment_Blog_User.commentId}"><td colspan="4"><div class="recon">${comment_Blog_User.commentContent}</div></td></tr>
</c:forEach>

</tbody>
</table>
</c:if>

    <!--  用if标签控制前端的数据显示，此时属性为草稿箱-->
 <c:if test="${managercate==4 }">
<!--数据表-->
<div class="table-responsive ">
  <table class="table table-hover">
    <tbody><tr class=""><th class="tdleft">标题</th><th style="width:50px;">状态</th><th style="width:50px;">阅读</th><th style="width:50px;">评论</th><th style="width:70px;">评论权限</th><th style="width:170px;">操作</th>
          </tr>
          <c:forEach var="blog"  items="${blogs}" >
          <tr class=""><td class="tdleft"><a href="${ctx }/Blog/oneblog/${blog.bId }" target="_blank"> ${blog.bTitle } </a>
          <span class="gray">（${blog.dayChinese }）</span></td><td>&nbsp;</td><td>${blog.readTimes }</td>
          <td>${blog.commontTimes }</td>
          
            <c:if test="${blog.commontAuth==true }">
          <td><a href="javascript:void(0);"  onclick="commonauth(${blog.bId},'draftblog',${blog.commontAuth})"      class="lock">禁止评论</a></td>
         </c:if>
           <c:if test="${blog.commontAuth==false }">
          <td><a  href="javascript:void(0);"  onclick="commonauth(${blog.bId},'draftblog',${blog.commontAuth})"      class="lock">允许评论</a></td>
         </c:if>
         
          <td><a href="${ctx }/Blog/postedit/draftblog/${blog.bId }">编辑</a>  | <a href="javascript:void(0);" onclick="del(${blog.bId },'${ctx }','draftblog')" title="删除">删除</a> | <a href="javascript:void(0);"  data-toggle="modal" onclick="setbId(${blog.bId },'draftblog')" data-target="#SmallToCate" class="cat">分类</a></td></tr>
       </c:forEach>
</tbody>
  </table>
</div>
</c:if>

<!--  用if标签控制前端的数据显示，此时属性为回收站-->
 <c:if test="${managercate==5 }">
<!--数据表-->
<div class="table-responsive ">
  <table class="table table-hover">
    <tbody><tr class=""><th class="tdleft">标题</th><th style="width:50px;">状态</th><th style="width:50px;">阅读</th><th style="width:50px;">评论</th><th style="width:70px;">评论权限</th><th style="width:170px;">操作</th>
          </tr>
          <c:forEach var="blog"  items="${blogs}" >
          <tr class=""><td class="tdleft"><a href="${ctx }/Blog/oneblog/${blog.bId }" target="_blank"> ${blog.bTitle } </a>
          <span class="gray">（${blog.dayChinese }）</span></td><td>&nbsp;</td><td>${blog.readTimes }</td>
          <td>${blog.commontTimes }</td>
            <c:if test="${blog.commontAuth==true }">
          <td><a href="javascript:void(0);"  onclick="commonauth(${blog.bId},'reblog',${blog.commontAuth})"      class="lock">禁止评论</a></td>
         </c:if>
           <c:if test="${blog.commontAuth==false }">
          <td><a  href="javascript:void(0);"  onclick="commonauth(${blog.bId},'reblog',${blog.commontAuth})"      class="lock">允许评论</a></td>
         </c:if>
          <td><a href="${ctx }/Blog/postedit/reblog/${blog.bId }">编辑</a>  | <a href="javascript:void(0);" onclick="del(${blog.bId },'${ctx }','reblog')"  title="删除">删除</a> | <a href="javascript:void(0);" data-toggle="modal"  onclick="setbId(${blog.bId },'reblog')" data-target="#SmallToCate" class="cat">分类</a></td></tr>
       </c:forEach>
</tbody>
  </table>
</div>
</c:if>


 </div>

<script type="text/javascript">  
//为选中的管理项增加active属性
$("#m${managercate}").addClass("active");
</script >

<footer class=" navbar-inverse navbar-fixed-bottom " style="height: 30px">
  <div class="">
    <a href="#" class="text-center">About us</a>
  </div>
</footer>

<script type="text/javascript">    
//需要编辑类别的ID
     let cId=null;
     //博客ID
     let  bId_all=null;
     //表ID，博客 草稿，回收站等
     let table=null;
    	 //监听select：
        $("#selCat").change(function(e) {
        	var n_url="${ctx }/Message/manager/${id}/1_"+e.target.value;
        	window.location.href =n_url;
        });
     
        function open_write(ctx,uId){
        	window.open(ctx+"/Blog/writeblog/"+uId,'_blank');
	     	}
        //显示更改分类模态框，给其赋值
        function setbId(bId,tname){
        	//给ID赋值
        	bId_all=bId;
        	table=tname;
        }
        //设置评论权限
        function commonauth(bId_this,table,commonauth){
        	
            $.ajax({  
                type: "post",  
                url: "${ctx}/Blog/setcommonauth/"+bId_this,  
            	data:JSON.stringify({
            		"table":table,
            		"commontAuth":commonauth,
            		"bId":bId_this
          			}),
          		contentType: "application/json; charset=utf-8", 
          		dataType:"json",
                success: function(result) {  
                	window.location.reload();
                	alert("修改成功!");
                	
                }  ,
         	error:function(){
        		alert("设置权限时后台出现错误！");
            }
            });  
	     	}
   
        //提交博客的分类更改  
        function update_blogCate() {  
            //获取模态框数据  
            var cId_model = $("input[name='catebyUser_model']:checked").val();
            if(cId_model==null){
            	alert("请选择分类！");
            	return false;
            }
            
            $.ajax({  
                type: "post",  
                url: "${ctx}/Blog/updatecate/"+cId_model,  
            	data:JSON.stringify({
            		"cId": cId_model,
          			"bId":bId_all,
          			"table":table
          			}),
          		contentType: "application/json; charset=utf-8", 
          		dataType:"json",
                success: function(result) {  
                	$('#SmallToupdate').modal('hide');
                	alert("修改成功!");
               	 window.location.reload();
                }  ,
         	error:function(){
        		alert("更改分类时后台出现错误！");
            }
            });  
      }
        //显示更改分类模态框，给其赋值
        function doExec(obj,id){
        	//给ID赋值
        	cId=id;
        	 va=document.getElementById(obj).innerHTML;
        	$('#cateName_model').val(va);  
        }
      //提交更改  
        function update() {  
            //获取模态框数据  
            var cateName = $('#cateName_model').val();  
            
            $.ajax({  
                type: "post",  
                url: "${ctx}/Category/updatecate/"+cId,  
            	data:JSON.stringify({
            		"cId": cId,
          			"cateName":cateName
          			}),
          		contentType: "application/json; charset=utf-8", 
          		dataType:"json",
                success: function(result) {  
                	$('#SmallToEdit').modal('hide');
                var	cate_name=document.getElementById("cate_"+cId);
                	cate_name.innerText=result.cateName;
                }  ,
         	error:function(){
        		alert("更改分类时后台出现错误！");
            }
            });  
      }
      //添加分类
        function addCate(uId){
        	var vt=$('#addCate').val();
        	if(vt.trim()==""){
        		alert("不能为空!");
        		return false;
        	}
        	  $.ajax({  
                  type: "post",  
                  url: "${ctx}/Category/addcate/"+uId,  
              	data:JSON.stringify({
              	     	"uId": uId,
            			"cateName":vt
            			}),
            		contentType: "application/json; charset=utf-8", 
            		dataType:"json",
                  success: function(result) {  
                	//打开新的页面
	        			 window.location.reload();
                  }  ,
           	error:function(){
          		alert("存在相同的分类！");
              }
              });  
        }
      //删除评论
        function delcomment(ctx,commentId){
        	 if(confirm("你确定要删除吗？"))
             {
         
         $.ajax({
        		type:"POST",
        		url:ctx+"/Comment/delComment/"+commentId,
        		contentType: "application/json; charset=utf-8", 
        		dataType:"json",
        		success:function(commentId){
        			if(commentId==0){
        				alert("删除操作出现错误！");
        				return false;
        			}
        		
        			 alert("删除成功！");
        			 $("#comment1_"+commentId).hide();
        			 $("#comment2_"+commentId).hide();
        		},
        	error:function(){
        		alert("出现未知错误！");
        	
            }
        })
            }
        }
</script> 
   
    
	<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
	<script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
  </body>
</html>