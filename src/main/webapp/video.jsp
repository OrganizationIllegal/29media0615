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
<<<<<<< HEAD
<<<<<<< HEAD
=======
   <script type="text/javascript" src="http://player.youku.com/jsapi">  
	</script>
	<script type="text/javascript">
	var link = "${vedio.video_link}"
	//alert(link)
	var start = link.indexOf("id");
	var end = link.indexOf("=");
	var ID = link.substring(start+3, end);
	alert(ID)
	$(function(){
		player = new YKU.Player('youkuplayer',{
			styleid: '0',
			client_id: '6e97509b4cd3378b',
			vid: 'XMTI4MjA5Njg4OA',
			events:{
			onPlayStart: function(){ alert("kaishi") },
			onPlayEnd: function(){ alert("jieshu") }
			}
			});
			function playVideo(){
			player.playVideo();
				alert("kaishi");
			}
			function pauseVideo(){
			player.pauseVideo();
				alert("zanting")
			}
	});
	</script>
	<style type="text/css">
		 .yuanjiao{
            width: 205px;
            color: white;
            margin: 20px;
            -webkit-border-radius: 15px;
            -moz-border-radius: 15px;

        }
	</style>
>>>>>>> 118e13aac2d00471ac2c0cdae4da4130a80f6135
	 <style type="text/css">  
=======
   <style type="text/css">  
>>>>>>> 577e913d717da0ac29330d65e1dbfe7ffea71a97
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
<<<<<<< HEAD
<<<<<<< HEAD
=======

>>>>>>> 577e913d717da0ac29330d65e1dbfe7ffea71a97
 	<div style="margin-top:50px;">
		<div style="width:280px;float:left;">
		<div style="text-align:center;font-size:20px;font-weight:bolder;padding-bottom:20px;border-bottom:1px solid;color:white;">影视</div>
		<!-- 影视目录 -->
<<<<<<< HEAD
		<c:forEach items="${typeList}" var="item" varStatus="status">
		<div style="cursor:pointer;margin-left:20px;font-weight:bold;">
		
=======
<<<<<<< HEAD
		<%-- <c:forEach var="item" items="${trendList }" varStatus="stat">
			<div style="margin-top:20px;margin-left:20px;font-weight:bold;-filter:alpha(opacity=60);-opacity:0.6;">${item.time}</div>
		<div id="id${stat.index+1}" style="cursor:pointer;margin-left:20px;font-weight:bold;"><a href="/News?newsId=${item.news_id}" style="color:#783f04;">${item.title}</a></div>		
		</c:forEach> --%>
=======
		
>>>>>>> 577e913d717da0ac29330d65e1dbfe7ffea71a97
		<div style="cursor:pointer;margin-left:20px;font-weight:bold;"><a href="#" style="color:#783f04;">练习生影视</a></div>			
>>>>>>> f2d810a4d6fa5fb73c352997a289c14cf07ce565
		
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
<<<<<<< HEAD
=======
 	<div style="padding-top:10px">
 	     <!--左侧视频播放start-->
 		<div style="width:860px;float:left;">
 				<div id="youkuplayer" style="width:800px;height:500px"></div>
 				<!--要播放视频列表start-->
 				
 				<div style="font-size:16px;margin-top:20px;width:750px;margin-left:20px;margin-right:20px;">
 				
 				${vedio.video_desc}
 				</div>
 				<!--要播放视频列表end-->
 		</div>
 		<!--左侧视频播放end-->
 		<!--右侧图片列表start-->
 		<div style="float:left;width:280px;">
 			 <c:forEach var="item" items="${vedioList}" varStatus="stat">
 			   <a href="VideoList?id=${item.id}"><img alt="" src="/29images/${item.video_pic}" style="width:240px;height:170px;cursor:pointer;"/>
 			   </a>
 			</c:forEach> 
 		</div>
 		<!--右侧图片列表end-->
 	</div>
>>>>>>> 118e13aac2d00471ac2c0cdae4da4130a80f6135
=======

<<<<<<< HEAD
 	<!-- <div style="clear:both;"> -->
=======
>>>>>>> 577e913d717da0ac29330d65e1dbfe7ffea71a97
 	<div style="clear:both;">
>>>>>>> f2d810a4d6fa5fb73c352997a289c14cf07ce565
		<jsp:include page="foot.jsp" />
		<!-- </div> -->
</body>
</html>