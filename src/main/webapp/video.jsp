<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>VIDEO</title>
<link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet">
   <link href="/bootstrap/css/bootstrap-theme.min.css" rel="stylesheet">
   <link href="/css/news.css" rel="stylesheet">
   <script src="/js/jquery.min.js"></script>
   <script src="/bootstrap/js/bootstrap.min.js"></script>
   <script type="text/javascript" src="http://player.youku.com/jsapi">
		
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
</head>
<body>

 <div class="container">
 <jsp:include page="head.jsp" />
 	<div class="row" style="padding-top:10px">
 	     <!--左侧视频播放start-->
 		<div class="col-md-8 col-lg-8" >
 				<div id="youkuplayer" style="width:795px;height:761px">
 				</div>
 				<!--要播放视频列表start-->
 				<div >
 				 	<img alt="" src="images/img01.jpg"   height="170px" style="border:1px solid grey" class="yuanjiao">
 					<img alt="" src="images/img02.jpg"   height="170px" style="border:1px solid grey" class="yuanjiao" >
 					<img alt="" src="images/img03.jpg"   height="170px" style="border:1px solid grey" class="yuanjiao">
 				</div>
 				<!--要播放视频列表end-->
 		</div>
 		<!--左侧视频播放end-->
 		<!--右侧图片列表start-->
 		<div class="col-md-4 col-lg-4" align="right" style="margin-left: -18px;padding-right:80px;">
 			<img alt="" src="images/img01.jpg"  width="250px" height="190px" style="border:1px solid grey">
 			<img alt="" src="images/img02.jpg"  width="250px" height="190px" style="border:1px solid grey">
 			<img alt="" src="images/img03.jpg"  width="250px" height="190px" style="border:1px solid grey">
 			<img alt="" src="images/img04.jpg"  width="250px" height="190px" style="border:1px solid grey">
 			<img alt="" src="images/img05.jpg"  width="250px" height="190px" style="border:1px solid grey">
 		</div>
 		<!--右侧图片列表end-->
 	</div>
 	<jsp:include page="foot.jsp" />
 </div>
</body>
</html>