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
    background: url(../images/tit_bg.jpg) repeat-x top;
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
				bo07997的博客
			</h2>
		</div>
	</div>
	<div id="navigator">
		<div class="navigator">
			<ul >           
                <li  id="btnContents"><a href="http://blog.csdn.net/bo602505401?viewmode=contents"><span onclick="_gaq.push(['_trackEvent','function', 'onclick', 'blog_articles_mulu'])">
                    <img src="http://static.blog.csdn.net/images/ico_list.gif">目录视图</span></a></li>
                <li  id="btnView"><a href="http://blog.csdn.net/bo602505401?viewmode=list"><span onclick="_gaq.push(['_trackEvent','function', 'onclick', 'blog_articles_zhaiyao'])">
                    <img src="http://static.blog.csdn.net/images/ico_summary.gif">摘要视图</span></a></li>
                <li id="btnRss"><a href="http://blog.csdn.net/bo602505401/rss/list"><span onclick="_gaq.push(['_trackEvent','function', 'onclick', 'blog_articles_RSS'])">
                    <img src="http://static.blog.csdn.net/images/ico_rss.gif">订阅</span></a></li>                
            

                    <li id="btnManage"><a href="http://write.blog.csdn.net"><span>
                        <img src="http://static.blog.csdn.net/images/ico_set.gif">管理博客</span></a></li>
                    <li id="btnWrite"><a href="http://write.blog.csdn.net/postedit"><span>
                    <img src="http://static.blog.csdn.net/images/ico_write.gif">写新文章</span></a></li>
            </ul>
		</div>
	</div>
	
	<div id="body">
	
	<div class="blog_l fl" >
		
		<div id="side">
		  <div class="side">
				<div id="panel_Profile" class="panel" style="margin-top: 50px;
">
<ul class="panel_head"><span>个人资料</span></ul>
<ul class="panel_body profile">
<div id="blog_userface">
    <a href="http://my.csdn.net/bo602505401" target="_blank">
    <img src="http://avatar.csdn.net/E/7/2/1_bo602505401.jpg" title="访问我的空间" style="max-width:90%">
    </a>
    <br>
    <span><a href="http://my.csdn.net/bo602505401" class="user_name" target="_blank">bo602505401</a></span>
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
    <li>访问：<span>4459次</span></li>
    <li>积分：<span>291</span> </li>    
    <li>等级： <span style="position:relative;display:inline-block;z-index:1">
            <img src="http://c.csdnimg.cn/jifen/images/xunzhang/jianzhang/blog2.png" alt="" style="vertical-align: middle;" id="leveImg">
            <div id="smallTittle" style="position: absolute; left: -24px; top: 25px; text-align: center; width: 101px; height: 32px; background-color: rgb(255, 255, 255); line-height: 32px; border: 2px solid rgb(221, 221, 221); display: none; z-index: 999;">
            <div style="left: 42%;  top: -8px;  position: absolute;  width: 0;  height: 0;  border-left: 10px solid transparent;  border-right: 10px solid transparent;  border-bottom: 8px solid #EAEAEA;"></div>
            积分：291 </div>
        </span>  </li>
    <li>排名：<span>千里之外</span></li>
</ul>
<ul id="blog_statistics">
    <li>原创：<span>23篇</span></li>
    <li>转载：<span>3篇</span></li>
    <li>译文：<span>0篇</span></li>
    <li>评论：<span>2条</span></li>
</ul>
</ul>
</div>
			</div>
		</div>
		<h2>我在左边我在左边我在左边我在左边我在左边我在左边我在左边我在左边我在左边我在左边我在左边我在左边</h2>
			</div>	
	
	
	
	
	
	
		<div id="main " class="fr blog_r">
			<div class="list_item_new">

        <div id="article_toplist" class="list">

        </div>

    <div id="article_list" class="list">

    <div class="list_item article_item">
        <div class="article_title">   
         <span class="ico ico_type_Original"></span>


    <h1>
        <span class="link_title"><a href="/bo602505401/article/details/53224537">
        python爬虫从0到1遇到问题及解决方向            
        </a></span>
    </h1>
</div>

        <div class="article_description">
本文介绍了python重头到尾所需要的工具，如urllib2，requests，beautifulsoup4，Xpath等，
和代码展示，最后实战爬取起点小说网站数据，筛选238本小说，找到高质量的10本小说，途中
遇到的问题及解决方法，及以后展望。...        </div>
            <div class="article_manage">
             <span class="link_postdate">2016-11-19 01:20</span>
    
   
        <span class="link_view" title="阅读次数"><a href="/bo602505401/article/details/53224537" title="阅读次数">阅读</a>(167)</span>
        <span class="link_comments" title="评论次数"><a href="/bo602505401/article/details/53224537#comments" title="评论次数" onclick="_gaq.push(['_trackEvent','function', 'onclick', 'blog_articles_pinglun'])">评论</a>(0)</span>

            <span class="link_edit"><a href="http://write.blog.csdn.net/postedit/53224537" title="编辑">编辑</a></span>
            <span class="link_delete"><a href="javascript:void(0);" onclick="javascript:deleteArticle(53224537);return false;" title="删除">删除</a></span>
    </div>

        <div class="clear"></div>
    </div>
    <div class="list_item article_item">
        <div class="article_title">   
         <span class="ico ico_type_Original"></span>


    <h1>
        <span class="link_title"><a href="/bo602505401/article/details/51872276">
        阿里巴巴2017实习生笔试题+JAVA工程师能力评估部分题目            
        </a></span>
    </h1>
