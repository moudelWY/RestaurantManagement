<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>    
<!DOCTYPE html >
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta content="" name=keywords />
<meta content="" name=description />
</head>
<body style='background:transparent'>
<div id="bottommenu">

<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="center" valign="top">
      <a href="our.jsp" target="_self">关于我们</a>|
      <a href="carry.jsp" target="_self">配送说明</a>|   
    
    </td>
  </tr>
  <tr>
    <td align="center" valign="top">
    <span > Copyright(C)2017-2020</span></td>
  </tr>
</table>
</div>


</body>
</html>
