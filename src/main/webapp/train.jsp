<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
   <title>TRAIN</title>
   <link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet">
   <script src="/js/jquery.min.js"></script>
   <script src="/bootstrap/js/bootstrap.min.js"></script>
    <style type="text/css">
   body{
   background-color:rgba(233, 243, 248, 1);
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
		<div>
			<div style="width:150px;height:170px;float:left;margin-left:60px;">
			<canvas id="can1" width="150" height="150" ></canvas>
			<div style="position:relative;z-index:1;top:-115px;color:white;text-align:center;"><p style="margin-bottom:0px;font-size:16px;">ABOUTUS</p><p style="margin-top:0px;margin-bottom:0px;font-size:30px;font-weight:bold;">JOB</p><p style="margin-top:0px;margin-bottom:0px;font-size:30px;font-weight:bold;font-family:黑体;">培训</p></div>
			</div>
			<div style="width:300px;float:right;margin-right:100px;">
					<div  style="width:30px;float:left;padding-top:75px;color:#3c78d8;font-size:25px;"><span class="glyphicon glyphicon-chevron-left"></span></div>
					<div  style="width:70px;float:left;padding-top:60px;"><div><canvas id="can2" width="50" height="50" ></div><div>企业动态</div></div>
					<div  style="width:70px;float:left;padding-top:60px;"><div><canvas id="can3" width="50" height="50" ></div><div>培训介绍</div></div>
					<div  style="width:70px;float:left;padding-top:60px;"><div><canvas id="can4" width="50" height="50" ></div><div>培训案例</div></div>
					<div  style="width:30px;float:left;padding-top:75px;color:#3c78d8;font-size:25px;"><span class="glyphicon glyphicon-chevron-right"></span></div>
			</div>
			
		</div>
		<div style="clear:both;">
		  <c:forEach items="${trainList}"  var="item" varStatus="status">
		  <c:if test="${status.index<3 }">
			<div style="width:380px;float:left;text-align:center;"><img src="${item.train_image}" width="350px" height="280px">
			<div style="z-index:1;width:350px;height:100px;opacity:0.5;background:#1c4587;top:-190px;left:15px;position:relative;filter:alpha(opacity=50);">
					<div style="height:100%;line-height:100%;overflow:hidden;align:center;">
						<h1 style="text-align:center;color:white;">${item.train_name}</h1>
						<input type="hidden" value="${item.id}">
					</div>
			</div>
			<div style="-margin-top:-100px;">${item.train_desc}</div>
		   </div>
		   </c:if>
		   </c:forEach>
		</div>
		<div class="row" style="margin-top:20px;padding-bottom:50px;">
			<div class="col-md-4" style="border-right:2px solid #7f7979;padding-right:30px;">
				<div style="font-size:30px;font-weight:bolder;font-family:黑体;">兴趣班</div>
				<div style="font-size:25px;font-weight:bolder;color:#7f7979;">INTEREST&nbsp;CLASS</div>
				<hr style="height:1px;border:none;border-top:3px solid #555555;width: 40%;margin-left: 0px;margin-top: 0px;margin-bottom:10px;" />
				<c:forEach items="${xingqubanList}"  var="item">
				<div style="background-color:#7f7979;color:white;width:25%;font-size；20px;">${item.time}</div>
				<div style="font-size:20px;font-weight:bolder;font-family:黑体;">${item.title}</div>
				<div>${item.detail}</div>
				 </c:forEach>
			</div>
			<div style="font-size:120px;font-weight:bolder;color:#7f7979;position:absolute;z-index:1;left:32%;">1</div>
			<div class="col-md-4" style="border-right:2px solid #7f7979;padding-right:30px;">
				<div style="font-size:30px;font-weight:bolder;font-family:黑体;"><a href="/TrainDetail?id=${trainid_lianxi}">练习生</a></div>
						<c:forEach items="${lianxishengList}"  var="item">
				<input type="hidden" value="${item.train_id}"/>
				<div style="font-size:25px;font-weight:bolder;color:#7f7979;">TRAINEE</div>
				<hr style="height:1px;border:none;border-top:3px solid #555555;width: 40%;margin-left: 0px;margin-top: 0px;margin-bottom:10px;" />
				<div class="row" style="margin-top:20px;">
					<div class="col-md-6" style="padding-right:0px;"><img src="${item.train_img}" width="140px;" height="100px;"></div>
					<div class="col-md-6" style="padding-left:0px;"><div style="font-size:18px;font-weight:bolder;">${item.title}</div>
					<div>${item.detail}</div>
				</div>
			</div>
			</c:forEach>
			</div>
			<div style="font-size:120px;font-weight:bolder;color:#7f7979;position:absolute;z-index:1;left:61%;">2</div>
			<div class="col-md-4" style="border-right:2px solid #7f7979;padding-right:30px;">
				<div style="font-size:30px;font-weight:bolder;font-family:黑体;">国际班</div>
				<div style="font-size:25px;font-weight:bolder;color:#7f7979;">INTERNATIONAL&nbsp;CLASS</div>
				<hr style="height:1px;border:none;border-top:3px solid #555555;width: 40%;margin-left: 0px;margin-top: 0px;margin-bottom:10px;" />
				<c:forEach items="${guojibanList}"  var="item">
				<div><img src="${item.train_img}" width="320px" height="200px"></div>
				<div>${item.detail}</div>
				</c:forEach>
			</div>
			<div style="font-size:120px;font-weight:bolder;color:#7f7979;position:absolute;z-index:1;left:90%;">3</div>

		</div>
		<jsp:include page="foot.jsp" />
</div>

</body>
</html>
