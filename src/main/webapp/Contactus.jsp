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
   body{
   background-color:rgba(233, 243, 248, 1);
   }
   </style>
  <style text="text/css">
  #username,#email{
  	height:46px;
  }
  #content{
  	height:150px;
  }
  </style>
</head>
<body>
 <jsp:include page="headnew.jsp" />
 <div style="width:1140px;margin:0 auto;height:700px;">
  <div style="/* background-color: rgb(17, 164, 231); */width: 1140px;height:700px;">
  <div style="text-align:center;margin:27px;padding-top:29px;"><I style="color:rgb(170, 237, 241);font-family:微软雅黑;font-size:29px;">加入我们</I>
  <I style="font-family:微软雅黑;font-size:29px;">Join Us</I> </div>
	  <div style="margin-left: 196px;float:left;">
	  	<!-- <img src="images/1.png" height="300px;"> -->
	  	<div style="text-align:right;width:300px;/* background-color:red; */height:300px;font-size:21px;font-weight:bold;padding-right:15px;border:5px solid rgb(170, 237, 241);color:black;">
	  	<div style="padding-top:20px;"><span class="glyphicon glyphicon-earphone"></span>&nbsp;咨询电话：</div>
	  	<div >021-60727090(10:00-18:00)</div>
	  	<div style="font-size:20px;">(周一-周五)</div>
	  	<div ><span class="glyphicon glyphicon-list-alt"></span>&nbsp;咨询邮箱：</div>
	  	<div >support@alf.cn</div>
	  	<div style="padding-top:20px;"><span class="glyphicon glyphicon-inbox"></span>&nbsp;商务洽谈合作:</div>
	  	<div >bd@atf.cn</div>
	  	</div>
	  </div>
  <div style="float:left;width:400px;">
  <form class="form-horizontal"  style="width:400px;" id="newsinfo">
   <div class="form-group" style="margin-bottom:10px;">
      
      <div class="col-sm-10" style="margin-left:25px;">
         <input type="text" class="form-control" id="username" name="username"  placeholder="您的真实姓名" style="height:30px;">
        
      </div>
      <!-- <div id="user" style="height:30px;margin-left:20px;">
         
      </div> -->
      
   </div>
   <div class="form-group">
      
      <div class="col-sm-10" style="margin-left:25px;">
         <input type="text" class="form-control" id="email" name="email" placeholder="您的邮箱" style="height:30px;">
      </div>
      <!--  <div id="pass" style="height:30px;margin-left:20px;">
          
      </div> -->
   </div>
   
    <div class="form-group">
      
      <div class="col-sm-10" style="margin-left:25px;">
         <!-- <input type="text" class="form-control" id="content" name="content" placeholder="报名的内容"> -->
         <textarea rows="3" cols="20" class="form-control" id="content" name="content" placeholder="报名的内容" style="height:100px;"></textarea>
      </div>
       <!-- <div id="pass" style="height:60px;margin-left:20px;">
          
      </div> -->
   </div>
 </form>  
<form id="newsimg">
<div class="c-fix" style="padding-left:25px;margin-top:5px;">
<span class="area_span" style="float:left;">图片</span>
<span> <input type="file" name="news_image" id="news_image" style="width:330px;border:1px solid rgb(239,235,242);float:left;margin-right:40px;margin-top:5px;"/><a href="#" class="addnewsimg">上传</a></span>
</div>
</form>
<div id="newsimglist" style="margin-top:20px;" name = "newsimglist1"></div>
<div class="area_left4" style="margin-left:25px;"><button type="button" class="btn" onclick="add()" style="margin-top:10px;">提交</button></div>
<!-- <div class="area_right4"><button type="button" class="btn" onclick="chongzhi()">重置</button></div>
 -->
 </div>
   
</div>
<!-- <div style="clear:both;margin-left: 765px;"><a href="#"><U style="color:rgb(170, 237, 241)">确认邮件寄出</U></a></div> -->
 <!--  <div style="text-align:center;"><img src="images/12.png"></div> -->
