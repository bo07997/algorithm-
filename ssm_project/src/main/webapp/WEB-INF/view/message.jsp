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
<!-- 省市选择CSS -->
    <link href="${ctx}/resources/bootstrap/css/city-picker.css" rel="stylesheet">
     <link href="${ctx}/resources/bootstrap/css/main.css" rel="stylesheet">
    <!-- 新 Bootstrap 核心 CSS 文件 -->
	<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
	<link href="${ctx}/resources/bootstrap/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
   
</head>
  
<style type="text/css">
.main {
    width: 1170px;
    margin: 0 auto;
}
.person_info_con {
    background: #fff;
    border: 1px solid #dcdcdc;
    margin: 10px auto 0;
    overflow: hidden;
    position: relative;
}
 .person-photo {
    width: 150px;
    height: 200px;
    float: left;
    margin: 15px 30px 15px 20px;
}
.focus_num {
    width: 72px;
    height: 52px;
    border-right: 1px solid #f0f0f0;
    float: left;
    font-size: 14px;
    color: #999;
    text-align: center;
    overflow: hidden;
}
 .fans_num {
    width: 72px;
    height: 52px;
    float: left;
    font-size: 14px;
    color: #999;
    text-align: center;
    overflow: hidden;
}
.person-info {
    float: left;
    width: 950px;
    margin-top: 30px;
}
.person-info dt {
    overflow: hidden;
}

 .person-detail {
    overfolw: hidden;
    font-size: 16px;
    color: #333;
    margin-top: 10px;
}
 .person-info .person-detail span {
    font-size: 14px;
    color: #999;
    padding: 0 15px;
}

.tag {
    position: relative;
    background: #f5f5f5;
    float: left;
    width: 132px;
    height: 68px;
    line-height: 70px;
    border: 1px solid #02c4b9;
    -webkit-border-radius: 10px;
    border-radius: 10px;
    margin-right: 37px;
    margin-bottom: 20px;
    font-size: 16px;
    color: #333;
    text-align: center;
    -webkit-transition: all 0.6s ease-out;
    -moz-transition: all 0.6s ease-out;
    -o-transition: all 0.6s ease-out;
    -ms-transition: all 0.6s ease-out;
    transition: all 0.6s ease-out;
}
 
 .field{
    padding-top: 34px;
    padding-bottom: 30px;
    border-bottom: 1px solid #f0f0f0;
    
    margin-top: 20px;
    
}
 h3 {
    font-size: 16px;
    color: #333;
    font-weight: normal;
    margin-bottom: 20px;
}
.tags {
    margin-right: -39px;
    margin-bottom: -20px;
    zoom: 1;
}
.tagpack{
 height: 130px
}
.del {
    background: url(${ctx}/resources/jpgs/del.png) no-repeat;
    right: 24px;
}
.addTag {
    font-size: 16px;
    color: #c0c0c0;
    background: #fff;
    font-size: 25px;
    font-weight: 700;
    color: #a6a9ac;
}
.space{
    padding: 30px 0;
    border-bottom: solid 1px #e7ecef;
     border-top: solid 1px #e7ecef;
     width: 1170px;
}
.radio_sex {
    width: 20px;
    height: auto;
}
</style>
<body>
<nav class="navbar navbar-default navbar-inverse navbar-static-top" role="navigation" style="margin-bottom: 0px">
  <div class="container">
   <h1 style="color:#fff;"  class="text-center">MyBlog<small>Welcome!</small>
   </h1>
  </div>
</nav>




<nav class="navbar navbar-default second_nav_size navbar-static-top" role="navigation"  >
  <div  >
    <ul class="nav navbar-nav" style=" margin-left: 200px;">
        <li ><a href="${ctx }/Blog/home">首页</a></li>
        <li class="active"><a href="#">个人主页</a></li>
        <li><a href="#">排行</a></li>
        <li><a href="#">观点</a></li>
        <li><a href="${ctx }/Message/manager/${user.uId}/1_0"  target="_blank">我的博客</a></li>
        <li><a href="${ctx }/User/loginout" target="_self">安全退出</a></li>
       </ul>
  </div>
</nav>


<div class="main">
<div class="person_info_con">
<dl class="person-photo">
                      <dt><a href="javascript:;"><img style=" width: 175px;" src="${ctx }${message_Info_all.head}" class="header"><span class="edit_person_pic"></span></a></dt>
            <dd class="focus_num"><b><a >6</a></b><br>关注</dd>
            <dd class="fans_num"><b><a>2</a></b><br>粉丝</dd>
          </dl>
