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
  <!--  <script type="text/javascript">
   $(function(){
	   $("#id1").click(function(){
		   $("#artist1").css("display","block");
		   $("#artist2").css("display","none");
		   });
	   $("#id2").click(function(){
		   $("#artist2").css("display","block");
		   $("#artist1").css("display","none");
		   });
	   });
   </script> -->
</head>
<body>
<div class="container">
		<jsp:include page="head.jsp" />
		<div class="row" style="margin-top:20px;">
		<div class="col-md-9" style="padding-left:32px;">
		<div style="width:800px; height:890px;">
		<div id="artist1">
		<div style="text-align:center;"><img alt="" src="${star1.star_img}" style="width:600px;height:400px;"></div>
		<div style="margin-top:30px;">
		            <c:if test="${not empty star1.chinese_name}">
 						<div class="row">
 						    <div class="col-md-2"></div>
						    <label class="col-md-2 control-label">姓名：</label>
						    <div class="col-md-8">
						      ${star1.chinese_name}
						    </div>
						</div>
					</c:if>
 					
					<c:if test="${not empty star1.bieming}">
						<div class="row" >
						    <div class="col-md-2"></div>
						    <label class="col-md-2 control-label">别名:</label>
						    <div class="col-md-8">
						      ${star1.bieming}
						    </div>
						</div>
					</c:if>
					
					<c:if test="${not empty star1.nation}">
						<div class="row">
						    <div class="col-md-2"></div>
						    <label class="col-md-2 control-label">民族：</label>
						    <div class="col-md-8">
						      ${star1.nation}
						    </div>
						</div>
					</c:if>
					
					<c:if test="${not empty star1.constellation}">
						<div class="row">
						<div class="col-md-2"></div>
					    <label class="col-md-2 control-label">星座：</label>
					    <div class="col-md-8">
					      ${ star1.constellation}
					    </div>
					</div>
					</c:if>
					
					<c:if test="${not empty star1.bloodtype}">
						<div class="row" >
						<div class="col-md-2"></div>
					    <label class="col-md-2 control-label">血型：</label>
					    <div class="col-md-8">
					     ${star1.bloodtype}
					    </div>
					</div>
					</c:if>
					
					<c:if test="${not empty star1.height}">
						<div class="row" >
						<div class="col-md-2"></div>
					    <label class="col-md-2 control-label">身高：</label>
					    <div class="col-md-8">
					      ${ star1.height}
					    </div>
					</div>
					</c:if>
					
					<c:if test="${not empty star1.weight}">
						<div class="row" >
						<div class="col-md-2"></div>
					    <label class="col-md-2 control-label">体重：</label>
					   <div class="col-md-8">
					      ${ star1.weight}
					    </div>
					</div>
					</c:if>
					
					<c:if test="${not empty star1.birthday}">
						<div class="row">
						<div class="col-md-2"></div>
					    <label class="col-md-2 control-label">生日：</label>
					     <div class="col-md-8">
					      ${ star1.birthday}
					    </div>
					</div>
					</c:if>
					
					<c:if test="${not empty  star1.birthplace}">
						<div class="row">
						<div class="col-md-2"></div>
					    <label class="col-md-2 control-label">出生地：</label>
					     <div class="col-md-8">
					      ${ star1.birthplace}
					    </div>
					</div>
					</c:if>
					
					<c:if test="${not empty star1.occupation}">
						<div class="row">
						<div class="col-md-2"></div>
					    <label class="col-md-2 control-label">职业：</label>
					     <div class="col-md-8">
					      ${ star1.occupation}
					    </div>
					</div>
					</c:if>
					
					<c:if test="${not empty star1.brokerfirm}">
						<div class="row">
						<div class="col-md-2"></div>
					    <label class="col-md-2 control-label">经纪公司：</label>
					    <div class="col-md-8">
					       ${ star1.brokerfirm}
					    </div>
					</div>
					</c:if>
					
					<c:if test="${not empty star1.animal}">
						<div class="row">
						<div class="col-md-2"></div>
					    <label class="col-md-2 control-label">属相：</label>
					    <div class="col-md-8">
					      ${ star1.animal}
					    </div>
					</div>
					</c:if>
					
					<c:if test="${not empty star1.representativeworks}">
						<div class="row">
					    <div class="col-md-2"></div>
					    <label class="col-md-2 control-label">代表作品：</label>
					    <div class="col-md-8">
					      ${ star1.representativeworks}
					    </div>
					</div>
					</c:if>
					
					<c:if test="${not empty star1.residence}">
						<div class="row">
					    <div class="col-md-2"></div>
					    <label class="col-md-2 control-label">现居地：</label>
					    <div class="col-md-8">
					      ${ star1.residence}
					    </div>
					</div>
					</c:if>
					
					<c:if test="${not empty star1.gratuateunivercity}">
						<div class="row">
					    <div class="col-md-2"></div>
					    <label class="col-md-2 control-label">毕业院校：</label>
					    <div class="col-md-8">
					      ${ star1.gratuateunivercity}
					    </div>
					</div>
					</c:if>
					
					<c:if test="${not empty star1.achivements}">
						<div class="row">
					    <div class="col-md-2"></div>
					    <label class="col-md-2 control-label">成就：</label>
					    <div class="col-md-8">
					      ${ star1.achivements}
					    </div>
					</div>
					</c:if>
					
					<c:if test="${not empty star1.nationality}">
						<div class="row">
					    <div class="col-md-2"></div>
					    <label class="col-md-2 control-label">国籍：</label>
					    <div class="col-md-8">
					      ${ star1.nationality}
					    </div>
					</div>
					</c:if>
					
					<c:if test="${not empty star1.sex}">
						<div class="row">
					    <div class="col-md-2"></div>
					    <label class="col-md-2 control-label">性别：</label>
					    <div class="col-md-8">
					      ${ star1.sex}
					    </div>
					</div>
					</c:if>
					
					<c:if test="${not empty star1.specialty}">
						<div class="row">
						   <div class="col-md-2"></div>
					    <label class="col-md-2 control-label">特长：</label>
					    <div class="col-md-8">
						      ${ star1.specialty}
						    </div>
						</div>
					</c:if>
					<c:if test="${not empty star1.musicalstyle}">
					    <div class="row">
						    <div class="col-md-2"></div>
					    <label class="col-md-2 control-label">音乐风格：</label>
					    <div class="col-md-8">
						      ${ star1.musicalstyle}
						    </div>
						</div>
					</c:if>
		</div>
		</div>
		<!-- <div id="artist2" style="display:none;">
		<div style="text-align:center;"><img alt="" src="/images/artist/big1.PNG" style="width:700px;height:550px;"></div>
		<div style="text-align:center;margin-top:30px;"><img alt="" src="/images/artist/jianjie1.PNG"></div>
		</div> -->
		</div>	
		</div>
		<div class="col-md-3" style="text-align:left;padding-left:0px;margin-left:-45px;">	
		<div id="id1" style="margin-bottom:10px;"><img alt="" src="/images/artist/cy1.png" style="width:240px;height:170px;cursor:pointer;"></div>
		<div id="id2" style="margin-bottom:10px;"><img alt="" src="/images/artist/dyn1.png" style="width:240px;height:170px;cursor:pointer;"></div>
		<div id="id3" style="margin-bottom:10px;"><img alt="" src="/images/artist/ssy1.png" style="width:240px;height:170px;cursor:pointer;"></div>
		<div id="id4" style="margin-bottom:10px;"><img alt="" src="/images/artist/pbj1.png" style="width:240px;height:170px;cursor:pointer;"></div>
		<div id="id5" style="margin-bottom:10px;"><img alt="" src="/images/artist/zjy1.png" style="width:240px;height:170px;cursor:pointer;"></div>	
		</div>
		</div>
		<jsp:include page="foot.jsp" />
</div>
</body>
</html>
