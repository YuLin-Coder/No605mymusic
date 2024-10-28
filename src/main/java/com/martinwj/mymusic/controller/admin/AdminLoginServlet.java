package com.martinwj.mymusic.controller.admin;

import com.martinwj.mymusic.dao.AdminDao;
import com.martinwj.mymusic.dao.impl.AdminDaoImpl;
import com.martinwj.mymusic.entity.Admin;
import com.martinwj.mymusic.service.AdminService;
import com.martinwj.mymusic.service.impl.AdminServiceImpl;
import com.martinwj.mymusic.util.ServletUtils;
import net.sf.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;
import java.util.Objects;

/**
 * @ClassName: AdminLoginServlet
 * @Description: TODO
 * @author: 王靖
 * @createDate: 2020-11-07 9:14
 *
 */
@WebServlet("/admin/loginServlet")
public class AdminLoginServlet extends HttpServlet {

    private AdminService adminService = null;

    @Override
    public void init() throws ServletException {
        adminService = new AdminServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");

        // 获取前端传过来的数据
        String login = req.getParameter("login");
        String pwd = req.getParameter("pwd");
        String inputCode = req.getParameter("code");
        System.out.println(inputCode);

        // 获取session中存入的验证码
        HttpSession session = req.getSession();
        String code = (String) session.getAttribute("code");
        System.out.println(code);

        // 定义json格式的返回数据
        JSONObject jsonObject = new JSONObject();
        // 判断验证码输入是否正确
        if(code != null && code.equalsIgnoreCase(inputCode)){
            // 判断用户名是否存在
            if(adminService.usernameIsExit(login) != null){
                Admin admin = adminService.getAdmin(login, pwd);
                if(admin != null){
                    jsonObject.put("Status", "ok");
                    jsonObject.put("Text", "登录成功<br /><br />欢迎回来");
                    session.setAttribute("admin", admin);
                    // 设置用户数量、专辑数量、歌手数量、歌曲数量的 session
                    ServletUtils.setNumber(session);
                }else {
                    jsonObject.put("Status", "Erro");
                    jsonObject.put("Erro", "密码错误");
                }
            }else {
                jsonObject.put("Status", "Erro");
                jsonObject.put("Erro", "用户名不存在");
            }
        }else {
            // 验证码错误
            jsonObject.put("Status", "Erro");
            jsonObject.put("Erro", "验证码错误");
        }
        session.setAttribute("code", "");
        System.out.println(jsonObject.toString());

        ServletUtils.sendToPage(resp, jsonObject.toString());
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