<dl class="person-info">
            <dt class="person-nick-name">
            			<span style=" margin-left: 15px;">${user.username }</span>
            			<c:if test="${update_Info_auth==1 }">
            			     <div align="right" style="float:right">
            			  		<button type="button" class="btn btn-default btn-lg"  data-toggle="modal" data-target="#myModal">
								  <span class="glyphicon glyphicon-edit"></span> 
								</button>
								</div>
							</c:if>
            </dt>
            <dd class="person-detail"> 
            		<span  >${hangye_myinfo }</span><span>|</span>
            		<span >${ job_myinfo}</span><span>|</span>
            		<span>${realname_myinfo }</span><span>|</span >
            		 <span>${nationality_myinfo }</span><span>|</span>
            		<span > ${ sex_myinfo}</span><span>|</span>
            		<span >${birthday_myinfo }</span>
          
            		 </dd>
            <dd class="person-sign" style="margin-top: 20px; margin-left: 18px; "><strong>个人简介:</strong></dd>
            <dd style="margin-top: 20px; margin-left: 18px; ">${message_Info_all.introduction }</dd>
          </dl>

</div>
<div>
<a class="navbar-brand" href="#" style="padding-left: 0px;">我的资料</a>
</div>

<!--信息修改 模态框 1 -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title" id="myModalLabel">修改个人信息</h4>
      </div>
      <div class="modal-body">
       <form id="updateform1" class="navbar-form navbar "  Action="${ctx }/Message/updateMessage/${user.uId}"  method="post">
       
       <div style="float:left">
    <label> 用户名:</label>
    <input type="text" class="form-control"  value="${user.username }"   placeholder="username" name="username" style=" ">
  </div>
    
    <div >
   <label> &nbsp;&nbsp;&nbsp;姓名:</label> 
     <input type="text" class="form-control"  placeholder="realname"   value="${message_Info_all.realname }"  name="message.realname">
     </div>
    <br>
       <div style="float:left">
    <label> 职位:</label>
    <input type="text" class="form-control"   name="message.job"  value="${message_Info_all.job }" style=" margin-left: 15px; ">
  </div>
  
      <div >
   <label> &nbsp;&nbsp;&nbsp;性别：</label>
                  <input name="message.sex" type="radio" value="1" class="radio_sex">男 &nbsp;&nbsp;&nbsp;
                  <input name="message.sex" type="radio" value="2" class="radio_sex">女
     </div> 
<br>

 <div style="float:left">
  <div  style="float:left ; ">
    <label style="    margin-top: 10px;">生日:</label>
    </div>
   <div class="input-append date form_date" style="float:left; margin-left: 18px; height: 25px;">
    <input size="15"   name="birthday_str"  class="form-control"  type="text" value="${birthday_str}" readonly>
    <span class="add-on"><i class="icon-remove glyphicon glyphicon-remove"></i></span>
    <span class="add-on"><i class="icon-th glyphicon glyphicon-th"></i></span>
</div>
  </div>

     <div >
   <label> &nbsp;&nbsp;&nbsp;行业:</label> 
     <input type="text" class="form-control"  value="${message_Info_all.hangye}"  name="message.hangye">
     </div>
    <br>
     <div >
  <div  style="float:left ; ">
    <label    style="    margin-top: 10px;">地区:</label>
    </div>
<div  style="float:left ; margin-left: 10px; " class="docs-methods">
	<form class="form-inline">
		<div id="distpicker">
			<div class="form-group">
				<div style="position: relative;">
					<input  name="message.nationality" value="${message_Info_all.nationality}" style="width:200px" id="city-picker3" class="form-control" readonly type="text" data-toggle="city-picker">
				</div>
			</div>
		</div>
	</form>
</div>
</div>

 <div >
  <div >
    <label style=" margin-top: 10px;margin-left: 15px;">个人简介:</label>
    </div>
    <textarea form="updateform1" name="message.introduction" 
    placeholder="300字以内"  style="width:560px;height: 156px;
    margin-left: 15px;margin-bottom: 25px;  "  >${message_Info_all.introduction }</textarea>
    </div>
</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button"  onclick="submit('updateform1')" class="btn btn-primary">confirm</button>
      </div>
    </div>
  </div>
</div>

<!-- 大块头开始 -->
<div class="field">

