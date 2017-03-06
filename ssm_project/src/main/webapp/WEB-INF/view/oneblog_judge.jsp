<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <c:set var="ctx" value="${pageContext.request.contextPath}" />   
<!DOCTYPE html>
<html lang="zh-cn">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>MyBlog</title>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
   <%--  <script src="${ctx}/resources/jQuery/jquery-1.10.0.js"></script>  --%>
    <!-- 自己的JS -->
<script src='${ctx}/resources/myjs/myjs.js'></script>
    <!-- 新 Bootstrap 核心 CSS 文件 -->
	<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
  <!-- 评论的CSS -->
  <link rel="stylesheet" href="${ctx}/resources/comment/css/semantic.css" type="text/css" />
<link rel="stylesheet" href="${ctx}/resources/comment/css/zyComment.css" type="text/css" />
  </head>
<style type="text/css">
    .logina{
	 padding-left:600px;
    padding-top: 100px;
    }
/*	总标题*/
	#header {
    width: 980px;
    height: 36px;
    margin: 0 auto;
    padding: 35px 0 0 0;
    text-align: left;
}
	#navigator {
    display: block;
    clear: both;
    height: 42px;
    margin: 0 auto;
    width: 96%;
    max-width: 1200px;
    padding: 100px 0px 0 0;
    text-align: left;
}
	.navigator {
    text-align: left;
}
/*	标签水平浮动*/
	.navigator li {
    display: inline;
    float: right;
    margin: 0 5px;
}
	#body {
    display: block;
    width: 96%;
    max-width: 1200px;
    margin: 10px auto;
    text-align: left;
}
	#main {
    margin-left: -210px;
    overflow: hidden;
}
	#main .main {
    _float: right;
    min-width: 700px;
    margin-left: 210px;
    padding: 1px;
    border: solid 1px #000;
    background: #fff;
}
	#side {
    float: left;
    width: 200px;
    overflow: hidden;
    line-height: 120%;
}
.color_red ul li{
color:red;
}
.color_red ul li p{
color:black;
float:right
}
.color_red ul li a {
	color: red
}
	.panel {
    margin: 0 0 10px 0;
    padding: 1px;
    border: solid 1px #000;
    background: #fff;
}
	.panel_head {
    clear: both;
    height: 30px;
    padding: 0 5px;
    background: grey;
    color: #333;
    font: bold 12px/30px Arial;
    text-indent: 5px;
}
	.side .panel_body {
    padding: 4px 10px;
}
	.side ul {
    margin: 0px;
    padding: 0px;
}
		.blog_l {
    width: 196px;
}
		.fl {
    float: left;
}
		 .blog_r {
    width: 850px;
}
		.fr {
    float: right;
}
#com1{
margin-top: 100px ;
	width:850px;
	margin:200px auto;
	margin-bottom: 100px ;
	}
	#com1 dt {
    margin: 0px;
    color: #fff;
    font: normal 27px/30px 'Microsoft YaHei';
}
#com1 dd {
    margin: 0px;
    color: #fff;
    font: normal 12px/22px Arial;
}
label {
	    font-weight: bold;
	}
	a {
		font-family: Microsoft YaHei;
	}
	#articleComment {
		width: 600px;
		height: 1500px;
		overflow: auto;
	}
	</style>
  <body>
<nav class="navbar navbar-default navbar-inverse navbar-static-top" role="navigation" >
  <div class="container">
   <h1 style="color:#fff" class="text-center">MyBlog<small>Welcome!</small>
   </h1>
   
  </div>
</nav>


<div id="container">
	<div id="header">
		<div>
			<h2>
				${user.name}的博客
			</h2>
		</div>
	</div>
	<div id="navigator">  
	
	</div>
	
	<div id="body">
	
	<div class="blog_l fl" >
		
		<div id="side">
		  <div class="side">
				<div id="panel_Profile" class="panel" style=" width: 194px;">
<ul class="panel_head"><span>个人资料</span></ul>
<ul class="panel_body profile">
<div id="blog_userface">
    <a href="${ctx }/Message/toMessage/${message.messageId}" target="_blank">
    <img src="${ctx}${message.head}" title="访问我的空间" style="max-width:90%">
    </a>
    <br>
    <span><a href="${ctx }/Message/toMessage/${message.messageId}" class="user_name" target="_blank">${user.name}</a></span>
</div>
<div class="interact" style="display: none;">

    <a href="javascript:void(0);" class="attent" id="span_add_follow" title="[加关注]"></a>

 <a href="javascript:void(0);" class="letter" title="[发私信]" onclick="window.open('http://msg.csdn.net/letters/model?receiver=bo602505401','_blank','height=350,width=700');_gaq.push(['_trackEvent','function', 'onclick', 'blog_articles_sixin'])"></a>  
</div>
<div id="blog_medal">
                <div id="bms_box">
               </div>
