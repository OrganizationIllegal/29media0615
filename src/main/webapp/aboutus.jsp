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
</head>
<body>
		<jsp:include page="headnew.jsp" />
		<div style="width:1140px;margin:0 auto;">
		<div style="margin-top:20px;margin-left:210px;"><img alt="联系我们" src="images/lianxi.gif"></div>
		<div style="clear:both;">
		<jsp:include page="foot.jsp" />
		</div>
</div>
</body>
</html>
