<%-- 
    Document   : editar
    Created on : 05-10-2018, 20:43:53
    Author     : RLCR
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="clases.tipoUsuario"%>
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
       String id=request.getParameter("id");
       out.print(id);
       conexion cn = new conexion();    
       ArrayList<tipoUsuario> tipos=cn.verTipoUsuarioById(id);
       
        out.print("<form method='POST' action='editarTipoUsuario.jsp'>");
            out.print("Tipo:<input type=\"text\" name=\"txtTipo\" value='"+tipos.get(0).getTipo()+"'> <br/>");
            out.print("Descripcion:<input type=\"text\" name=\"txtDescripcion\" value='"+tipos.get(0).getDescripcion()+"' ><br/>");
            out.print("<input type=\"hidden\" name=\"hdnID\" value='"+tipos.get(0).getId()+"'> <br/>"); //trae la id
            out.print("<input type=\"submit\" name=\"btnEditar\">");
        out.print("</form>");
      %>  
        
    </body>
</html>
