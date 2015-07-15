<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html>
<head>
<title>首页录入</title>
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
<div class="area_bkg1">当前位置:首页录入</div>
<div class="area_bkg2">图片录入</div>
<form id="indeximg">
<div class="area_left">
<span class="area_span">类型</span>
<span>
<select class="area_select" id="type" name="type">
  <option value ="顶部轮播">顶部轮播</option>
  <option value ="培训轮播">培训轮播</option>
  <option value ="明星图片">明星图片</option>
  <option value ="影视图片">影视图片</option>
</select>
</span>
</div>
<div class="area_right">
<span class="area_span">图片链接</span>
<input type="text" id="href" name="href" >
</div>
<div class="c-fix" style="padding-left:35px;margin-top:50px;">
<span class="area_span" style="float:left;">轮播图片</span>
<span> <input type="file" name="img" id="img" style="width:600px;border:1px solid rgb(239,235,242);float:left;margin-right:40px;"/><a href="#" class="addindeximg">添加</a></span>
</div>
</form>
<div id="indeximglist" style="margin-top:20px;"></div>
<div class="area_left4"><button type="button" class="btn" onclick="add()">提交</button></div>
<div class="area_right4"><button type="reset" class="btn">重置</button></div>
</div>
<script type="text/javascript">
function add(){
	  var h = $("#href").val();
	  indeximglist.href = $("#href").val();
	  alert(indeximglist.href)
	  $.ajax({
	 	    type: "POST",
	 		data: {"h":h, "indeximglist":JSON.stringify(indeximglist)},
	 		dataType: "json",
	 		url: "/inputLunbo",
	 		success:function(data){
	 			if(data.flag == 1){
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
</script>
<script type="text/javascript">
var indeximglist=[];
var isindeximgedit=100;
var indeximgedititem;
var indeximgecount=0;
$(function(){
	$.ajaxSetup({  
	    contentType: "application/x-www-form-urlencoded; charset=utf-8"  
	});  
	$(".addindeximg").click(function(){
		if(isindeximgedit==100){
			if($('#img').val()==""){
				alert("请选择文件！");
				return false;}
			var indeximg={};
			var filenames=$('#img').val().split("\\");
			var filename=filenames[filenames.length-1];
			indeximg=DataDeal.formToJson(data= decodeURIComponent($("#indeximg").serialize(),true));
			indeximg=eval("("+indeximg+")"); 
			indeximg.img=filename;
			indeximglist.push(indeximg);
			$("#indeximglist").append("<div style='float:left;padding-left:35px;width:900px;margin-top:5px;margin-bottom:5px;'><span style='padding-right:100px;'>"+(++indeximgecount)+"</span><span style='padding-right:100px;'>"+indeximglist[indeximgecount-1].type+"</span><span style='padding-right:100px;'>"+indeximglist[indeximgecount-1].img+"</span><span><a href='#' style='padding-right:10px;' class='editindeximg'>编辑</a><a href='#' class='deleteindeximg'>删除</a></span></div>");			
			UploadFile("img");
			$("#indeximg input").each(function(){
				$(this).val("");
				});
			}else{
				if($('#img').val()==""){
					alert("请选择文件！");
					return false;}
				//alert("edit");
				var filenames=$('#img').val().split("\\");
				var filename=filenames[filenames.length-1];
				indeximgedititem=DataDeal.formToJson(data= decodeURIComponent($("#indeximg").serialize(),true));
				indeximgedititem=eval("("+indeximgedititem+")");
				indeximgedititem["img"]=filename;
				UploadFile("img");
				$("#indeximg input").each(function(){
					$(this).val("");
					});
				indeximglist[isindeximgedit]=indeximgedititem;
				//alert($("#indeximglist").children().eq(isindeximgedit));
				$("#indeximglist").children().eq(isindeximgedit).html("<div style='float:left;width:900px;margin-top:5px;margin-bottom:5px;'><span style='padding-right:100px;'>"+(isindeximgedit+1)+"</span><span style='padding-right:100px;'>"+indeximglist[indeximgecount-1].type+"</span><span style='padding-right:100px;'>"+indeximglist[indeximgecount-1].img+"</span><span><a href='#' style='padding-right:10px;' class='editindeximg'>编辑</a><a href='#' class='deleteindeximg'>删除</a></span></div>").show();
				isindeximgedit=100;				
				}
		});
	
	    $("#indeximglist").on("click",".deleteindeximg",function(){
		indeximglist.splice($(this).parent().parent().children().eq(0).text()-1,1);
		$(this).parent().parent().empty(); 		
		indeximgecount--;
		});

	    $("#indeximglist").on("click",".editindeximg",function(){			
			var index=$(this).parent().parent().children().eq(0).text()-1;
			//alert(index);
			alert("edit");
			indeximgedititem=indeximglist[index];
			$(this).parent().parent().hide();
			//alert(index+"index");
			isindeximgedit=index;
			$("#type").val(indeximgedititem.title);
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