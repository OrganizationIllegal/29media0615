<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
   <title>ABOUT US</title>
   <link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet">
   <script src="/js/jquery.min.js"></script>
   <script src="/bootstrap/js/bootstrap.min.js"></script>
    <style type="text/css">
   body{
   background-color:rgba(233, 243, 248, 1);
   }
   </style>
   <script type="text/javascript">
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
	   $("#id3").mouseover(function(){
		   $("#id3").css("opacity","1");
		   });
	   $("#id3").mouseleave(function(){
		   $("#id3").css("opacity","0.6");
		   });
	   $("#id4").mouseover(function(){
		   $("#id4").css("opacity","1");
		   });
	   $("#id4").mouseleave(function(){
		   $("#id4").css("opacity","0.6");
		   });
	   $("#id1").click(function(){
		   $("#train1").css("display","block");
		   $("#train2").css("display","none");
		   });
	   $("#id1").click(function(){
		   $("#train2").css("display","block");
		   $("#train1").css("display","none");
		   });
	   });
   </script>
</head>
<body>
<div class="container">
		<jsp:include page="head.jsp" />
		<div class="row" style="color:white;">
		<div class="col-md-2" style="padding-right:0px;padding-top:50px;">
		<div style="font-size:30px;font-weight:bolder;border-bottom:1px solid;font-family:黑体;width:125px;">艺能培训</div>
		<div style="margin-left:50px;border-left:1px solid /* rgba(121, 200, 225, 1) */;">
		<div id="id1" style="padding-top:80px;font-size:30px;font-weight:bolder;font-family:黑体;filter:alpha(opacity=60);opacity:0.6;cursor:pointer;">舞蹈班</div>
		<div id="id2" style="padding-top:80px;font-size:30px;font-weight:bolder;font-family:黑体;filter:alpha(opacity=60);opacity:0.6;cursor:pointer;">艺术班</div>
		<div id="id3" style="padding-top:80px;font-size:30px;font-weight:bolder;font-family:黑体;filter:alpha(opacity=60);opacity:0.6;cursor:pointer;">唱歌班</div>
		<div id="id4" style="padding-top:80px;font-size:30px;font-weight:bolder;font-family:黑体;filter:alpha(opacity=60);opacity:0.6;cursor:pointer;">练习班</div>
		<div style="padding-top:80px;font-size:30px;font-weight:bolder;font-family:黑体;filter:alpha(opacity=60);opacity:0.6;"><a href="Contactus.jsp">加入我们</a></div>
		</div>		
		</div>
		<div class="col-md-10" style="padding-left:0px;">
		<div style=" /*border-left:1px solid rgba(121, 200, 225, 1) */;padding-top:20px;">
		<div id="train1">
		<div style="text-align:center;"><img src="/images/traindetail/t1.PNG"></div>
		<div style="overflow-y:auto; width:910px; height:380px;margin-top:10px;"><img alt="公司简介" src="/images/traindetail/t2.PNG" style="width:880px;"></div>
		</div>
		<div id="train2" style="display:none;">
		<div style="text-align:center;"><img src="/images/traindetail/t1.PNG"></div>
		<div style="overflow-y:auto; width:910px; height:380px;margin-top:10px;"><img alt="公司简介" src="/images/traindetail/t2.PNG" style="width:880px;"></div>
		</div>
		</div>
		</div>
		</div>
		<jsp:include page="foot2.jsp" />
</div>
</body>
</html>