</div >
<jsp:include page="foot.jsp" />
</div>


</body>
</html>
<script>
	function add(){
	
	  var newsinfo=DataDeal.formToJson(data= decodeURIComponent($("#newsinfo").serialize(),true)); 
	  newsinfo=eval("("+newsinfo+")");
	  /* var newsid=newsinfo.news_id;
	  var newstime=newsinfo.time;  */
	  var name = $("#username");
	  var email = $("#email");
	  var content = $("#content");
	  var newsimglist1 = JSON.stringify(newsimglist);
	  
	  /* $("#form1").submit(); */
	  $.ajax({
	 	    type: "POST",
	 		data: {"newsinfo":JSON.stringify(newsinfo),"newsimglist":JSON.stringify(newsimglist)},
	 		dataType: "json",
	 		url: "/inputJoinUs",
	 		success:function(data){
	 			if(data.flag ==2){
	 				alert("添加成功！");
	 			}else if(data.flag ==0){
	 				alert("添加失败！");
	 			}
	 		},
	 		error:function(){
	 			alert("error")
	 		}
	 	});
	  }



function chongzhi(){
	$("#news_id").val("").focus();
	$("#title").val("");
	$("#time").val("");
	$("#detail").val("");
}
</script>
<script type="text/javascript">

var newsimglist=[];
var isnewsimgedit=100;
var newsimgedititem;
var newsimgecount=0;
$(function(){
	$.ajaxSetup({  
	    contentType: "application/x-www-form-urlencoded; charset=utf-8"
	});  
	$(".addnewsimg").click(function(){
		//alert(isnewsimgedit);
		if(isnewsimgedit==100){

			if($('#news_image').val()==""){
				alert("请选择文件！");
				return false;}
			var newsimg={};
			var filenames=$('#news_image').val().split("\\");
			var filename=filenames[filenames.length-1];
			/* newsimg=DataDeal.formToJson(data= decodeURIComponent($("#newsimg").serialize(),true)); */
			/* newsimg=eval("("+newsimg+")"); */
			newsimg.news_image=filename;
			newsimglist.push(newsimg);
			/* for(var i=0;i<newsimglist.length;i++){
				alert(newsimglist[i].news_image)
				} */
			$("#newsimglist").append("<div style='float:left;padding-left:35px;width:817px;padding-top:10px;'><span style='padding-right:50px;'>"+(++newsimgecount)+"</span><span style='padding-right:10px;'>"+newsimglist[newsimgecount-1].news_image+"</span><span style='padding-left: 30px;padding-right: 40px;'></span><span><a href='#' class='deletenewsimg'>删除</a></span></div>");			
			UploadFile("news_image");
			$("#newsimg input").each(function(){
				$(this).val("");
				});
			}
		});
	
	    $("#newsimglist").on("click",".deletenewsimg",function(){
		newsimglist.splice($(this).parent().parent().children().eq(0).text()-1,1);
		$(this).parent().parent().empty(); 
		newsimgecount--;
		});	
});



var DataDeal = {  
		//将从form中通过$('#form').serialize()获取的值转成json  
		           formToJson: function (data) {  
		               data=data.replace(/&/g,"\",\"");  
		               data=data.replace(/=/g,"\":\"");  
		               data="{\""+data+"\"}";  
		               return data;  
		            },  
		}; 
function UploadFile(imageid) {
    var fileObj = document.getElementById(imageid).files[0]; // 获取文件对象
    var FileController = "/imageupload";                    // 接收上传文件的后台地址 
    // FormData 对象
    var form = new FormData();
    form.append("file", fileObj);                           // 文件对象
    // XMLHttpRequest 对象
    var xhr = new XMLHttpRequest();
    xhr.open("post", FileController, true);
    xhr.onload = function () {
        alert("上传完成!");
    };
    xhr.send(form);
} 


</script>