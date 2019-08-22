<%-- 
    Document   : editEmp
    Created on : Aug 2, 2019, 11:34:35 AM
    Author     : Mr Loi Ho
--%>
<%@page import="java.util.List"%>
<%@page import="model.Employee"%>
<%@page import="model.Employee"%>
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
    <title>Edit employee</title>
</head>
<body>
    <div class="container">
        <center style="color:SlateBlue;">
            <h2>Edit employee with id: ${idE}</h2>
        </center>
        <form class="form" name="edit Form" action="SaveEmp" >
            <div class="form-group">
                <div class="hidden">
                    <label for="id">
                        Id:
                    </label>
                    <input type="id" class="form-control" 
                           id="id" name="idEmp"  value="${idE}" hidden>
                </div>
            </div>
            <div class="form-group">
                <label for="name">
                    Name:
                </label>
                <input type="name" class="form-control" id="name" 
                       placeholder="${nameE}" name="nameEmp">
            </div>
            <div class="form-group">
                <label for="email">
                    Email:
                </label>
                <input type="email" class="form-control" 
                       id="email" placeholder="${emailE}" 
                       name="emailEmp">
            </div>
            <button type="submit" class="btn btn-primary"  >
                Submit
            </button>
        </form>

    </div>
</body>
</html>
