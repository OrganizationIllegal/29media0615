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
   <title>贰玖传媒</title>
   <link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet">
   <script src="/js/jquery.min.js"></script>
   <script src="/bootstrap/js/bootstrap.min.js"></script>
   <script type="text/javascript" src="http://ecn.dev.virtualearth.net/mapcontrol/mapcontrol.ashx?v=7.0&mkt=zh-cn"></script> 
   <script type="text/javascript" src="/js/bingMap.js"></script>
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
		<div style="text-align:center;margin-top:20px;"><img alt="联系我们" src="images/lianxi.jpg"></div>
		<div style="clear:both;">
		<jsp:include page="foot.jsp" />
		</div>
</div>
</body>
</html>
