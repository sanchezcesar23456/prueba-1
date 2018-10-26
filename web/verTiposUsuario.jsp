<%-- 
    Document   : verTiposUsuario
    Created on : 05-10-2018, 19:12:54
    Author     : RLCR
--%>

<%@page import="clases.conexion"%>
<%@page import="java.util.ArrayList"%>
<%@page import="clases.tipoUsuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       
        <%
        conexion cn = new conexion();    
        ArrayList<tipoUsuario> tipos=cn.verTipoUsuario();
        
        out.print("<table border=1>");
            out.print("<tr>");
                out.print("<td>");
                    out.print("tipo");
                out.print("</td>");
                out.print("<td>");
                    out.print("descripcion");
                out.print("</td>");
                out.print("<td>");
                    out.print("Acciones");
                out.print("</td>");
            out.print("</tr>");
             for (int i = 0; i < tipos.size(); i++) {
                 out.print("<tr>");
                    out.print("<td>");
                        out.print(tipos.get(i).getTipo());
                    out.print("</td>");
                    out.print("<td>");
                        out.print(tipos.get(i).getDescripcion());
                    out.print("</td>");
                    out.print("<td>");
                        out.print("<a href=\"editar.jsp?id="+tipos.get(i).getId()+"\">Editar</a>");
                    out.print("</td>");
                 out.print("</tr>");
            }
        
         out.print("</table>");
        
        %>
        
        
    </body>
</html>
