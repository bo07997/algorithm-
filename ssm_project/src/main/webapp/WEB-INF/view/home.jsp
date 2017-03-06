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
<link rel="stylesheet"
	href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
</head>
<style type="text/css">
.logina {
	padding-left: 600px;
	padding-top: 100px;
}

.image {
	background: #fff000;
	overflow: hidden;
}

.image img {
	width: 100%;
	height: 100%;
}

.second_nav_size {
	height: 0px;
	width: 100%;
	background: #F1ECEC;
}

.blog_home_main {
	width: 1170px;
	margin: 30px auto;
}

.blog_l {
	width: 850px;
}

.fl {
	float: left;
}

.blog_r {
	width: 300px;
}

.fr {
	float: right;
}

.choose_blog .choose_b {
	position: relative;
	overflow: hidden;
	cursor: pointer;
}

.choose_b_l {
	width: 500px;
}

.choose_b_r {
	width: 340px;
	float: left;
	margin-left: 10px;
}

.blog_list_wrap {
	background: #fff;
	overflow: hidden;
}

.blog_list {
	padding: 30px 0;
	border-bottom: solid 1px #e7ecef;
}

.expert_title {
	position: absolute;
	top: 10px;
	left: -7px;
	height: 28px;
	line-height: 28px;
	background: #d13030;
	padding: 0 20px;
	font-size: 14px;
	color: #fff;
}

.expert {
	background: #fff;
	position: relative;
	padding: 40px 30px 30px;
}

.head_expert {
	width: 130px;
	height: 130px;
	border-radius: 50%;
	display: block;
	margin: 0 auto;
}

.head_expert_bloglist {
	width: 40px;
	height: 40px;
	border-radius: 50%;
	display: block;
	margin: 0 auto;
}

/*	分类*/
.mod_title {
	height: 50px;
	border-bottom: solid 1px #ebebeb;
	position: relative;
	padding: 0 20px;
	line-height: 50px;
}

.blog_category {
	padding: 10px 20px;
}

.border_b {
	height: 2px;
	position: absolute;
	left: 20px;
	bottom: -1px;
	width: 20px;
	border-bottom: solid 2px #c00;
}

.mod_title_t {
	line-height: 50px;
}

.categ {
	background: #fff;
	margin-top: 10px;
}

