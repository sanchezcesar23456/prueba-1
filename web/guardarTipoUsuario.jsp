<%-- 
    Document   : guardarTipoUsuario
    Created on : 28-09-2018, 21:42:43
    Author     : RLCR
--%>

<%@page import="clases.conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
           conexion cn= new conexion();
           String txtTipo=request.getParameter("txtTipo");
           String txtDescripcion=request.getParameter("txtDescripcion");
           
           cn.nuevoTipoUsuario(txtTipo, txtDescripcion);
           response.sendRedirect("verTiposUsuario.jsp");
        %>
    </body>
</html>
