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
   <title>29传媒</title>
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
		<jsp:include page="headnew.jsp" />
		<div style="width:1140px;margin:0 auto;">
		<div style="margin-top:20px;">
		<div style="width:860px;height:900px;padding-left:30px;float:left;">
		<div id="artist1">
		<div style="text-align:center;"><img alt="" src="/29images/${star1.star_img}" style="width:600px;height:400px;"></div>
		<div style="margin-top:30px;width:600px;margin-left:50px;">
		            <c:if test="${not empty star1.chinese_name}">
 						<div style="margin-bottom:8px;">
						    <label class="control-label" style="width:100px;float:left;margin-left:100px;">姓名：</label>
						    <div style="width:600px;">
						      ${star1.chinese_name}
						    </div>
						</div>
					</c:if>
 					
					<c:if test="${not empty star1.bieming}">
						<div style="margin-bottom:8px;">
						    <label class="control-label" style="width:100px;float:left;margin-left:100px;clear:both;">别名:</label>
						    <div   style="width:600px;">
						      ${star1.bieming}
						    </div>
						</div>
					</c:if>
					
					<c:if test="${not empty star1.nation}">
						<div style="margin-bottom:8px;">
						   
						    <label class=" control-label" style="width:100px;float:left;margin-left:100px;clear:both;">民族：</label>
						    <div style="width:600px;">
						      ${star1.nation}
						    </div>
						</div>
					</c:if>
					
					<c:if test="${not empty star1.constellation}">
						<div style="margin-bottom:8px;">
						
					    <label class=" control-label" style="width:100px;float:left;margin-left:100px;clear:both;">星座：</label>
					    <div style="width:600px;">
					      ${ star1.constellation}
					    </div>
					</div>
					</c:if>
					
					<c:if test="${not empty star1.bloodtype}">
						<div style="margin-bottom:8px;" >
						
					    <label class=" control-label" style="width:100px;float:left;margin-left:100px;clear:both;">血型：</label>
					    <div style="width:600px;">
					     ${star1.bloodtype}
					    </div>
					</div>
					</c:if>
					
					<c:if test="${not empty star1.height}">
						<div style="margin-bottom:8px;" >
						
					    <label class=" control-label" style="width:100px;float:left;margin-left:100px;clear:both;">身高：</label>
					    <div style="width:600px;">
					      ${ star1.height}
					    </div>
					</div>
					</c:if>
					
					<c:if test="${not empty star1.weight}">
						<div style="margin-bottom:8px;" >
						
					    <label class=" control-label" style="width:100px;float:left;margin-left:100px;clear:both;">体重：</label>
					   <div style="width:600px;">
					      ${ star1.weight}
					    </div>
					</div>
					</c:if>
					
					<c:if test="${not empty star1.birthday}">
						<div style="margin-bottom:8px;">
						
					    <label class=" control-label" style="width:100px;float:left;margin-left:100px;clear:both;">生日：</label>
					     <div style="width:600px;">
					      ${ star1.birthday}
					    </div>
					</div>
					</c:if>
					
					<c:if test="${not empty  star1.birthplace}">
						<div style="margin-bottom:8px;">
						
					    <label class=" control-label" style="width:100px;float:left;margin-left:100px;clear:both;">出生地：</label>
					     <div style="width:600px;">
					      ${ star1.birthplace}
					    </div>
					</div>
					</c:if>
					
					<c:if test="${not empty star1.occupation}">
						<div style="margin-bottom:8px;">
					
					    <label class=" control-label" style="width:100px;float:left;margin-left:100px;clear:both;">职业：</label>
					     <div style="width:600px;">
					      ${ star1.occupation}
					    </div>
					</div>
					</c:if>
					
					<c:if test="${not empty star1.brokerfirm}">
						<div style="margin-bottom:8px;">
						
					    <label class=" control-label" style="width:100px;float:left;margin-left:100px;clear:both;">经纪公司：</label>
					    <div style="width:600px;">
					       ${ star1.brokerfirm}
					    </div>
					</div>
					</c:if>
					
					<c:if test="${not empty star1.animal}">
						<div style="margin-bottom:8px;">
						
					    <label class=" control-label" style="width:100px;float:left;margin-left:100px;clear:both;">属相：</label>
					    <div style="width:600px;">
					      ${ star1.animal}
					    </div>
					</div>
					</c:if>
					
					<c:if test="${not empty star1.representativeworks}">
						<div style="margin-bottom:8px;">
					    
					    <label class=" control-label" style="width:100px;float:left;margin-left:100px;clear:both;">代表作品：</label>
					    <div style="width:600px;">
					      ${ star1.representativeworks}
					    </div>
					</div>
					</c:if>
					
					<c:if test="${not empty star1.residence}">
						<div style="margin-bottom:8px;">
					  
					    <label class=" control-label" style="width:100px;float:left;margin-left:100px;clear:both;">现居地：</label>
					    <div style="width:600px;">
					      ${ star1.residence}
					    </div>
					</div>
					</c:if>
					
					<c:if test="${not empty star1.gratuateunivercity}">
						<div style="margin-bottom:8px;">
					    
					    <label class=" control-label" style="width:100px;float:left;margin-left:100px;clear:both;">毕业院校：</label>
					    <div style="width:600px;">
					      ${ star1.gratuateunivercity}
					    </div>
					</div>
					</c:if>
					
					<c:if test="${not empty star1.achivements}">
						<div style="margin-bottom:8px;">
					   
					    <label class=" control-label" style="width:100px;float:left;margin-left:100px;clear:both;">成就：</label>
					    <div style="width:600px;">
					      ${ star1.achivements}
					    </div>
					</div>
					</c:if>
					
					<c:if test="${not empty star1.nationality}">
						<div style="margin-bottom:8px;">
					  
					    <label class=" control-label" style="width:100px;float:left;margin-left:100px;clear:both;">国籍：</label>
					    <div style="width:600px;">
					      ${ star1.nationality}
					    </div>
					</div>
					</c:if>
					
					<c:if test="${not empty star1.sex}">
						<div style="margin-bottom:8px;">
					 
					    <label class=" control-label" style="width:100px;float:left;margin-left:100px;clear:both;">性别：</label>
					    <div style="width:600px;">
					      ${ star1.sex}
					    </div>
					</div>
					</c:if>
					
					<c:if test="${not empty star1.specialty}">
						<div style="margin-bottom:8px;">
						  
					    <label class=" control-label" style="width:100px;float:left;margin-left:100px;clear:both;">特长：</label>
					    <div style="width:600px;">
						      ${ star1.specialty}
						    </div>
						</div>
					</c:if>
					<c:if test="${not empty star1.musicalstyle}">
					    <div style="margin-bottom:8px;">
						   
					    <label class=" control-label" style="width:100px;float:left;margin-left:100px;clear:both;">音乐风格：</label>
					    <div style="width:600px;">
						      ${ star1.musicalstyle}
						    </div>
						</div>
					</c:if>
		</div>
		</div>	
		</div>
		
		<c:if test="${!empty list}">
		<div  style="float:left;width:280px;">
		<c:forEach var="item" items="${list}" varStatus="stat">
		
		<div id="${stat.index }" style="margin-bottom:10px;">
			<a href="/Artist?starNum=${stat.index+1}"><img alt="" src="/29images/${item.star_img}" style="width:240px;height:170px;cursor:pointer;">
			</a>
		</div>
		<!-- <div id="id2" style="margin-bottom:10px;"><a href="/Artist?starNum=2"><img alt="" src="/images/artist/dyn1.png" style="width:240px;height:170px;cursor:pointer;"></a></div>
		<div id="id3" style="margin-bottom:10px;"><a href="/Artist?starNum=3"><img alt="" src="/images/artist/ssy1.png" style="width:240px;height:170px;cursor:pointer;"></a></div>
		<div id="id4" style="margin-bottom:10px;"><a href="/Artist?starNum=4"><img alt="" src="/images/artist/pbj1.png" style="width:240px;height:170px;cursor:pointer;"></a></div>
		<div id="id5" style="margin-bottom:10px;"><a href="/Artist?starNum=5"><img alt="" src="/images/artist/zjy1.png" style="width:240px;height:170px;cursor:pointer;"></a></div>	 -->
		</c:forEach>
		</div>
		</c:if>
		</div>
		<jsp:include page="foot.jsp" />
</div>
</body>
</html>
