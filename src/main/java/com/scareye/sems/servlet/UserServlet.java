package com.scareye.sems.servlet;

import com.scareye.sems.controlObject.Student;
import com.scareye.sems.db.StudentDB;
import com.scareye.sems.service.UserService;
import com.scareye.sems.utils.Utils;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name = "UserServlet", value = "/UserServlet")
public class UserServlet extends HttpServlet {

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String methodWay = request.getParameter("methodWay");
        switch (methodWay) {
            case "login": {
                // 登录
                String userName = request.getParameter("userName");
                String userPassword = request.getParameter("userPassword");
                Utils utils = new Utils();
                if (utils.ifPasswordRight("user", userName, userPassword)) {
                    HttpSession session = request.getSession();
                    session.setAttribute("isLogin", true);
                    session.setAttribute("userName", userName);
                    response.sendRedirect("user/UserIndex.jsp");
                } else {
                    response.sendRedirect("user/UserLogin.jsp");
                }
                break;
            }
            case "bindSelfInfo": {
                // 绑定信息
                UserService userService = new UserService();
                // 从 session 获取用户名
                String userName = (String) request.getSession().getAttribute("userName");
                int stuID = Integer.parseInt(request.getParameter("stuID"));
                if (userService.getUserStuID(userName) == 0) {
                    // 获取用户的学生ID == 0
                    Student student = new Student(0,
                            stuID,
                            request.getParameter("stuName"),
                            request.getParameter("stuSex"),
                            Integer.parseInt(request.getParameter("stuAge")),
                            request.getParameter("stuPhoneNum"),
                            request.getParameter("stuClassNum"),
                            request.getParameter("stuProfessional")
                    );
                    StudentDB studentDB = new StudentDB();
                    studentDB.insertStudent(student);
                    userService.changeUserStuID(userName, stuID);
                    response.sendRedirect("user/UserIndex.jsp");
                }
                break;
            }
            case "unBindSelfInfo": {
                //解绑信息
                UserService userService = new UserService();
                // 从 session 获取用户名
                String userName = (String) request.getSession().getAttribute("userName");
                if (userService.getUserStuID(userName) != 0) {
                    // 删除学生信息
                    userService.deleteStudentSQL(userService.getUserStuID(userName));
                    // 设置用户表 stuID 为 0
                    userService.changeUserStuID(userName, 0);
                    response.sendRedirect("user/UserIndex.jsp");
                }
                break;
            }
            case "register": {
                // 注册
                String userName = request.getParameter("userName");
                String userPassword = request.getParameter("userPassword");
                UserService userService = new UserService();
                if (userService.ifUserNameExited(userName)) {
                    response.sendRedirect("user/UserRegister.jsp");
                } else {
                    userService.insertUser(userName, userPassword);
                    HttpSession session = request.getSession();
                    session.setAttribute("isLogin", true);
                    session.setAttribute("userName", userName);
                    response.sendRedirect("user/UserIndex.jsp");
                }
                break;
            }
        }
    }


    @Override
    public void destroy() {
    }
}
