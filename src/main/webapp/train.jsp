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
    <!-- 绘制圆形 start -->
   <script type="text/javascript">
    $(function(){
    var can = document.getElementById("can1");
    var ctx = can.getContext("2d");     
    ctx.beginPath(); 
    ctx.scale(1,1.1);
    ctx.fillStyle="#1c4587";  
    ctx.arc(75,78,75,0,Math.PI*2); // context.arc(x,y,r,sAngle,eAngle,counterclockwise)
    ctx.fill();
})
    $(function(){
    var can = document.getElementById("can2");
    var ctx = can.getContext("2d");     
    ctx.beginPath(); 
    ctx.lineWidth = "3";
    ctx.strokeStyle="#3c78d8";  
    ctx.arc(25,25,20,0,Math.PI*2); // context.arc(x,y,r,sAngle,eAngle,counterclockwise)
    ctx.stroke();
})
     $(function(){
    var can = document.getElementById("can3");
    var ctx = can.getContext("2d");     
    ctx.beginPath(); 
    ctx.lineWidth = "3";
    ctx.strokeStyle="#3c78d8";  
    ctx.arc(25,25,20,0,Math.PI*2); // context.arc(x,y,r,sAngle,eAngle,counterclockwise)
    ctx.stroke();
})
      $(function(){
    var can = document.getElementById("can4");
    var ctx = can.getContext("2d");     
    ctx.beginPath(); 
    ctx.lineWidth = "3";
    ctx.strokeStyle="#5b0f00";  
    ctx.arc(25,25,20,0,Math.PI*2); // context.arc(x,y,r,sAngle,eAngle,counterclockwise)
    ctx.stroke();
})
      $(function(){
    var can = document.getElementById("can5");
    var ctx = can.getContext("2d");     
    ctx.beginPath(); 
    ctx.fillStyle="rgba(28, 69, 134, 0.5)"; 
    ctx.arc(75,75,70,0,Math.PI*2); // context.arc(x,y,r,sAngle,eAngle,counterclockwise)
    ctx.fill();
})
        $(function(){
    var can = document.getElementById("can6");
    var ctx = can.getContext("2d");     
    ctx.beginPath(); 
    ctx.scale(2,1);
    ctx.fillStyle="rgba(28, 69, 134, 0.5)"; 
    ctx.arc(50,50,50,0,Math.PI*2); // context.arc(x,y,r,sAngle,eAngle,counterclockwise)
    ctx.fill();
})
   </script>
   <!-- 绘制圆形 end -->
</head>
<body>

		<jsp:include page="headnew.jsp" />
		<div style="width:1140px;margin:0 auto;">
		<div style="clear:both;">
		  <c:forEach items="${trainList}"  var="item" varStatus="status">
		  <c:if test="${status.index<3 }">
			<div style="width:380px;float:left;text-align:center;"><a href="/TrainDetail?train_id=${item.train_id}"><img src="/29images/${item.train_image}" width="350px" height="280px"></a>
			<div style="z-index:1;width:350px;height:100px;opacity:0.5;stop:-190px;left:15px;position:relative;">
					
			</div>
			<div style="margin-top:-100px;width:350px;text-align:left;padding-left:15px;">${item.train_desc}</div>
		   </div>
		   <div style="border-right:2px solid #7f7979;padding-right:30px;width:380px;float:left;padding-left:15px;clear:both;">
			1111111
			</div>
		   </c:if>
		   </c:forEach>
		</div>
		
		<div style="clear:both;">
		<jsp:include page="foot.jsp" />
		</div>
</div>

</body>
</html>
