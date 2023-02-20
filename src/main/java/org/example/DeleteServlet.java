package org.example;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = "/delete")
public class DeleteServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        Car car = DBManager.getCar(id);
        car.toString();

        if(car != null){
            if(DBManager.deleteCar(car)){
                resp.sendRedirect("/");
            }
            else {
                resp.sendRedirect("/edit?id=" + id + "&error");
            }
        }
        else {
            resp.sendRedirect("/");
        }
    }
}
