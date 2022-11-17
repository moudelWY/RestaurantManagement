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
<script src="${pageContext.request.contextPath }/js/My97DatePicker/WdatePicker.js"></script>
<title></title>
<script type="text/javascript">
	
</script>
</head>
<body>
	<div class="data_list backMain">
		<div class="search_content" style="vertical-align: middle;">
			<form action="" method="post">
				用户ID: <input type="text" name="userid" value="">&nbsp;&nbsp;
				菜品名称： <input type="text" name="menuname" value="">&nbsp;&nbsp;
				销售日期:<input type="text" name="date" class="Wdate"
					onclick="WdatePicker()" style="width: 120px;" value="" />&nbsp;&nbsp;
				<button class="btn  btn-primary" type="submit"
					style="margin-top: -8px;">查询</button>
			</form>
		</div>
		<div class="data_content">
			<table class="table table-hover table-bordered">
				<tr>
                   <th>用户ID</th>
                   <th>真实姓名</th>
                   <th>联系方式</th>
                   <th>家庭住址</th>
                   <th>菜品名称</th>
                   <th>订购数量</th>
                   <th>单价(元)</th>
                   <th>合计(元)</th>
                   <th>订购时间</th>
                   <th>是否派送</th>
                  
                 </tr>
				
				<tr>
				   <td>1</td>
                   <td>张三</td>
                   <td>18660704000</td>
                   <td>北京</td>
                   <td>粉蒸肉</td>
                   <td>1</td>
                   <td>100</td>
                   <td>100</td>
                   <td>2015-02-15 13:16:28</td>
                   <td>否</td>
				   
				</tr>
				<tr>
				   <td>1</td>
                   <td>张三</td>
                   <td>18660704000</td>
                   <td>北京</td>
                   <td>粉蒸肉</td>
                   <td>1</td>
                   <td>100</td>
                   <td>100</td>
                   <td>2015-02-15 13:16:28</td>
                   <td>否</td>
				   
				</tr>
				<tr>
				   <td>1</td>
                   <td>张三</td>
                   <td>18660704000</td>
                   <td>北京</td>
                   <td>粉蒸肉</td>
                   <td>1</td>
                   <td>100</td>
                   <td>100</td>
                   <td>2015-02-15 13:16:28</td>
                   <td>否</td>
				  
				</tr>
				<tr>
				   <td>1</td>
                   <td>张三</td>
                   <td>18660704000</td>
                   <td>北京</td>
                   <td>粉蒸肉</td>
                   <td>1</td>
                   <td>100</td>
                   <td>100</td>
                   <td>2015-02-15 13:16:28</td>
                   <td>否</td>
				  
				</tr>
				<tr>
				   <td>1</td>
                   <td>张三</td>
                   <td>18660704000</td>
                   <td>北京</td>
                   <td>粉蒸肉</td>
                   <td>1</td>
                   <td>100</td>
                   <td>100</td>
                   <td>2015-02-15 13:16:28</td>
                   <td>否</td>
				   
				</tr>
				
			</table>
			<p style="text-align: center;">
			<span>第1页 共1页</span>&nbsp;&nbsp;
             <a href="#">[首页]</a>
             <a href="#">[尾页]</a>&nbsp;&nbsp;
             <a href="#">[上一页]</a>
             <a href="#">[下一页]</a>
			</p>
		</div>
		
		<div class="pagination pagination-centered"></div>
	</div>
</body>
</html>