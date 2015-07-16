<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html>
<head>
<title>艺人编辑</title>
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
<div class="area_bkg1">当前位置:艺人编辑</div>
<div class="area_bkg2">艺人信息</div>
<form id="artistinfo">
<div class="area_left">
<span class="area_span">艺人编号</span><span><input type="text" id="star_num" name="star_num" class="area_input" value=${starinfo.star_num}></span>
</div>
<div class="area_right">
<span class="area_span">中文名</span><span><input type="text" id="chinese_name" name="chinese_name" class="area_input" value=${starinfo.chinese_name}></span>
</div>
<div class="area_left">
<span class="area_span">英文名</span><span><input type="text" id="english_name" name="english_name" class="area_input" value=${starinfo.english_name}></span>
</div>
<div class="area_right">
<span class="area_span">别名</span><span><input type="text" id="bieming" name="bieming" class="area_input" value=${starinfo.bieming}></span>
</div>
<div class="area_left">
<span class="area_span">性别</span><span><input type="text" id="sex" name="sex" class="area_input" value=${starinfo.sex}></span>
</div>
<div class="area_right">
<span class="area_span">国籍</span><span><input type="text" id="nationality" name="nationality" class="area_input" value=${starinfo.nationality}></span>
</div>
<div class="area_left">
<span class="area_span">民族</span><span><input type="text" id="nation" name="nation" class="area_input" value=${starinfo.nation}></span>
</div>
<div class="area_right">
<span class="area_span">星座</span><span><input type="text" id="constellation" name="constellation" class="area_input" value=${starinfo.constellation}></span>
</div>
<div class="area_left">
<span class="area_span">血型</span><span><input type="text" id="bloodtype" name="bloodtype" class="area_input" value=${starinfo.bloodtype}></span>
</div>
<div class="area_right">
<span class="area_span">属相</span><span><input type="text" id="animal" name="animal" class="area_input" value=${starinfo.animal}></span>
</div>
<div class="area_left">
<span class="area_span">身高</span><span><input type="text" id="height" name="height" class="area_input" value=${starinfo.height}></span>
</div>
<div class="area_right">
<span class="area_span">体重</span><span><input type="text" id="weight" name="weight" class="area_input" value=${starinfo.weight}></span>
</div>
<div class="area_left">
<span class="area_span">出生地</span><span><input type="text" id="birthplace" name="birthplace" class="area_input" value=${starinfo.birthplace}></span>
</div>
<div class="area_right">
<span class="area_span">生日</span><span><input type="text" id="birthday" name="birthday" class="area_input" value=${starinfo.birthday}></span>
</div>
<div class="area_left">
<span class="area_span">职业</span><span><input type="text" id="occupation" name="occupation" class="area_input" value=${starinfo.occupation}></span>
</div>
<div class="area_right">
<span class="area_span">经纪公司</span><span><input type="text" id="brokerfirm" name="brokerfirm" class="area_input" value=${starinfo.brokerfirm}></span>
</div>
<div class="area_left">
<span class="area_span">现居地</span><span><input type="text" id="residence" name="residence" class="area_input" value=${starinfo.residence}></span>
</div>
<div class="area_right">
<span class="area_span">毕业院校</span><span><input type="text" id="gratuateunivercity" name="gratuateunivercity" class="area_input" value=${starinfo.gratuateunivercity}></span>
</div>
<div class="area_left">
<span class="area_span">特长</span><span><input type="text" id="specialty" name="specialty" class="area_input" value=${starinfo.specialty}></span>
</div>
<div class="area_right">
<span class="area_span">音乐风格</span><span><input type="text" id="musicalstyle" name="musicalstyle" class="area_input" value=${starinfo.musicalstyle}></span>
</div>
<div class="area_left">
<span class="area_span">代表作品</span><span><input type="text" id="representativeworks" name="representativeworks" class="area_input" value=${starinfo.representativeworks}></span>
</div>
<div class="area_right">
<span class="area_span">成就</span><span><input type="text" id="achivements" name="achivements" class="area_input" value=${starinfo.achivements}></span>
</div>
<div class="area_left" style="display:none;">
<span class="area_span">id</span><span><input type="text" id="id" name="id" class="area_input" value=${starinfo.id}></span>
</div>
</form>
<div class="area_left c-fix">
<span class="area_span">艺人详情</span>
</div>
<div class="c-fix" style="margin-bottom:15px;"><textarea id="star_detail" placeholder="艺人详情" name="star_detail">${starinfo.star_detail}</textarea></div>


