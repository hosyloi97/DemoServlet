<%-- 
    Document   : showEmps
    Created on : Aug 2, 2019, 8:36:26 AM
    Author     : Mr Loi Ho
--%>

<%@page import="java.util.List"%>
<%@page import="model.Employee"%>
<%@page import="DAO.DBConnection"%>
<%@page import="DAO.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous"></head>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>

    <title>List employees</title>
</head>
<body>
    <div class="container">
        <center style="color:SlateBlue;">
            <h2>This is the list employees</h2>
        </center>

        <div class="row">
            <div class="col-lg-9"> 
                <p>This is the list employees of our company.</p>
            </div>
            <div class="col-lg-3">
                <button type="button" class="btn btn-primary" data-toggle="modal"
                        data-target="#AddNewEmp" >
                    <i class="fas fa-user-plus"> &nbsp; &nbsp; Add new</i>
                </button>
                <br/> <br/>
            </div>
        </div>

        <table class="table table-striped">
            <thead>
                <tr>
                    <th>Id      </th>
                    <th>Name  </th>
                    <th>Email</th>
                    <th>Actions</th>
                </tr>
            </thead>
            
                <%
                    DBConnection db = new DBConnection();
                    List<Employee> emps = db.getAllEmps();
                    for (Employee emp : emps) {%>
                <tr>
                    <td><%=emp.getId()%></td>
                    <td><%=emp.getName()%></td>
                    <td><%=emp.getEmail()%></td>
                    <td>
                        <button type="button" class="btn btn-success" 
                                title="edit employee">
                            <a href="EditEmp?id=<%=emp.getId()%>">
                            <i class="fas fa-user-edit"></i>
                            </a>
                        </button>
                        <button type="button" class="btn btn-danger" 
                                title="delete employee" >
                            <a href="DeleteEmp?id=<%=emp.getId()%>">
                            <i class="fas fa-user-minus"></i>
                            </a>
                        </button>
                    </td>
                </tr>
                <% }%>
            
        </table>
        <!-- The Modal AddNewEmp -->
        <div class="modal" id="AddNewEmp">
            <div class="modal-dialog">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title" style="color:blue">
                            <i class="fas fa-user-plus"> Add new employee</i>
                        </h4>
                        <button type="button" class="close" 
                                data-dismiss="modal">&times;
                        </button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body">
                        <form class="form" name="Input Form" action="AddNewEmp">
                            <div class="form-group">
                                <label for="id">
                                    Id:
                                </label>
                                <input type="id" class="form-control" 
                                       id="id" placeholder="Enter id" name="idEmp">
                            </div>
                            <div class="form-group">
                                <label for="name">
                                    Name:
                                </label>
                                <input type="name" class="form-control" id="name" 
                                       placeholder="Enter name" name="nameEmp">
                            </div>
                            <div class="form-group">
                                <label for="email">
                                    Email:
                                </label>
                                <input type="email" class="form-control" 
                                       id="email" placeholder="Enter email" 
                                       name="emailEmp">
                            </div>
                            <button type="submit" class="btn btn-primary" >
                                Submit
                            </button>
                        </form>
                    </div>

                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" 
                                data-dismiss="modal">Close</button>
                    </div>

                </div>
            </div>
        </div>
    </div>

</body>
</html>
