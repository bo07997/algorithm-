<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
        "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>编辑博客</title>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
   <!-- 新 Bootstrap 核心 CSS 文件 -->
	<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="${ctx}/resources/jQuery/jquery-1.10.0.js"></script>
    
    <script type="text/javascript" charset="utf-8" src="${ctx }/resources/uediter/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="${ctx }/resources/uediter/ueditor.all.min.js"> </script>
    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
    <script type="text/javascript" charset="utf-8" src="${ctx }/resources/uediter/lang/zh-cn/zh-cn.js"></script>

    <style type="text/css">
        div{
            width:100%;
        }
        .subtit {
    margin: 6px 0px;
    border-bottom-color: #f0f0f0;
}
.subtit {
    padding: 12px 4px 2px 4px;
    color: #999;
    font-weight: bold;
    border-bottom: solid 1px #f5f5f5;
    clear: both;
}
        .radioBox {
    margin-top: 6px;
}
  .radioBox input{
      margin-left: 20px;
  
  }
    </style>
</head>
<body>
<nav class="navbar navbar-default navbar-inverse navbar-static-top" role="navigation" >
  <div class="container">
   <h1 style="color:#fff" class="text-center">My Blog<small>Welcome!</small>
   </h1>
   
  </div>
</nav>
<div >
<div align="center" >
<div style="width:1024px;" >
    <div align="left"  style=" margin-bottom: 20px;">
   <p class="subtit">文章标题</p>
   <input id="title" type="text" class="form-control"    placeholder="文章标题" name="bTitle" style="width:512px ">
   </div>
   <div class="radioBox ">
    <script id="editor" type="text/plain" style="width:1024px;height:500px;"></script>
</div>

<div style="width:1024px;     margin-bottom: 100px;" align="left" >
<div>
<p class="subtit">个人分类 [<a href="${ctx }/Message/manager/${loginuser.uId}/2_0" target="_blank">编辑分类</a>]</p>
<div class="radioBox ">
<c:forEach var="categorie"  items="${categories}" >
<input type="radio" name="catebyUser" id="my_${categorie.cId }" value="${categorie.cId }"><label for="radChl1">${categorie.cateName }</label>
       </c:forEach>
</div>
</div>

<div>
   <p class="subtit">文章分类（到分类首页）</p>
   <div class="radioBox ">
<input type="radio" name="radChl" id="radChl1" value="移动开发"><label for="radChl1">移动开发</label>
<input type="radio" name="radChl" id="radChl2" value="Web前端"><label for="radChl2">Web前端</label>
<input type="radio" name="radChl" id="radChl3" value="架构设计"><label for="radChl3">架构设计</label>
<input type="radio" name="radChl" id="radChl4" value="编程语言"><label for="radChl4">编程语言</label>
<input type="radio" name="radChl" id="radChl5" value="互联网"><label for="radChl5">互联网</label>
<input type="radio" name="radChl" id="radChl6" value="数据库"><label for="radChl6">数据库</label>
<input type="radio" name="radChl" id="radChl7" value="系统运维"><label for="radChl7">系统运维</label>
<input type="radio" name="radChl" id="radChl8" value="云计算"><label for="radChl8">云计算</label>
<input type="radio" name="radChl" id="radChl9" value="研发管理"><label for="radChl9">研发管理</label>
<input type="radio" name="radChl" id="radChl10" value="综合"><label for="radChl10">综合</label>
</div>
</div>

<div >
  <div >
    <label class="subtit" style=" margin-top: 10px;">摘要: （默认自动提取您文章的前200字显示在博客首页作为文章摘要，您也可以在这里自行编辑 ）</label>
    </div>
    <textarea id="introduction_blog" name="blog.introduction" 
    placeholder="300字以内"  style="width:1024px;height: 106px;
    margin-left: 15px;margin-bottom: 25px;  "  ></textarea>
    </div>

<div class="btn-group" data-toggle="buttons"  style="width:255px;margin-left: 355px;" >
 <button id="submit_blog"  onclick="submit_blog(${loginuser.uId})" type="button" class="btn btn-primary" >提交</button>
 <button type="button" class="btn btn-primary" onclick="preserve_blog(${loginuser.uId})" >保存</button>
 <button type="button" class="btn btn-primary" onclick="javascript:history.go(-1);">舍弃</button>
</div>
</div>


</div>

</div>

