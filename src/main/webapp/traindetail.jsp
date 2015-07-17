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
		<jsp:include page="headnew.jsp" />
		 <div style="width:1140px;margin:0 auto;">
		<div  style="margin-top:50px;">
		<div  style="width:280px;float:left;">
		<div style="text-align:center;font-size:20px;font-weight:bolder;padding-bottom:20px;border-bottom:1px solid;color:white;">艺能培训</div>
		<!-- <div style="margin-left:50px;border-left:1px solid /* rgba(121, 200, 225, 1) */;"> -->
		 <c:forEach var="item" items="${lianxiList}" varStatus="stat">
			<div id="id1" style="margin-top:20px;margin-left:20px;cursor:pointer;margin-left:20px;font-weight:bold;">
			<a href="/TrainDetail?id=${item.id}&train_id=${item.train_id}" style="color:#783f04;">${item.typename}</a></div>
		</c:forEach> 
		<div style="margin-top:20px;margin-left:20px;cursor:pointer;margin-left:20px;font-weight:bold;"><a href="Contactus.jsp" style="color:#783f04;">加入我们</a></div>
		<!-- </div>	 -->	
		</div>

		<div style="width:940px;float:left;">
		<div style=" /*border-left:1px solid rgba(121, 200, 225, 1) */;padding-top:20px;">
		<div id="train1">
	<%

   		String detail = request.getAttribute("detail").toString();
   		detail = detail.replace("\\n", "<br/>");
   		detail = detail.replace(" ", "&nbsp;");
    %>

			<div style="text-align:center;">
				<c:if test="${!empty data}">
					<img src="/29images/${data.img}"   height=310px; width=621px>
					</c:if>
			</div>
			<div style="overflow-y:auto; width:910px; height:380px;margin-top:32px;color: black;">
			
			<%=detail %>
			</div>
			
			</div>
		
		<%-- <div id="train2" style="display:none;">
		<div style="text-align:center;"><img src="/images/traindetail/t1.PNG"></div>
		<div style="overflow-y:auto; width:910px; height:380px;margin-top:10px;">
		${data.detail }
		</div>
		</div> --%>
		<!-- </div> -->
		</div>
		</div>
		<div style="clear:both;">
		<jsp:include page="foot.jsp" />
		</div>
</div>
</body>
</html>
