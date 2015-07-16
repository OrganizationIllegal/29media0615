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
   <script type="text/javascript" src="http://player.youku.com/jsapi">  
	</script>
	<script type="text/javascript">
	$(function(){
		player = new YKU.Player('youkuplayer',{
			styleid: '0',
			client_id: '6e97509b4cd3378b',
			vid: 'XOTUxNDk2NDQ0',
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
 	<div style="padding-top:10px">
 	     <!--左侧视频播放start-->
 		<div style="width:760px;float:left;">
 				<div id="youkuplayer" style="width:795px;height:761px">
 				</div>
 				<!--要播放视频列表start-->
 				<div >
 					 <c:forEach var="item" items="${vedioList}" varStatus="stat">
 					 		<img alt="" src="/29images/${item.video_pic}"   height="170px" style="border:1px solid grey" class="yuanjiao" >
 					 </c:forEach>
 				</div>
 				<!--要播放视频列表end-->
 		</div>
 		<!--左侧视频播放end-->
 		<!--右侧图片列表start-->
 		<div align="right" style="margin-left: -18px;padding-right:80px;width:380px;float:left;">
 			 <c:forEach var="item" items="${starVedioList}" varStatus="stat">
 			   <a href="#"><img alt="" src="/29images/${item.video_pic}" style="border:1px solid grey; width:240px;height:170px;"/>
 			   </a>
 			</c:forEach> 
 		</div>
 		<!--右侧图片列表end-->
 	</div>
 	<jsp:include page="foot.jsp" />
 </div>
</body>
</html>