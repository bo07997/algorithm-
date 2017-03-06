//2016-12-24
//删除博客
function   del(e,ctx,table){
    		 if(confirm("你确定要删除吗？"))
    			     {
    			 
    			 $.ajax({
    	        		type:"POST",
    	        		url:ctx+"/Blog/deleteblog/"+table+"/"+e,
    	        		contentType: "application/json; charset=utf-8", 
    	        		dataType:"json",
    	        		success:function(user){
    	        			//打开新的页面
    	        			 window.location.reload();
    	        			 alert("删除成功！");
    	        		},
    	        	error:function(){
    	        		//打开新的页面
	        			 window.location.reload();
    	        		alert("删除操作出现错误！");
    	        	
    	            }
    	        		
    	        	
    	        })
    			    }
    	}

//删除类别
function   delcate(e,ctx){
	 if(confirm("你确定要删除该类别吗？"))
		     {
		 
		 $.ajax({
       		type:"POST",
       		url:ctx+"/Category/deletecate/"+e,
       		contentType: "application/json; charset=utf-8", 
       		dataType:"json",
       		success:function(user){
       			//打开新的页面
       			 window.location.reload();
       			alert("删除成功！");
       		},
       	error:function(){
       		//打开新的页面
   			 window.location.reload();
       		alert("删除操作出现错误！");
       	
           }
       		
       	
       })
		    }
}

/*
 * 根据时间替换博文简介文章
 */
function   getblogsBydate(uId,date,ctx){

		 $.ajax({
      		type:"POST",
      		url:ctx+"/Message/cateByDate",
      		contentType: "application/json; charset=utf-8", 
      		dataType:"json",
      		data:JSON.stringify({
      			"uId":uId,
    			"date":date
    			}),
      		success:function(blogs){
      		/*	let blogsHtml = blogs
      				.map(blog => generateBlog(blog))
      				.join('')*/
      				
      	        let blogsHtml = '';
      			for (let i = 0; i  < blogs.length; i++) {
      				blogsHtml+= generateBlog(blogs[i]);
      				
      			}
      				  				
      			$("#article_list").html(blogsHtml);
      		},
      	error:function(){
      		
      		alert("删除操作出现错误！");
      	
          }
      		
      	
      })
		    
}

function   openblogsBydate(uId,date,ctx){
	//打开新的页面
	  window.open (ctx +"/Message/our_home/"+uId+"_0");
	 
	  $(document).ready(function() { 
		getblogsBydate(uId,date,ctx);
	  });

	

	
}

/*
 * 拼接HTML
 */
function generateBlog (blog) {
	const ctx = "/ssm_project";
	return `
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
			href="${ctx }/Blog/oneblog/${blog.bId }#footer"
			style="color: red" title="评论">评论</a>(${blog.commontTimes })</span>
		<span><a
			href="http://write.blog.csdn.net/postedit/53224537" title="编辑">编辑</a></span>
		<span><a href="javascript:void(0);"
			onclick="del(${blog.bId },'${ctx }','blog')" title="删除">删除</a></span>
	</div>
	<div class="clear"></div>
</div>
	`
}



	
