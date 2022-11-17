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
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="style/index.css" rel="stylesheet">
<link href="bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="bootstrap/css/bootstrap-responsive.css" rel="stylesheet">
<script src="bootstrap/js/jQuery.js"></script>
<script src="bootstrap/js/bootstrap.js"></script>
<script src="js/ckeditor/ckeditor.js"></script>
<script src="js/My97DatePicker/WdatePicker.js"></script>
<title>新闻维护</title>
<script type="text/javascript">
	function menusDel(id){
	    var b = confirm("确定要删除该条信息吗");
	    if (b){
	        $.ajax({
                url:"${pageContext.request.contextPath}/admin/MenusController",
                data:{id:id,action:"menusDel"},
                success:function (){
                    alert("删除成功~");
                    location.href="${pageContext.request.contextPath}/admin/MenusController?action=selectMenusByPage"
                }
            })
        }
    }
</script>
</head>
<body>
	<div class="data_list backMain">
		
		<div class="data_content">
			<table class="table table-hover table-bordered">
				<tr>
                    <th>菜单名称</th>
                    <th>展示图片</th>
                    <th>原料</th>
                    <th>类型</th>
                    <th>说明</th>
                    <th>市场价格</th>
                    <th>市场价销售数量</th>
                    <th>会员单价</th>
                    <th>会员价销售数量</th>
                    <th>操作</th>
                 </tr>
				<c:forEach items="${page.list}" var="menus">
				<tr>
				   <td>${menus.name}</td>
                   <td>
                       <a href= "${pageContext.request.contextPath }/admin/menus/img.jsp?imp=${menus.imgpath}">
                       <img src="${menus.imgpath}" width="30" height="30"></a>
                   </td>
                    <td>${menus.burden}</td>
                    <td>${menus.typeName}</td>
                    <td>${menus.brief}</td>
                    <td>${menus.price}</td>
                    <td>${menus.sums}</td>
                    <td>${menus.price1}</td>
                    <td>${menus.sums1}</td>
					<td>
						<a href="${pageContext.request.contextPath }/admin/MenusController?action=menusCheSelect&id=${menus.id}"><button class="btn  btn-info" type="button">修改</button></a>&nbsp;
						<a href="#"><button class="btn btn-danger" onclick="menusDel(${menus.id})" type="button">删除</button></a>&nbsp;
					</td>
				</tr>
                </c:forEach>
				
			</table>
			<p style="text-align: center;">
			<span>第${page.currentPage}页 共${page.totalPage}页</span>&nbsp;&nbsp;
                
                <c:choose>
                    <c:when test="${page.currentPage == 1 }">
                    </c:when>
                    <c:otherwise>

                        <a href="${pageContext.request.contextPath}/admin/MenusController?action=selectMenusByPage&currentPage=1">[首页]</a>&nbsp;&nbsp;
                        <a href="${pageContext.request.contextPath}/admin/MenusController?action=selectMenusByPage&currentPage=${page.currentPage-1}">[上一页]</a>

                    </c:otherwise>
                </c:choose>

                <c:choose>
                    <c:when test="${page.currentPage == page.totalPage }">
                    </c:when>
                    <c:otherwise>
                        <a href="${pageContext.request.contextPath}/admin/MenusController?action=selectMenusByPage&currentPage=${page.totalPage}">[尾页]</a>
                        <a href="${pageContext.request.contextPath}/admin/MenusController?action=selectMenusByPage&currentPage=${page.currentPage+1}">[下一页]</a>
                    </c:otherwise>
                </c:choose>
            </p>
		</div>
		
		<div class="pagination pagination-centered"></div>
	</div>
</body>
</html>