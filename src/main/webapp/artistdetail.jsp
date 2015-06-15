<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>艺人详情</title>
<link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet">
   <link href="/bootstrap/css/bootstrap-theme.min.css" rel="stylesheet">
   <link href="/css/news.css" rel="stylesheet">
   <script src="/js/jquery.min.js"></script>
   <script src="/bootstrap/js/bootstrap.min.js"></script>
   <style type="text/css">
   body{
   background-color:rgba(233, 243, 248, 1);
   }
   </style>
</head>
<body>
 <div class="container">
 <jsp:include page="head.jsp" />
 	<div class="row" style="color:white;">
 		<div class="col-md-8 col-lg-8">
 			<div class="row" style="height:500px;">
 				<div class="col-md-4 col-lg-4">
 					<img alt="" src="${star1.star_img}" height="">
 				</div>
 				<div class="col-md-8 col-lg-8">
 					<c:if test="${not empty star1.chinese_name}">
 						<div class="row">
						    <label class="col-md-3 control-label">姓名：</label>
						    <div class="col-md-9">
						      ${star1.chinese_name}
						    </div>
						</div>
					</c:if>
 					
					<c:if test="${not empty star1.bieming}">
						<div class="row" >
						    <label class="col-md-3 control-label">别名:</label>
						    <div class="col-md-9">
						      ${star1.bieming}
						    </div>
						</div>
					</c:if>
					
					<c:if test="${not empty star1.nation}">
						<div class="row">
						    <label class="col-sm-3 control-label">民族：</label>
						    <div class="col-sm-9">
						      ${star1.nation}
						    </div>
						</div>
					</c:if>
					
					<c:if test="${not empty star1.constellation}">
						<div class="row">
					    <label class="col-sm-3 control-label">星座：</label>
					    <div class="col-sm-9">
					      ${ star1.constellation}
					    </div>
					</div>
					</c:if>
					
					<c:if test="${not empty star1.bloodtype}">
						<div class="row" >
					    <label class="col-sm-3 control-label">血型：</label>
					    <div class="col-sm-9">
					     ${star1.bloodtype}
					    </div>
					</div>
					</c:if>
					
					<c:if test="${not empty star1.height}">
						<div class="row" >
					    <label class="col-sm-3 control-label">身高：</label>
					    <div class="col-sm-9">
					      ${ star1.height}
					    </div>
					</div>
					</c:if>
					
					<c:if test="${not empty star1.weight}">
						<div class="row" >
					    <label class="col-sm-3 control-label">体重：</label>
					    <div class="col-sm-9">
					      ${ star1.weight}
					    </div>
					</div>
					</c:if>
					
					<c:if test="${not empty star1.birthday}">
						<div class="row">
					    <label class="col-sm-3 control-label">生日：</label>
					    <div class="col-sm-9">
					      ${ star1.birthday}
					    </div>
					</div>
					</c:if>
					
					<c:if test="${not empty  star1.birthplace}">
						<div class="row">
					    <label class="col-sm-3 control-label">出生地：</label>
					    <div class="col-sm-9">
					      ${ star1.birthplace}
					    </div>
					</div>
					</c:if>
					
					<c:if test="${not empty star1.occupation}">
						<div class="row">
					    <label class="col-sm-3 control-label">职业：</label>
					    <div class="col-sm-9">
					      ${ star1.occupation}
					    </div>
					</div>
					</c:if>
					
					<c:if test="${not empty star1.brokerfirm}">
						<div class="row">
					    <label class="col-sm-3 control-label">经纪公司：</label>
					    <div class="col-sm-9">
					       ${ star1.brokerfirm}
					    </div>
					</div>
					</c:if>
					
					<c:if test="${not empty star1.animal}">
						<div class="row">
					    <label class="col-sm-3 control-label">属相：</label>
					    <div class="col-sm-9">
					      ${ star1.animal}
					    </div>
					</div>
					</c:if>
					
					<c:if test="${not empty star1.representativeworks}">
						<div class="row">
					    <label class="col-sm-3 control-label">代表作品：</label>
					    <div class="col-sm-9">
					      ${ star1.representativeworks}
					    </div>
					</div>
					</c:if>
					
					<c:if test="${not empty star1.residence}">
						<div class="row">
					    <label class="col-sm-3 control-label">现居地：</label>
					    <div class="col-sm-9">
					      ${ star1.residence}
					    </div>
					</div>
					</c:if>
					
					<c:if test="${not empty star1.gratuateunivercity}">
						<div class="row">
					    <label class="col-sm-3 control-label">毕业院校：</label>
					    <div class="col-sm-9">
					      ${ star1.gratuateunivercity}
					    </div>
					</div>
					</c:if>
					
					<c:if test="${not empty star1.achivements}">
						<div class="row">
					    <label class="col-sm-3 control-label">成就：</label>
					    <div class="col-sm-9">
					      ${ star1.achivements}
					    </div>
					</div>
					</c:if>
					
					<c:if test="${not empty star1.nationality}">
						<div class="row">
					    <label class="col-sm-3 control-label">国籍：</label>
					    <div class="col-sm-9">
					      ${ star1.nationality}
					    </div>
					</div>
					</c:if>
					
					<c:if test="${not empty star1.sex}">
						<div class="row">
					    <label class="col-sm-3 control-label">性别：</label>
					    <div class="col-sm-9">
					      ${ star1.sex}
					    </div>
					</div>
					</c:if>
					
					<c:if test="${not empty star1.specialty}">
						<div class="row">
						    <label class="col-sm-3 control-label">特长：</label>
						    <div class="col-sm-9">
						      ${ star1.specialty}
						    </div>
						</div>
					</c:if>
					<c:if test="${not empty star1.musicalstyle}">
					    <div class="row">
						    <label class="col-sm-3 control-label">音乐风格：</label>
						    <div class="col-sm-9">
						      ${ star1.musicalstyle}
						    </div>
						</div>
					</c:if>
					
					
				  	
 				</div>
 			</div>
 			<div class="row">
 			
 			</div>
 			
 		</div>
 		<div class="col-md-4 col-lg-4">
 			<img alt="" src="/images/img01.jpg" class="row" height="250px">
 			<img alt="" src="/images/img01.jpg" class="row" height="250px">
 			<img alt="" src="/images/img01.jpg" class="row" height="250px">
 			
 		</div>
 	</div>
 <jsp:include page="foot.jsp" />
 </div>
</body>
</html>