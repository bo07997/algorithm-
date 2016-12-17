<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Markdown本地练习</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
     <link rel="stylesheet" href="http://apps.bdimg.com/libs/bootstrap/3.3.0/css/bootstrap.min.css">  
     <script src="http://apps.bdimg.com/libs/jquery/2.1.1/jquery.min.js"></script>
     <script src="http://apps.bdimg.com/libs/bootstrap/3.3.0/js/bootstrap.min.js"></script>
</head>
<body style="padding:30px;background:#e6e6e6;">
<div style="width:100%;padding:7px;">
<button type="button" align="center" class="btn btn-primary btn-lg" style="font-size:30px;">
  <span class="glyphicon glyphicon-user"></span> 嗨，左边输入markdown语句，右边实时预览
</button>
</div>
<textarea id="text-input" oninput="this.editer.update()" style="width:50%;height:768px; background:#CBEFD9;font-size:22px;">
</textarea>
<div id="preview" style="float:right;width:50%;height:100%; border:0.5px solid #315;background:#e6e6e6;"></div>
<script src='markdown.js'></script>
<script type="text/javascript">
    function Editor(input , preview){
        this.update = function(){
            preview.innerHTML = markdown.toHTML(input.value);
        };
        input.editer = this
        this.update()
    }

    var $ = function(id) {
        return document.getElementById(id)
    }
    new Editor($("text-input"),$("preview"))
</script>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="http://lib.sinaapp.com/js/jquery/1.9.1/jquery-1.9.1.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
</body>
</html>