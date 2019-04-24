package com.yjsj.ajax.app.servlets;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.yjsj.ajax.beans.ShoppingCart;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

//1.获取ID,PRICE

@WebServlet(name = "AddToCartServlet")
public class AddToCartServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String bookName = request.getParameter("id");
        int price = Integer.parseInt(request.getParameter("price"));

        HttpSession session =  request.getSession();
        ShoppingCart sc = (ShoppingCart)session.getAttribute("sc");
        if (sc == null){
            sc = new ShoppingCart();
            session.setAttribute("sc",sc);
        }

        sc.addToCart(bookName,price);

        StringBuilder result =  new StringBuilder();
        result.append("{")
                .append("\"bookName\":\""+bookName+"\"")
                .append(",")
                .append("\"totalBookNumber\":"+sc.getTotalBookNumber())
                .append(",")
                .append("\"totalMoney\":"+sc.getTotalMoeny())
                .append("}");
        ObjectMapper mapper = new ObjectMapper();
        String result = mapper.writeValueAsString(sc);
        System.out.println(result);

        response.setContentType("text/javascript");
        response.getWriter().print(result.toString());
    }
}
