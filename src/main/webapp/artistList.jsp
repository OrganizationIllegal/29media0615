<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html>
<head>
<title>艺人列表</title>
<link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/input.css" />

<link href="/bootstrap/css/bootstrap-table.css" rel="stylesheet">
<link href="/bootstrap/css/bootstrap-editable.css" rel="stylesheet">
<link href="/bootstrap/css/examples.css" rel="stylesheet">

<script src="/js/jquery.min.js"></script>
<script src="/bootstrap/js/bootstrap.min.js"></script>


<script src="/bootstrap/js/bootstrap-table.js"></script>
<script src="/bootstrap/js/bootstrap-editable.js"></script>
<script src="/bootstrap/js/bootstrap-table-export.js"></script>
<script src="/bootstrap/js/bootstrap-table-editable.js"></script>
<script src="/bootstrap/js/tableExport.js"></script>

<style type="text/css">
body{
	/* background-color:rgb(232, 233, 234)!important; */
	font-family:"Microsoft YaHei"!important;
}
</style>

</head>
<body>
<div style="width:900px;margin:25px auto;">
<div class="area_bkg1">当前位置:艺人列表</div>
 <table id="table"          
           data-pagination="true"
           data-side-pagination="server"
           data-url="/ArtistList"
           data-response-handler="responseHandler"
           >
        <thead>
        <tr>
            <th data-field="state" data-checkbox="true"></th>
            <th data-field="id" data-sortable="true" data-editable="true">ID</th>
            <th data-field="star_num" data-sortable="true" data-editable="true">艺人编号</th>
            <th data-field="chinese_name" data-sortable="true" data-editable="true">姓名</th>
            <th data-field="sex" data-sortable="true" data-editable="true">性别</th>
            <th data-field="star_img" data-sortable="true" data-editable="true">图片</th>
            <th data-field="operate"
                data-formatter="operateFormatter"
                data-events="operateEvents">Item Operate</th>
        </tr>
        </thead>
    </table>
</div>


<script>
    var $table = $('#table'),
    selections = [];
	var i=0;
    $(function () {       
        $table.bootstrapTable({
            height: getHeight()
        });       
    });

    function operateFormatter(value, row, index) {
        return [
            '<a class="edit" href="javascript:void(0)" title="edit">',
            '<i class="glyphicon glyphicon-heart"></i>',
            '</a>  ',
            '<a class="remove" href="javascript:void(0)" title="Remove">',
            '<i class="glyphicon glyphicon-remove"></i>',
            '</a>'
        ].join('');
    }
    
    window.operateEvents = {
    	 'click .edit': function (e, value, row, index) {
                //alert(row.id);
                var id = row.id;
                window.open ('findArtist?id='+id);               
    	 },  
         	 	
        'click .remove': function (e, value, row, index) {
            //alert(row.id);
            var id = row.id;
            var star_num=row.star_num;
             $.ajax({
		 	    type: "POST",
		 		data: {id: id,star_num: star_num},
		 		dateType: "json",
		 		url: "/deleteArtist",		 		
		 		success:function(data){
		 			data=eval("("+data+")");
		 			if(data.flag == 3){
		 				alert("删除成功！");
		 			}else if(data.flag ==0){
		 				alert("删除失败！");
		 			}
		 		},
		 		error:function(){
		 			alert("error")
		 		}
	 	});
                     
            
            $table.bootstrapTable('remove', {
                field: 'id',
                values: [row.id]
            });
        }
    };
    function getHeight() {
        return $(window).height() - $('h1').outerHeight(true);
    }
</script>
</body>
</html>