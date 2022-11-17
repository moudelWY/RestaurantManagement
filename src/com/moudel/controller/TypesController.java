package com.moudel.controller;

import com.moudel.bean.Types;
import com.moudel.service.impl.TypesServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet("/admin/types")
public class TypesController extends HttpServlet {
    private  void typesAll(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getSession().setAttribute("typesAll",new TypesServiceImpl().getAllTypes());
        req.getRequestDispatcher("/admin/type/typeList.jsp").forward(req,resp);
    }
    private  void typesAdd(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        boolean b = new TypesServiceImpl().addTypes(new Types(null, name));
        if (b){
            resp.getWriter().println("<script>\n" +
                    "\t\talert(\"添加成功~\");location.href=\""+req.getContextPath()+"/admin/types?action=typesAll\"\n" +
                    "\t</script>");
           // req.getRequestDispatcher("/admin/types?action=typesAll").forward(req,resp);
        }else {
            resp.getWriter().println("<script>alert(\"添加失败，存在相同的类别~\");location.href=\""+req.getContextPath()+"/admin/type/typeAdd.jsp\"</script>");
        }
    }
    private  void typesDel(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        int i = Integer.parseInt(id);
        boolean b = new TypesServiceImpl().delTypes(i);
        //resp.getWriter().println("<script>alert(\"del success~\")</script>");
        //req.getRequestDispatcher("/admin/types?action=typesAll").forward(req,resp);
    }
    private  void cheById(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        int i = Integer.parseInt(id);
        Types types = new TypesServiceImpl().selectById(i);
        req.setAttribute("types",types);
        req.setAttribute("actionIfo","che");
        req.getRequestDispatcher("/admin/type/typeAdd.jsp").forward(req,resp);
    }
    private  void typesChe(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        Types types = (Types) req.getSession().getAttribute("types");
        boolean b = new TypesServiceImpl().updataTypes(new Types(types.getId(), name));
        req.getSession().invalidate();
        typesAll(req, resp);
    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        if ("typesAll".equals(action)){
            this.typesAll(req,resp);
        }else  if("typesAdd".equals(action)){
            if ("che".equals(req.getSession().getAttribute("actionIfo"))){
                this.typesChe(req,resp);
            }else {
                this.typesAdd(req, resp);
            }
        }else  if ("typesDel".equals(action)){
            this.typesDel(req, resp);
        }else if ("cheById".equals(action)){
            this.cheById(req, resp);
        }
    }
}
