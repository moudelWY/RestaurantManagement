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
<title></title>
<script type="text/javascript">
	
</script>
</head>
<body>
<div class="data_list backMain">
	<div class="data_content">
		<form  method="post" action="${pageContext.request.contextPath }/login.jsp">
			<table style="padding: 5px">
				<tr>
					<td>
						<label>新的账户：</label>
					</td>
					<td>
						<input type="text" id="name" name="name" value="sa" />
					</td>
				</tr>
				<tr>
					<td>
						<label>新的密码：</label>
					</td>
					<td>
						<input type="password" id="pwd" name="pwd" value="1234" />
					</td>
				</tr>
				<tr>
				
					<td>
						<input type="submit" id="btnSubmit" class="btn btn-primary"  value="修改账户"/>&nbsp;&nbsp;
						<input type="button" class="btn btn-primary" value="返回" onclick="javascript:history.back()"/>&nbsp;&nbsp;<font id="error" color="red"></font>
					</td>
				</tr>
				
			</table>
			 <input type="hidden" name="id" value="1"/>
		</form>
	</div>
</div>
</body>
<script type="text/javascript">
//1.获取请求参数值
var flag=${param.flag};
//2.对请求参数值进行判断
if(flag==-1){
	alert("账户名已存在");
}else if(flag==0){
	alert("修改失败");
}
</script>
</html>