<div class="area_bkg2 c-fix" id="brokerinfo">艺人图片</div>
<form id="artistimg">
<div class="c-fix" style="padding-left:35px;margin-top:20px;">
<span class="area_span">艺人图片</span>
<span style="float:right;"> <input type="file" name="img" id="img" style="width:677px;border:1px solid rgb(239,235,242);float:left;margin-right:20px;"/><a href="#" class="addartistimg">上传</a></span>
</div>
</form>
<div id="artistimglist" style="margin-top:20px;"></div>
<%-- <div class="area_bkg2 c-fix" id="brokerinfo">艺人影视</div>
<form id="videoimg">
<div class="area_left">
<span class="area_span">影视编号</span><span><input type="text" id="video_id" name="video_id" class="area_input"></span>
</div>
<div class="area_right">
<span class="area_span">影视链接</span><span><input type="text" id="video_link" name="video_link" class="area_input"></span>
</div>
<div class="c-fix" style="padding-left:35px;margin-top:20px;">
<span class="area_span">影视图片</span>
<span style="float:right;"> <input type="file" name="video_pic" id="video_pic" style="width:677px;border:1px solid rgb(239,235,242);float:left;margin-right:20px;"/><a href="#" class="addvideoimg">添加</a></span>
</div>
</form>
<div id="videoimglist" style="margin-top:20px;">
<c:forEach var="item" items="${videoList}" varStatus="status">
<div style='float:left;padding-left:35px;width:900px;margin-top:5px;margin-bottom:5px;'>
<span style='padding-right:100px;'>${status.index + 1}</span><span style='padding-right:100px;'>${item.video_id}</span><span style='padding-right:100px;'>${item.video_link}</span><span style='padding-right:100px;'>${item.video_pic}</span><span style="display:none;">${item.id}</span><span><a href="#" class="editvideoimg" style='padding-right:10px;'>编辑</a><a href="#" class="deletevideoimg">删除</a></span>
</div>
</c:forEach>
</div> --%>
<div class="area_left4"><button type="button" class="btn" onclick="add()">提交</button></div>
<div class="area_right4"><button type="reset" class="btn" onclick="fanhui()">返回</button></div>
</div>

<script type="text/javascript">
CKEDITOR.replace( 'star_detail' );
</script>
<script type="text/javascript">
function add(){
	  var artistinfo=DataDeal.formToJson(data= decodeURIComponent($("#artistinfo").serialize(),true)); 
	  artistinfo=eval("("+artistinfo+")");
	  var detail=$("#star_detail").val(); 
	  //alert(detail);
	  $.ajax({
	 	    type: "POST",
	 		data: {"artistinfo":JSON.stringify(artistinfo),"artistimglist":JSON.stringify(artistimglist),"videoimglist":JSON.stringify(videoimglist),detail:detail},
	 		dataType: "json",
	 		url: "/editArtist",
	 		success:function(data){
	 			if(data.flag == 3){
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
var artistimglist=[];
var isartistimgedit=100;
var artistimgedititem;
var artistimgecount=0;
$(function(){
	$.ajaxSetup({  
	    contentType: "application/x-www-form-urlencoded; charset=utf-8"  
	});  
	$(".addartistimg").click(function(){
		if(isartistimgedit==100){
			if($('#img').val()==""){
				alert("请选择文件！");
				return false;}
			var artistimg={};
			var filenames=$('#img').val().split("\\");
			var filename=filenames[filenames.length-1];
			artistimg.img=filename;
			artistimglist.push(artistimg);
			$("#artistimglist").append("<div style='float:left;padding-left:35px;width:817px;padding-top:10px;'><span style='padding-right:50px;'>"+(++artistimgecount)+"</span><span style='padding-right:10px;'>"+artistimglist[artistimgecount-1].img+"</span><span style='padding-left: 30px;padding-right: 40px;'></span><span><a href='#' class='deleteartistimg'>删除</a></span></div>");			
			UploadFile("img");
			$("#artistimg input").each(function(){
				$(this).val("");
				});
			}
		});
	
	    $("#artistimglist").on("click",".deleteartistimg",function(){
		artistimglist.splice($(this).parent().parent().children().eq(0).text()-1,1);
		$(this).parent().parent().empty(); 		
		artistimgecount--;
		});
	
});

var videoimglist='${videoListJson}';
videoimglist=eval("("+videoimglist+")"); 
var isvideoimgedit=100;
var videoimgedititem;
var videoimgecount=videoimglist.length;
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
			videoimg=DataDeal.formToJson(data= decodeURIComponent($("#videoimg").serialize(),true)); 
			videoimg=eval("("+videoimg+")"); 
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
				videoimgedititem=DataDeal.formToJson(data= decodeURIComponent($("#videoimg").serialize(),true));
				videoimgedititem=eval("("+videoimgedititem+")");
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