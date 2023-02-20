<%@ page import="org.example.Car" %>
<html>
    <head>
        <title>Details</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    </head>
    <body>
        <div class="container">
            <div class="row mt-5">
                <div class="col-sm-12">
                    <%
                        Car car = (Car)request.getAttribute("car");
                        if(car!=null){
                    %>
                    <div class="p-5 mb-4 bg-light rounded-3">
                        <div class="container-fluid py-5">
                            <h1 class="display-5 fw-bold"><%=car.getName()%></h1>
                            <p class="col-md-8 fs-4">Model: <%=car.getModel()%></p>
                            <p class="col-md-8 fs-4">Year: <%=car.getYear()%></p>
                            <p class="col-md-8 fs-4">Volume: <%=car.getVolume()%></p>
                            <a class="btn btn-primary btn-lg" href="/edit?id=<%=car.getId()%>" role="button">EDIT</a>
                        </div>
                    </div>
                    <%
                        }
                    %>
                </div>
            </div>
        </div>
    </body>
</html>