</div>
<ul id="blog_rank">
    <li>访问：<span>${message.allTimes} 次</span></li>
    <li>等级： <span style="position:relative;display:inline-block;z-index:1">
            <img src="http://c.csdnimg.cn/jifen/images/xunzhang/jianzhang/blog${message.level}.png" alt="" style="vertical-align: middle;" id="leveImg">
            <div id="smallTittle" style="position: absolute; left: -24px; top: 25px; text-align: center; width: 101px; height: 32px; background-color: rgb(255, 255, 255); line-height: 32px; border: 2px solid rgb(221, 221, 221); display: none; z-index: 999;">
            <div style="left: 42%;  top: -8px;  position: absolute;  width: 0;  height: 0;  border-left: 10px solid transparent;  border-right: 10px solid transparent;  border-bottom: 8px solid #EAEAEA;"></div>
            积分：${message.allTimes} </div>
        </span>  </li>
    <li>排名：<span>${message.rank}</span></li>
</ul>
<ul id="blog_statistics">
    <li>原创：<span>23篇</span></li>
    <li>转载：<span>3篇</span></li>
    <li>译文：<span>0篇</span></li>
    <li>评论：<span>${all_comment_times }条</span></li>
</ul>
</ul>
</div>
			</div>
		</div>
		<div class="panel panel-default">
		<div class="color_red">
			<div  >
  <!-- Default panel contents -->
  <div class="panel-heading"  style="background:grey">文章分类</div>
  <!-- List group -->
  <ul class="list-group" style=" margin-top: 20px">
  <c:forEach var="categorie"  items="${categories}" begin="0" end="9"  >
                  <c:if test="${not empty categorie}">
               <li class="list-group-item"><a href="${ctx}/Message/our_home/${categorie.uId }_${categorie.cId } ">
												${categorie.cateName }
												</a>

											<p>(${ categorie.blogCount} )</p>
               </li>
               </c:if> 
</c:forEach>
    
    
  </ul>
  </div>
		
			<div  >
  <!-- Default panel contents -->
  <div class="panel-heading"  style="background:grey">文章存档</div>
  <!-- List group -->
  <ul class="list-group" style=" margin-top: 20px">
    <c:forEach var="createD"  items="${createD}" begin="0" end="9"  ><!-- 这一行不能有class标签，
			否则 Attribute class invalid for tag forEach according to TLD-->
                 <%--用EL表达式调用list对象的属性循环输出对象的各个属性值--%> 
                  <c:if test="${not empty createD}">
               <li class="list-group-item">
               <a  href="javascript:void(0) ;" onClick="openblogsBydate(${user.uId },'${createD.createDate }','${ctx}')">${createD.createDate }</a>
				<p>(${ createD.sum} )</p>
               </li>
               </c:if> 
</c:forEach>
  </ul>
  </div>
		
		
		<div  >
  <!-- Default panel contents -->
  <div class="panel-heading"  style="background:grey">阅读排行</div>
  <!-- List group -->
  <ul class="list-group" style=" margin-top: 20px">
   <c:forEach var="readTimes"  items="${readTimes}" begin="0" end="9"  ><!-- 这一行不能有class标签，
			否则 Attribute class invalid for tag forEach according to TLD-->
                 <%--用EL表达式调用list对象的属性循环输出对象的各个属性值--%> 
                  <c:if test="${not empty readTimes}">
               <li class="list-group-item"  style="font-size:5px;margin-bottom: 5px;">
            <a  href="${ctx }/Blog/oneblog/${readTimes.bId}" >
											${readTimes.bTitle }
											</a>
											<p>(${ readTimes.readTimes} )</p>
               </li>
               </c:if> 
</c:forEach>
  </ul>
  </div>
  
  
  	<div  >
  <!-- Default panel contents -->
  <div class="panel-heading"  style="background:grey">评论排行</div>
  <!-- List group -->
  <ul class="list-group" style=" margin-top: 20px">
    <c:forEach var="commontTimes"  items="${commontTimes}" begin="0" end="9"  ><!-- 这一行不能有class标签，
			否则 Attribute class invalid for tag forEach according to TLD-->
                 <%--用EL表达式调用list对象的属性循环输出对象的各个属性值--%> 
                  <c:if test="${not empty commontTimes}">
               <li class="list-group-item" style="font-size:5px;margin-bottom: 5px;">
              	<a  href="${ctx }/Blog/oneblog/${commontTimes.bId}" >
											${commontTimes.bTitle }
											</a>
											<p>(${ commontTimes.commontTimes} )</p>
               </li>
               </c:if> 
</c:forEach>
  </ul>
  </div>
  
  	<div  >
  <!-- Default panel contents -->
  <div class="panel-heading"  style="background:grey">最新评论</div>
  <!-- List group -->
  <ul class="list-group" style=" margin-top: 20px">
    <li class="list-group-item">Cras justo odio</li>
    <li class="list-group-item">Dapibus ac facilisis in</li>
    <li class="list-group-item">Morbi leo risus</li>
    <li class="list-group-item">Porta ac consectetur ac</li>
    <li class="list-group-item">Vestibulum at eros</li>
  </ul>
  </div>
  
