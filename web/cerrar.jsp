<%-- 
    Document   : cerrar
    Created on : 28-09-2018, 19:35:31
    Author     : RLCR
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
            <%
            HttpSession misesion=request.getSession(true); //crea una sesion
                       
            String usuarioSesion=(String)misesion.getAttribute("username"); //trae la variable de sesion
            
            if(misesion!=null){
                misesion.invalidate();
                out.print("Sesión cerrada para: "+ usuarioSesion);
            }else{
                out.print("Sesión cerrada");
            }
         %>
    </body>
</html>
