<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html>
<head>
<title>培训录入</title>
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
<div class="area_bkg1">当前位置:培训录入</div>
<div class="area_bkg2" id="brokerinfo">培训信息</div>
<div class="area_left">
<span class="area_span">培训编号</span><span><input type="text" id="train_id" name="train_id" class="area_input"></span>
</div>
<div class="area_right">
<span class="area_span">培训名称</span><span><input type="text" id="train_name" name="train_name" class="area_input"></span>
</div>
<div class="area_left c-fix">
<span class="area_span">培训描述</span>
</div>
<div class="c-fix" style="margin-bottom:15px;margin-left:35px;"><textarea id="train_desc" name="train_desc" rows="3" cols="112" style="background-color:rgb(237,238,243);border:0px;"></textarea></div>
<div class="area_bkg2 c-fix" id="brokerinfo">培训详情</div>
<div class="area_left">
<span class="area_span">标题</span><span><input type="text" id="title" name="title" class="area_input"></span>
</div>
<div class="area_right">
<span class="area_span">时间</span><span><input type="text" id="time" name="time" class="area_input"></span>
</div>
<div class="area_left c-fix">
<span class="area_span">详情</span>
</div>
<div class="c-fix" style="margin-bottom:15px;margin-left:35px;"><textarea id="detail" name="detail" rows="3" cols="112" style="background-color:rgb(237,238,243);border:0px;"></textarea></div>
<div class="c-fix" style="padding-left:35px;margin-top:20px;">
<span class="area_span" style="float:left;">培训图片</span>
<span> <input type="file" name="news_image" id="news_image" style="width:600px;border:1px solid rgb(239,235,242);float:left;margin-right:40px;"/><a href="#">上传</a></span>
</div>
<div class="area_left3"></div>
<div class="area_right3"><span class="area_span5"><a href="#" onclick="add1()">添加</a></span></div>
<div class="area_left3">
<span class="area_span">二九传媒</span><span class="area_span">2015-05-15</span><span class="area_span">/images/trainee1.PNG</span>
</div>
<div class="area_right3">
<span class="area_span4"><a href="#">编辑</a></span><span class="area_span5"><a href="#">删除</a></span>
</div>
<div class="area_left3">
<span class="area_span">二九传媒</span><span class="area_span">2015-05-16</span><span class="area_span">/images/trainee2.PNG</span>
</div>
<div class="area_right3">
<span class="area_span4"><a href="#">编辑</a></span><span class="area_span5"><a href="#">删除</a></span>
</div>
<div class="area_bkg2 c-fix" id="brokerinfo">艺能培训</div>
<div class="area_left">
<span class="area_span">类型</span><span><input type="text" id="typename" name="typename" class="area_input"></span>
</div>
<div class="area_left c-fix">
<span class="area_span">详情</span>
</div>
<div class="c-fix" style="margin-bottom:15px;margin-left:35px;"><textarea id="detail" name="detail" rows="3" cols="112" style="background-color:rgb(237,238,243);border:0px;"></textarea></div>
<div class="c-fix" style="padding-left:35px;margin-top:20px;">
<span class="area_span" style="float:left;">培训图片</span>
<span> <input type="file" name="img" id="img" style="width:600px;border:1px solid rgb(239,235,242);float:left;margin-right:40px;"/><a href="#">上传</a></span>
</div>
<div class="area_left3 c-fix"></div>
<div class="area_right3"><span class="area_span5"><a href="#" onclick="add1()">添加</a></span></div>
<div class="area_left3">
<span class="area_span">舞蹈班</span><span class="area_span">inter1.PNG</span>
</div>
<div class="area_right3">
<span class="area_span4"><a href="#">编辑</a></span><span class="area_span5"><a href="#">删除</a></span>
</div>
<div class="area_left3">
<span class="area_span">艺术班</span><span class="area_span">trainee2.PNG</span>
</div>
<div class="area_right3">
<span class="area_span4"><a href="#">编辑</a></span><span class="area_span5"><a href="#">删除</a></span>
</div>
<div class="area_left4"><button type="button" class="btn" onclick="add()">提交</button></div>
<div class="area_right4"><button type="reset" class="btn">重置</button></div>
</div>
<script type="text/javascript">
function add(){
	  var broker_num=$("#broker_num").val();
	  var broker_name=$("#broker_name").val();
	  var broker_language=$("#broker_language").val();
	  var broker_region=$("#broker_region").val();
	  var broker_type=$("#broker_type").val();
	  var broker_zizhi=$("#broker_zizhi").val();
	  var broker_experience=$("#broker_experience").val();
	  var broker_img=$("#broker_img").val();
	  var introduction=$("#introduction").val();
	  var type_num=$("#type_num").val();
	  var type_name=$("#type_name").val();
	  var type_image=$("#type_image").val();
	  $.ajax({
	 	    type: "POST",
	 		data: { broker_num : broker_num,broker_name : broker_name,broker_language : broker_language,broker_region : broker_region,broker_type : broker_type,broker_zizhi : broker_zizhi,broker_experience : broker_experience,broker_img : broker_img,introduction : introduction,type_num : type_num,type_name : type_name,type_image : type_image}, 
	 		dataType: "json",
	 		url: "/inputBroker",
	 		success:function(data){
	 			if(data.flag == 2){
	 				alert("添加成功！");
	 			}else if(data.flag <2){
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