<script type="text/javascript">

    //实例化编辑器
    //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
    var ue = UE.getEditor('editor');
  
    function submit_blog(uId) {
    		let introduction=$("#introduction_blog").val();
    		//获取简介的值
    		if($("#introduction_blog").val()==null||$("#introduction_blog").val().trim()==""){
    			if(UE.getEditor('editor').getContentTxt().length<200){
    				introduction=	UE.getEditor('editor').getContentTxt();
    			}
    			else{
    			introduction=	UE.getEditor('editor').getContentTxt().substr(0, 199);
    			}
    		}
    
          	$.ajax({
          		type:"POST",
          		url:"${pageContext.request.contextPath}/Blog/addBlogByUser",
          		data:JSON.stringify({
          			"bTitle": $("#title").val(),
          			"content":UE.getEditor('editor').getPlainTxt(),
          			"cateId":$("input[name='catebyUser']:checked").val(),
          			"cateCsdn":$("input[name='radChl']:checked").val(),
          			"introduction":introduction,
          			"uId":uId
          			}),
          		contentType: "application/json; charset=utf-8", 
          		dataType:"json",
          		success:function(result){
          			//打开新的页面
          			window.location.href ="${pageContext.request.contextPath}/Message/manager/"+uId+"/1_0";
          			alert("添加成功，等待审核！");
          			
          		},
          	error:function(){
          		alert("提交时出现错误！");
              }
          		
          	})
          
         } 
    
    function preserve_blog(uId) {
		let introduction=$("#introduction_blog").val();
		//获取简介的值
		if($("#introduction_blog").val()==null||$("#introduction_blog").val().trim()==""){
			if(UE.getEditor('editor').getContentTxt().length<200){
				introduction=	UE.getEditor('editor').getContentTxt();
			}
			else{
			introduction=	UE.getEditor('editor').getContentTxt().substr(0, 199);
			}
		}

      	$.ajax({
      		type:"POST",
      		url:"${pageContext.request.contextPath}/Blog/addDraftBlogByUser",
      		data:JSON.stringify({
      			"bTitle": $("#title").val(),
      			"content":UE.getEditor('editor').getPlainTxt(),
      			"cateId":$("input[name='catebyUser']:checked").val(),
      			"cateCsdn":$("input[name='radChl']:checked").val(),
      			"introduction":introduction,
      			"uId":uId
      			}),
      		contentType: "application/json; charset=utf-8", 
      		dataType:"json",
      		success:function(result){
      			//打开新的页面
      			window.location.href ="${pageContext.request.contextPath}/Message/manager/"+uId+"/4_0";
      			
      			
      		},
      	error:function(){
      		alert("保存时出现错误！");
          }
      		
      	})
      
     } 
    function isFocus(e){
        alert(UE.getEditor('editor').isFocus());
        UE.dom.domUtils.preventDefault(e)
    }
    function setblur(e){
        UE.getEditor('editor').blur();
        UE.dom.domUtils.preventDefault(e)
    }
    function insertHtml() {
        var value = prompt('插入html代码', '');
        UE.getEditor('editor').execCommand('insertHtml', value)
    }
    function createEditor() {
        enableBtn();
        UE.getEditor('editor');
    }
    function getAllHtml() {
        alert(UE.getEditor('editor').getAllHtml())
    }
    function getContent() {
        var arr = [];
        arr.push("使用editor.getContent()方法可以获得编辑器的内容");
        arr.push("内容为：");
        arr.push(UE.getEditor('editor').getContent());
        alert(arr.join("\n"));
    }
    function getPlainTxt() {
        var arr = [];
        arr.push("使用editor.getPlainTxt()方法可以获得编辑器的带格式的纯文本内容");
        arr.push("内容为：");
        arr.push(UE.getEditor('editor').getPlainTxt());
        alert(arr.join('\n'))
    }
    function setContent(isAppendTo) {
        var arr = [];
        arr.push("使用editor.setContent('欢迎使用ueditor')方法可以设置编辑器的内容");
        UE.getEditor('editor').setContent('欢迎使用ueditor', isAppendTo);
        alert(arr.join("\n"));
    }
    function setDisabled() {
        UE.getEditor('editor').setDisabled('fullscreen');
        disableBtn("enable");
    }

    function setEnabled() {
        UE.getEditor('editor').setEnabled();
        enableBtn();
    }

    function getText() {
        //当你点击按钮时编辑区域已经失去了焦点，如果直接用getText将不会得到内容，所以要在选回来，然后取得内容
        var range = UE.getEditor('editor').selection.getRange();
        range.select();
        var txt = UE.getEditor('editor').selection.getText();
        alert(txt)
    }

    function getContentTxt() {
        var arr = [];
        arr.push("使用editor.getContentTxt()方法可以获得编辑器的纯文本内容");
        arr.push("编辑器的纯文本内容为：");
        arr.push(UE.getEditor('editor').getContentTxt());
        alert(arr.join("\n"));
    }
    function hasContent() {
        var arr = [];
        arr.push("使用editor.hasContents()方法判断编辑器里是否有内容");
        arr.push("判断结果为：");
        arr.push(UE.getEditor('editor').hasContents());
        alert(arr.join("\n"));
    }
    function setFocus() {
        UE.getEditor('editor').focus();
    }
    function deleteEditor() {
        disableBtn();
        UE.getEditor('editor').destroy();
    }
    function disableBtn(str) {
        var div = document.getElementById('btns');
        var btns = UE.dom.domUtils.getElementsByTagName(div, "button");
        for (var i = 0, btn; btn = btns[i++];) {
            if (btn.id == str) {
                UE.dom.domUtils.removeAttributes(btn, ["disabled"]);
            } else {
                btn.setAttribute("disabled", "true");
            }
        }
    }
    function enableBtn() {
        var div = document.getElementById('btns');
        var btns = UE.dom.domUtils.getElementsByTagName(div, "button");
        for (var i = 0, btn; btn = btns[i++];) {
            UE.dom.domUtils.removeAttributes(btn, ["disabled"]);
        }
    }

    function getLocalData () {
        alert(UE.getEditor('editor').execCommand( "getlocaldata" ));
    }

    function clearLocalData () {
        UE.getEditor('editor').execCommand( "clearlocaldata" );
        alert("已清空草稿箱");
    }
</script>
 
</body>
</html>