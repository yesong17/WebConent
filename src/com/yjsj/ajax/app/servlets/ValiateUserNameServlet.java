package com.yjsj.ajax.app.servlets;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import javax.servlet.http.*;
public class ValiateUserNameServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        List<String> userNames = Arrays.asList("AAA","BBB","CCC");
        String userName = request.getParameter("userName");
        String result = null;
        if(userNames.contains(userName)){
            result = "<font color='red'> 该用户不能使用.</font>";
        }else{
            result = "<font color='green'> 该用户不能使用.</font>";
        }

        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html");
        response.getWriter().print(result);
    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
}
}
