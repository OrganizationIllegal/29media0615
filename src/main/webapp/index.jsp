<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
   <meta name="北京贰玖文化传媒有限公司" content="北京贰玖文化传媒有限公司">
   <link rel="icon" sizes="any" type="image/x-icon"  href="images/Logo2.png">
   <title>贰玖传媒</title>
   <link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet">
   <link href="/bootstrap/css/bootstrap-theme.min.css" rel="stylesheet">
   <link href="/css/news.css" rel="stylesheet">
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
    <!-- 绘制圆形 -->
   <script type="text/javascript">
   /* $(function(){
    var can = document.getElementById("can1");
    var ctx = can.getContext("2d");     
   var img = new Image();

            img.onload = function () {
                ctx.drawImage(img, 0, 0, 150, 150);
            }

            img.src = "/29images/${videoimg1}";
     
    ctx.beginPath(); 
    //ctx1.fillStyle="#CDC9C9";  
    ctx.arc(75,75,60,0,Math.PI*2); // context.arc(x,y,r,sAngle,eAngle,counterclockwise)
    //ctx1.fill();　　　　　　//使用ctx.fill();就是填充色；
    ctx.clip();       
})
   $(function(){
    var can = document.getElementById("can2");
    var ctx = can.getContext("2d");   
    var img = new Image();

            img.onload = function () {
                ctx.drawImage(img, 0, 0, 80, 80);
            }

            img.src = "/29images/${videoimg2}";
     
    ctx.beginPath(); 
    //ctx1.fillStyle="#CDC9C9";  
    ctx.arc(40,40,40,0,Math.PI*2); // context.arc(x,y,r,sAngle,eAngle,counterclockwise)
    //ctx1.fill();　　　　　　//使用ctx.fill();就是填充色；
    ctx.clip();          
})
   $(function(){
    var can = document.getElementById("can3");
    var ctx = can.getContext("2d");  
    var img = new Image();

            img.onload = function () {
                ctx.drawImage(img, 0, 0, 80, 80);
            }

            img.src ="/29images/${videoimg3}";
     
    ctx.beginPath(); 
    //ctx1.fillStyle="#CDC9C9";  
    ctx.arc(40,40,40,0,Math.PI*2); // context.arc(x,y,r,sAngle,eAngle,counterclockwise)
    //ctx1.fill();　　　　　　//使用ctx.fill();就是填充色；
    ctx.clip();          
})
   $(function(){
    var can = document.getElementById("can4");
    var ctx = can.getContext("2d");   
    var img = new Image();

            img.onload = function () {
                ctx.drawImage(img, 0, 0, 150, 150);
            }

            img.src = "/29images/${videoimg4}";
     
    ctx.beginPath(); 
    //ctx1.fillStyle="#CDC9C9";  
    ctx.arc(75,75,60,0,Math.PI*2); // context.arc(x,y,r,sAngle,eAngle,counterclockwise)
    //ctx1.fill();　　　　　　//使用ctx.fill();就是填充色；
    ctx.clip();                       
}) */
   function pop1(){
  $('#modal1').modal('show');
}
function pop2(){
  $('#modal2').modal('show');
}
function pop3(){
  $('#modal3').modal('show');
}
function pop4(){
  $('#modal4').modal('show');
}
$(function(){
	$("#starleft img").mouseover(function(){
		$(this).css("padding","15%");
	})
	$("#starleft").mouseleave(function(){
		$("#starleft img").css("padding","5px");
	})
	$("#starright").mouseover(function(){
		$("#vediotitle").css("background-color","rgba(253, 0, 113, 1)");
	})
	$("#vediotitle").mouseleave(function(){
		$(this).css("background-color","rgba(44,44,44,1)");
	})
});
   </script>   
