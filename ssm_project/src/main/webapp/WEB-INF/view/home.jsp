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
</head><style type="text/css">
    .logina{
	 padding-left:600px;
    padding-top: 100px;
    }
	 #image{ 
        width:500px;
        height:190px;
        background:#fff000;
        overflow: hidden;
    }
	.second_nav_size{
		height: 0px;
		width: 100%;
		background:#F1ECEC;
		
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
	</style>
  <body>
<nav class="navbar navbar-default navbar-inverse navbar-static-top" role="navigation" style="margin-bottom: 0px">
  <div class="container">
   <h1 style="color:#fff" class="text-center">MyBlog<small>Welcome!</small>
   </h1>
  </div>
</nav>
<nav class="navbar navbar-default second_nav_size navbar-static-top" role="navigation" style="" >
  <div  >
   <h2 style="" class="text-center">测试
   </h2>
  </div>
</nav>
<div class="blog_home_main ">
	<div class="blog_l fl" >
		
		<h1>我在左边我在左边我在左边我在左边我在左边我在左边我在左边我在左边我在左边我在左边我在左边</h1>
		<!--推荐博文-->
		<div>
		<!--推荐一-->
			<div class="choose_b_l choose_b fl" style="height: 195px;width:500px; ">
				
				<div  id="image"><!-- ../jpgs/background.jpg -->
	            <a  href="#">
		        <img class="image" src="http://w.qq.com/img/bg/1.jpg">
                </a>
	           </div>
			</div>
			
			<!--推荐二-->
			<div class="choose_b_r choose_b" style="height: 195px;width: 340px">
				<h1>我在右边我在右边我在右边我在右边我在右边我在右</h1>
			</div>
		</div>
		
		<div class="">
			<div class="blog_list ">
				<h2>我是列表</h2>
				<h4>我是内容</h4>
			</div>
			<c:forEach var="bloglist" items="${bloglist}" ><!-- 这一行不能有class标签，
			否则 Attribute class invalid for tag forEach according to TLD-->
                 <%--用EL表达式调用list对象的属性循环输出对象的各个属性值--%> 
                <div class="blog_list ">
                <h2>${bloglist.bTitle}</h2>
				<h4>${bloglist.introduction}</h4>
				</div>

</c:forEach>
			
			
			</div>
			
		</div>
		
	</div>
	
	<div class="blog_r fr" >
		<h1>我在右边我在右边我在右边我在右边我在右边我在右边我在右边我在右边我在右边我在右边我在右边我在右边我在右边我在右边我在右边我在右边我在右边我在右边我在右边我在右边我在右边我在在右边我在右边</h1>
		<!--签约作者-->
         <div class="expert">
          <div class="expert_title">Programmer<img src="http://static.blog.csdn.net/static/images/triangle_right.png" alt="img" class="triangle"></div>
          <dl class="expert_c">
            <dt class="tracking-ad" data-mod="popu_253"><a href="http://blog.csdn.net/baimafujinji" target="_blank"><img src="http://img.blog.csdn.net/20161205175643088" class="head_expert"></a>
              <h4 class="expert_name"><a href="http://blog.csdn.net/baimafujinji" target="_blank">左飞</a></h4>
              <p class="author">签约作者</p>
            </dt>
            <dd><img src="http://static.blog.csdn.net/static/images/icon_l.png" alt="img" class="icon_l"><img src="http://static.blog.csdn.net/static/images/icon_r.png" alt="img" class="icon_r">
              <div class="expert_c_b">技术作家、译者。著作涉及图像处理、机器学习和移动通信等多个领域，并翻译出版了计算机领域的经...</div>
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
                        <li>
                          <ul>
                          <li> 
                          <a href="/mobile/newarticle.html" class="glyphicon glyphicon-phone" target="_blank">移动开发</a>
                          </li>
                          <li>
                           <a href="/web/newarticle.html" class="web" target="_blank">Web前端</a>  
                           </li>  
                           </ul>         
                        </li>          
                        <li>
                           <a href="/enterprise/newarticle.html" class="enterprise" target="_blank">架构设计</a><a href="/code/newarticle.html" class="code" target="_blank">编程语言</a>                        </li>          
                        <li>
                           <a href="/www/newarticle.html" class="www" target="_blank">互联网</a><a href="/database/newarticle.html" class="database" target="_blank">数据库</a>                        </li>          
                        <li>
                           <a href="/system/newarticle.html" class="system" target="_blank">系统运维</a><a href="/cloud/newarticle.html" class="cloud" target="_blank">云计算</a>                        </li>          
                        <li>
                           <a href="/software/newarticle.html" class="software" target="_blank">研发管理</a><a href="/other/newarticle.html" class="other" target="_blank">综合</a>                        </li>          
            </ul>
          </div>

         
         
         <div class="categ">
          <div class="mod_title">
            <div class="border_b"></div>
            <h4 class="mod_title_t">
              <label>热文排行榜</label>
              <div id="List" class="List"><span class="list_cur">日榜</span><span class="">周榜</span><span class="">月榜</span></div>
            </h4>
          </div>
          <ul class="hot_wrap tracking-ad" data-mod="popu_261"><li><a href="http://blog.csdn.net/cnbeta2435/article/details/53207073"><i class="fa fa-caret-right"></i><span>关闭公告</span></a></li><li><a href="http://blog.csdn.net/hudashi/article/details/7664482"><i class="fa fa-caret-right"></i><span>git checkout简介</span></a></li><li><a href="http://blog.csdn.net/qq379454816/article/details/50086349"><i class="fa fa-caret-right"></i><span>Xutils3的使用</span></a></li><li><a href="http://blog.csdn.net/zhs17180642010/article/details/52141078"><i class="fa fa-caret-right"></i><span>新MM</span></a></li><li><a href="http://blog.csdn.net/qq524666534/article/details/51934642"><i class="fa fa-caret-right"></i><span>起点网络备用列表</span></a></li></ul>
 </div>
         
         
          </div>
		
	</div>
	
	
</div>


<footer class=" navbar-inverse navbar-fixed-bottom " style="height: 50px">
  <div class="">
    <a href="#" class="text-center">About us</a>
  </div>
</footer>
<div>
	
	
</div>


    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="${ctx}/resources/jQuery/jquery-1.10.0.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    
	<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
	<script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
  </body>
</html>
</html>
