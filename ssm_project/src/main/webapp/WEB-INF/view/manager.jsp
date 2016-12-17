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
                    <dt><a href="http://my.csdn.net/" ><img src="http://avatar.csdn.net/E/7/2/3_bo602505401.jpg" alt="bo602505401"></a></dt>
                    <dd>
                        <ul>
                            <li class="user_name"><a href="http://my.csdn.net/" class="user_name">bo602505401</a><span>bo602505401的博客</span></li>
                            <li>
                            	
                            </li>
                            <li class="feed_link"><a href="http://my.csdn.net/">个人主页</a>|<a href="http://blog.csdn.net/bo602505401">我的博客</a></li>
                        </ul>
                    </dd>
                </dl>
            </div>

           
        </div>
        
<!--       管理栏 -->
       <div class="tabs_header">
        
            <a class="btn btn-default" href="#" role="button">文章管理</a>
             <a class="btn btn-default" href="#" role="button">类别管理</a>
             <a class="btn btn-default" href="#" role="button">评论管理</a>
             <a class="btn btn-default" href="#" role="button">写新文章</a>
             <a class="btn btn-default" href="#" role="button">类别管理</a>
             <a class="btn btn-default" href="#" role="button">评论管理</a>
             <a class="btn btn-default" href="#" role="button">写新文章</a>
        </div>
        
<!--        选择框-->
        <div id="sel_div" class="h_status">
类别：
<select id="selCat"><option value="0">全部&nbsp;&nbsp;&nbsp;&nbsp;</option><option value="6121539">数据结构 (4)</option><option value="6121540">计算机网络 (8)</option><option value="6121541">操作系统 (1)</option><option value="6121542">JAVA学习 (9)</option><option value="6121543">数据库 (4)</option><option value="6238378">在校生活 (1)</option><option value="6528527">Python (1)</option>
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
<tr class=""><td class="tdleft"><a href="http://blog.csdn.net/bo602505401/article/details/53224537" target="_blank">python爬虫从0到1遇到问题及解决方向</a><span class="gray">（2016-11-19 01:20）</span></td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td>172</td><td>0</td><td><a href="?t=lock&amp;id=53224537" class="lock">禁止评论</a></td><td><a href="/postedit/53224537">编辑</a> | <a href="?t=top&amp;id=53224537">置顶</a> | <a href="?t=del&amp;id=53224537" name="del">删除</a> | <a href="javascript:void(0);" onclick="javascript:return setcat(this,53224537);" class="cat">分类</a></td></tr>

<tr class="altitem"><td class="tdleft"><a href="http://blog.csdn.net/bo602505401/article/details/51872276" target="_blank">阿里巴巴2017实习生笔试题+JAVA工程师能力评估部分题目</a><span class="gray">（2016-07-10 17:06）</span></td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td>233</td><td>0</td><td><a href="?t=lock&amp;id=51872276" class="lock">禁止评论</a></td><td><a href="/postedit/51872276">编辑</a> | <a href="?t=top&amp;id=51872276">置顶</a> | <a href="?t=del&amp;id=51872276" name="del">删除</a> | <a href="javascript:void(0);" onclick="javascript:return setcat(this,51872276);" class="cat">分类</a></td></tr>

<tr class=""><td class="tdleft"><a href="http://blog.csdn.net/bo602505401/article/details/51533674" target="_blank">hibernate+struts2学生信息管理系统简单整合</a><span class="gray">（2016-05-29 21:48）</span></td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td>678</td><td>2</td><td><a href="?t=lock&amp;id=51533674" class="lock">禁止评论</a></td><td><a href="/postedit/51533674">编辑</a> | <a href="?t=top&amp;id=51533674">置顶</a> | <a href="?t=del&amp;id=51533674" name="del">删除</a> | <a href="javascript:void(0);" onclick="javascript:return setcat(this,51533674);" class="cat">分类</a></td></tr>

<tr class="altitem"><td class="tdleft"><a href="http://blog.csdn.net/bo602505401/article/details/51463920" target="_blank">struts笔记</a><span class="gray">（2016-05-20 19:48）</span></td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td>156</td><td>0</td><td><a href="?t=lock&amp;id=51463920" class="lock">禁止评论</a></td><td><a href="/postedit/51463920">编辑</a> | <a href="?t=top&amp;id=51463920">置顶</a> | <a href="?t=del&amp;id=51463920" name="del">删除</a> | <a href="javascript:void(0);" onclick="javascript:return setcat(this,51463920);" class="cat">分类</a></td></tr>

<tr class=""><td class="tdleft"><a href="http://blog.csdn.net/bo602505401/article/details/51463365" target="_blank">学沫的自白</a><span class="gray">（2016-05-20 17:26）</span></td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td>84</td><td>0</td><td><a href="?t=lock&amp;id=51463365" class="lock">禁止评论</a></td><td><a href="/postedit/51463365">编辑</a> | <a href="?t=top&amp;id=51463365">置顶</a> | <a href="?t=del&amp;id=51463365" name="del">删除</a> | <a href="javascript:void(0);" onclick="javascript:return setcat(this,51463365);" class="cat">分类</a></td></tr>

