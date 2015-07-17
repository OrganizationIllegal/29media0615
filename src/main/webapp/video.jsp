<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="icon" sizes="any" type="image/x-icon"  href="images/Logo2.png">
    <title>贰玖传媒</title>
<link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet">
   <link href="/bootstrap/css/bootstrap-theme.min.css" rel="stylesheet">
   <link href="/css/news.css" rel="stylesheet">
   <script src="/js/jquery.min.js"></script>
   <script src="/bootstrap/js/bootstrap.min.js"></script>

	<style type="text/css">
		 .yuanjiao{
            width: 205px;
            color: white;
            margin: 20px;
            -webkit-border-radius: 15px;
            -moz-border-radius: 15px;

        }
	</style>

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

 	<div style="margin-top:50px;">
		<div style="width:280px;float:left;">
		<div style="text-align:center;font-size:20px;font-weight:bolder;padding-bottom:20px;border-bottom:1px solid;color:white;">影视</div>
		<!-- 影视目录 -->

		<c:forEach items="${typeList}" var="item" varStatus="status">
		
<div style="cursor:pointer;margin-left:20px;font-weight:bold;">
		
<a href="VideoList?vedioParam=${item}" style="color:#783f04;">${item}</a>
		
		</div>			
		</c:forEach>
		</div>
		
		<div style="width:860px;float:left;border-left:1px solid;">
		<c:forEach items="${resultList}" var="item" varStatus="status">
			<a href="${item.video_link}" target="_blank">
			<div style="width:180px;float:left;background-color:rgba(218, 220, 219, 1);text-align:center;margin-left:50px;padding:5px;">
			<div><img src="/29images/${item.video_pic}" style="width:160px;height:100px;"></div>
			<div style="padding:5px;font-size:14px;color:rgba(31, 154, 228, 1);text-align:left;">
			${item.video_desc}</div>
			</div>
	        </a>
        </c:forEach>
   </div>
   
   </div>

		</div> 


		<jsp:include page="foot.jsp" />

</body>
</html>