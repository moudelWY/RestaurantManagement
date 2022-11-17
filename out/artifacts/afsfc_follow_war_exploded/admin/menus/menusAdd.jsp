<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html >
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<title>添加新菜单</title>
<script type="text/javascript">
	
</script>
</head>
<body>
<div class="data_list backMain">
	<div class="data_content">
		<form id="formNews"  method="post" action="<%=request.getContextPath()%>/admin/MenusController?action=menusAdd" enctype="multipart/form-data">
			<table style="padding: 5px">
				<tr>
					<td>
						<label>菜品名称：</label>
					</td>
					<td>
						<input type="text" id="name" name="name" />
					</td>
				</tr>
				<tr>
					<td>
						<label>原料：</label>
					</td>
					<td>
						<input type="text" id="burden" name="burden" />
						
					</td>
				</tr>
				<tr>
					<td>
						<label>市场价格：</label>
					</td>
					<td>
						<input type="text" id="price" name="price" />
						
					</td>
				</tr>
				<tr>
					<td>
						<label>会员价格：</label>
					</td>
					<td>
						<input type="text" id="price1" name="price1" />
					
					</td>
				</tr>
				<tr>
					<td>
						<label>菜品类别：</label>
					</td>
					<td>
						<select id="typeid" name="typeid">
							<option value="">请选择菜品类别</option>
							<c:forEach items="${allTypes}" var="types">
								<option value="${types.id}">${types.name}</option>

							</c:forEach>
								
						</select>
						
					</td>
				</tr>
				<tr>
					<td>
						<label>上传图片：</label>
					</td>
					<td>
						<input type="file" id="img" name="img" />
						
					</td>
				</tr>
				
				<tr>
					<td valign="top">
						<label>说明：</label>
					</td>
					<td>
						<textarea class="ckeditor" id="brief" name="brief"></textarea>
					</td>
				</tr>
			</table>
			<p>
			<br>
			<input type="submit" id="btnSubmit" class="btn btn-primary"  value="保存菜单"/>&nbsp;&nbsp;
			<input type="button" class="btn btn-primary" value="返回" onclick="javascript:history.back()"/>&nbsp;&nbsp;
					
			</p>
		</form>
	</div>
</div>	
</body>
</html>