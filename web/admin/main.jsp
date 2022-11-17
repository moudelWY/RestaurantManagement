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
<link rel="stylesheet" href="admin/resources/css/pintuer.css">
<link rel="stylesheet" href="admin/resources/css/admin.css">
<script src="admin/resources/scripts/jquery-1.3.2.min.js"></script>
<title>阿婆私房菜管理平台</title>
<script type="text/javascript">
	$(document).ready(function(){
		 $(".leftnav h2").click(function(){
			  $(this).next().slideToggle(200);	
			  $(this).toggleClass("on"); 
		  })
		  $(".leftnav ul li a").click(function(){
			    $("#a_leader_txt").text($(this).text());
		  		$(".leftnav ul li a").removeClass("on");
				$(this).addClass("on");
		  })
		  showTime();
	});
	
    function showTime(){ 
        var show_day=new Array('星期一','星期二','星期三','星期四','星期五','星期六','星期日'); 
        var time=new Date(); 
        var year=time.getFullYear();
        var month=time.getMonth(); 
        var date=time.getDate(); 
        var day=time.getDay(); 
        var hour=time.getHours(); 
        var minutes=time.getMinutes(); 
        var second=time.getSeconds(); 
		month=month+1;
        month<10?month='0'+month:month;
        hour<10?hour='0'+hour:hour; 
        minutes<10?minutes='0'+minutes:minutes; 
        second<10?second='0'+second:second; 
        var now_time=year+'年'+month+'月'+date+'日'+' '+hour+':'+minutes+':'+second; 
        $(".currentTime").html(now_time);
        setTimeout("showTime();",1000); 
    } 
	
</script>
</head>
<body style="admin-color:#f2f9fd;">
<div class="header bg-main">
  <div class="logo margin-big-left fadein-top">
    <h1>阿婆私房菜管理平台</h1>
  </div>
  <div class="head-l">
  	<a class="button button-little bg-blue" href="" target="_blank"><span class="icon-home"></span> 前台首页</a> &nbsp;&nbsp;
  	<a class="button button-little bg-red" href="javascript:logout();"><span class="icon-power-off"></span> 退出登录</a> 
  </div>
</div>
<div class="leftnav">
  <div class="leftnav-title"><strong><span class="icon-list"></span>菜单列表</strong></div>
  <h2><span class="icon-pencil-square-o"></span>菜单管理</h2>
  <ul style="display:block">
    <li><a href="${pageContext.request.contextPath}/admin/MenusController?action=menusAddSelect" target="right"><span class="icon-caret-right"></span>添加新菜单</a></li>
    <li><a href="${pageContext.request.contextPath}/admin/MenusController?action=selectMenusByPage" target="right"><span class="icon-caret-right"></span>菜单信息列表</a></li>
  </ul>   
  <h2><span class="icon-pencil-square-o"></span>菜单类别管理</h2>
  <ul>
    <li><a href="admin/type/typeAdd.jsp" target="right"><span class="icon-caret-right"></span>添加新类别</a></li>
    <li><a href="admin/types?action=typesAll" target="right"><span class="icon-caret-right"></span>类别信息列表</a></li>
  </ul>
  <h2><span class="icon-pencil-square-o"></span>公告信息管理</h2>
  <ul>
    <li><a href="admin/notices/noticesAdd.jsp" target="right"><span class="icon-caret-right"></span>添加新公告</a></li>
    <li><a href="admin/notices/noticesList.jsp" target="right"><span class="icon-caret-right"></span>公告信息列表</a></li>   
  </ul>
  <h2><span class="icon-pencil-square-o"></span>销售订单管理</h2>
  <ul>
    <li><a href="admin/orders/orders.jsp" target="right"><span class="icon-caret-right"></span>销售订单信息列表</a></li>
    <li><a href="admin/orders/order_search.jsp" target="right"><span class="icon-caret-right"></span>销售订单查询</a></li>
     <li><a href="admin/orders/order_statistic.jsp" target="right"><span class="icon-caret-right"></span>本日销售额统计</a></li>      
  </ul>
  <h2><span class="icon-user"></span>辅助功能</h2>
  <ul>
    <li><a href="admin/other/about.jsp" target="right"><span class="icon-caret-right"></span>更新配送说明</a></li>
    <li><a href="admin/other/delivery.jsp" target="right"><span class="icon-caret-right"></span>更新关于我们</a></li>   
  </ul>    
  <h2><span class="icon-user"></span>账号管理</h2>
  <ul>
    <li><a href="admin/admin/admin_update.jsp" target="right"><span class="icon-caret-right"></span>修改账户</a></li>
    <li><a href="${pageContext.request.contextPath }/" target="right"><span class="icon-caret-right"></span>注销退出</a></li>   
  </ul>    
</div>
<ul class="bread">
  <li><a href="admin/default.jsp" target="right" class="icon-home"> 首页</a></li>
  <li><a id="a_leader_txt">网站信息</a></li>
  <li><b>当前用户：</b><span style="color:red;">${admin.name}</span></li>
</ul>
<div style="position: absolute; right: 15px;top: 80px;">
<span class="currentTime"></span>
</div>
<div class="admin">
  <iframe scrolling="auto" rameborder="0" src="admin/default.jsp" name="right" width="100%" height="100%"></iframe>
</div>
</body>
</html>