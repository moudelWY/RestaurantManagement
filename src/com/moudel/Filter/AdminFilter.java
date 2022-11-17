package com.moudel.Filter;

import com.moudel.bean.Admin;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * 管理员资源访问权限的Filter
 */
/*
@WebFilter(value = "/admin/*", initParams = {
		@WebInitParam(name = "exceptionPath", value = "/admin/login.jsp")
}, dispatcherTypes = {
		DispatcherType.REQUEST,
		DispatcherType.FORWARD,
		DispatcherType.INCLUDE
})*/
public class AdminFilter implements Filter {

	private FilterConfig config = null;

    public AdminFilter() {
        // TODO Auto-generated constructor stub
    }

	public void destroy() {
		// TODO Auto-generated method stub
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest)request;
		HttpSession session = req.getSession();
		Admin admin = (Admin)session.getAttribute("admin");
	
		String reqPath = req.getServletPath();
		String excetionPath = config.getInitParameter("exceptionPath");
		System.out.println("reqPath:" + reqPath);
		System.out.println("excetionPath:" + excetionPath);
		
		if((admin != null) || (reqPath.equals(excetionPath)) || (reqPath.endsWith(".css")) || (reqPath.endsWith(".js")) || (reqPath.endsWith(".gif")) || (reqPath.endsWith(".jpg")) ) { //用户存在   或    访问例外程序放行
			chain.doFilter(request, response);
		} else { //用户不存在，跳转到管理员登陆页
			req.getRequestDispatcher("/admin/login.jsp").forward(request, response);
		}
	}

	public void init(FilterConfig fConfig) throws ServletException {
		this.config = fConfig;
	}
}
