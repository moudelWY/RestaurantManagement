<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html >
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="style/index.css" rel="stylesheet">
<link href="bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="bootstrap/css/bootstrap-responsive.css" rel="stylesheet">
<script src="bootstrap/js/jQuery.js"></script>
<script src="bootstrap/js/bootstrap.js"></script>
<script src="js/ckeditor/ckeditor.js"></script>
<script src="js/My97DatePicker/WdatePicker.js"></script>
<title></title>
<script type="text/javascript">
	
</script>
</head>
<body>
	<div class="data_list backMain">
		
		<div class="data_content">
			<table class="table table-hover table-bordered">
				<tr>
                   <th>菜品名称</th>
                   <th>订购数量</th>
                   <th>单价</th>
                   <th>合计</th>
                   
                 </tr>
				
				<tr>
				   <td>红烧肉</td>
                   <td>2</td>
                   <td>50</td>
                   <td>100</td>
				</tr>
				<tr>
				   <td>红烧肉</td>
                   <td>2</td>
                   <td>50</td>
                   <td>100</td>
				</tr>
				<tr>
				<td colspan="4" style="text-align: center;">本日销售总额:&nbsp;&nbsp;200元</td>
				</tr>
			</table>
			
		</div>
		
		<div class="pagination pagination-centered"></div>
	</div>
</body>
</html>