<tr class="altitem"><td class="tdleft"><a href="http://blog.csdn.net/bo602505401/article/details/51155043" target="_blank">mysql常用存储引擎</a><span class="gray">（2016-04-14 21:07）</span></td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td>102</td><td>0</td><td><a href="?t=lock&amp;id=51155043" class="lock">禁止评论</a></td><td><a href="/postedit/51155043">编辑</a> | <a href="?t=top&amp;id=51155043">置顶</a> | <a href="?t=del&amp;id=51155043" name="del">删除</a> | <a href="javascript:void(0);" onclick="javascript:return setcat(this,51155043);" class="cat">分类</a></td></tr>

<tr class=""><td class="tdleft"><a href="http://blog.csdn.net/bo602505401/article/details/51146129" target="_blank">java开发之反射</a><span class="gray">（2016-04-13 19:46）</span></td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td>52</td><td>0</td><td><a href="?t=lock&amp;id=51146129" class="lock">禁止评论</a></td><td><a href="/postedit/51146129">编辑</a> | <a href="?t=top&amp;id=51146129">置顶</a> | <a href="?t=del&amp;id=51146129" name="del">删除</a> | <a href="javascript:void(0);" onclick="javascript:return setcat(this,51146129);" class="cat">分类</a></td></tr>

<tr class="altitem"><td class="tdleft"><a href="http://blog.csdn.net/bo602505401/article/details/51028715" target="_blank">TCP三次握手四次挥手</a><span class="gray">（2016-03-31 17:41）</span></td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td>122</td><td>0</td><td><a href="?t=lock&amp;id=51028715" class="lock">禁止评论</a></td><td><a href="/postedit/51028715">编辑</a> | <a href="?t=top&amp;id=51028715">置顶</a> | <a href="?t=del&amp;id=51028715" name="del">删除</a> | <a href="javascript:void(0);" onclick="javascript:return setcat(this,51028715);" class="cat">分类</a></td></tr>

<tr class=""><td class="tdleft"><a href="http://blog.csdn.net/bo602505401/article/details/50950865" target="_blank">String、StringBuffer和StringBuilder的比较</a><span class="gray">（2016-03-21 22:24）</span></td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td>78</td><td>0</td><td><a href="?t=lock&amp;id=50950865" class="lock">禁止评论</a></td><td><a href="/postedit/50950865">编辑</a> | <a href="?t=top&amp;id=50950865">置顶</a> | <a href="?t=del&amp;id=50950865" name="del">删除</a> | <a href="javascript:void(0);" onclick="javascript:return setcat(this,50950865);" class="cat">分类</a></td></tr>

<tr class="altitem"><td class="tdleft"><a href="http://blog.csdn.net/bo602505401/article/details/50946335" target="_blank">计算机网络之应用层协议</a><span class="gray">（2016-03-21 14:35）</span></td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td>75</td><td>0</td><td><a href="?t=lock&amp;id=50946335" class="lock">禁止评论</a></td><td><a href="/postedit/50946335">编辑</a> | <a href="?t=top&amp;id=50946335">置顶</a> | <a href="?t=del&amp;id=50946335" name="del">删除</a> | <a href="javascript:void(0);" onclick="javascript:return setcat(this,50946335);" class="cat">分类</a></td></tr>

<tr class=""><td class="tdleft"><a href="http://blog.csdn.net/bo602505401/article/details/50938083" target="_blank">数据库事务特性和隔离级别</a><span class="gray">（2016-03-20 19:27）</span></td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td>118</td><td>0</td><td><a href="?t=lock&amp;id=50938083" class="lock">禁止评论</a></td><td><a href="/postedit/50938083">编辑</a> | <a href="?t=top&amp;id=50938083">置顶</a> | <a href="?t=del&amp;id=50938083" name="del">删除</a> | <a href="javascript:void(0);" onclick="javascript:return setcat(this,50938083);" class="cat">分类</a></td></tr>

<tr class="altitem"><td class="tdleft"><a href="http://blog.csdn.net/bo602505401/article/details/50907406" target="_blank">java基础面试题（1）</a><span class="gray">（2016-03-16 18:38）</span></td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td>133</td><td>0</td><td><a href="?t=lock&amp;id=50907406" class="lock">禁止评论</a></td><td><a href="/postedit/50907406">编辑</a> | <a href="?t=top&amp;id=50907406">置顶</a> | <a href="?t=del&amp;id=50907406" name="del">删除</a> | <a href="javascript:void(0);" onclick="javascript:return setcat(this,50907406);" class="cat">分类</a></td></tr>