</head>
<body>
<jsp:include page="headnew.jsp" />
<div style="width:1140px;margin:0 auto;">
		<div id="myCarousel" class="carousel slide" data-ride="carousel" data-interval="5000" style="padding-bottom:10px;">
   <!-- 轮播（Carousel）指标 -->
   <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
      <li data-target="#myCarousel" data-slide-to="3"></li>
   </ol>   
   <!-- 轮播（Carousel）项目 -->
   <div class="carousel-inner">
      <div class="item active">
         <a href="${href1}"><img src="/29images/${toplunbo1}" alt="First slide" style="width:1400px;height:370px;"></a>
         <div class="carousel-caption"></div>
      </div>
      <div class="item">
         <a href="${href2}"><img src="/29images/${toplunbo2}" alt="Second slide" style="width:1400px;height:370px;"></a>
         <div class="carousel-caption"></div>
      </div>
      <div class="item">
         <a href="${href3}"><img src="/29images/${toplunbo3}" alt="Third slide" style="width:1400px;height:370px;"></a>
         <div class="carousel-caption"></div>
      </div>
       <div class="item">
         <a href="${href4}"><img src="/29images/${toplunbo4}" alt="Forth slide" style="width:1400px;height:370px;"></a>
         <div class="carousel-caption"></div>
      </div>
      <!-- 轮播（Carousel）导航 -->
   <a class="carousel-control left" href="#myCarousel" 
      data-slide="prev">&lsaquo;</a>
   <a class="carousel-control right" href="#myCarousel" 
      data-slide="next">&rsaquo;</a>

   </div>
   </div>
		<!-- header end -->
		<!-- <div style="height:500px;"></div> -->
		<!-- lize start -->
		<div>
		<div style="width:570px;float:left;">
			<div class="topnewsbox">

				<div class="topnews" style="width:570px;border:0px;">
					<div class="topnewspic" id="hotsearchlist" style="filter:progid:DXImageTransform.Microsoft.GradientWipe(GradientSize=0.25,wipestyle=0,motion=forward)">
					<c:forEach var="item" items="${NewsList}" varStatus="stat">
						<div id="switch_${stat.index }"><a href="/News?newsId=${item.news_id}" target="_blank"><img width="314" height="143" alt="${item.title }" src="/29images/${item.image }" /></a></div>
					</c:forEach>
						
						
					</div>
				
					<div class="topnewslist">
						<img src="/images/jrjd.jpg" width="253" height="25" alt="今日焦点" style="border-radius:10px 20px;"/>
						<ul>
						<c:forEach var="item" items="${NewsList}" varStatus="stat">
						<c:choose>
							<c:when test="${stat.index==0 }">
								<li><a class="up" id="focus_${stat.index }" onmouseover="show_focus_image(${stat.index });" href="/News?newsId=${item.news_id}" target="_blank">${item.title }</a></li>
							</c:when>
							<c:otherwise>
							<li><a class="up" id="focus_${stat.index }" onmouseover="show_focus_image(${stat.index });" href="/News?newsId=${item.news_id}" target="_blank">${item.title }</a></li>
							</c:otherwise>
						</c:choose>
							
						
					</c:forEach>
							
						</ul>
					</div>
				</div>
		</div>
	</div>
	<div style="width:565px;float:right;height:262px;">
				 <a href="/Train"><img src="/29images/${trainlunbo1}" style="width:182px;height:257px;margin-right: 5px;"></a>
				 <a href="/Train"><img src="/29images/${trainlunbo2}" style="width:182px;height:257px;margin-right: 5px;"></a>
				 <a href="/Train"><img src="/29images/${trainlunbo3}" style="width:183px;height:257px;-margin-right: 6px;"></a>
				<%-- <div id="myCarousel2" class="carousel slide" data-ride="carousel" data-interval="5000">
   <!-- 轮播（Carousel）指标 -->
   <ol class="carousel-indicators">
      <li data-target="#myCarousel2" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel2" data-slide-to="1"></li>
      <li data-target="#myCarousel2" data-slide-to="2"></li>
   </ol> 
    <!-- 轮播（Carousel）项目 -->
   <div class="carousel-inner">
      <div class="item active">
         <a href="/Train"><img class="yinying" src="/29images/${trainlunbo1}" alt="First slide" style="width:570px;height:260px;"></a>
         <div class="carousel-caption"></div>
      </div>
      <div class="item">
         <a href="/Train"><img src="/29images/${trainlunbo2}" alt="Second slide" style="width:570px;height:260px;"></a>
         <div class="carousel-caption"></div>
      </div>
      <div class="item">
         <a href="/Train"><img src="/29images/${trainlunbo3}" alt="Third slide" style="width:570px;height:260px;"></a>
         <div class="carousel-caption"></div>
      </div> 
     </div>
     </div>  --%>
				<div style="z-index:1;width:558px;height:90px;opacity:0.8;background:rgb(44,44,44);top:-180px;position:relative;filter:alpha(opacity=50);border-radius:50%;">
					<div style="height:100%;line-height:100%;overflow:hidden;align:center;">
						<h1 style="text-align:center;"><a href="/Train">PeiXun 培训</a></h1>
					</div>
				</div>
	</div>
