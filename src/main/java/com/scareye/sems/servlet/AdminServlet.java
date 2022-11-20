package com.scareye.sems.servlet;

import com.scareye.sems.controlObject.HealthRecord;
import com.scareye.sems.controlObject.Student;
import com.scareye.sems.controlObject.User;

import com.scareye.sems.service.AdminService;
import com.scareye.sems.utils.Utils;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name = "AdminServlet", value = "/AdminServlet")
public class AdminServlet extends HttpServlet {

    @Override
    public void init() {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String methodWay = request.getParameter("methodWay");
        switch (methodWay) {
            case "login": {
                // 登录
                String adminName = request.getParameter("adminName");
                String adminPassword = request.getParameter("adminPassword");
                Utils utils = new Utils();
                if (utils.ifPasswordRight("admin", adminName, adminPassword)) {
                    HttpSession session = request.getSession();
                    session.setAttribute("isLogin", true);
                    session.setAttribute("adminName", adminName);
                    response.sendRedirect("admin/AdminIndex.jsp");
                } else {
                    response.sendRedirect("admin/AdminLogin.jsp");
                }
                break;
            }
            case "studentEdit": {
                AdminService adminService = new AdminService();
                Student student = new Student(
                        Integer.parseInt(request.getParameter("id")),
                        Integer.parseInt(request.getParameter("stuID")),
                        request.getParameter("stuName"),
                        request.getParameter("stuSex"),
                        Integer.parseInt(request.getParameter("stuAge")),
                        request.getParameter("stuPhoneNum"),
                        request.getParameter("stuClassNum"),
                        request.getParameter("stuProfessional")
                );
                adminService.updateStudentInfo(student);
                response.sendRedirect("admin/StudentManager.jsp");
                break;
            }
            case "userEdit": {
                String userPassword;
                if (request.getParameter("newUserPassword").equals("null") | request.getParameter("newUserPassword").equals("")) {
                    userPassword = request.getParameter("userPassword");
                } else {
                    userPassword = request.getParameter("confirmNewUserNewPassword");
                }
                AdminService adminService = new AdminService();
                User user = new User(
                        Integer.parseInt(request.getParameter("id")),
                        request.getParameter("userName"),
                        userPassword,
                        Integer.parseInt(request.getParameter("stuID"))
                );
                adminService.updateUserInfo(user);
                response.sendRedirect("admin/UserManager.jsp");
                break;
            }
            case "recordEdit": {
                AdminService adminService = new AdminService();
                boolean ifDetected;
                ifDetected = request.getParameter("ifDetected").equals("已做") | request.getParameter("ifDetected").equals("1");
                HealthRecord healthRecord = new HealthRecord(
                        Integer.parseInt(request.getParameter("id")),
                        Integer.parseInt(request.getParameter("stuID")),
                        request.getParameter("stuName"),
                        request.getParameter("stuSex"),
                        Integer.parseInt(request.getParameter("stuAge")),
                        request.getParameter("stuPhoneNum"),
                        request.getParameter("stuClassNum"),
                        request.getParameter("stuProfessional"),
                        Double.parseDouble(request.getParameter("stuTemperature")),
                        ifDetected,
                        request.getParameter("stuHealthSituation"),
                        request.getParameter("dateTime")
                );
                adminService.updateRecordInfo(healthRecord);
                response.sendRedirect("admin/RecordManager.jsp");
                break;
            }
            case "delSub": {
                String subName = request.getParameter("subName");
                AdminService adminService = new AdminService();
                String attribute = request.getParameter("attribute");
                adminService.delSub(subName, attribute);
                response.sendRedirect("admin/" + subName + "Manager.jsp");
                break;
            }
            case "newSub": {
                AdminService adminService = new AdminService();
                String subName = request.getParameter("subName");
                switch (subName) {
                    case "Student":
                        adminService.insertSub(new Student(
                                0,
                                Integer.parseInt(request.getParameter("stuID")),
                                request.getParameter("stuName"),
                                request.getParameter("stuSex"),
                                Integer.parseInt(request.getParameter("stuAge")),
                                request.getParameter("stuPhoneNum"),
                                request.getParameter("stuClassNum"),
                                request.getParameter("stuProfessional")
                        ));
                        break;
                    case "Record":
                        boolean ifDetected;
                        ifDetected = request.getParameter("ifDetected").equals("已做") | request.getParameter("ifDetected").equals("1");
                        adminService.insertSub(new HealthRecord(
                                0,
                                Integer.parseInt(request.getParameter("stuID")),
                                request.getParameter("stuName"),
                                request.getParameter("stuSex"),
                                Integer.parseInt(request.getParameter("stuAge")),
                                request.getParameter("stuPhoneNum"),
                                request.getParameter("stuClassNum"),
                                request.getParameter("stuProfessional"),

                                Double.parseDouble(request.getParameter("stuTemperature")),
                                ifDetected,
                                request.getParameter("stuHealthSituation"),
                                request.getParameter("dateTime")
                        ));
                        break;
                    case "User":
                        adminService.insertSub(new User(
                                0,
                                request.getParameter("userName"),
                                request.getParameter("userPassword"),
                                0
                        ));
                        break;
                }
                response.sendRedirect("admin/SubManager.jsp?subName=" + subName);
                break;
            }
        }
    }

    @Override
    public void destroy() {
    }

}
