<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html>
<head>
<title>艺人录入</title>
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
<div class="area_bkg1">当前位置:艺人录入</div>
<div class="area_bkg2" id="brokerinfo">艺人信息</div>
<div class="area_left">
<span class="area_span">艺人编号</span><span><input type="text" id="star_num" name="star_num" class="area_input"></span>
</div>
<div class="area_right">
<span class="area_span">中文名</span><span><input type="text" id="chinese_name" name="chinese_name" class="area_input"></span>
</div>
<div class="area_left">
<span class="area_span">英文名</span><span><input type="text" id="english_name" name="english_name" class="area_input"></span>
</div>
<div class="area_right">
<span class="area_span">别名</span><span><input type="text" id="bieming" name="bieming" class="area_input"></span>
</div>
<div class="area_left">
<span class="area_span">性别</span><span><input type="text" id="sex" name="sex" class="area_input"></span>
</div>
<div class="area_right">
<span class="area_span">国籍</span><span><input type="text" id="nationality" name="nationality" class="area_input"></span>
</div>
<div class="area_left">
<span class="area_span">民族</span><span><input type="text" id="nation" name="nation" class="area_input"></span>
</div>
<div class="area_right">
<span class="area_span">星座</span><span><input type="text" id="constellation" name="constellation" class="area_input"></span>
</div>
<div class="area_left">
<span class="area_span">血型</span><span><input type="text" id="bloodtype" name="bloodtype" class="area_input"></span>
</div>
<div class="area_right">
<span class="area_span">属相</span><span><input type="text" id="animal" name="animal" class="area_input"></span>
</div>
<div class="area_left">
<span class="area_span">身高</span><span><input type="text" id="height" name="height" class="area_input"></span>
</div>
<div class="area_right">
<span class="area_span">体重</span><span><input type="text" id="weight" name="weight" class="area_input"></span>
</div>
<div class="area_left">
<span class="area_span">出生地</span><span><input type="text" id="birthplace" name="birthplace" class="area_input"></span>
</div>
<div class="area_right">
<span class="area_span">生日</span><span><input type="text" id="birthday" name="birthday" class="area_input"></span>
</div>
<div class="area_left">
<span class="area_span">职业</span><span><input type="text" id="occupation" name="occupation" class="area_input"></span>
</div>
<div class="area_right">
<span class="area_span">经纪公司</span><span><input type="text" id="brokerfirm" name="brokerfirm" class="area_input"></span>
</div>
<div class="area_left">
<span class="area_span">现居地</span><span><input type="text" id="residence" name="residence" class="area_input"></span>
</div>
<div class="area_right">
<span class="area_span">毕业院校</span><span><input type="text" id="gratuateunivercity" name="gratuateunivercity" class="area_input"></span>
</div>
<div class="area_left">
<span class="area_span">特长</span><span><input type="text" id="specialty" name="specialty" class="area_input"></span>
</div>
<div class="area_right">
<span class="area_span">音乐风格</span><span><input type="text" id="musicalstyle" name="musicalstyle" class="area_input"></span>
</div>
<div class="area_left">
<span class="area_span">代表作品</span><span><input type="text" id="representativeworks" name="representativeworks" class="area_input"></span>
</div>
<div class="area_right">
<span class="area_span">成就</span><span><input type="text" id="achivements" name="achivements" class="area_input"></span>
</div>
<div class="area_left c-fix">
<span class="area_span">艺人详情</span>
</div>
<div class="c-fix" style="margin-bottom:15px;"><textarea id="star_detail" placeholder="艺人详情" name="star_detail"></textarea></div>
<div class="area_bkg2 c-fix" id="brokerinfo">艺人图片</div>
<div class="c-fix" style="padding-left:35px;margin-top:20px;">
<span class="area_span">艺人图片</span>
<span style="float:right;"> <input type="file" name="img" id="img" style="width:677px;border:1px solid rgb(239,235,242);float:left;margin-right:20px;"/><a href="#">上传</a></span>
</div>
<div class="area_left3"></div>
<div class="area_right3"><span class="area_span5"><a href="#" onclick="add1()">添加</a></span></div>
<div class="area_left3">
<span class="area_span">1</span><span class="area_span">/images/img01.jpg</span>
</div>
<div class="area_right3">
<span class="area_span4"><a href="#">编辑</a></span><span class="area_span5"><a href="#">删除</a></span>
</div>
<div class="area_left3">
<span class="area_span">1</span><span class="area_span">/images/img02.jpg</span>
</div>
<div class="area_right3">
<span class="area_span4"><a href="#">编辑</a></span><span class="area_span5"><a href="#">删除</a></span>
</div>
<div class="area_bkg2 c-fix" id="brokerinfo">艺人影视</div>
<div class="area_left">
<span class="area_span">影视编号</span><span><input type="text" id="video_id" name="video_id" class="area_input"></span>
</div>
<div class="area_right">
<span class="area_span">影视链接</span><span><input type="text" id="video_link" name="video_link" class="area_input"></span>
</div>
<div class="c-fix" style="padding-left:35px;margin-top:20px;">
<span class="area_span">影视图片</span>
<span style="float:right;"> <input type="file" name="video_pic" id="video_pic" style="width:677px;border:1px solid rgb(239,235,242);float:left;margin-right:20px;"/><a href="#">上传</a></span>
</div>
<div class="area_left3"></div>
<div class="area_right3"><span class="area_span5"><a href="#" onclick="add1()">添加</a></span></div>
<div class="area_left3">
<span class="area_span">1</span><span class="area_span">/images/img01.jpg</span>
</div>
<div class="area_right3">
<span class="area_span4"><a href="#">编辑</a></span><span class="area_span5"><a href="#">删除</a></span>
</div>
<div class="area_left3">
<span class="area_span">1</span><span class="area_span">/images/img02.jpg</span>
</div>
<div class="area_right3">
<span class="area_span4"><a href="#">编辑</a></span><span class="area_span5"><a href="#">删除</a></span>
</div>
<div class="area_left4"><button type="button" class="btn" onclick="add()">提交</button></div>
<div class="area_right4"><button type="reset" class="btn">重置</button></div>
</div>

<script type="text/javascript">
CKEDITOR.replace( 'star_detail' );
</script>
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