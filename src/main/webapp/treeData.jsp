<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
   <title>后台录入</title>
   <link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet">
   <!-- <link href="/css/default.css" rel="stylesheet"> -->
   <script src="/js/jquery.min.js"></script>
   <script src="/bootstrap/js/bootstrap.min.js"></script>
   <script src="//cdn.ckeditor.com/4.4.7/full/ckeditor.js"></script>
</head>
<body>
<input type="hidden" id="top"/>
<%-- <jsp:include page="head.jsp" /> --%>
 <div class="container">
 <div class="row">
 <div class="col-md-3" style="padding-top:25px;">
 <div id="treeview"></div>
 </div>
 <div class="col-md-9" style="padding-left:0px;">
 <div id="showlist"></div>
 </div>
 </div>
 </div>
 <script src="/bootstrap/js/bootstrap-treeview.js"></script>
 <script type="text/javascript">
 $(function() {
 
	        var defaultData = [
				{
				    text: '首页录入',	
				    color: '#ffffff', 
				    backColor:'rgb(59,94,132)',
				    href:'#title',
				    nodes: [
				    
				              {
					                text: '图片录入'
						                          
					              }
				            ]         
				  },
		          {
			            text: '新闻录入',	
			            color: '#ffffff', 
			            backColor:'rgb(59,94,132)',
			            href:'#title',
			            nodes: [
					              {
					                text: '新闻信息'
						      	                
					              },
					              {
						                text: '新闻图片'
							                          
						              }
					            ]         
			          },
			          {
				            text: '艺人录入',	
				            color: '#ffffff', 
				            backColor:'rgb(59,94,132)',
				            href:'#title',
				            nodes: [
						              {
						                text: '艺人信息'
							            	                
						              },
						              {
							                text: '艺人图片'
								                           
							              },
						              {
							                text: '艺人影视'
								                        
							              }
						            ]          
				          },
				          {
					            text: '培训录入',	
					            color: '#ffffff', 
					            backColor:'rgb(59,94,132)',
					            href:'#title',
					            nodes: [
							              {
							                text: '培训信息'
								      	                
							              },
							              {
								                text: '培训详情'
									                          
								              },
								              {
									                text: '艺能培训'
										                          
									              }
							            ]         
					          },
					          {
						            text: '首页列表',	
						            color: '#ffffff', 
						            backColor:'rgb(59,94,132)', 
						            href:'#title'       
						          },
			          
				          {
					            text: '新闻列表',	
					            color: '#ffffff', 
					            backColor:'rgb(59,94,132)', 
					            href:'#title'       
					          },
					          {
						            text: '艺人列表',	
						            color: '#ffffff', 
						            backColor:'rgb(59,94,132)', 
						            href:'#title'       
						          },
					          {
						            text: '培训列表',	
						            color: '#ffffff', 
						            backColor:'rgb(59,94,132)', 
						            href:'#title'       
						          }
					         
	        ];
	        $("#showlist").load("indexInput.jsp"); 
	        $('#treeview').treeview({
	          color: "#000000",
	          data: defaultData,
	          enableLinks:true,
	          onNodeSelected: function(event, node) {
	        	  if(node.text=="首页录入"){
		           		$("#showlist").load("indexInput.jsp");
		           }
	           if(node.text=="新闻录入"){
	           		$("#showlist").load("newsInput.jsp");
	           }
	           if(node.text=="艺人录入"){
	           		$("#showlist").load("artistInput.jsp");
	           }
	           if(node.text=="培训录入"){
	           		$("#showlist").load("trainInput.jsp");
	           }
	           if(node.text=="首页列表"){
	           		$("#showlist").load("indexList.jsp");
	           }
	           if(node.text=="新闻列表"){
	           		$("#showlist").load("newsList.jsp");
	           }
	           if(node.text=="艺人列表"){
	           		$("#showlist").load("artistList.jsp");
	           }
	           if(node.text=="培训列表"){
	           		$("#showlist").load("trainList.jsp");
	           }
	          }   
	        });
 });
 </script>
</body>
</html>