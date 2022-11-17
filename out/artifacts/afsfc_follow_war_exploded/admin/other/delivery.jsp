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
<base href="<%= basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="style/index.css" rel="stylesheet">
<link href="bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="bootstrap/css/bootstrap-responsive.css" rel="stylesheet">
<script src="bootstrap/js/jQuery.js"></script>
<script src="bootstrap/js/bootstrap.js"></script>
<script src="js/ckeditor/ckeditor.js"></script>
<title>菜单修改</title>
<script type="text/javascript">
	
</script>
</head>
<body>
<div class="data_list backMain">
	<div class="data_content">
		<form id="formNews"  method="post">
			<table style="padding: 5px">
				<tr>
					<td>
						<label>配送说明标题：</label>
					</td>
					<td>
						<input type="text" id="name" name="name" value="配送说明" />
					</td>
				</tr>
				<tr>
					<td>
						<label>午餐配送时间：</label>
					</td>
					<td>
						<input type="text" id="lunchtime" name="lunchtime" value="12:00~14:00" />
						
					</td>
				</tr>
				<tr>
					<td>
						<label>晚餐配送时间：</label>
					</td>
					<td>
						<input type="text" id="dinnertime" name="dinnertime"  value="18:00~21:00"/>
						
					</td>
				</tr>
				<tr>
					<td>
						<label>联系电话：</label>
					</td>
					<td>
						<input type="text" id="phone" name="phone" value="18660700000" />
					
					</td>
				</tr>
				<tr>
					<td>
						<label>联系人：</label>
					</td>
					<td>
						<input type="text" id="contacts" name="contacts" value="王经理" />
					
					</td>
				</tr>
				
				
				<tr>
					<td valign="top">
						<label>内容：</label>
					</td>
					<td>
						<textarea class="ckeditor" id="content" name="content">
						到货时请支付现金，本店暂不支持网上付费，谢谢合作！
						</textarea>
					</td>
				</tr>
			</table>
			<p>
			<br>
			<input type="submit" id="btnSubmit" class="btn btn-primary"  value="修改菜品"/>&nbsp;&nbsp;
			<input type="button" class="btn btn-primary" value="返回" onclick="javascript:history.back()"/>&nbsp;&nbsp;
					
			</p>
			  <input type="hidden" name="id" value="1"/>
		</form>
	</div>
</div>	
</body>
</html>