</div>
	</div>		
			
			
			</div>	
	
	
	
	
	
	
		<div id="main " class="fr blog_r">
		<h2 style="text-align:center">${blog.bTitle}   </h2>
		<p style="text-align:right;color:grey">${blog.dayChinese}  &nbsp&nbsp&nbsp ${blog.readTimes }人阅读 </p>
		<div id="content">
		${blog.content }
		</div>
		
		<div>
	<div id="com1" class="btn-group"  >
  <button type="button" class="btn btn-default" style="  padding: 30px 30px;margin-left: 300px;
  background:#ff7900" ><dt>顶</dt><dd id="uptimes">${blog.up}</dd></button>
  <button type="button" class="btn btn-default"style="  padding: 30px 30px;
  background:#ff7900" ><dt>踩</dt><dd id="downtimes">${blog.down}</dd></button>
  </div>
		</div>
		
		
	</div>

</div>

	  </div>
	  


<footer  class=" navbar-inverse navbar-fixed-bottom " style="height: 30px">
  <div class="">
    <a href="#" class="text-center">About us</a>
  </div>
</footer>


    
    
	
	<!-- 评论的JS -->
	<script type="text/javascript" src="${ctx}/resources/comment/js/jquery-1.7.2.min.js"></script>
	<script type="text/javascript" src="${ctx}/resources/comment/js/zyComment.js"></script>
	<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
	<script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script type="text/javascript">

let messageId=null;
let message_head=null;
let message_name=null;

let commentAuth =false;
let time =null;
var  agoComment =[];
var result_comment=null;
//博客ID
 let bId=${blog.bId};
//messageid
messageId="${login_message_oneblog.messageId}";
//头像图片地址
message_head="${login_message_oneblog.head}";
//用户名
message_name="${login_message_oneblog.realname}";
//评论权限
commentAuth=${blog.commontAuth};

//获取当前时间的正确格式
function getNowFormatDate() {
    var date = new Date();
    var seperator1 = "-";
    var seperator2 = ":";
    var month = date.getMonth() + 1;
    var strDate = date.getDate();
    var strHours = date.getHours() ;
    var strMinutes = date.getMinutes();
    var strSeconds = date.getSeconds();
    if (month >= 1 && month <= 9) {
        month = "0" + month;
    }
    if (strDate >= 0 && strDate <= 9) {
        strDate = "0" + strDate;
    }
    if (strHours >= 0 && strHours <= 9) {
    	strHours = "0" + strHours;
    }
    if (strMinutes >= 0 && strMinutes <= 9) {
    	strMinutes = "0" + strMinutes;
    }
    if (strSeconds >= 0 && strSeconds <= 9) {
    	strSeconds = "0" + strSeconds;
    }
    var currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate
            + " " + strHours + seperator2 + strMinutes
            + seperator2 + strSeconds;
    return currentdate;
}
$(document).ready(function(){
	//获取以往评论的ajax
	$.ajax({
  		type:"POST",
  		url:"${ctx}/Comment/getComment/"+bId,
  		data:JSON.stringify({
  			
  			}),
  		contentType: "application/json; charset=utf-8", 
  		dataType:"json",
  		success:function(result){
  			agoComment=result;
  			$("#articleComment").zyComment({
  				"width":"355",
  				"height":"33",
  				"agoComment":agoComment,
  				"callback":function(comment){
  					console.info("填写内容返回值：");
  					console.info(comment);
  					time=getNowFormatDate();
  					var day=new Date();
  					if (messageId==null||messageId.trim()=="")
  				  {
  				  alert("请先登录!");
  				  return false;
  				  }
  					if(commentAuth==false){
  					  alert("本文禁止评论!");
  	  				  return false;
  					}
  				
  					//将新建的评论通过ajax插入到数据库
  					$.ajax({
  		type:"POST",
  		url:"${ctx}/Comment/addComment/"+bId,
  		data:JSON.stringify({
  			"messageId":messageId,
  			"blogId":bId,
  			"time":day,
  			"content":comment.content,
  			"sortId":comment.sortID
  			}),
  		contentType: "application/json; charset=utf-8", 
  		dataType:"json",
  		success:function(result){
  			result_comment=result;
  			// 添加新的评论
				$("#articleComment").zyComment("setCommentAfter",{"id":result_comment.commentId, "name":message_name,"head":message_head,"content":comment.content, "time":time});
  			}
  		})
  					
  				
  				}
  			});
  			
  		},
	error:function(){
		alert("错误！");
    }
  	})

});
//处理赞与踩
function up_down(up_down) {
	
				//将新建的赞与踩提交
					$.ajax({
			type:"POST",
			url:"${ctx}/Blog/updateUp_down/"+up_down,//顶为1，踩为2
			data:JSON.stringify({
			"bId":bId,
			}),
			contentType: "application/json; charset=utf-8", 
			dataType:"json",
			success:function(blog){
				$("#uptimes").html(blog.up);
				$("#downtimes").html(blog.down);
			
			},
			error:function(){
				
		    }
			})
}
</script>
  </body>
</html>