<div class="tags ">
<div  class="tagpack ">
<div style="text-align:left">
<h3  ><strong>熟悉的领域</strong></h3>
</div>
<c:forEach var="skillAndField"  items="${skillAndFields}"  >
                  <c:if test="${skillAndField.type==1}">
               <div class="tag " id="${skillAndField.infoId}"><span>${skillAndField.content}</span>
               <c:if test="${update_Info_auth==1 }">
               <a href="${ctx }/MessageInfo/deleteInfo/${skillAndField.infoId}">
               <img   src="${ctx}/resources/jpgs/del.png" style=" margin-top: 50px;">
               </a>
               </c:if>
               </div>
               </c:if> 
</c:forEach>
<c:if test="${update_Info_auth==1 }">
<div class="tag addTag" ><a href="#" data-toggle="modal" data-target="#Modal1">+</a></div>
</c:if>
</div>

<!--增加领域 模态框  -->
<div class="modal fade" id="Modal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title" id="Modal1Label">新增我熟悉的领域</h4>
      </div>
      <div class="modal-body">
       <form id="addform1" class="navbar-form navbar "  Action="${ctx }/MessageInfo/addInfo/${user.uId }/1"  method="post">
       
    <div  style="margin-bottom: 20px;">
    <label> 领域:</label>
    <input type="text" class="form-control"     name="content" >
  </div>
    
    </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button"  onclick="submit('addform1')" class="btn btn-primary">confirm</button>
      </div>
    </div>
  </div>
</div>

<div class="tagpack " >
<h3 ><strong>专业技能</strong></h3>
<c:forEach var="skillAndField"  items="${skillAndFields}"  >
          <c:if test="${skillAndField.type==2}">
               <div class="tag " id="${skillAndField.infoId}"><span>${skillAndField.content}</span>
               <c:if test="${update_Info_auth==1 }">
               <a href="${ctx }/MessageInfo/deleteInfo/${skillAndField.infoId}">
               <img   src="${ctx}/resources/jpgs/del.png" style=" margin-top: 50px;">
               </a>
               </c:if>
               </div>
          </c:if> 
</c:forEach>
<c:if test="${update_Info_auth==1 }">
<div class="tag addTag" ><a href="#" data-toggle="modal" data-target="#Modal2">+</a></div>
</c:if>
</div>

<!--增加技能 模态框  -->
<div class="modal fade" id="Modal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title" id="Modal1Label">新增我熟悉的技能</h4>
      </div>
      <div class="modal-body">
       <form id="addform2" class="navbar-form navbar "  Action="${ctx }/MessageInfo/addInfo/${user.uId }/2"  method="post">
       
    <div  style="margin-bottom: 20px;">
    <label> 技能:</label>
    <input type="text" class="form-control"     name="content" >
  </div>
    
    </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button"  onclick="submit('addform2')" class="btn btn-primary">confirm</button>
      </div>
    </div>
  </div>
</div>


<div class="tagpack " >
<div style=" margin-top: 56px;    padding: 30px 0;
    border-bottom: solid 1px #e7ecef;margin-bottom: 12px; 
     width: 1170px;">
<h3  style="margin-bottom: 0px; "><strong>教育经历</strong>
     	
     </h3>
     <c:if test="${update_Info_auth==1 }">
     <button style="float:right"type="button" class="btn btn-default btn-lg"  data-toggle="modal" data-target="#educationModal">
								  <span class="glyphicon glyphicon-edit"></span> 
								</button>
		</c:if>
     </div>
${message_Info_all.education }
</div>
<!--信息修改 模态框2  -->
<div class="modal fade" id="educationModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title" id="educationModalLabel">修改个人信息</h4>
      </div>
      <div class="modal-body">
       <form id="updateform2" class="navbar-form navbar "  Action="${ctx}/Message/updateMessage/${user.uId}"  method="post">
       
     <div >
  <div >
    <label style=" margin-top: 10px;margin-left: 15px;">教育经历:</label>
    </div>
    <textarea form="updateform2" name="message.education" 
    placeholder="300字以内"  style="width:520px;height: 156px;
    margin-left: 15px;margin-bottom: 25px;  "  >${message_Info_all.education }</textarea>
    </div>
    
    </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button"  onclick="submit('updateform2')" class="btn btn-primary">confirm</button>
      </div>
    </div>
  </div>
</div>


<div class="tagpack "  style=" margin-bottom: 120px;">
<div style=" margin-top: 56px;    padding: 30px 0;
    border-bottom: solid 1px #e7ecef;margin-bottom: 12px; 
     width: 1170px;">
