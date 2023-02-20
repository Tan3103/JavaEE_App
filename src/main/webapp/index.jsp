<%@ page import="org.example.Car" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="org.example.DBManager" %>
<html>
    <head>
        <title>Home</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    </head>
    <body>
        <div class="container">
            <div class="row mt-5">
                <div class="col-sm-8 offset-2">
                    <form action="/home" method="post">

                        <div class="form-group">
                            <label>Name: </label>
                             <input type="text" name="name" class="form-control">
                        </div>

                        <div class="form-group">
                            <label>Model: </label>
                            <input type="text" name="model" class="form-control">
                        </div>

                        <div class="form-group">
                            <label>Year: </label>
                            <input type="text" name="year" class="form-control">
                        </div>

                        <div class="form-group">
                            <label>Volume: </label>
                            <input type="text" name="volume" class="form-control">
                        </div>

                        <button class="btn btn-success btn-sm mt-2">ADD NEW CAR</button>
                    </form>
                </div>
            </div>
        </div>

        <div class="container">
            <div class="row mt-5">
                <div class="col-sm-8 offset-2">
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Name</th>
                                <th scope="col">Model</th>
                                <th scope="col">Year</th>
                                <th scope="col">Volume</th>
                                <th scope="col"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                ArrayList<Car> cars = DBManager.getAllCars();
                                if(cars!=null){
                                    for (Car i: cars) {
                            %>
                            <tr>
                                <th scope="row"> <%= i.getId()%></th>
                                <td>
                                    <%= i.getName()%>
                                </td>
                                <td>
                                    <%= i.getModel()%>
                                </td>
                                <td>
                                    <%= i.getYear()%>
                                </td>
                                <td>
                                    <%= i.getVolume()%>
                                </td>
                                <td>
                                    <a href="/details?id=<%=i.getId()%>" class="btn btn-info btn-sm">DETAILS</a>
                                </td>
                            </tr>
                            <%
                                    }
                                }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>
