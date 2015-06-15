<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
   <title>NEWS TREND</title>
   <link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet">
   <script src="/js/jquery.min.js"></script>
   <script src="/bootstrap/js/bootstrap.min.js"></script>
   
  <!--  <script type="text/javascript">
   $(function(){
	   $("#id1").mouseover(function(){
		   $("#id1").css("opacity","1");
		   });
	   $("#id1").mouseleave(function(){
		   $("#id1").css("opacity","0.6");
		   });
	   $("#id2").mouseover(function(){
		   $("#id2").css("opacity","1");
		   });
	   $("#id2").mouseleave(function(){
		   $("#id2").css("opacity","0.6");
		   });
	   $("#id1").click(function(){
		   $("#news1").css("display","block");
		   $("#news2").css("display","none");
		   });
	   $("#id2").click(function(){
		   $("#news2").css("display","block");
		   $("#news1").css("display","none");
		   });
	   });
   </script> -->
</head>
<body>
<div class="container">
		<jsp:include page="head.jsp" />
		<div class="row" style="margin-top:50px;">
		<div class="col-md-3" style="padding-right:0px;">
		<div style="text-align:center;font-size:20px;font-weight:bolder;padding-bottom:20px;border-bottom:1px solid;color:white;">NEWS TREND</div>
		<!-- 新闻目录 -->
		<c:forEach var="item" items="${trendList }" varStatus="stat">
			<div style="margin-top:20px;margin-left:20px;font-weight:bold;-filter:alpha(opacity=60);-opacity:0.6;">${item.time}</div>
		<div id="id${stat.index+1}" style="cursor:pointer;margin-left:20px;font-weight:bold;"><a href="/News?newsId=${item.news_id}" style="color:#783f04;">${item.title}</a></div>		
		</c:forEach>
			
		
		</div>
		<div class="col-md-9" style="padding-left:0px;">
		<div id="news1" style="border-left:1px solid;">
		<div style="text-align:center;font-size:20px;font-weight:bolder;color:white;">${newsInfo.news_title}</div>
		<div style="text-align:right;-filter:alpha(opacity=60);-opacity:0.6;border-bottom:1px solid;color:white;">${newsInfo.news_time}</div>
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
			         <img src="${item.news_image }" alt="First slide" style="width:800px;height:400px;">
			         <div class="carousel-caption"></div>
      			 </div>
   			</c:when>
   			<c:otherwise>
   				<div class="item">
			         <img src="${item.news_image }" alt="First slide" style="width:800px;height:400px;">
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
  <div style="overflow-y:auto; width:850px; height:300px;text-align:left;padding:30px;">&nbsp;&nbsp;&nbsp;&nbsp;${newsInfo.news_detail }</div>
		</div>
	
	<%--<div id="news2" style="border-left:1px solid;display:none;">
		<div style="text-align:center;font-size:20px;font-weight:bolder;">吉克隽逸献唱申冬奥歌曲《呼唤爱》 帅气展现正能量</div>
		<div style="text-align:right;filter:alpha(opacity=60);opacity:0.6;border-bottom:1px solid">2015年05月28日</div>
		<!-- 轮播图 -->
		<div style="margin-top:30px;margin-left:100px;margin-right:100px;">
		<div id="myCarousel2" class="carousel slide" data-ride="carousel" data-interval="5000">
   <!-- 轮播（Carousel）指标 -->
   <ol class="carousel-indicators">
      <li data-target="#myCarousel2" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel2" data-slide-to="1"></li>
      <li data-target="#myCarousel2" data-slide-to="2"></li>
   </ol>   
   <!-- 轮播（Carousel）项目 -->
   <div class="carousel-inner">
      <div class="item active">
         <img src="/images/news/news10.jpg" alt="First slide" style="width:800px;height:400px;">
         <div class="carousel-caption"></div>
      </div>
      <div class="item">
         <img src="/images/news/news11.jpg" alt="Second slide" style="width:800px;height:400px;">
         <div class="carousel-caption"></div>
      </div>
      <div class="item">
         <img src="/images/news/news12.jpg" alt="Third slide" style="width:800px;height:400px;">
         <div class="carousel-caption"></div>
      </div>
      <!-- 轮播（Carousel）导航 -->
   <a class="carousel-control left" href="#myCarousel2" 
      data-slide="prev">&lsaquo;</a>
   <a class="carousel-control right" href="#myCarousel2" 
      data-slide="next">&rsaquo;</a>

   </div>
   </div> --%>
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
