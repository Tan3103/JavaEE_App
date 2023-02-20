package org.example;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = "/edit")
public class EditServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        Car car = DBManager.getCar(id);

        if(car != null){
            req.setAttribute("car", car);
            req.getRequestDispatcher("/edit.jsp").forward(req, resp);
        }
        else{
            req.getRequestDispatcher("/index.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("name");
        String model = req.getParameter("model");
        int year = Integer.parseInt(req.getParameter("year"));
        double volume = Double.parseDouble(req.getParameter("volume"));

        Car car = DBManager.getCar(id);

        if(car != null){
            car.setName(name);
            car.setModel(model);
            car.setYear(year);
            car.setVolume(volume);

            if(DBManager.updateCar(car)){
                resp.sendRedirect("/edit?id=" + id + "&success");
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
