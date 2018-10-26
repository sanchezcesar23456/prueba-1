<%-- 
    Document   : editarTipoUsuario
    Created on : 05-10-2018, 21:20:43
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
         String txtTipo=request.getParameter("txttipo");
         String txtDescripcion=request.getParameter("txtDescripcion");
         String id=request.getParameter("hdnID");
           
         cn.editarTipoUsuario(id,txtTipo, txtDescripcion);
        
                
        %>
        
        
    </body>
</html>