</div>
		<!-- lize end -->
		<div>
			<div style="width:570px;float:left;background-color: rgb(44, 44, 44);margin-top:8px;" id="starleft">
					<div style="float:left;width:110px;height:220px;"><a href="${starhref1}"><img src="/29images/${starimg1}" style="width:110px;height:110px;padding:5px 0px 5px 5px;" title="新星新星"></a><a href="${starhref2}"><img src="/29images/${starimg2}" style="width:110px;height:110px;padding:0px 0px 5px 5px;" title="新星新星"></a></div>
					<div style="float:left;width:240px;height:220px;"><a href="${starhref3}"><img src="/29images/${starimg3}" style="width:240px;height:220px;padding:10px;" title="新星新星"></a></div>
					<div style="float:left;width:110px;height:220px;"><a href="${starhref4}"><img src="/29images/${starimg4}" style="width:110px;height:110px;padding:5px 5px 5px 0px;" title="新星新星"></a><a href="${starhref5}"><img src="/29images/${starimg5}" style="width:110px;height:110px;padding:0px 5px 5px 0px;" title="新星新星"></a></div>
					<div style="float:left;width:110px;height:220px;"><a href="${starhref6}"><img src="/29images/${starimg6}" style="width:110px;height:110px;padding:5px 5px 5px 0px;" title="新星新星"></a><a href="${starhref7}"><img src="/29images/${starimg7}" style="width:110px;height:110px;padding:0px 5px 5px 0px;" title="新星新星"></a></div>
			</div>
			<div style="width:570px;float:left;margin-right:-1px;margin-top:8px;" id="starright">
					<%-- <div  style="margin-top:15px;float:left;"><canvas id="can1" width="150" height="150" onclick="pop1()"></canvas></div>
					<div  style="margin-top:120px;float:left;"><canvas id="can2" width="80" height="80" onclick="pop2()"></canvas></div>
					<div  style="margin-top:20px;float:left;"><canvas id="can3" width="80" height="80" onclick="pop3()"></canvas></div>
					<div  style="margin-top:50px;float:left;"><canvas id="can4" width="150" height="150" onclick="pop4()"></canvas></div> --%>
					<div id="vediotitle" style="width:200px;height:25px;background-color:rgb(44,44,44);text-align:center;font-size:20px;font-weight:300;margin-left:175px;color:white;font-family:shishang;border-radius:10px 20px;">影视 </div>
					<div  style="margin-top:15px;float:left;margin-left:5px;"><a href="${videohref1}">
					<img src="/29images/${videoimg1}" alt="First slide" style="width: 565px;height:193px;margin-top: -13px;">
					<!-- <canvas id="can1" width="150" height="150"></canvas> --></a></div>
					<%-- <div  style="margin-top:120px;float:left;"><a href="${videohref2}"><canvas id="can2" width="80" height="80"></canvas></a></div>
					<div  style="margin-top:20px;float:left;"><a href="${videohref3}"><canvas id="can3" width="80" height="80"></canvas></a></div>
					<div  style="margin-top:50px;float:left;"><a href="${videohref4}"><canvas id="can4" width="150" height="150"></canvas></a></div> --%>
			</div>
		</div>
		<!-- <div style="width:460px;float:left;clear:both;padding-top:45px;"><hr style="border-top:2px solid #4ed6b8;"/></div> -->
		<!-- <div style="text-align:center;font-size:50px;font-weight:bold;color:#4ed6b8;margin:0 auto;width:1140px;padding-top:50px;float:left;">明星打造</div> -->
		<!-- <div style="width:460px;float:right;padding-top:45px;"><hr style="border-top:2px solid #4ed6b8;"/></div> -->
		<!-- <div style="margin-top:20px;">
			<div style="width:200px;float:left;">
				<div style="text-align:center;color:#bf5540;font-size:16px">明星打造明星打造</div>
				<div style="text-align:center;color:#4ed6b8;font-size:14px">mingxingdazaomingxing</div>
				<div style="text-align:center;color:#4ed6b8;font-size:14px">mingxingdazao</div>
			</div>
		</div> -->
		<!-- <div style="margin-top:30px;">
			<div style="width:200px;margin:0 auto;">
					<div style="width:50px;height:50px;float:left;margin-left:25px;"><img alt="logo"  src="/29images/pic2.PNG"></div>
					<div style="width:50px;height:50px;float:left;"><img alt="logo"  src="/29images/pic3.PNG"></div>
					<div style="width:50px;height:50px;float:right;margin-right:25px;"><img alt="logo"  src="/29images/pic4.PNG"></div>
			</div>
		</div> -->
		<div style="clear:both;"><jsp:include page="foot.jsp" /></div>
	</div>
	<!-- 模态框 -->
   <div class="modal fade" id="modal1" tabindex="-1" role="dialog" 
   aria-labelledby="myModalLabel" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content" style="margin-left:-230px;height:400px;width:600px;">
         <div class="modal-header">
            <button type="button" class="close" 
               data-dismiss="modal" aria-hidden="true">
                  &times;
            </button>
            <div class="modal-title" id="title">
               暂时无法播放视频
            </div>
         </div>
         <div class="modal-body">
            <img src="/29images/${videoimg1}" width="500" height="300" id="image"/>
         </div>
   
      </div>      
