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
  <style text="text/css">
  #username,#email{
  	height:46px;
  }
  #content{
  	height:150px;
  }
  </style>
</head>
<body>

 <div class="container" >
 <jsp:include page="head.jsp" />

  
  <div style="/* background-color: rgb(17, 164, 231); */width: 1140px;height:700px;">
  <div style="text-align:center;margin:27px;padding-top:29px;"><I style="color:rgb(170, 237, 241);font-family:微软雅黑;font-size:29px;">加入我们</I>
  <I style="font-family:微软雅黑;font-size:29px;">Join Us</I> </div>
	  <div style="margin-left: 196px;float:left;">
	  	<!-- <img src="images/1.png" height="300px;"> -->
	  	<div style="text-align:right;width:300px;/* background-color:red; */height:300px;font-size:21px;font-weight:bold;padding-right:15px;border:5px solid white;color:white;">
	  	<div style="padding-top:20px;"><span class="glyphicon glyphicon-earphone"></span>&nbsp;咨询电话：</div>
	  	<div >021-60727090(10:00-18:00)</div>
	  	<div style="font-size:20px;">(周一-周五)</div>
	  	<div ><span class="glyphicon glyphicon-list-alt"></span>&nbsp;咨询邮箱：</div>
	  	<div >support@alf.cn</div>
	  	<div style="padding-top:20px;"><span class="glyphicon glyphicon-inbox"></span>&nbsp;商务洽谈合作:</div>
	  	<div >bd@atf.cn</div>
	  	</div>
	  </div>
  <div style="float:left;width:400px;">
  <form class="form-horizontal" role="form" method="post" name="fm" action="/login" style="width:400px;">
   <div class="form-group">
      
      <div class="col-sm-10" style="margin-left:25px;">
         <input type="text" class="form-control" id="username" name="username"  placeholder="您的真实姓名">
        <input type="hidden" class="form-control" id="role" 
            name="role" placeholder="用户角色">
      </div>
      <div id="user" style="height:60px;margin-left:20px;">
         
      </div>
      
   </div>
   <div class="form-group">
      
      <div class="col-sm-10" style="margin-left:25px;">
         <input type="text" class="form-control" id="email" name="email" placeholder="您的邮箱">
      </div>
       <div id="pass" style="height:60px;margin-left:20px;">
          
      </div>
   </div>
   
    <div class="form-group">
      
      <div class="col-sm-10" style="margin-left:25px;">
         <input type="text" class="form-control" id="content" name="content" placeholder="报名的内容">
      </div>
       <div id="pass" style="height:60px;margin-left:20px;">
          
      </div>
   </div>
   
</form></div>
<div style="  clear: both;
  margin-left: 765px;"><a href="#"><U style="color:rgb(170, 237, 241)">确认邮件寄出</U></a></div>
 <!--  <div style="text-align:center;"><img src="images/12.png"></div> -->
</div >
<jsp:include page="foot2.jsp" />
  </div>


</body>
</html>
   