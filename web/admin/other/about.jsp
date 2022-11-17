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
						<label>标题：</label>
					</td>
					<td>
						<input type="text" id="title" name="title" value="关于我们" />
					</td>
				</tr>
				
				
				<tr>
					<td valign="top">
						<label>内容：</label>
					</td>
					<td>
						<textarea class="ckeditor" id="content" name="content">
						      皇家每羊私房菜有限公司是山东省济宁市一家拥有国际品牌的知名企业。自2019年创办第一家专营粤菜的海鲜大酒楼以来，公司现已发展成为集餐饮、休闲、娱乐为一体的连锁性综合机构。 公司倾心打造至高品味的美食场所，创立了最爱中餐、燕鲍翅精作房等特色餐饮品牌，将传统大型中餐与特色餐饮相结合，形成独特的店中店模式，满足不同消费群体的不同需求。专业的团队，个性化的装修、极显人性化的亲和服务。一直以来，对美食的执着与创新，精彩的演绎着美食的至高境界。
						</textarea>
					</td>
				</tr>
			</table>
			<p>
			<br>
			<input type="submit" id="btnSubmit" class="btn btn-primary"  value="更新"/>&nbsp;&nbsp;
			<input type="button" class="btn btn-primary" value="返回" onclick="javascript:history.back()"/>&nbsp;&nbsp;
					
			</p>
			  <input type="hidden" name="id" value="1"/>
		</form>
	</div>
</div>	
</body>
</html>