<h3  style="margin-bottom: 0px; "><strong>工作经历</strong>
     	
     </h3>
     <c:if test="${update_Info_auth==1 }">
     <button style="float:right"type="button" class="btn btn-default btn-lg"  data-toggle="modal" data-target="#jobexperienceModal">
								  <span class="glyphicon glyphicon-edit"></span> 
								</button>
	</c:if>							
     </div>
${message_Info_all.jobexperience }
</div>

<!--信息修改 模态框3  -->
<div class="modal fade" id="jobexperienceModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title" id="jobexperienceModalLabel">修改个人信息</h4>
      </div>
      <div class="modal-body">
       <form id="updateform3" class="navbar-form navbar "  Action="${ctx}/Message/updateMessage/${user.uId}"  method="post">
       
     <div >
  <div >
    <label style=" margin-top: 10px;margin-left: 15px;">工作经历:</label>
    </div>
    <textarea form="updateform3" name="message.jobexperience" 
    placeholder="300字以内"  style="width:520px;height: 156px;
    margin-left: 15px;margin-bottom: 25px;  "  >${message_Info_all.jobexperience }</textarea>
    </div>
    
    </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button"  onclick="submit('updateform3')" class="btn btn-primary">confirm</button>
      </div>
    </div>
  </div>
</div>



	
	<div class="tagpack "  style=" margin-bottom: 120px;">
<div style=" margin-top: 56px;    padding: 30px 0;
    border-bottom: solid 1px #e7ecef;margin-bottom: 12px; 
     width: 1170px;">
<h3  style="margin-bottom: 0px; "><strong>联系方式</strong>
     	
     </h3>
     <c:if test="${update_Info_auth==1 }">
     <button style="float:right"type="button" class="btn btn-default btn-lg"  data-toggle="modal" data-target="#contactModal">
								  <span class="glyphicon glyphicon-edit"></span> 
								</button>
	</c:if>
     </div>
<ul class="clearfix">
				  
				  <li><i>手机号码：</i>${message_Info_all.phone }<span nodetype="mobile" class="mobile" title=""></span></li>
				  <li><i>QQ号码：</i>${message_Info_all.qq }<span nodetype="qq" class="qq"></span></li>
				  
				</ul>
</div>	
<!--信息修改 模态框4  -->
<div class="modal fade" id="contactModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title" id="contactModalLabel">修改个人信息</h4>
      </div>
      <div class="modal-body">
       <form id="updateform4" class="navbar-form navbar "  Action="${ctx }/Message/updateMessage/${user.uId}"  method="post">
       
    <div  style="margin-bottom: 20px;">
    <label> 手机号码:</label>
    <input type="text" class="form-control"  value="${message_Info_all.phone }"   placeholder="phone" name="message.phone" >
  </div>
        <div >
    <label> QQ号码:</label>
    <input style="margin-left: 8px;" type="text" class="form-control"  value="${message_Info_all.qq }"   placeholder="qq" name="message.qq" >
  </div>
    </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button"  onclick="submit('updateform4')" class="btn btn-primary">confirm</button>
      </div>
    </div>
  </div>
</div>


</div>

</div>

</div>



<footer class=" navbar-inverse navbar-fixed-bottom " style="height: 30px">
  <div class="">
    <a href="#" class="text-center">About us</a>
  </div>
</footer>

  <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="${ctx}/resources/jQuery/jquery-1.10.0.js"></script>
   
   <script type="text/javascript" src="${ctx }/resources/bootstrap/js/bootstrap.min.js"></script>
    <!-- 时间插件 -->
<script type="text/javascript" src="${ctx }/resources/bootstrap/js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
<script type="text/javascript" src="${ctx }/resources/bootstrap/js/bootstrap-datetimepicker.fr.js" charset="UTF-8"></script>
    <!-- 省市插件 -->
    <script src="${ctx }/resources/bootstrap/js/city-picker.data.js"></script>
<script src="${ctx }/resources/bootstrap/js/city-picker.js"></script>
<script src="${ctx }/resources/bootstrap/js/main.js"></script>
    
<script type="text/javascript">
  
	$('.form_date').datetimepicker({
		format: "yyyy-mm-dd ",
        language:  'fr',
        weekStart: 1,
        todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 2,
		minView: 2,
		forceParse: 0
    });
	  function submit(id){
	    		 
	     	document.getElementById(id).submit();
	            	
	     	}
</script>
</body>
</html>