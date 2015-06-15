<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
   <title>ABOUT US</title>
   <link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet">
   <script src="/js/jquery.min.js"></script>
   <script src="/bootstrap/js/bootstrap.min.js"></script>
    <style type="text/css">
   body{
   background-color:rgba(233, 243, 248, 1);
   }
   </style>
   <script type="text/javascript">
   $(function(){
	   $("#erjiu1").mouseover(function(){
		   $("#erjiu1").css("opacity","1");
		   });
	   $("#erjiu1").mouseleave(function(){
		   $("#erjiu1").css("opacity","0.6");
		   });
	   $("#zhaopin1").mouseover(function(){
		   $("#zhaopin1").css("opacity","1");
		   });
	   $("#zhaopin1").mouseleave(function(){
		   $("#zhaopin1").css("opacity","0.6");
		   });
	   $("#lianxi1").mouseover(function(){
		   $("#lianxi1").css("opacity","1");
		   });
	   $("#lianxi1").mouseleave(function(){
		   $("#lianxi1").css("opacity","0.6");
		   });
	   $("#erjiu1").click(function(){
		   $("#erjiu2").css("display","block");
		   $("#zhaopin2").css("display","none");
		   $("#lianxi2").css("display","none");
		   });
	   $("#zhaopin1").click(function(){
		   $("#zhaopin2").css("display","block");
		   $("#erjiu2").css("display","none");
		   $("#lianxi2").css("display","none");
		   });
	   $("#lianxi1").click(function(){
		   $("#lianxi2").css("display","block");
		   $("#erjiu2").css("display","none");
		   $("#zhaopin2").css("display","none");
		   });
	   });
   </script>
</head>
<body>
<div class="container">
		<jsp:include page="head.jsp" />
		<div class="row" style="margin-top:30px;color:white;">
		<div class="col-md-3" style="padding-right:0px;">
		<div style="text-align:center;font-size:20px;font-weight:bolder;padding-bottom:20px;border-bottom:1px solid;color:white;">ABOUT US</div>
		<div id="erjiu1" style="cursor:pointer;margin-top:20px;margin-left:20px;filter:alpha(opacity=60);opacity:0.6;color:white;"><img alt="关于二九" src="/images/aboutus/left1.PNG" style="width:100px;"><span style="font-size:16px;font-weight:bolder;margin-left:20px;">关于二九</span></div>
		<div id="zhaopin1" style="cursor:pointer;margin-top:30px;margin-left:20px;filter:alpha(opacity=60);opacity:0.6;color:white;"><img alt="招聘信息" src="/images/aboutus/left2.PNG" style="width:100px;"><span style="font-size:16px;font-weight:bolder;margin-left:20px;">招聘信息</span></div>
		<div id="lianxi1" style="cursor:pointer;margin-top:30px;margin-left:20px;filter:alpha(opacity=60);opacity:0.6;color:white;"><img alt="联系我们" src="/images/aboutus/left3.PNG" style="width:100px;"><span style="font-size:16px;font-weight:bolder;margin-left:20px;">联系我们</span></div>
		</div>
		<div class="col-md-9" style="padding-left:0px;">
		<div id="erjiu2" style="border-left:1px solid;">
		<div style="text-align:center;font-size:20px;font-weight:bolder;padding-bottom:10px;padding-top:10px;border-bottom:1px solid;color:white;">公司简介</div>
		<div style="overflow-y:auto; width:863px; height:670px;text-align:center;"><img alt="公司简介" src="/images/aboutus/jianjie.png"></div>
		</div>
		<div id="zhaopin2" style="border-left:1px solid;display:none;">
		<div style="text-align:center;font-size:20px;font-weight:bolder;padding-bottom:10px;padding-top:10px;border-bottom:1px solid">招聘信息</div>
		<div style="overflow-y:auto; width:863px; height:670px;text-align:center;"><img alt="招聘信息" src="/images/aboutus/zhaopin.PNG"></div>
		</div>
		<div id="lianxi2" style="border-left:1px solid;display:none;">
		<div style="text-align:center;font-size:20px;font-weight:bolder;padding-bottom:10px;padding-top:10px;border-bottom:1px solid">联系我们</div>
		<div style="overflow-y:auto; width:863px; height:670px;text-align:center;"><img alt="联系我们" src="/images/aboutus/lianxi.PNG"></div>
		</div>
		</div>
		</div>
		<jsp:include page="foot.jsp" />
</div>
</body>
</html>
