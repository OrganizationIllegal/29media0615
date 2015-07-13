<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
   <link rel="icon" sizes="any" type="image/x-icon"  href="images/Logo2.png">
   <title>29传媒</title>
   <link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet">
   <script src="/js/jquery.min.js"></script>
   <script src="/bootstrap/js/bootstrap.min.js"></script>
    <style type="text/css">  
   img 
   {
   filter:progid:DXImageTransform.Microsoft.Shadow(color=#909090,direction=120,strength=3);/*ie*/
   -moz-box-shadow: 2px 2px 10px #909090;/*firefox*/
   -webkit-box-shadow: 2px 2px 10px #909090;/*safari或chrome*/
   box-shadow:2px 2px 10px #909090;/*opera或ie9*/
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
		<jsp:include page="headnew.jsp" />
		<div style="width:1140px;margin:0 auto;">
		<div style="margin-top:30px;">
		<div style="width:280px;float:left;">
		<div style="text-align:center;font-size:20px;font-weight:bolder;padding-bottom:20px;border-bottom:1px solid;color:white;">ABOUT US</div>
		<div id="erjiu1" style="cursor:pointer;margin-top:20px;margin-left:20px;filter:alpha(opacity=60);opacity:0.6;color:white;"><img alt="关于二九" src="/29images/left1.PNG" style="width:100px;"><span style="font-size:16px;font-weight:bolder;margin-left:20px;">关于二九</span></div>
		<div id="zhaopin1" style="cursor:pointer;margin-top:30px;margin-left:20px;filter:alpha(opacity=60);opacity:0.6;color:white;"><img alt="招聘信息" src="/29images/left2.PNG" style="width:100px;"><span style="font-size:16px;font-weight:bolder;margin-left:20px;">招聘信息</span></div>
		<div id="lianxi1" style="cursor:pointer;margin-top:30px;margin-left:20px;filter:alpha(opacity=60);opacity:0.6;color:white;"><img alt="联系我们" src="/29images/left3.PNG" style="width:100px;"><span style="font-size:16px;font-weight:bolder;margin-left:20px;">联系我们</span></div>
		</div>
		<div style="width:860px;float:left;">
		<div id="erjiu2" style="border-left:1px solid;">
		<div style="text-align:center;font-size:20px;font-weight:bolder;padding-bottom:10px;padding-top:10px;border-bottom:1px solid;color:white;">公司简介</div>
		<div style="overflow-y:auto; width:863px; height:670px;text-align:center;"><img alt="公司简介" src="/29images/jianjie.png"></div>
		</div>
		<div id="zhaopin2" style="border-left:1px solid;display:none;">
		<div style="text-align:center;font-size:20px;font-weight:bolder;padding-bottom:10px;padding-top:10px;border-bottom:1px solid">招聘信息</div>
		<div style="overflow-y:auto; width:863px; height:670px;text-align:center;"><img alt="招聘信息" src="/29images/zhaopin.PNG"></div>
		</div>
		<div id="lianxi2" style="border-left:1px solid;display:none;">
		<div style="text-align:center;font-size:20px;font-weight:bolder;padding-bottom:10px;padding-top:10px;border-bottom:1px solid">联系我们</div>
		<div style="overflow-y:auto; width:863px; height:670px;text-align:center;"><img alt="联系我们" src="/29images/lianxi.PNG"></div>
		</div>
		</div>
		</div>
		<div style="padding-top:20px;clear:both;">
		<jsp:include page="foot.jsp" />
		</div>
</div>
</body>
</html>
