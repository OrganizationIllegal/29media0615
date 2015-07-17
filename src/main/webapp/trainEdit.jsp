<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html>
<head>
<title>培训编辑</title>
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
<div class="area_bkg1">当前位置:培训编辑</div>
<div class="area_bkg2">培训信息</div>
<form id="traininfo">
<div class="area_left">
<span class="area_span">培训编号</span><span><input type="text" id="train_id" name="train_id" class="area_input" value=${train.train_id} placeholder="请输入数字编号"></span>
</div>
<div class="area_right">
<span class="area_span">培训名称</span><span><input type="text" id="train_name" name="train_name" class="area_input" value=${train.train_name}></span>
</div>
<%-- <div class="area_left c-fix">
<span class="area_span">培训描述</span>
</div>
<div class="c-fix" style="margin-bottom:15px;margin-left:35px;"><textarea id="train_desc" name="train_desc" rows="3" cols="112" style="background-color:rgb(237,238,243);border:0px;">${train.train_desc}</textarea></div> --%>
<div class="area_right" style="display:none;">
<span class="area_span">id</span><span><input type="text" id="id" name="id" class="area_input" value=${train.id}></span>
</div>
</form>
<div class="area_bkg2 c-fix" id="brokerinfo">培训详情</div>
<form id="trainimg">
<div class="area_left">
<span class="area_span">标题</span><span><input type="text" id="title" name="title" class="area_input"></span>
</div>
<!-- <div class="area_right">
<span class="area_span">时间</span><span><input type="text" id="time" name="time" class="area_input" placeholder="请输入日期：yyyy-mm-dd"></span>
</div> -->
<div class="area_left c-fix">
<span class="area_span">详情</span>
</div>
<div class="c-fix" style="margin-bottom:15px;margin-left:35px;">
<textarea id="detail" name="detail" rows="3" cols="112" style="background-color:rgb(237,238,243);border:0px;"></textarea></div>
<div class="c-fix" style="padding-left:35px;margin-top:20px;">
<span class="area_span" style="float:left;">培训图片</span>
<span> <input type="file" name="train_img" id="train_img" style="width:600px;border:1px solid rgb(239,235,242);float:left;margin-right:40px;"/><a href="#" class="addtrainimg">添加</a></span>
</div>
<!-- <div class="area_left3"></div>
<div class="area_right3"><span class="area_span5"><a href="#" class="addtrainimg">添加</a></span></div> -->
</form>
<div id="trainimglist" style="margin-top:20px;">
<c:forEach var="item" items="${detailList}" varStatus="status">
<div style='float:left;padding-left:35px;width:900px;margin-top:5px;margin-bottom:5px;'>
<span style='padding-right:100px;'>${status.index + 1}</span><span style='padding-right:100px;'>${item.title}</span><span style='padding-right:100px;'>${item.time}</span><span style='padding-right:100px;'>${item.train_img}</span><span style="display:none;">${item.id}</span><span><a href="#" class="edittrainimg" style='padding-right:10px;'>编辑</a><a href="#" class="deletetrainimg">删除</a></span>
</div>
</c:forEach>
</div>
<div class="area_bkg2 c-fix" id="brokerinfo">艺能培训</div>
<form id="yineng">
<div class="area_left">
<span class="area_span">类型</span><span><input type="text" id="typename" name="typename" class="area_input"></span>
</div>
<div class="area_left c-fix">
<span class="area_span">详情</span>
</div>
<div class="c-fix" style="margin-bottom:15px;margin-left:35px;"><textarea id="detail1" name="detail" rows="3" cols="112" style="background-color:rgb(237,238,243);border:0px;"></textarea></div>
<div class="c-fix" style="padding-left:35px;margin-top:20px;">
<span class="area_span" style="float:left;">培训图片</span>
<span> <input type="file" name="img" id="img" style="width:600px;border:1px solid rgb(239,235,242);float:left;margin-right:40px;"/><a href="#" class="addyineng">添加</a></span>
</div>
</form>
<div id="yinenglist" style="margin-top:20px;">
<c:forEach var="item" items="${lianxiList}" varStatus="status">
<div style='float:left;padding-left:35px;width:900px;margin-top:5px;margin-bottom:5px;'>
<span style='padding-right:100px;'>${status.index + 1}</span><span style='padding-right:100px;'>${item.typename}</span><%-- <span style='padding-right:100px;'>${item.detail}</span> --%><span style='padding-right:100px;'>${item.img}</span><span style="display:none;">${item.id}</span><span><a href="#" class="edityineng" style='padding-right:10px;'>编辑</a><a href="#" class="deleteyineng">删除</a></span>
</div>
</c:forEach>
</div>
<div class="area_left4"><button type="button" class="btn" onclick="add()">提交</button></div>
<div class="area_right4"><button type="reset" class="btn" onclick="fanhui()">返回</button></div>
</div>
<script type="text/javascript">

