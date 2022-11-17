<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html >

<html>
<head>

<base href="<%= basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="style/index.css" rel="stylesheet">
<link href="bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="bootstrap/css/bootstrap-responsive.css" rel="stylesheet">
<script src="bootstrap/js/jQuery.js"></script>
<script src="bootstrap/js/bootstrap.js"></script>
<script type="text/javascript"></script>
	<script>
		function delClick(id){
			var b = confirm("确定要删除该条数据吗?");
			if (b){
				$.ajax({
					url:"${pageContext.request.contextPath}/admin/types?action=typesDel&id="+id,
				//	 date:{id:id},
				//	type:"get",
					success:function (){
						alert("删除成功~")
						location.href="${pageContext.request.contextPath}/admin/types?action=typesAll"
					}
				})
			}
		}

		function cheClick(id){
			location.href="${pageContext.request.contextPath}/admin/types?action=cheById&id="+id
		}
	</script>

</head>
<body>

<div class="data_list backMain">
	<div class="data_content">
		<table class="table table-hover table-bordered">
			<tr>
				<th>类别编号</th>
				<th>类别名称</th>
				<th>操作</th>
			</tr>
				<c:forEach items="${typesAll}" var="tepes">
				<tr>
					<td>${tepes.id}</td>
					<td>${tepes.name}</td>
					<td>
                         <button class="btn  btn-info" onclick="cheClick(${tepes.id})" type="button">修改</button>&nbsp;
						<button class="btn btn-danger"  onclick="delClick(${tepes.id}) " type="button">删除</button>
					</td>
				</tr>
				</c:forEach>

		</table>
	</div>
</div>
</body>

</html>