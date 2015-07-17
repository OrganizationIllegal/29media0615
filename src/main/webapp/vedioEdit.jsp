<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html>
<head>
<title>影视编辑</title>
<link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/input.css" />
<script src="//cdn.ckeditor.com/4.4.7/full/ckeditor.js"></script>
<script src="/js/jquery.min.js"></script>
<script src="/bootstrap/js/bootstrap.min.js"></script>
<style type="text/css">
body{
	/* background-color:rgb(232, 233, 234)!important; */
	font-family:"Microsoft YaHei"!important;
}
</style>
</head>
<body>
<div style="width:900px;margin:25px auto;">
<div class="area_bkg1">当前位置:影视编辑</div>
<div class="area_bkg2">影视信息</div>

<form id="videoimg">
<div class="area_left">
<span class="area_span">影视编号</span><span><input type="text" id="video_id" name="video_id" class="area_input" value=${vedioInfo.video_id}></span>
</div>
<div class="area_right">
<span class="area_span">影视链接</span><span><input type="text" id="video_link" name="video_link" class="area_input" value=${vedioInfo.video_link}></span>
</div>
<div class="area_left">
<span class="area_span">类型</span>
<span>
<select class="area_select" id="type" name="type">
  <option value ="${vedioInfo.type}">${vedioInfo.type}</option>
   <option value ="视频">视频</option>
  <option value ="练习生视频">练习生视频</option>
</select>
</span>
</div>
<div class="area_left">
<span class="area_span">类型</span>
<span>
<select class="area_select" id="type" name="type">
  <option value ="视频">视频</option>
  <option value ="练习生视频">练习生视频</option>
</select>
</span>
</div>

<div class="area_left c-fix">
<span class="area_span">影视描述</span>
</div>
<div class="c-fix" style="margin-bottom:15px;margin-left:35px;"><textarea id="video_desc" name="video_desc" rows="3" cols="112" style="background-color:rgb(237,238,243);border:0px;">${vedioInfo.video_desc}</textarea></div>
<div class="area_right" style="display:none;">
<span class="area_span">id</span><span><input type="text" id="id" name="id" class="area_input" value=${vedioInfo.id}></span>
</div>
<div class="c-fix" style="padding-left:35px;margin-top:20px;">
<span class="area_span">影视图片</span>
<span style="float:right;"> <input type="file" name="video_pic" id="video_pic" style="width:677px;border:1px solid rgb(239,235,242);float:left;margin-right:20px;"/><a href="#" class="addvideoimg">添加</a></span>
</div>
</form>
<div id="videoimglist" style="margin-top:20px;">
</div>
<div class="area_left4"><button type="button" class="btn" onclick="add()">提交</button></div>
<div class="area_right4"><button type="reset" class="btn" onclick="fanhui()">返回</button></div>
</div>


<script type="text/javascript">
function add(){
	 
	  $.ajax({
	 	    type: "POST",
	 		data: {"videoimglist":JSON.stringify(videoimglist)},
	 		dataType: "json",
	 		url: "/editVedio",
	 		success:function(data){
	 			if(data.flag == 1){
	 				alert("修改成功！");
	 			}else if(data.flag ==0){
	 				alert("修改失败！");
	 			}
	 		},
	 		error:function(){
	 			alert("error")
	 		}
	 	});
	  }
function fanhui(){
	window.location.href="/treeData.jsp";
}
</script>
<script type="text/javascript">
var videoimglist=[];
var isvideoimgedit=100;
var videoimgedititem;
var videoimgecount=0;
$(function(){
	$.ajaxSetup({  
	    contentType: "application/x-www-form-urlencoded; charset=utf-8"  
	});  
	$(".addvideoimg").click(function(){
		if(isvideoimgedit==100){
			if($('#video_pic').val()==""){
				alert("请选择文件！");
				return false;}
			var videoimg={};
			var filenames=$('#video_pic').val().split("\\");
			var filename=filenames[filenames.length-1];
			videoimg.video_id=$("#video_id").val();
			videoimg.video_link=$("#video_link").val();
			videoimg.video_desc=$("#video_desc").val();
			videoimg.type=$("#type").val();
			videoimg.video_pic=filename;
			videoimglist.push(videoimg);
			$("#videoimglist").append("<div style='float:left;padding-left:35px;width:900px;margin-top:5px;margin-bottom:5px;'><span style='padding-right:50px;'>"+(++videoimgecount)+"</span><span style='padding-right:100px;'>"+videoimglist[videoimgecount-1].video_id+"</span><span style='padding-right:100px;'>"+videoimglist[videoimgecount-1].video_link+"</span><span style='padding-right:100px;'>"+videoimglist[videoimgecount-1].video_pic+"</span><span><a href='#' style='padding-right:10px;' class='editvideoimg'>编辑</a><a href='#' class='deletevideoimg'>删除</a></span></div>");			
			UploadFile("video_pic");
			$("#videoimg input").each(function(){
				$(this).val("");
				});
			}else{
				if($('#video_pic').val()==""){
					alert("请选择文件！");
					return false;}
				//alert("edit");
				var filenames=$('#video_pic').val().split("\\");
				var filename=filenames[filenames.length-1];
				/* videoimgedititem=DataDeal.formToJson(data= decodeURIComponent($("#videoimg").serialize(),true));
				videoimgedititem=eval("("+videoimgedititem+")"); */
				
				videoimgedititem["video_id"]=$("#video_id").val();
				videoimgedititem["video_link"]=$("#video_link").val();
				videoimgedititem["video_desc"]=$("#video_desc").val();
				videoimgedititem["type"]=$("#type").val();
				videoimgedititem["video_pic"]=filename;
				UploadFile("video_pic");
				$("#videoimg input").each(function(){
					$(this).val("");
					});
				videoimglist[isvideoimgedit]=videoimgedititem;
				//alert($("#videoimglist").children().eq(isvideoimgedit));
				$("#videoimglist").children().eq(isvideoimgedit).html("<div style='float:left;width:900px;margin-top:5px;margin-bottom:5px;'><span style='padding-right:100px;'>"+(isvideoimgedit+1)+"</span><span style='padding-right:100px;'>"+videoimglist[videoimgecount-1].video_id+"</span><span style='padding-right:100px;'>"+videoimglist[videoimgecount-1].video_link+"</span><span style='padding-right:100px;'>"+videoimglist[videoimgecount-1].video_pic+"</span><span><a href='#' style='padding-right:10px;' class='editvideoimg'>编辑</a><a href='#' class='deletevideoimg'>删除</a></span></div>").show();
				isvideoimgedit=100;				
				}
		});
	
	    $("#videoimglist").on("click",".deletevideoimg",function(){
		videoimglist.splice($(this).parent().parent().children().eq(0).text()-1,1);
		$(this).parent().parent().empty(); 		
		videoimgecount--;
		});	

	    $("#videoimglist").on("click",".editvideoimg",function(){			
			var index=$(this).parent().parent().children().eq(0).text()-1;
			//alert(index);
			alert("edit");
			videoimgedititem=videoimglist[index];
			$(this).parent().parent().hide();
			//alert(index+"index");
			isvideoimgedit=index;
			$("#video_id").val(videoimgedititem.video_id);
			$("#video_link").val(videoimgedititem.video_link);
			$("#video_desc").val(videoimgedititem.video_desc);
			$("#type").val(videoimgedititem.type);
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
</body>
</html>