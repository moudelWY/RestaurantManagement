package com.moudel.controller;

import com.moudel.bean.Menus;
import com.moudel.bean.Page;
import com.moudel.bean.Types;
import com.moudel.service.MenusService;
import com.moudel.service.TypesService;
import com.moudel.service.impl.MenuServiceImpl;
import com.moudel.service.impl.TypesServiceImpl;
import com.moudel.utils.PageUtil;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;
@WebServlet("/admin/MenusController")
public class MenusController  extends HttpServlet {
    MenusService  menuService=new MenuServiceImpl();
    TypesService typesService = new TypesServiceImpl();
    private  void selectMenusByPage(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer currentPage =   req.getParameter("currentPage") != null ? Integer.valueOf( req.getParameter("currentPage")) :1;
        Page page = menuService.selectMenus(PageUtil.createPage(3, menuService.menusAllCount(), currentPage));
        req.setAttribute("page",page);
        req.getRequestDispatcher("/admin/menus/menusList.jsp").forward(req,resp);
    }
    private  void menusAdd(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        DiskFileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload sfu = new ServletFileUpload(factory);

        try {
            Menus menus = new Menus();
            List<FileItem> fileItems = sfu.parseRequest(req);
            for (FileItem fileItem : fileItems) {
                if (fileItem.isFormField()){
                    String fieldName = fileItem.getFieldName();
                    switch (fieldName){
                        case "name":
                            menus.setName(fileItem.getString("utf-8"));
                            continue;
                        case "burden":
                            menus.setBurden((fileItem.getString("utf-8")));
                            continue;
                        case "price":
                            menus.setPrice(Double.valueOf(fileItem.getString("utf-8")));
                            continue;
                        case "price1":
                            menus.setPrice1(Double.valueOf(fileItem.getString("utf-8")));
                            continue;
                        case "typeid":
                            menus.setTypeid(Integer.valueOf(fileItem.getString("utf-8")));
                            continue;
                        case "brief":
                            menus.setBrief(fileItem.getString("utf-8"));
                            continue;
                    }
                }else {
                    long time = new Date().getTime();
                    String fileName = time + fileItem.getName();
                    String realPath = this.getServletContext().getRealPath("/img");
                    fileItem.write(new File(realPath+"/"+fileName));
                    menus.setImgpath("img/"+fileName);
                }
            }
            boolean b = menuService.addMenus(menus);
          if (b){
             selectMenusByPage(req, resp);
          }else {

          }
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
    private  void menusAddSelect(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Types> allTypes = typesService.getAllTypes();
        req.setAttribute("allTypes",allTypes);
        req.getRequestDispatcher("/admin/menus/menusAdd.jsp").forward(req,resp);
    }
    private  void menusCheSelect(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Menus menus = menuService.selectMenusById(Integer.valueOf(req.getParameter("id")));
        List<Types> allTypes = typesService.getAllTypes();
        req.setAttribute("menus",menus);
        req.setAttribute("allTypes",allTypes);
        req.getRequestDispatcher("/admin/menus/menusUpdate.jsp").forward(req,resp);
    }
    private  void menusDel(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        menuService.delMenus(id);
    }
    private  void menusChe(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("memnafjabkbajhbcjhb");
        String id1 = req.getParameter("id");
        Integer id = Integer.valueOf(req.getParameter("id"));
        String name = req.getParameter("name");
        Integer typeid =Integer.valueOf(req.getParameter("typeid"));
        String burden = req.getParameter("burden");
        String brief = req.getParameter("brief");
        Double price = Double.valueOf(req.getParameter("price"));
        Double price1 = Double.valueOf(req.getParameter("price1"));
        boolean b = menuService.updateMenus(new Menus(id, name, typeid, burden, brief, price, null, price1, null, null));
        System.out.println(b);
        resp.getWriter().println("{\"choose\":"+b+"}");
    }
        @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if ("selectMenusByPage".equals(action)){
            selectMenusByPage(req, resp);
        }else  if ("menusAdd".equals(action)){
            menusAdd(req, resp);
        }else  if ("menusDel".equals(action)){
            menusDel(req, resp);
        }else if ("menusCheSelect".equals(action)){
            menusCheSelect(req, resp);
        }else if ("menusChe".equals(action)){
            menusChe(req, resp);
        }else  if ("menusAddSelect".equals(action)){
            menusAddSelect(req, resp);
        }
    }
}