<tr class=""><td class="tdleft"><a href="http://blog.csdn.net/bo602505401/article/details/50897991" target="_blank">java之多线程初解</a><span class="gray">（2016-03-15 17:01）</span></td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td>92</td><td>0</td><td><a href="?t=lock&amp;id=50897991" class="lock">禁止评论</a></td><td><a href="/postedit/50897991">编辑</a> | <a href="?t=top&amp;id=50897991">置顶</a> | <a href="?t=del&amp;id=50897991" name="del">删除</a> | <a href="javascript:void(0);" onclick="javascript:return setcat(this,50897991);" class="cat">分类</a></td></tr>

<tr class="altitem"><td class="tdleft"><a href="http://blog.csdn.net/bo602505401/article/details/50878563" target="_blank">Java开发人员面试题分析汇总</a><span class="gray">（2016-03-13 16:25）</span></td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td>158</td><td>0</td><td><a href="?t=lock&amp;id=50878563" class="lock">禁止评论</a></td><td><a href="/postedit/50878563">编辑</a> | <a href="?t=top&amp;id=50878563">置顶</a> | <a href="?t=del&amp;id=50878563" name="del">删除</a> | <a href="javascript:void(0);" onclick="javascript:return setcat(this,50878563);" class="cat">分类</a></td></tr>

<tr class=""><td class="tdleft"><a href="http://blog.csdn.net/bo602505401/article/details/50866970" target="_blank">操作系统之进程的描述与控制</a><span class="gray">（2016-03-12 23:02）</span></td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td>142</td><td>0</td><td><a href="?t=lock&amp;id=50866970" class="lock">禁止评论</a></td><td><a href="/postedit/50866970">编辑</a> | <a href="?t=top&amp;id=50866970">置顶</a> | <a href="?t=del&amp;id=50866970" name="del">删除</a> | <a href="javascript:void(0);" onclick="javascript:return setcat(this,50866970);" class="cat">分类</a></td></tr>

<tr class="altitem"><td class="tdleft"><a href="http://blog.csdn.net/bo602505401/article/details/50857432" target="_blank">计算机网络之运输层</a><span class="gray">（2016-03-11 16:56）</span></td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td>131</td><td>0</td><td><a href="?t=lock&amp;id=50857432" class="lock">禁止评论</a></td><td><a href="/postedit/50857432">编辑</a> | <a href="?t=top&amp;id=50857432">置顶</a> | <a href="?t=del&amp;id=50857432" name="del">删除</a> | <a href="javascript:void(0);" onclick="javascript:return setcat(this,50857432);" class="cat">分类</a></td></tr>

<tr class=""><td class="tdleft"><a href="http://blog.csdn.net/bo602505401/article/details/50851035" target="_blank">数据库面试常问的一些基本概念</a><span class="gray">（2016-03-10 23:27）</span></td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td>117</td><td>0</td><td><a href="?t=lock&amp;id=50851035" class="lock">禁止评论</a></td><td><a href="/postedit/50851035">编辑</a> | <a href="?t=top&amp;id=50851035">置顶</a> | <a href="?t=del&amp;id=50851035" name="del">删除</a> | <a href="javascript:void(0);" onclick="javascript:return setcat(this,50851035);" class="cat">分类</a></td></tr>

<tr class="altitem"><td class="tdleft"><a href="http://blog.csdn.net/bo602505401/article/details/50849494" target="_blank">计算机网络之网络层</a><span class="gray">（2016-03-10 23:26）</span></td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td>174</td><td>0</td><td><a href="?t=lock&amp;id=50849494" class="lock">禁止评论</a></td><td><a href="/postedit/50849494">编辑</a> | <a href="?t=top&amp;id=50849494">置顶</a> | <a href="?t=del&amp;id=50849494" name="del">删除</a> | <a href="javascript:void(0);" onclick="javascript:return setcat(this,50849494);" class="cat">分类</a></td></tr>

<tr class=""><td class="tdleft"><a href="http://blog.csdn.net/bo602505401/article/details/50844992" target="_blank">计算机网络之数据链路层</a><span class="gray">（2016-03-10 18:42）</span></td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td>143</td><td>0</td><td><a href="?t=lock&amp;id=50844992" class="lock">禁止评论</a></td><td><a href="/postedit/50844992">编辑</a> | <a href="?t=top&amp;id=50844992">置顶</a> | <a href="?t=del&amp;id=50844992" name="del">删除</a> | <a href="javascript:void(0);" onclick="javascript:return setcat(this,50844992);" class="cat">分类</a></td></tr>

<tr class="altitem"><td class="tdleft"><a href="http://blog.csdn.net/bo602505401/article/details/50839892" target="_blank">计算机网络之物理层</a><span class="gray">（2016-03-10 11:04）</span></td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td>90</td><td>0</td><td><a href="?t=lock&amp;id=50839892" class="lock">禁止评论</a></td><td><a href="/postedit/50839892">编辑</a> | <a href="?t=top&amp;id=50839892">置顶</a> | <a href="?t=del&amp;id=50839892" name="del">删除</a> | <a href="javascript:void(0);" onclick="javascript:return setcat(this,50839892);" class="cat">分类</a></td></tr>
</tbody>
  </table>
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