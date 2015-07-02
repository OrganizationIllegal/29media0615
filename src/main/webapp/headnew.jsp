<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
 <style type="text/css">
   body{
   /* background-color:rgba(233, 243, 248, 1); */
    background: -moz-linear-gradient(top, #666666 0%, #ffffff 40%);
    background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#666666), color-stop(40%,#ffffff));
    background: -webkit-linear-gradient(top, #666666 0%,#ffffff 40%);
    background: -o-linear-gradient(top, #666666 0%,#ffffff 40%);
    background: -ms-linear-gradient(top, #666666 0%,#ffffff 40%);
    background: linear-gradient(to bottom, #666666 0%,#ffffff 40%);
 
   }
   </style>
   <script type="text/javascript">
   $().ready(function() {
  $("#login2").click(function(){
   	$('#login').modal('show');
  })
   $("#register2").click(function(){
   	$('#register').modal('show');
  })
  
  	var username = $("#username").val(); 
  
	  $("li").css("text-decoration","");
	 
	  $(".my").hover(function(){	    
	     	$("#info1").show();		   
		});
	   $("#info1").mouseleave(function(){
		  $("#info1").hide();
		 
		  });
	});
   function pop(){
       $('#modal').modal('show');
     }
     </script>
</head>
<body>
 <!-- header start -->
		<div style="padding-top:30px;margin:0 auto;width:1140px;height:155px;">
			<div style="width:650px;float:right;">
			<div style="float:left;width:85px;padding-left:0px;padding-right:0px;border-color:white;border-right-style:solid;border-right-width:1px;padding-top:5px;padding-bottom:22px;">
				<div style="padding-left:10px;margin-bottom:10px;"><a href="/Index" style="color:white;font-size:20px;font-family:楷体;">首页</a></div>
				<div style="color:white;font-size:10px;font-family:楷体;">LATEST NEWS</div>
				<div style="color:white;font-size:10px;font-family:楷体;">EVENT</div>
			</div>
            <div style="float:left;width:85px;padding-left:10px;padding-right:0px;border-color:white;border-right-style:solid;border-right-width:1px;padding-top:5px;padding-bottom:5px;">
				<div style="padding-left:10px;margin-bottom:10px;"><a href="/News?newsId=1" style="color:white;font-size:20px;font-family:楷体;">动态</a></div>
				<div style="color:white;font-size:10px;font-family:楷体;">WEDDING</div>
				<div style="color:white;font-size:10px;font-family:楷体;">PHOTO</div>
				<div style="color:white;font-size:10px;font-family:楷体;">GUESTPHOTO</div>
			</div>
			<div style="float:left;width:85px;padding-left:10px;padding-right:0px;border-color:white;border-right-style:solid;border-right-width:1px;padding-top:5px;padding-bottom:39px;">

				<div style="padding-left:10px;margin-bottom:10px;"><a href="/Artist" style="color:white;font-size:20px;font-family:楷体;">艺人</a></div>

				<div style="color:white;font-size:10px;font-family:楷体;">DOING</div>
			</div>
			<div style="float:left;width:85px;padding-left:10px;padding-right:0px;border-color:white;border-right-style:solid;border-right-width:1px;padding-top:5px;padding-bottom:5px;">
				<div style="padding-left:10px;margin-bottom:10px;"><a href="/Train" style="color:white;font-size:20px;font-family:楷体;">培训</a></div>
				<div style="color:white;font-size:10px;font-family:楷体;">ABOUT US</div>
				<div style="color:white;font-size:10px;font-family:楷体;">JOB</div>
				<div style="color:white;font-size:10px;font-family:楷体;">SERVICE TIPS</div>
			</div>
			<div style="float:left;width:85px;padding-left:10px;padding-right:0px;border-color:white;border-right-style:solid;border-right-width:1px;padding-top:5px;padding-bottom:5px;">
				<div style="padding-left:10px;margin-bottom:10px;"><a href="/video.jsp" style="color:white;font-size:20px;font-family:楷体;">影视</a></div>
				<div style="color:white;font-size:10px;font-family:楷体;">CONTACT</div>
				<div style="color:white;font-size:10px;font-family:楷体;">WEIBO</div>
				<div style="color:white;font-size:10px;font-family:楷体;">WEIXIN</div>
			</div>
			<div style="float:left;width:100px;padding-left:10px;padding-right:0px;padding-top:5px;padding-bottom:5px;">
				<div style="padding-left:10px;margin-bottom:10px;"><a href="/aboutus.jsp" style="color:white;font-size:20px;font-family:楷体;">联系我们</a></div>
				<div style="color:white;font-size:10px;font-family:楷体;">ABOUT US</div>
				<div style="color:white;font-size:10px;font-family:楷体;">JOB</div>
				<div style="color:white;font-size:10px;font-family:楷体;">SERVICE TIPS</div>
			</div>
			</div>
			<%
            String username = null;
            //out.println(request.getSession().getAttribute("username")+"fff");
       		if(request.getSession().getAttribute("username")!=null && request.getSession().getAttribute("username")!=""){
       			String role = request.getSession().getAttribute("role").toString();
       			username = request.getSession().getAttribute("username").toString();
       		
%>             
				<%
	       			if("0".equals(role)){
	       				
	       		%>      管理员${sessionScope.username}
	       		<%
	       			}else{
	       		%>
	       				普通用户${sessionScope.username}
	       		<%
	       			}
	       		
	       		%><a href="${pageContext.request.contextPath}/logout.jsp" style="cursor:pointer;">退出登录</a>
	       		<%
	       		}
	       		else{
	      		%>
					<a id="register2" style="cursor:pointer;color:white;">注册</a>
					<a class="f-r s-14 f-yahei main_sep fw cp" style="color:white;">/</a>
					<a id="login2" style="cursor:pointer;color:white;">登录</a>
					
				<%
	       			}
	       		%>
		
</div>		
<!-- header end -->


<!-- login start -->
<div class="modal fade" id="login" tabindex="-1" role="dialog" 
   aria-labelledby="myModalLabel" aria-hidden="true">
   <div class="modal-dialog" style="margin-top:100px;">
      <div class="modal-content" style="margin-left:100px;height:270px;width:355px;">
         <div class="modal-header" style="background-color:rgb(55,52,67);padding:0px 10px;height:10px;">
            <button type="button" class="close" 
               data-dismiss="modal" aria-hidden="true" style="font-size:18px;color:white;">
                  &times;
            </button>
         </div>
         <div class="modal-body">
  <div style="text-align:center;margin-top:5px;"><div style="font-size:20px;font-weight:bold;">欢迎登录海外房产优选</div>
  <form method="post" name="fm" action="/login" autocomplete="off" >
  <div  style="padding-top:25px;">
         <input type="text"  id="username"
            name="username" style="background-image:url(images/0.png);background-repeat:no-repeat;background-position:left;width:270px;padding-left:35px;height:32px;background-color:rgba(246, 245, 245, 1);" placeholder="手机号/邮箱" autocomplete="off"  disableautocomplete />
         <input type="hidden" id="username1" 
            name="username1" style="background-image:url(images/0.png);background-repeat:no-repeat;background-position:left;width:270px;padding-left:35px;height:32px;background-color:rgba(246, 245, 245, 1);" placeholder="手机号/邮箱" autocomplete="off">
        <input type="hidden" style="background-image:url(images/0.png);background-repeat:no-repeat;background-position:left;width:270px;padding-left:35px;height:32px;background-color:rgba(246, 245, 245, 1);" id="role" 
            name="role" placeholder="用户角色">
       <div id="user" style="margin-left:20px;"></div>
      
   </div>
   <div>
         <input  type="password" id="password" 
            name="password" style="background-image:url(images/2.png);background-repeat:no-repeat;background-position:left;padding-left:35px;width:270px;height:32px;background-color:rgba(246, 245, 245, 1);" placeholder="密码" autocomplete="off">
         <input type="hidden" id="password1" 
            name="password1" style="background-image:url(images/2.png);background-repeat:no-repeat;background-position:left;padding-left:35px;width:270px;height:32px;background-color:rgba(246, 245, 245, 1);" placeholder="密码" autocomplete="off">
       <div id="pass" style="margin-left:20px;"></div>
   </div>
   
   <div style="padding-top:20px;padding-left:20px;float:left;font-size:12px;">
      <span><input type="checkbox" checked="true">记住我 <a href="/changePass.jsp" style="padding-left:160px;color:black;">忘记密码？</a></span>  
   </div>
   <div style="padding-top:15px;padding-left:20px;float:left;">
   <img src="images/3.png" id="login1" style="width:120px;height:30px;cursor:pointer;">   
   </div>
</form>
         </div>
   
      </div>
</div>
</div>
</div>
<!-- login end -->

<!-- register start -->
<div class="modal fade" id="register" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
   <div class="modal-dialog" style="margin-top:100px;">
      <div class="modal-content" style="margin-left:100px;height:270px;width:355px;">
         <div class="modal-header" style="background-color:rgb(55,52,67);padding:0px 10px;height:10px;">
            <button type="button" class="close" 
               data-dismiss="modal" aria-hidden="true" style="font-size:18px;color:white;">
                  &times;
            </button>
         </div>
         <div class="modal-body">
  <div style="text-align:center;margin-top:5px;"><div style="font-size:20px;font-weight:bold;">用户注册</div>
  <form method="post" action="/Register" name="fm1">
  <div  style="padding-top:15px;">
         <input type="text"  id="telemail" name="telemail" style="background-image:url(images/0.png);background-repeat:no-repeat;background-position:left;padding-left:35px;width:270px;height:34px;background-color:rgba(246, 245, 245, 1);" placeholder="手机号/邮箱" autocomplete="off">
   
   </div>
   <div>
         <input type="password" id="pwd" name="pwd" style="background-image:url(images/2.png);background-repeat:no-repeat;background-position:left;padding-left:35px;width:270px;height:34px;background-color:rgba(246, 245, 245, 1);" placeholder="密码" autocomplete="off">
   </div>
   <div style="padding-top:15px;padding-left:26px;float:left;font-size:12px;">
   
   <img src="images/register.png" id="reg" style="width:120px;height:30px;cursor:pointer;"><span style="padding-left:20px;"><a id="cancel" href="#">取消</a></span>
   </div>
</form>
<div style="float:left;margin-top:60px;margin-left:-165px;font-size:12px;"><span>已有账户？<a href="#">登录</a></span></div>
<div style="float:left;margin-top:85px;margin-left:-165px;font-size:12px;font-weight:bold;"><span><input type="checkbox" checked="true">我已阅读并接受<a href="/ServiceProtocol.jsp" style="color:black;">《用户服务协议》</a></span></div>
</div>
   
      </div>
</div>
</div>
</div>
<!-- register end -->
</body>

<script>

var role;
 $(function() {
                $("#login1").click(function() {
                	var user = $("#username").val();
                	var pass = $("#password").val();
                	var temp;
                	temp = judge(user,pass);
                	
                	if(temp==true){
	                	var username = encode64($("#username").val());
	                	var password = encode64($("#password").val());
	                	//alert("用户名加密后的结果:"+username+"密码加密后的结果:"+password);
	                	$("#username1").val(username);
	                    $("#password1").val(password);
	                    $("#role").val(role);
	                    document.fm.submit();  //fm为form表单name
                	}
                	else{
                		return false;
                	}
                })
                
                $("#reg").click(function() {
                  	var user = $("#telemail").val();
                  	var pass = $("#pwd").val();
                  	var temp;
                  	temp = judgeRe(user,pass);
                  	//alert(temp)             	
                  	if(temp==true){	                	
  	                    document.fm1.submit();  //fm为form表单name
                  	}
                  	else{               	
                  		return false;
                  	} 
                  });

                  $("#cancel").click(function() {
                    	$("#telemail").val("").focus();
                    	$("#pwd").val("");
                    });   
        })

function judge(username, password){
	 var result = false;
	 if(username==""){
	 alert("请输入用户名");
		 //$("#user").html("请输入用户名");
		 return false;
	 }
	 else if(username!=""&&password==""){
	 alert("请输入密码");
		 /* $("#pass").html("请输入密码");
		 $("#user").html(""); */
		 return false;
	 }
	 else{
		$.ajax({
			type:'GET',
			url:'/loginPanduan?username='+username+'&password='+password,
			dataType:'json',
			async: false, 
			success:function(data){
				if(data.user==0){
				alert("用户名不存在");
					//$("#user").html("用户名不存在");
				}
				else if(data.user==2){
				alert("用户名和密码不符");
					/* $("#pass").html("用户名和密码不符");
					$("#user").html(""); */
				}
				else if(data.user==1){
					//alert(data.role)
					if(data.role==0){
						role = 0;
					}
					else{
						role = 1;
					}
					result=true;
				}
			},
			error:function(){
				
			}
		})
 
	 }
	
 if(result == true){
	 return true;
 }
 }
function judgeRe(username, password){
  	 var result = false;
  	 if(username==""){
  	 alert("请输入用户名");
  		 return false;
  	 }
  	 else if(username!=""&&password==""){
  	 alert("请输入密码");
  		 return false;
  	 }
  	 else{
  		$.ajax({
  			type:'GET',
  			url:'/registerPanduan?username='+username+'&password='+password,
  			dataType:'json',
  			async: false, 
  			success:function(data){
  				if(data.user==0){
  				  alert("用户名已存在，请直接登录！");
  				}
  				else if(data.user==1){
  				result=true;
  				}
  			},
  			error:function(){
  			}
  		});
   
  	 }
  	
   if(result == true){
  	 return true;
   }
 }
 
   
  
var keyStr = "ABCDEFGHIJKLMNOP" + "QRSTUVWXYZabcdef" + "ghijklmnopqrstuv"
+ "wxyz0123456789+/" + "=";

function encode64(input) {

var output = "";
var chr1, chr2, chr3 = "";
var enc1, enc2, enc3, enc4 = "";
var i = 0;
do {
chr1 = input.charCodeAt(i++);
chr2 = input.charCodeAt(i++);
chr3 = input.charCodeAt(i++);
enc1 = chr1 >> 2;
enc2 = ((chr1 & 3) << 4) | (chr2 >> 4);
enc3 = ((chr2 & 15) << 2) | (chr3 >> 6);
enc4 = chr3 & 63;
if (isNaN(chr2)) {
        enc3 = enc4 = 64;
} else if (isNaN(chr3)) {
        enc4 = 64;
}
output = output + keyStr.charAt(enc1) + keyStr.charAt(enc2)
                + keyStr.charAt(enc3) + keyStr.charAt(enc4);
chr1 = chr2 = chr3 = "";
enc1 = enc2 = enc3 = enc4 = "";
} while (i < input.length);

return output;
}
</script>
