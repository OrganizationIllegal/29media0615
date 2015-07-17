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
   <title>29传媒</title>
<link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet">
   <link href="/bootstrap/css/bootstrap-theme.min.css" rel="stylesheet">
   <link href="/css/news.css" rel="stylesheet">
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
</head>
<body>
 <jsp:include page="headnew.jsp" />
 <div style="width:1140px;margin:0 auto;">
 	<div style="margin-top:50px;">
		<div style="width:280px;float:left;">
		<div style="text-align:center;font-size:20px;font-weight:bolder;padding-bottom:20px;border-bottom:1px solid;color:white;">影视</div>
		<!-- 影视目录 -->
		<%-- <c:forEach var="item" items="${trendList }" varStatus="stat">
			<div style="margin-top:20px;margin-left:20px;font-weight:bold;-filter:alpha(opacity=60);-opacity:0.6;">${item.time}</div>
		<div id="id${stat.index+1}" style="cursor:pointer;margin-left:20px;font-weight:bold;"><a href="/News?newsId=${item.news_id}" style="color:#783f04;">${item.title}</a></div>		
		</c:forEach> --%>
		<div style="cursor:pointer;margin-left:20px;font-weight:bold;"><a href="#" style="color:#783f04;">练习生影视</a></div>			
		
		</div>
		<div style="width:860px;float:left;border-left:1px solid;">
		<a href="#">
		<div style="width:180px;background-color:rgba(218, 220, 219, 1);text-align:center;margin-left:50px;padding:5px;">
		<div><img  src="images/img01.jpg" style="width:160px;height:100px;"></div>
		<div style="padding:5px;font-size:14px;color:rgba(31, 154, 228, 1);text-align:left;">啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊</div>
		</div>
        </a>
   </div>
   </div>

		</div> 
 	<div style="clear:both;">
		<jsp:include page="foot.jsp" />
		</div>
</body>
</html>