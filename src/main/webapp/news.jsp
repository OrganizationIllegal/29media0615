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
		<div style="text-align:center;font-size:20px;font-weight:bolder;padding-bottom:20px;border-bottom:1px solid;color:white;">NEWS TREND</div>
		<!-- 新闻目录 -->
		<c:forEach var="item" items="${trendList }" varStatus="stat">
			<div style="margin-top:20px;margin-left:20px;font-weight:bold;-filter:alpha(opacity=60);-opacity:0.6;">${item.time}</div>
		<div id="id${stat.index+1}" style="cursor:pointer;margin-left:20px;font-weight:bold;"><a href="/News?newsId=${item.news_id}" style="color:#783f04;">${item.title}</a></div>		
		</c:forEach>
			
		
		</div>
		<div style="width:860px;float:left;">
		<div id="news1" style="border-left:1px solid;">
		<div style="text-align:center;font-size:20px;font-weight:bolder;color:white;">${newsInfo.title}</div>
		<div style="text-align:right;-filter:alpha(opacity=60);-opacity:0.6;border-bottom:1px solid;color:white;">${newsInfo.time}</div>
		<!-- 轮播图 -->
		<div style="margin-top:30px;margin-left:100px;margin-right:100px;">
		<div id="myCarousel" class="carousel slide" data-ride="carousel" data-interval="5000">
   <!-- 轮播（Carousel）指标 -->
   <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
   </ol>   
   <!-- 轮播（Carousel）项目 -->
   <div class="carousel-inner">
   <c:forEach items="${imageList}" var="item" varStatus="stat">
   		<c:choose>
   			<c:when test="${stat.index==0 }">
	   			 <div class="item active">
			         <img src="/29images/${item.news_image }" alt="First slide" style="width:800px;height:400px;">
			         <div class="carousel-caption"></div>
      			 </div>
   			</c:when>
   			<c:otherwise>
   				<div class="item">
			         <img src="/29images/${item.news_image }" alt="First slide" style="width:800px;height:400px;">
			         <div class="carousel-caption"></div>
      			 </div>
   			</c:otherwise>
   		</c:choose>
   </c:forEach>
     
      <!-- 轮播（Carousel）导航 -->
   <a class="carousel-control left" href="#myCarousel" 
      data-slide="prev">&lsaquo;</a>
   <a class="carousel-control right" href="#myCarousel" 
      data-slide="next">&rsaquo;</a>

   </div>
   </div>
   </div>

   <!--  轮播图 -->
    <%
   		String detail = request.getAttribute("detail").toString();
   		/* detail = detail.replace("\n", "<br/>");
   		detail = detail.replace(" ", "&nbsp;"); */
    %>
  <div style="-overflow-y:auto; width:850px; -height:300px;text-align:left;padding:30px;margin-bottom:50px;"><%=detail %></div>
		</div>
   
 
   </div>
  <!--  轮播图 -->
 <!--  <div style="overflow-y:auto; width:850px; height:300px;text-align:center;margin-top:30px;margin-bottom:30px;"><img alt="明星介绍" src="/images/news/news13.PNG"></div>
		</div>
			

		</div>-->
		</div> 
		<jsp:include page="foot.jsp" />
</div>
</body>
</html>
