<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html>
<head>
<title>培训列表</title>
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
<div class="area_bkg1">当前位置:培训列表</div>
 <table id="table"          
           data-pagination="true"
           data-side-pagination="server"
           data-url="/TrainList"
           data-response-handler="responseHandler"
           >
        <thead>
        <tr>
            <th data-field="state" data-checkbox="true"></th>
            <th data-field="id" data-sortable="true" data-editable="true">ID</th>
            <th data-field="train_id" data-sortable="true" data-editable="true">培训编号</th>
            <th data-field="train_name" data-sortable="true" data-editable="true">培训名称</th>
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
                window.open ('findTrain?id='+id);               
    	 },  
         	 	
        'click .remove': function (e, value, row, index) {
            //alert(row.id);
            var id = row.id;
            
             $.ajax({
		 	    type: "POST",
		 		data: {id: id},
		 		dateType: "json",
		 		url: "/deleteTrain",		 		
		 		success:function(data){
		 			if(data.flag == 1){
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