<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html>
<head>
<title>新闻录入</title>
<link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/input.css" />
<script src="//cdn.ckeditor.com/4.4.7/full/ckeditor.js"></script>
<script src="/js/jquery.min.js"></script>
<script src="/bootstrap/js/bootstrap.min.js"></script>
<style type="text/css">
body{
	/* background-color:rgb(232, 233, 234)!important; */
	font-family:"Microsoft YaHei"!important;
}
</style>
</head>
<body>
<div style="width:900px;margin:25px auto;">
<div class="area_bkg1">当前位置:新闻录入</div>
<div class="area_bkg2" id="newsinfo">新闻信息</div>
<div class="area_left">
<span class="area_span">新闻编号</span><span><input type="text" id="news_id" name="news_id" class="area_input" placeholder=${newstrends.news_id}></span>
</div>
<div class="area_right">
<span class="area_span">新闻标题</span><span><input type="text" id="title" name="title" class="area_input"></span>
</div>
<div class="area_left">
<span class="area_span">发布时间</span><span><input type="text" id="time" name="time" class="area_input"></span>
</div>
<div class="area_left c-fix">
<span class="area_span">新闻详情</span>
</div>
<div class="c-fix" style="margin-bottom:15px;margin-left:35px;"><textarea id="detail" name="detail" rows="3" cols="112" style="background-color:rgb(237,238,243);border:0px;"></textarea></div>
<div class="area_bkg2 c-fix" id="newsimg">新闻图片</div>
<div class="c-fix" style="padding-left:35px;margin-top:20px;">
<span class="area_span" style="float:left;">培训图片</span>
<span> <input type="file" name="news_image" id="news_image" style="width:600px;border:1px solid rgb(239,235,242);float:left;margin-right:40px;"/><a href="#">上传</a></span>
</div>
<div class="area_left3 c-fix"></div>
<div class="area_right3"><span class="area_span5"><a href="#">添加</a></span></div>
<div class="area_left3">
<span class="area_span">1</span><span class="area_span">/images/news/news00.jpg</span>
</div>
<div class="area_right3">
<span class="area_span4"><a href="#">编辑</a></span><span class="area_span5"><a href="#">删除</a></span>
</div>
<div class="area_left3">
<span class="area_span">1</span><span class="area_span">/images/news/news01.jpg</span>
</div>
<div class="area_right3">
<span class="area_span4"><a href="#">编辑</a></span><span class="area_span5"><a href="#">删除</a></span>
</div>
<div class="area_left4"><button type="button" class="btn" onclick="add()">提交</button></div>
<div class="area_right4"><button type="reset" class="btn">重置</button></div>
</div>
<script type="text/javascript">
function add(){
	  var news_id=$("#news_id").val();
	  var title=$("#title").val();
	  var time=$("#time").val();
	  var detail=$("#detail").val();
	  $.ajax({
	 	    type: "POST",
	 		data: { news_id : news_id,title : title,time : time,detail : detail}, 
	 		dataType: "json",
	 		url: "/inputNewsTrends",
	 		success:function(data){
	 			if(data.flag == 1){
	 				alert("添加成功！");
	 			}else if(data.flag ==0){
	 				alert("添加失败！");
	 			}
	 		},
	 		error:function(){
	 			alert("error")
	 		}
	 	});
	  }
</script>
</body>
</html>