</div>
</div>
<div class="modal fade" id="modal2" tabindex="-1" role="dialog" 
   aria-labelledby="myModalLabel" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content" style="margin-left:-230px;height:400px;width:600px;">
         <div class="modal-header">
            <button type="button" class="close" 
               data-dismiss="modal" aria-hidden="true">
                  &times;
            </button>
            <div class="modal-title" id="title">
               暂时无法播放视频
            </div>
         </div>
         <div class="modal-body">
            <img src="/29images/${videoimg2}" width="500" height="300" id="image"/>
         </div>
   
      </div>      
</div>
</div>
<div class="modal fade" id="modal3" tabindex="-1" role="dialog" 
   aria-labelledby="myModalLabel" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content" style="margin-left:-230px;height:400px;width:600px;">
         <div class="modal-header">
            <button type="button" class="close" 
               data-dismiss="modal" aria-hidden="true">
                  &times;
            </button>
            <div class="modal-title" id="title">
               暂时无法播放视频
            </div>
         </div>
         <div class="modal-body">
            <img src="/29images/${videoimg3}" width="500" height="300" id="image"/>
         </div>
   
      </div>      
</div>
</div>
<div class="modal fade" id="modal4" tabindex="-1" role="dialog" 
   aria-labelledby="myModalLabel" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content" style="margin-left:-230px;height:400px;width:600px;">
         <div class="modal-header">
            <button type="button" class="close" 
               data-dismiss="modal" aria-hidden="true">
                  &times;
            </button>
            <div class="modal-title" id="title">
               暂时无法播放视频
            </div>
         </div>
         <div class="modal-body">
            <img src="/29images/${videoimg4}" width="500" height="300" id="image"/>
         </div>
   
      </div>      
</div>
</div>
<script  src="/js/topnews.js"></script>
</body>
</html>
