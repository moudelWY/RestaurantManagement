<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
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
    <title>菜单修改</title>
    <script type="text/javascript">
            function menusChe(){
                var b = confirm("确定要修改吗~");
                if (b){
                    $.ajax({
                        url:"${pageContext.request.contextPath}/admin/MenusController?action=menusChe",
                        data:{
                            id:$("#id").val(),
                            name:$("#name").val(),
                            burden:$("#burden").val(),
                            price:$("#price").val(),
                            price1:$("#price1").val(),
                            typeid:$("#typeid").val(),
                            brief:CKEDITOR.instances['brief'].getData()
                        },
                        success:function (date){
                            var parse1 = JSON.parse(date);
                            if (parse1.choose){
                                alert("修改成功~")
                                location.href="${pageContext.request.contextPath}/admin/MenusController?action=selectMenusByPage"
                            }else{
                                alert("修改失败~已存在该名称的菜品~")
                            }
                          /*  alert("修改成功~")
                            location.href="${pageContext.request.contextPath}/admin/MenusController?action=selectMenusByPage"*/
                        }
                    })
                }else {
                    console.log("用户取消修改~")
                }
            }
    </script>
</head>
<body>
<div class="data_list backMain">
    <div class="data_content">
        <form id="formNews" method="post">
            <table style="padding: 5px">
                <tr>
                    <td>
                        <label>菜品名称：</label>
                    </td>
                    <td>
                        <input type="text" id="name" name="name" value="${menus.name}"/>
                    </td>
                </tr>
                <%--				req.setAttribute("menus",menus);--%>
                <%--				req.setAttribute("allTypes",allTypes);--%>
                <tr>
                    <td>
                        <label>原料：</label>
                    </td>
                    <td>
                        <input type="text" id="burden" name="burden" value="${menus.burden}"/>

                    </td>
                </tr>
                <tr>
                    <td>
                        <label>市场价格：</label>
                    </td>
                    <td>
                        <input type="text" id="price" name="price" value="${menus.price}"/>

                    </td>
                </tr>
                <tr>
                    <td>
                        <label>会员价格：</label>
                    </td>
                    <td>
                        <input type="text" id="price1" name="price1" value="${menus.price1}"/>

                    </td>
                </tr>
                <tr>
                    <td>
                        <label>菜品类别：</label>
                    </td>
                    <td>
                        <select id="typeid" name="typeid">
                            <c:forEach items="${allTypes}" var="types">
                                <c:if test="${types.id ==  menus.typeid}">
                                    <option selected value="${types.id}">${types.name}</option>
                                </c:if>
                                <c:if test="${types.id !=  menus.typeid}">
                                    <option value="${types.id}">${types.name}</option>

                                </c:if>
                            </c:forEach>
                        </select>

                    </td>
                </tr>
                <tr>
                    <td>
                        <label>展示图片：</label>
                    </td>
                    <td>
                        <img src="${pageContext.request.contextPath}/${menus.imgpath}">
                    </td>
                </tr>

                <tr>
                    <td valign="top">
                        <label>说明：</label>
                    </td>
                    <td>
                        <textarea class="ckeditor" id="brief" name="${menus.brief}">111</textarea>
                    </td>
                </tr>
            </table>
            <p>
                <br>
                <input type="submit" id="btnSubmit" class="btn btn-primary" onclick="menusChe()" value="修改菜品"/>&nbsp;&nbsp;
                <input type="button" class="btn btn-primary" value="返回" onclick="javascript:history.back()"/>&nbsp;&nbsp;

            </p>
            <input type="hidden" name="id" id="id" value="${menus.id}"/>
        </form>
    </div>
</div>
</body>
</html>