.imgword {
	font-size: 20px;
	color: #fff;
	position: absolute;
	margin: 0;
	padding: 0;
	line-height: 24px;
	font-family: 'Microsoft YaHei';
	font-weight: normal;
	text-decoration: none;
	top: 320px;
	background: transparent;
	outline: none;
}
</style>
<body>
	<nav class="navbar navbar-default navbar-inverse navbar-static-top"
		role="navigation" style="margin-bottom: 0px">
	<div class="container">
		<h1 style="color: #fff;" class="text-center">
			MyBlog<small>Welcome!</small>
		</h1>
	</div>
	</nav>

	<nav class="navbar navbar-default second_nav_size navbar-static-top"
		role="navigation" style="">
	<div>
		<ul class="nav navbar-nav" style="margin-left: 200px;">
			<li class="active"><a href="${ctx }/Blog/home">首页</a></li>
			<li><a href="${ctx }/Message/toMessage/${user.uId}">个人主页</a></li>
			<li><a href="#">排行</a></li>
			<li><a href="#">观点</a></li>
			<li><a href="${ctx }/Message/manager/${user.uId}/1_0"
				target="_blank">我的博客</a></li>
			<li><a href="${ctx }/User/loginout" target="_self">安全退出</a></li>
		</ul>
	</div>
	</nav>

	<div class="blog_home_main ">
		<div class="blog_l fl">

			<!--推荐博文-->
			<div>
				<!--推荐一-->
				<div class="choose_b_l choose_b fl"
					style="height: 255px; width: 500px; margin-bottom: 90px;">

					<div class="image">
						<!-- ../jpgs/background.jpg -->
						<a href="${ctx}/Blog/oneblog/${blog.bId}"> <img class="image"
							src="${ctx}/resources/jpgs/home/201612201.jpg "> <a
							class="imgword" style="width: 480px"
							href="${ctx}/Blog/oneblog/${blog.bId}">${blog.bTitle} <br>
							<br>姜维

						</a>

						</a>
					</div>
				</div>

				<!--推荐二-->
				<div class="choose_b_r choose_b"
					style="height: 255px; width: 340px; margin-bottom: 90px;">
					<div class="image">
						<!-- ../jpgs/background.jpg -->
						<a href="${ctx}/Blog/oneblog/${blog.bId}"> <img class="image"
							src="${ctx}/resources/jpgs/home/201612202.jpg "> <a
							class="imgword"></a>
						</a>

					</div>
				</div>
			</div>

			<div class=""
				style="border-width: 2px; border-style: solid; border-color: #e7ecef">
				<c:forEach var="blog" items="${bloglist}">
					<!-- 这一行不能有class标签，
			否则 Attribute class invalid for tag forEach according to TLD-->
					<%--用EL表达式调用list对象的属性循环输出对象的各个属性值--%>
					<div style="padding-bottom: 70px;" class="blog_list ">
						<h3>
							<a href="${ctx}/Blog/oneblog/${blog.bId}" style="color: black">${blog.bTitle}</a>
						</h3>
						<h4 style="color: grey">${blog.introduction}</h4>
						<div style="float: left">
							<a href="${ctx }/Message/our_home/${blog.uId}_0" target="_blank">
								<img style="margin-left: 50px;" src="${ctx }${blog.head }"
								class="head_expert_bloglist">
							</a> <a href="${ctx }/Message/our_home/${blog.uId}_0" target="_blank">
								<h5 style="margin-left: 50px;">${blog.realname}</h5>
							</a>
						</div>
						<div style="float: left">
                         <a href="${ctx }/Blog/home/${blog.cateCsdn}">
							<h4
							class="glyphicon glyphicon-th-list"
								style="color: black; width: 120px; height: 45px; margin-left: 50px; margin-top: 25px;">${blog.cateCsdn}</h4>
						</a>
						</div>
						<div style="float: right">

							<h4
							class="glyphicon glyphicon-eye-open"
								style="color: black; width: 95px; height: 15px; margin-left: 50px; margin-top: 25px;">阅读次数</h4>
							<h4 style="text-align: right;margin-top: 0px;">${blog.commont_times}</h4>
						</div>
						<div style="float: right">

							<h4
							class="glyphicon glyphicon-time"
								style="color: black; width: 150px; height: 20px; margin-left: 50px; margin-top: 25px;">${blog.day_chinese}</h4>
						</div>
					</div>

				</c:forEach>


			</div>

		</div>

	</div>

	<div class="blog_r fr">

		<!--签约作者-->
		<div class="expert">
			<div class="expert_title">
				Programmer<img
					src="http://static.blog.csdn.net/static/images/triangle_right.png"
					alt="img" class="triangle">
			</div>
			<dl class="expert_c">
				<dt class="tracking-ad" data-mod="popu_253">
					<a href="${ctx }/Message/our_home/${homeman.messageId}_0"
						target="_blank"><img src="${ctx }${homeman.head }"
						class="head_expert"></a>
					<h4 class="expert_name">
						<a href="${ctx }/Message/our_home/${homeman.messageId}_0"
							target="_blank">${homeman.realname}</a>
					</h4>
					<p class="author">签约作者</p>
				</dt>
				<dd>
					<div class="expert_c_b">${homeman.introduction }...</div>
				</dd>
			</dl>
		</div>

		<!--博文分类-->
		<div class="categ">
			<div class="mod_title">
				<div class="border_b"></div>
				<h4 class="mod_title_t">
					<label><a href="/newarticle.html" name="all">博文分类</a></label>
				</h4>
			</div>
			<div class="blog_category">
				<ul class="category_list tracking-ad" data-mod="popu_257">


					<li><a class="glyphicon glyphicon-phone"></a> <a
						href="${ctx }/Blog/home/移动开发" target="_blank">移动开发</a></li>
					<li><a class="glyphicon glyphicon-tasks"></a> <a
						href="${ctx }/Blog/home/Web前端" target="_blank">Web前端</a></li>


					<li><a class="glyphicon glyphicon-indent-right"></a> <a
						href="${ctx }/Blog/home/架构设计" target="_blank">架构设计</a></li>
					<li><a class="glyphicon glyphicon-book"></a> <a
						href="${ctx }/Blog/home/编程语言" target="_blank">编程语言</a></li>
					<li><a class="glyphicon glyphicon-globe"></a> <a
						href="${ctx }/Blog/home/互联网" target="_blank">互联网</a></li>
					<li><a class="glyphicon glyphicon-save"></a> <a
						href="${ctx }/Blog/home/数据库" target="_blank">数据库</a></li>
					<li><a class="glyphicon glyphicon-star-empty"></a> <a
						href="${ctx }/Blog/home/系统运维" target="_blank">系统运维</a></li>
					<li><a class="glyphicon glyphicon-cloud-upload"></a> <a
						href="${ctx }/Blog/home/云计算" target="_blank">云计算</a></li>
					<li><a class="glyphicon glyphicon-certificate"></a> <a
						href="${ctx }/Blog/home/研发管理" target="_blank">研发管理</a></li>

					<li><a class="glyphicon glyphicon-tower"></a> <a
						href="${ctx }/Blog/home/综合" class="other" target="_blank">综合</a>
					</li>
				</ul>
			</div>






		</div>
	</div>
	</div>


	<footer class=" navbar-inverse navbar-fixed-bottom "
		style="height: 30px">
	<div class="">
		<a href="#" class="text-center">About us</a>
	</div>
	</footer>



	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="${ctx}/resources/jQuery/jquery-1.10.0.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->

	<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
	<script
		src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
</body>
</html>
</html>
