<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html>
<head>
<title>新闻编辑</title>
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
<div class="area_bkg1">当前位置:新闻编辑</div>
<div class="area_bkg2">新闻信息</div>
<form id="newsinfo">
<div class="area_left">
<span class="area_span">新闻编号</span><span><input type="text" id="news_id" name="news_id" class="area_input" value=${newstrends.news_id} ></span>
</div>
<div class="area_right">
<span class="area_span">新闻标题</span><span><input type="text" id="title" name="title" class="area_input" value=${newstrends.title}></span>
</div>
<div class="area_left">
<span class="area_span">发布时间</span><span><input type="text" id="time" name="time" class="area_input" value=${newstrends.time}></span>
</div>
<div class="area_right" style="display:none;">
<span class="area_span">id</span><span><input type="text" id="id" name="id" class="area_input" value=${newstrends.id}></span>
</div>
</form>

<div class="area_left c-fix">
<span class="area_span">新闻详情</span>
</div>
<%-- <div class="c-fix" style="margin-bottom:15px;margin-left:35px;"><textarea id="detail" name="detail" rows="3" cols="112" style="background-color:rgb(237,238,243);border:0px;" >${newstrends.detail}</textarea></div> --%>
<div class="c-fix" style="margin-bottom:15px;"><textarea id="detail" placeholder="新闻详情" name="detail">${newstrends.detail}</textarea></div>
<div class="area_bkg2 c-fix" id="newsimg">新闻图片</div>
<form id="newsimg">
<div class="c-fix" style="padding-left:35px;margin-top:20px;">
<span class="area_span" style="float:left;">培训图片</span>
<span> <input type="file" name="news_image" id="news_image" style="width:600px;border:1px solid rgb(239,235,242);float:left;margin-right:40px;"/><a href="#" class="addnewsimg">上传</a></span>
</div>
</form>
<div id="newsimglist" style="margin-top:20px;"></div>
<div class="area_left4"><button type="button" class="btn" onclick="add()">提交</button></div>
<div class="area_right4"><button type="reset" class="btn" onclick="fanhui()">返回</button></div>
</div>
<script type="text/javascript">
CKEDITOR.replace( 'detail' );
</script>
<script type="text/javascript">
function add(){
	  var newsinfo=DataDeal.formToJson(data= decodeURIComponent($("#newsinfo").serialize(),true));
	  newsinfo=eval("("+newsinfo+")");
	  var result = $("#detail").val();
	  //alert(result)
	  newsinfo.detail = result;
	  $.ajax({
	 	    type: "POST",
	 		data: {"result":result, "newsinfo":JSON.stringify(newsinfo),"newsimglist":JSON.stringify(newsimglist)},
	 		dataType: "json",
	 		url: "/editNewsTrends",
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
</body>
</html>