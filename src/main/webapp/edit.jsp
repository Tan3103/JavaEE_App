<%@ page import="org.example.Car" %>
<html>
    <head>
        <title>Edit</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    </head>
    <body>
        <%
            Car car = (Car)request.getAttribute("car");
            if(car!=null){
        %>
        <div class="container">
            <div class="row mt-5">
                <div class="col-sm-8 offset-2">
                    <%
                        String success = request.getParameter("success");
                        if(success!=null){
                    %>
                        <div class="alert alert-success alert-dismissible fade show" role="alert">
                            Car saved successfully!
                        </div>
                    <%
                        }
                    %>

                    <%
                        String error = request.getParameter("error");
                        if(error!=null){
                    %>
                        <div class="alert alert-danger alert-dismissible fade show" role="alert">
                            Something went wrong!
                        </div>
                    <%
                        }
                    %>

                    <form action="/edit" method="post">
                        <input type="hidden" name="id" value="<%=car.getId()%>">

                        <div class="form-group mt-2">
                            <label>Name: </label>
                            <input type="text" name="name" class="form-control" value="<%=car.getName()%>">
                        </div>

                        <div class="form-group mt-2">
                            <label>Model: </label>
                            <input type="text" name="model" class="form-control" value="<%=car.getModel()%>">
                        </div>

                        <div class="form-group mt-2">
                            <label>Year: </label>
                            <input type="text" name="year" class="form-control" value="<%=car.getYear()%>">
                        </div>

                        <div class="form-group mt-2">
                            <label>Volume: </label>
                            <input type="text" name="volume" class="form-control" value="<%=car.getVolume() %>">
                        </div>

                        <div class="form-group mt-2">
                            <button class="btn btn-success">UPDATE</button>
                            <button type="button" class="btn btn-danger float-right" data-bs-toggle="modal" data-bs-target="#deleteCarModal">
                                DELETE
                            </button>
                        </div>
                    </form>

                    <div class="modal fade" id="deleteCarModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <form action="/delete" method="post">
                                    <input type="hidden" name="id" value="<%=car.getId()%>">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="staticBackdropLabel">Confirm Delete Process</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        Are you sure?
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">NO</button>
                                        <button class="btn btn-danger">YES</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%
            }
        %>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
    </body>
</html>
