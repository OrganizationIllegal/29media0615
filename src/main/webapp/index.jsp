<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
   <title>INDEX</title>
   <link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet">
   <link href="/bootstrap/css/bootstrap-theme.min.css" rel="stylesheet">
   <link href="/css/news.css" rel="stylesheet">
   <script src="/js/jquery.min.js"></script>
   <script src="/bootstrap/js/bootstrap.min.js"></script>
   
    <!-- 绘制圆形 -->
   <script type="text/javascript">
   $(function(){
    var can = document.getElementById("can1");
    var ctx = can.getContext("2d");     
   var img = new Image();

            img.onload = function () {
                ctx.drawImage(img, 0, 0, 150, 150);
            }

            img.src = "/images/img01.jpg";
     
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

            img.src = "/images/img02.jpg";
     
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

            img.src = "/images/img04.jpg";
     
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

            img.src = "/images/img05.jpg";
     
    ctx.beginPath(); 
    //ctx1.fillStyle="#CDC9C9";  
    ctx.arc(75,75,60,0,Math.PI*2); // context.arc(x,y,r,sAngle,eAngle,counterclockwise)
    //ctx1.fill();　　　　　　//使用ctx.fill();就是填充色；
    ctx.clip();                       
})
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
   </script>   
</head>
<body>
<div class="container">
		<jsp:include page="head.jsp" />
		<div style="width:1139px;">
		<div id="myCarousel" class="carousel slide" data-ride="carousel" data-interval="5000">
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
         <img src="/images/lunbo1.jpg" alt="First slide" width="1200px">
         <div class="carousel-caption"></div>
      </div>
      <div class="item">
         <img src="/images/lunbo2.jpg" alt="Second slide" width="1200px">
         <div class="carousel-caption"></div>
      </div>
      <div class="item">
         <img src="/images/lunbo3.jpg" alt="Third slide" width="1200px">
         <div class="carousel-caption"></div>
      </div>
       <div class="item">
         <img src="/images/lunbo4.jpg" alt="Forth slide" width="1200px">
         <div class="carousel-caption"></div>
      </div>
      <!-- 轮播（Carousel）导航 -->
   <a class="carousel-control left" href="#myCarousel" 
      data-slide="prev">&lsaquo;</a>
   <a class="carousel-control right" href="#myCarousel" 
      data-slide="next">&rsaquo;</a>

   </div>
   </div>
   </div>
		<!-- header end -->
		<!-- <div style="height:500px;"></div> -->
		<!-- lize start -->
		<div class="row" style="padding-right:4px;">
		<div class="col-md-6">
			<div class="topnewsbox">

				<div class="topnews" style="width:568px;border:0px;">
					<div class="topnewspic" id="hotsearchlist" style="filter:progid:DXImageTransform.Microsoft.GradientWipe(GradientSize=0.25,wipestyle=0,motion=forward)">
					<c:forEach var="item" items="${NewsList}" varStatus="stat">
						<div id="switch_${stat.index }"><a href="/News?newsId=${item.news_id}" target="_blank"><img width="314" height="143" alt="${item.title }" src="${item.image }" /></a></div>
					</c:forEach>
						
						
					</div>
				
					<div class="topnewslist">
						<img src="/images/jrjd.jpg" width="253" height="25" alt="今日焦点" />
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
	<div class="col-md-6">
			<div class="row" style="height:262px;">
				<!-- <img src="/images/star.jpg" width="98%" height="98%"> -->
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
         <img src="/images/lunbo3.jpg" alt="First slide" style="width:570px;height:260px;">
         <div class="carousel-caption"></div>
      </div>
      <div class="item">
         <img src="/images/star.jpg" alt="Second slide" style="width:570px;height:260px;">
         <div class="carousel-caption"></div>
      </div>
      <div class="item">
         <img src="/images/lunbo2.jpg" alt="Third slide" style="width:570px;height:260px;">
         <div class="carousel-caption"></div>
      </div> 
     </div>
     </div> 
				<div style="z-index:100;width:60%;height:40%;opacity:0.5;background:#FFE1FF;top:30%;left:20%;position:absolute;filter:alpha(opacity=50);">
					<div style="height:100%;line-height:100%;overflow:hidden;align:center;">
						<h1 style="text-align:center"><a href="/Train">PeiXun 培训</a></h1>
					</div>
				</div>
			</div>
	</div>