function add(){
	  var traininfo=DataDeal.formToJson(data= decodeURIComponent($("#traininfo").serialize(),true)); 
	  traininfo=eval("("+traininfo+")");
	 /*  var traininfo={};
	  traininfo.train_id = $("#train_id"); 
	  traininfo.train_name = $("#train_name"); 
	  traininfo.train_desc = $("#train_desc"); */ 
	  
	  $.ajax({
	 	    type: "POST",
	 		data: {"traininfo":JSON.stringify(traininfo),"trainimglist":JSON.stringify(trainimglist),"yinenglist":JSON.stringify(yinenglist)},
	 		dataType: "json",
	 		url: "/editTrain",
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
var trainimglist='${detailListJson}';
trainimglist=eval("("+trainimglist+")"); 
$.each(trainimglist,function(index,element){
	var date=new Date(parseInt(trainimglist[index].time.time));
	trainimglist[index].time=date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate();
})
var istrainimgedit=100;
var trainimgedititem;
var trainimgecount=trainimglist.length;
$(function(){
	//alert(trainimglist.length)
	$.ajaxSetup({  
	    contentType: "application/x-www-form-urlencoded; charset=utf-8"  
	});  
	$(".addtrainimg").click(function(){
		if(istrainimgedit==100){
			if($('#train_img').val()==""){
				alert("请选择文件！");
				return false;}
			var trainimg={};
			var filenames=$('#train_img').val().split("\\");
			var filename=filenames[filenames.length-1];
			/* trainimg=DataDeal.formToJson(data= decodeURIComponent($("#trainimg").serialize(),true)); 
			trainimg=eval("("+trainimg+")"); */
			trainimg.title = $("#title").val();
			//trainimg.time = $("#time").val();
			trainimg.detail = $("#detail").val();
			var traintime=trainimg.time;
			/* if(!RQcheck(traintime)){
				  alert("请输入正确的日期！(yyyy-mm-dd)");
				  $("#time").focus();
				  return false;
				  } */
			trainimg.train_img=filename;
			trainimglist.push(trainimg);
			$("#trainimglist").append("<div style='float:left;padding-left:35px;width:817px;padding-top:10px;'><span style='padding-right:50px;'>"+(++trainimgecount)+"</span><span style='padding-right:50px;'>"+trainimglist[trainimgecount-1].train_img+"</span><span style='padding-right:50px;'>"+trainimglist[trainimgecount-1].title+"</span><span style='padding-left: 30px;padding-right: 40px;'></span><span><a href='#' style='padding-right:10px;' class='edittrainimg'>编辑</a><a href='#' class='deletetrainimg'>删除</a></span></div>");			
			UploadFile("train_img");
			$("#trainimg input").each(function(){
				$(this).val("");
				});
			}else{
				if($('#train_img').val()==""){
					alert("请选择文件！");
					return false;}
				//alert("edit");
				var filenames=$('#train_img').val().split("\\");
				var filename=filenames[filenames.length-1];
				/* trainimgedititem=DataDeal.formToJson(data= decodeURIComponent($("#trainimg").serialize(),true));
				trainimgedititem=eval("("+trainimgedititem+")"); */
				trainimgedititem["title"]=$("#title").val();
				//trainimgedititem["time"]=$("#time").val();
				trainimgedititem["detail"]=$("#detail").val();
				trainimgedititem["train_img"]=filename;
				UploadFile("train_img");
				$("#trainimg input").each(function(){
					$(this).val("");
					});
				trainimglist[istrainimgedit]=trainimgedititem;
				//alert($("#trainimglist").children().eq(istrainimgedit));
				$("#trainimglist").children().eq(istrainimgedit).html("<div style='float:left;width:817px;padding-top:10px;'><span style='padding-right:50px;'>"+(istrainimgedit+1)+"</span><span style='padding-right:50px;'>"+trainimglist[trainimgecount-1].train_img+"</span><span style='padding-right:50px;'>"+trainimglist[trainimgecount-1].title+"</span><span style='padding-right:50px;'>"+trainimglist[trainimgecount-1].time+"</span><span style='padding-left: 30px;padding-right: 40px;'><a href='#' style='padding-right:10px;' class='edittrainimg'>编辑</a><a href='#' class='deletetrainimg'>删除</a></span></div>").show();
				istrainimgedit=100;				
				}
		
		});
	
	    $("#trainimglist").on("click",".deletetrainimg",function(){
		trainimglist.splice($(this).parent().parent().children().eq(0).text()-1,1);
		$(this).parent().parent().empty(); 		
		trainimgecount--;
		});

	    $("#trainimglist").on("click",".edittrainimg",function(){			
			var index=$(this).parent().parent().children().eq(0).text()-1;
			//alert(index);
			alert("edit");
			trainimgedititem=trainimglist[index];
			$(this).parent().parent().hide();
			//alert(index+"index");
			istrainimgedit=index;
			$("#title").val(trainimgedititem.title);
			var date=new Date(trainimgedititem.time)
			//alert(trainimgedititem.time)
			//$("#time").val(date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate());
			trainimgedititem.detail = change(trainimgedititem.detail); 
			$("#detail").val(trainimgedititem.detail);
			}); 
	
});

function change(strvalue){
strvalue = strvalue.replace(/&amp;/g,"&");
strvalue = strvalue.replace(/&lt;/g,"<");
strvalue = strvalue.replace(/&gt;/g,">");
strvalue = strvalue.replace(/&quot;/g,"\"");
strvalue = strvalue.replace(/&#39;/g,"'");
strvalue = strvalue.replace(/&nbsp;/g, " "); 
return strvalue;
}




var yinenglist='${lianxiListJson}';
yinenglist=eval("("+yinenglist+")"); 
var isyinengedit=100;
var yinengedititem;
var yinengecount=yinenglist.length;
$(function(){
	$.ajaxSetup({  
	    contentType: "application/x-www-form-urlencoded; charset=utf-8"  
	});  
	$(".addyineng").click(function(){
		if(isyinengedit==100){
			if($('#img').val()==""){
				alert("请选择文件！");
				return false;}
			var yineng={};
			var filenames=$('#img').val().split("\\");
			var filename=filenames[filenames.length-1];
			/* yineng=DataDeal.formToJson(data= decodeURIComponent($("#yineng").serialize(),true)); 
			yineng=eval("("+yineng+")");  */
			yineng.typename=$("#typename").val();
			yineng.detail=$("#detail1").val();
			yineng.img=filename;
			yinenglist.push(yineng);
			
			$("#yinenglist").append("<div style='float:left;padding-left:35px;width:817px;padding-top:10px;'><span style='padding-right:50px;'>"+(++yinengecount)+"</span><span style='padding-right:50px;'>"+ yinenglist[yinengecount-1].img +"</span><span style='padding-right:50px;'>"+yinenglist[yinengecount-1].typename+"</span><span style='padding-left: 30px;padding-right: 40px;'></span><span><a href='#' style='padding-right:10px;' class='edityineng'>编辑</a><a href='#' class='deleteyineng'>删除</a></span></div>");			
			UploadFile("img");
			$("#yineng input").each(function(){
				$(this).val("");
				});
			}else{
				if($('#img').val()==""){
					alert("请选择文件！");
					return false;}
				//alert("edit");
				var filenames=$('#img').val().split("\\");
				var filename=filenames[filenames.length-1];
				/* yinengedititem=DataDeal.formToJson(data= decodeURIComponent($("#yineng").serialize(),true));
				yinengedititem=eval("("+yinengedititem+")"); */
				yinengedititem["typename"]=$("#typename").val();
				yinengedititem["detail"]=$("#detail1").val();
				yinengedititem["img"]=filename;
				UploadFile("img");
				$("#yineng input").each(function(){
					$(this).val("");
					});
				yinenglist[isyinengedit]=yinengedititem;
				//alert($("#yinenglist").children().eq(isyinengedit));
				$("#yinenglist").children().eq(isyinengedit).html("<div style='float:left;width:817px;padding-top:10px;'><span style='padding-right:50px;'>"+(isyinengedit+1)+"</span><span style='padding-right:50px;'>"+yinenglist[yinengecount-1].img+"</span><span style='padding-right:50px;'>"+yinenglist[yinengecount-1].typename+"</span><span style='padding-left: 30px;padding-right: 40px;'><a href='#' style='padding-right:10px;' class='edityineng'>编辑</a><a href='#' class='deleteyineng'>删除</a></span></div>").show();
				isyinengedit=100;				
				}
		});
	
	    $("#yinenglist").on("click",".deleteyineng",function(){
		yinenglist.splice($(this).parent().parent().children().eq(0).text()-1,1);
		$(this).parent().parent().empty(); 		
		yinengecount--;
		});

	    $("#yinenglist").on("click",".edityineng",function(){			
			var index=$(this).parent().parent().children().eq(0).text()-1;
			//alert(index);
			alert("edit");
			yinengedititem=yinenglist[index];
			$(this).parent().parent().hide();
			//alert(index+"index");
			isyinengedit=index;
			$("#typename").val(yinengedititem.typename);
			yinengedititem.detail = change(yinengedititem.detail);
			$("#detail1").val(yinengedititem.detail);
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