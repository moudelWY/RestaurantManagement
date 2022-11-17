<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<script type="text/javascript">
	
</script>
</head>
<body>
	<div class="data_list backMain">
		<div class="data_content">
			<table class="table table-hover table-bordered">
				<tr >
					<th>标题</th>
					<th>内容</th>
					<th>发布时间</th>
					<th>操作</th>
				</tr>
				<tr>
					<td align="center" width="20%">新增菜单《糖醋排骨》</td>
					<td align="center" width="40%">糖醋排骨超级好吃。再挑食的小朋友都无法拒绝酸甜的口味，吃光排骨，再用糖醋汁拌米饭，今天的饭量见长。</td>
					<td align="center" width="20%">2015-02-28 13:49:40</td>
					<td align="center" width="20%">
						<a href="${pageContext.request.contextPath }/admin/notices/noticesUpdate.jsp"><button class="btn  btn-info" type="button">修改</button></a>&nbsp;
						<a href="#"><button class="btn btn-danger" type="button">删除</button></a>&nbsp;
					</td>
				</tr>
				<tr>
					<td align="center" width="20%">新增菜单《糖醋排骨》</td>
					<td align="center" width="40%">糖醋排骨超级好吃。再挑食的小朋友都无法拒绝酸甜的口味，吃光排骨，再用糖醋汁拌米饭，今天的饭量见长。</td>
					<td align="center" width="20%">2015-02-28 13:49:40</td>
					<td align="center" width="20%">
						<a href="${pageContext.request.contextPath }/admin/notices/noticesUpdate.jsp"><button class="btn  btn-info" type="button">修改</button></a>&nbsp;
						<a href="#"><button class="btn btn-danger" type="button">删除</button></a>&nbsp;
					</td>
				</tr>
				<tr>
					<td align="center" width="20%">新增菜单《糖醋排骨》</td>
					<td align="center" width="40%">糖醋排骨超级好吃。再挑食的小朋友都无法拒绝酸甜的口味，吃光排骨，再用糖醋汁拌米饭，今天的饭量见长。</td>
					<td align="center" width="20%">2015-02-28 13:49:40</td>
					<td align="center" width="20%">
						<a href="${pageContext.request.contextPath }/admin/notices/noticesUpdate.jsp"><button class="btn  btn-info" type="button">修改</button></a>&nbsp;
						<a href="#"><button class="btn btn-danger" type="button">删除</button></a>&nbsp;
					</td>
				</tr>
				<tr>
					<td align="center" width="20%">新增菜单《糖醋排骨》</td>
					<td align="center" width="40%">糖醋排骨超级好吃。再挑食的小朋友都无法拒绝酸甜的口味，吃光排骨，再用糖醋汁拌米饭，今天的饭量见长。</td>
					<td align="center" width="20%">2015-02-28 13:49:40</td>
					<td align="center" width="20%">
						<a href="${pageContext.request.contextPath }/admin/notices/noticesUpdate.jsp"><button class="btn  btn-info" type="button">修改</button></a>&nbsp;
						<a href="#"><button class="btn btn-danger" type="button">删除</button></a>&nbsp;
					</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>