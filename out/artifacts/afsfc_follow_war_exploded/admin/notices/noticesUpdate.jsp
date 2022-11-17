<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>    
<!DOCTYPE html>
<html>
<head>
<base href="<%= basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="style/index.css" rel="stylesheet">
<link href="bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="bootstrap/css/bootstrap-responsive.css" rel="stylesheet">
<script src="bootstrap/js/jQuery.js"></script>
<script src="bootstrap/js/bootstrap.js"></script>
<script src="js/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
</script>
</head>
<body>
<div class="data_list backMain">

	<div class="data_content">
		<form  method="post" >
			<table style="padding: 5px">
				<tr>
					<td>
						<label>公告标题：</label>
					</td>
					<td>
						<input type="text" id="name" name="name" value="新增菜单《糖醋排骨》" />
					</td>
				</tr>
				<tr>
					<td valign="top">
						<label>公告内容：</label>
					</td>
					<td>
						<textarea class="ckeditor" id="content" name="content" >
						糖醋排骨超级好吃。再挑食的小朋友都无法拒绝酸甜的口味，吃光排骨，再用糖醋汁拌米饭，今天的饭量见长。
						</textarea>
					</td>
				</tr>
				<tr>
					<td>
						<input type="submit" id="btnSubmit" class="btn btn-primary" value="修改公告"/>&nbsp;&nbsp;
						<input type="button" class="btn btn-primary" value="返回" onclick="javascript:history.back()"/>&nbsp;&nbsp;
				</tr>
				
			</table>
			  <input type="hidden" name="id" value="1"/>
		</form>
	</div>
</div>
</body>
</html>