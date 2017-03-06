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
<link rel="stylesheet"
	href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
</head>
<style type="text/css">
.logina {
	padding-left: 600px;
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

.color_red ul li {
	color: red;
}

.color_red ul li p {
	color: black;
	float: right
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
	width: 950px;
}

.fr {
	float: right;
}

#com1 {
	margin-top: 100px;
	width: 850px;
	margin: 200px auto;
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

.border_b {
	border-width: 2px;
	border-style: solid;
	border-color: #e7ecef
}

.blog_list {
	padding: 30px 0;
	border-bottom: solid 1px #e7ecef;
}

.list {
	margin: 20px 20px 0 20px;
}

.list_item {
	display: block;
	clear: both;
}

.article_description {
	color: #666;
	font: normal 14px/24px Arial;
}

.article_manage {
	padding: 5px 0;
	color: #999;
	font: normal 12px/24px Arial;
	text-align: right;
}

#bod  span a {
	color: red
}
</style>
<body>
	<nav class="navbar navbar-default navbar-inverse navbar-static-top"
		role="navigation">
	<div class="container">
		<h1 style="color: #fff" class="text-center">
			MyBlog<small>Welcome!</small>
		</h1>

	</div>
	</nav>


	<div id="container">
		<div>
			<div>
				<h2>${user.name}的博客</h2>
			</div>
		</div>
		<c:if test="${loginuser.uId==auth_id}">
		<div id="navigator">
			<div class="navigator">
				<ul>
					
					<li id="btnView"><a
						href="http://blog.csdn.net/bo602505401?viewmode=list"><span
							onclick="_gaq.push(['_trackEvent','function', 'onclick', 'blog_articles_zhaiyao'])">
								<img src="http://static.blog.csdn.net/images/ico_summary.gif">摘要视图
						</span></a></li>
					


					<li id="btnManage"><a href="${ctx }/Message/manager/${id}/1_0"><span>
								<img src="http://static.blog.csdn.net/images/ico_set.gif">管理博客
						</span></a></li>
					<li id="btnWrite"><a
						href="${ctx }/Blog/writeblog/${id}"><span> <img
								src="http://static.blog.csdn.net/images/ico_write.gif">写新文章
						</span></a></li>
				</ul>
			</div>
		</div>
 </c:if> 
		<div id="body">

			<div class="blog_l fl">

				<div id="side">
					<div class="side">
						<div id="panel_Profile" class="panel" style="width: 194px;">
							<ul class="panel_head">
								<span>个人资料</span>
							</ul>
							<ul class="panel_body profile">
								<div id="blog_userface">
									<a href="${ctx }/Message/toMessage/${message.messageId}" target="_blank"> <img
										src="${ctx}${message.head}" title="访问我的空间"
										style="max-width: 90%">
									</a> <br> <span><a
										href="${ctx }/Message/toMessage/${message.messageId}" class="user_name"
										target="_blank">${user.name}</a></span>
								</div>
								<div class="interact" style="display: none;">

									<a href="javascript:void(0);" class="attent"
										id="span_add_follow" title="[加关注]"></a> <a
										href="javascript:void(0);" class="letter" title="[发私信]"
										onclick="window.open('http://msg.csdn.net/letters/model?receiver=bo602505401','_blank','height=350,width=700');_gaq.push(['_trackEvent','function', 'onclick', 'blog_articles_sixin'])"></a>
								</div>
								<div id="blog_medal">
									<div id="bms_box"></div>
								</div>
								<ul id="blog_rank">
									<li>访问：<span>${message.allTimes} 次</span></li>
									<li>等级： <span
										style="position: relative; display: inline-block; z-index: 1">
											<img
											src="http://c.csdnimg.cn/jifen/images/xunzhang/jianzhang/blog${message.level}.png"
											alt="" style="vertical-align: middle;" id="leveImg">
											<div id="smallTittle"
												style="position: absolute; left: -24px; top: 25px; text-align: center; width: 101px; height: 32px; background-color: rgb(255, 255, 255); line-height: 32px; border: 2px solid rgb(221, 221, 221); display: none; z-index: 999;">
												<div
													style="left: 42%; top: -8px; position: absolute; width: 0; height: 0; border-left: 10px solid transparent; border-right: 10px solid transparent; border-bottom: 8px solid #EAEAEA;"></div>
												积分：${message.allTimes}
											</div>
									</span>
									</li>
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
						<div>
							<!-- Default panel contents -->
							<div class="panel-heading" style="background: grey">文章分类</div>
							<!-- List group -->
							<ul class="list-group" style="margin-top: 20px">
								<c:forEach var="categorie" items="${categories}" begin="0"
									end="9">
									<%--用EL表达式调用list对象的属性循环输出对象的各个属性值--%>
									<c:if test="${not empty categorie}">
										<li class="list-group-item"  >
												<a href="${ctx}/Message/our_home/${categorie.uId }_${categorie.cId } ">
												${categorie.cateName }
												</a>

											<p>(${ categorie.blogCount} )</p>
										</li>
									</c:if>
								</c:forEach>


							</ul>
						</div>

						<div>
							<!-- Default panel contents -->
							<div class="panel-heading" style="background: grey">文章存档</div>
							<!-- List group -->
							<ul class="list-group" style="margin-top: 20px">
								<c:forEach var="createD" items="${createD}" begin="0" end="9">
									<!-- 这一行不能有class标签，
			否则 Attribute class invalid for tag forEach according to TLD-->
									<%--用EL表达式调用list对象的属性循环输出对象的各个属性值--%>
									<c:if test="${not empty createD}">
										<li class="list-group-item">
										<a  href="javascript:void(0) ;" onClick="getblogsBydate(${id },'${createD.createDate }','${ctx}')">${createD.createDate }</a>
											<p>(${ createD.sum} )</p>
										</li>
									</c:if>
								</c:forEach>
							</ul>
						</div>


						<div>
							<!-- Default panel contents -->
							<div class="panel-heading" style="background: grey">阅读排行</div>
							<!-- List group -->
							<ul class="list-group" style="margin-top: 20px">
								<c:forEach var="readTimes" items="${readTimes}" begin="0"
									end="9">
									<c:if test="${not empty readTimes}">
										<li class="list-group-item"
											style="font-size: 5px; margin-bottom: 5px;">
											<a  href="${ctx }/Blog/oneblog/${readTimes.bId}" >
											${readTimes.bTitle }
											</a>
											<p>(${ readTimes.readTimes} )</p>
										</li>
									</c:if>
								</c:forEach>
							</ul>
						</div>


						<div>
							<!-- Default panel contents -->
							<div class="panel-heading" style="background: grey">评论排行</div>
							<!-- List group -->
							<ul class="list-group" style="margin-top: 20px">
								<c:forEach var="commontTimes" items="${commontTimes}" begin="0"
									end="9">
									
									<c:if test="${not empty commontTimes}">
										<li class="list-group-item"
											style="font-size: 5px; margin-bottom: 5px;">
										<a  href="${ctx }/Blog/oneblog/${commontTimes.bId}" >
											${commontTimes.bTitle }
											</a>
											<p>(${ commontTimes.commontTimes} )</p>
										</li>
									</c:if>
								</c:forEach>
							</ul>
						</div>

						<div>
							<!-- Default panel contents -->
							<div class="panel-heading" style="background: grey">最新评论</div>
							<!-- List group -->
							<ul class="list-group" style="margin-top: 20px">
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
				<div class="list_item_new">

					<!-- <div id="article_toplist" class="list">

        </div> -->

					<div id="article_list" class="list border_b ">


						<c:forEach var="blog" items="${blogs}">
							<div class="list_item article_item blog_list">
								<div class="article_title">
									<h3>
										<span class="link_title"><a
											href="${ctx }/Blog/oneblog/${blog.bId }">
												${blog.bTitle } </a></span>
									</h3>
								</div>
								<div class="article_description">${blog.introduction }</div>
								<div id="bod" class="article_manage">
									<span class="link_postdate">${blog.dayChinese }</span> <span><a
										href="${ctx }/Blog/oneblog/${blog.bId }">阅读</a>(${blog.readTimes })</span>
									<span><a
										href="${ctx }/Blog/oneblog/${blog.bId }#articleComment"
										style="color: red" title="评论">评论</a>(${blog.commontTimes })</span>
									<c:if test="${loginuser.uId==auth_id}">
									<span><a
										href="${ctx }/Blog/postedit/blog/${blog.bId }" title="编辑">编辑</a></span>
									<span><a href="javascript:void(0);"
										onclick="del(${blog.bId },'${ctx }','blog')" title="删除">删除</a></span>
										</c:if>
								</div>
								<div class="clear"></div>
							</div>
						</c:forEach>
					</div>



				</div>
			</div>

		</div>

	</div>

	</div>







	<footer class=" navbar-inverse navbar-fixed-bottom "
		style="height: 50px">
	<div class="">
		<a href="#" class="text-center">About us</a>
	</div>
	</footer>



	<!-- Include all compiled plugins (below), or include individual files as needed -->

	<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
	<script
		src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
</script>
</body>
</html>