</div>
		<!-- lize end -->
		<div class="row" style="margin-bottom:60px;">
			<div class="col-md-6">
				<div class="row">
					<!-- <div class="col-md-1" style="width:30px;"></div> -->
					<div class="col-md-2" ><img src="/images/img01.jpg" style="width:110px;" title="新星新星"><img src="/images/img02.jpg" style="width:110px;" title="新星新星"></div>
					<div class="col-md-5" style="width:263px;"><img src="/images/img03.jpg" style="width:250px;height:220px;" title="新星新星"></div>
					<div class="col-md-2" style="padding-left:0px;"><img src="/images/img01.jpg" style="width:110px;" title="新星新星"><img src="/images/img02.jpg" style="width:110px;" title="新星新星"></div>
					<div class="col-md-2"><img src="/images/img04.jpg" style="width:110px;" title="新星新星"><img src="/images/img05.jpg" style="width:110px;" title="新星新星"></div>
					<div class="col-md-1"></div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="row">
					<%-- <div class="col-md-4">
						<div style="position:absolute;Z-index:-1"><canvas id="can1" width="150" height="150" ></canvas></div>
                        <div ><img src="/images/shipin.png" style="width:150px;" onclick="pop1()"/></div>
					</div> --%>
					<div class="col-md-4" style="margin-top:15px;"><canvas id="can1" width="150" height="150" onclick="pop1()"></canvas></div>
					<div class="col-md-2" style="margin-top:120px;"><canvas id="can2" width="80" height="80" onclick="pop2()"></canvas></div>
					<div class="col-md-2" style="margin-top:20px;"><canvas id="can3" width="80" height="80" onclick="pop3()"></canvas></div>
					<div class="col-md-4" style="margin-top:50px;"><canvas id="can4" width="150" height="150" onclick="pop4()"></canvas></div>
				</div>
			</div>
		</div>
		<div style="text-align:center;font-size:50px;font-weight:bold;color:#4ed6b8;margin-bottom:20px;">明星打造</div>
		<div class="row">
			<div class="col-md-5" style="margin-top:12px;">
				<hr style="border-top:2px solid #4ed6b8;"/>
			</div>
			<div class="col-md-2">
				<div style="text-align:center;color:#bf5540;font-size:16px">明星打造明星打造</div>
				<div style="text-align:center;color:#4ed6b8;font-size:14px">mingxingdazaomingxing</div>
				<div style="text-align:center;color:#4ed6b8;font-size:14px">mingxingdazao</div>
			</div>
			<div class="col-md-5" style="margin-top:12px;">
				<hr style="border-top:2px solid #4ed6b8;"/>
			</div>
		</div>
		<div class="row" style="margin-top:30px;">
			<div class="col-md-5"></div>
			<div class="col-md-2">
				<div class="row">
					<div class="col-md-1" style="padding-right:0px;"></div>
					<div class="col-md-3"><img alt="logo"  src="/images/pic2.PNG"></div>
					<div class="col-md-3"><img alt="logo"  src="/images/pic3.PNG"></div>
					<div class="col-md-3"><img alt="logo"  src="/images/pic4.PNG"></div>
					<div class="col-md-1"></div>
				</div>
			</div>
			<div class="col-md-5"></div>
		</div>
		<jsp:include page="foot.jsp" />
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
            <img src="/images/img01.jpg" width="500" height="300" id="image"/>
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
            <img src="/images/img02.jpg" width="500" height="300" id="image"/>
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
            <img src="/images/img04.jpg" width="500" height="300" id="image"/>
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
            <img src="/images/img05.jpg" width="500" height="300" id="image"/>
         </div>
   
      </div>      
</div>
</div>
<script  src="/js/topnews.js"></script>
</body>
</html>
