<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link href="${ctx }/resources/froala_editor/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<link href="${ctx }/resources/froala_editor/css/froala_editor.min.css" rel="stylesheet" type="text/css">


    <style>
        body {
            text-align: center;
        }

        section {
            width: 80%;
            margin: auto;
            text-align: left;
        }
    </style>
</head>

<body>
  <section id="editor">
      <div id='edit' style="margin-top: 30px;">
      </div>
  </section>

  <script src="${ctx }/resources/froala_editor/js/libs/jquery-1.11.1.min.js"></script>
  <script src="${ctx }/resources/froala_editor/js/froala_editor.min.js"></script>
  <!--[if lt IE 9]>
    <script src="../js/froala_editor_ie8.min.js"></script>
  <![endif]-->
  <script src="${ctx }/resources/froala_editor/js/plugins/tables.min.js"></script>
  <script src="${ctx }/resources/froala_editor/js/plugins/lists.min.js"></script>
  <script src="${ctx }/resources/froala_editor/js/plugins/colors.min.js"></script>
  <script src="${ctx }/resources/froala_editor/js/plugins/media_manager.min.js"></script>
  <script src="${ctx }/resources/froala_editor/js/plugins/font_family.min.js"></script>
  <script src="${ctx }/resources/froala_editor/js/plugins/font_size.min.js"></script>
  <script src="${ctx }/resources/froala_editor/js/plugins/block_styles.min.js"></script>
  <script src="${ctx }/resources/froala_editor/js/plugins/video.min.js"></script>

  <script>
      $(function(){
          $('#edit').editable({
        	  inlineMode: false, 
        	  alwaysBlank: true,
        	  language: "zh_cn",
              direction: "ltr",
              allowedImageTypes: ["jpeg", "jpg", "png", "gif"],
              autosave: true,
              autosaveInterval: 2500,
              saveURL: '/wirtetest',
              saveParams: { postId: "123" },
              spellcheck: true,
              plainPaste: true,
              imageButtons: ["floatImageLeft", "floatImageNone", "floatImageRight", "linkImage", "replaceImage", "removeImage"],
              imageUploadURL: 'hander/FroalaHandler.ashx',
              imageParams: { postId: "123" },
              enableScript: false
        	  
        	  })
      });
  </script>
</body>
</html>