</div>

        <div class="article_description">
阿里巴巴2017实习生笔试题

1.由权值分别为1、12、13、4、8的叶子节点生成一颗哈夫曼树，它的带权路径长度为()




2.进程间的通信方式
# 管道( pipe )：管道是一种半双工的通信方式，数据只能单向流动，而且只能在具有亲缘关系的进程间使用。进程的亲缘关系通常是指父子进程关系。&nbsp;
# 信号量( semophore ) ： 信号量是一个计数器，可以用来控制多个进程...        </div>
            <div class="article_manage">
             <span class="link_postdate">2016-07-10 17:06</span>
    
   
        <span class="link_view" title="阅读次数"><a href="/bo602505401/article/details/51872276" title="阅读次数">阅读</a>(231)</span>
        <span class="link_comments" title="评论次数"><a href="/bo602505401/article/details/51872276#comments" title="评论次数" onclick="_gaq.push(['_trackEvent','function', 'onclick', 'blog_articles_pinglun'])">评论</a>(0)</span>

            <span class="link_edit"><a href="http://write.blog.csdn.net/postedit/51872276" title="编辑">编辑</a></span>
            <span class="link_delete"><a href="javascript:void(0);" onclick="javascript:deleteArticle(51872276);return false;" title="删除">删除</a></span>
    </div>

        <div class="clear"></div>
    </div>
    <div class="list_item article_item">
        <div class="article_title">   
         <span class="ico ico_type_Original"></span>


    <h1>
        <span class="link_title"><a href="/bo602505401/article/details/51533674">
        hibernate+struts2学生信息管理系统简单整合            
        </a></span>
    </h1>
</div>

        <div class="article_description">
一.项目结构（MVC）
直接上图

前者是整个项目结构，webcontent包含的是前端的一些jsp文件和css样式，java resourse包含后台的一些业务逻辑处理及接口；
后者是hibernate框架涉及的部分（红线）model层下的.hbm.xml是持久化层的ORM映射文件，可以通过Eclipse直接生成: 右击持久化层的包（model）---&gt;new--&gt;other--&gt;hib...        </div>
            <div class="article_manage">
             <span class="link_postdate">2016-05-29 21:48</span>
    
   
        <span class="link_view" title="阅读次数"><a href="/bo602505401/article/details/51533674" title="阅读次数">阅读</a>(675)</span>
        <span class="link_comments" title="评论次数"><a href="/bo602505401/article/details/51533674#comments" title="评论次数" onclick="_gaq.push(['_trackEvent','function', 'onclick', 'blog_articles_pinglun'])">评论</a>(2)</span>

            <span class="link_edit"><a href="http://write.blog.csdn.net/postedit/51533674" title="编辑">编辑</a></span>
            <span class="link_delete"><a href="javascript:void(0);" onclick="javascript:deleteArticle(51533674);return false;" title="删除">删除</a></span>
    </div>

        <div class="clear"></div>
    </div>
    <div class="list_item article_item">
        <div class="article_title">   
         <span class="ico ico_type_Original"></span>


    <h1>
        <span class="link_title"><a href="/bo602505401/article/details/51463920">
        struts笔记            
        </a></span>
    </h1>
</div>

        <div class="article_description">
一.struts2工作原理


二.struts2核心文件
web.xml文件:
任何MVC都要与web应用整合，借助于web.xml。只有配置在web.xml文件中的servlet才会被应用加载。


struts.xml文件:
Action映射，以及Action包含的Result定义，包含:
1.全局属性
2.用户请求和响应Action之间的对应关系
3.Action可...        </div>
            <div class="article_manage">
             <span class="link_postdate">2016-05-20 19:48</span>
    
   
        <span class="link_view" title="阅读次数"><a href="/bo602505401/article/details/51463920" title="阅读次数">阅读</a>(154)</span>
        <span class="link_comments" title="评论次数"><a href="/bo602505401/article/details/51463920#comments" title="评论次数" onclick="_gaq.push(['_trackEvent','function', 'onclick', 'blog_articles_pinglun'])">评论</a>(0)</span>

            <span class="link_edit"><a href="http://write.blog.csdn.net/postedit/51463920" title="编辑">编辑</a></span>
            <span class="link_delete"><a href="javascript:void(0);" onclick="javascript:deleteArticle(51463920);return false;" title="删除">删除</a></span>
    </div>

        <div class="clear"></div>
    </div>
    
    
    <div>
    	
    	<h2>
    		结束结束结束结束结束结束结束结束结束结束结束结束结束结束结束结束结束结束结束结束结束结束结束结束结束结束
    	</h2>
    </div>
    

    <!--显示分页-->

    <div id="papelist" class="pagelist">
<span> 26条  共2页</span><strong>1</strong> <a href="/bo602505401/article/list/2">2</a> <a href="/bo602505401/article/list/2">下一页</a> <a href="/bo602505401/article/list/2">尾页</a> 
    </div>

</div>
		</div>
		
		
		
	
		
		
		
		
		
	</div>

</div>

	  </div>
	  













































<footer class=" navbar-inverse navbar-fixed-bottom " style="height: 50px">
  <div class="">
    <a href="#" class="text-center">About us</a>
  </div>
</footer>


    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="http://libs.baidu.com/jquery/1.9.0/jquery.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    
	<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
	<script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
  </body>
</html>