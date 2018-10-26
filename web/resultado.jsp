<%-- 
    Document   : resultado
    Created on : 28-09-2018, 19:17:11
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
          String usuario=request.getParameter("txtemail"); //admin@gmail.com
          String password=request.getParameter("txtpassword"); //admin
          
          if(usuario.equalsIgnoreCase("admin@gmail.com") && password.equals("admin")){
             HttpSession misesion=request.getSession(true); //crea una sesion
             misesion.setAttribute("username", usuario); //crea una variable de sesion (atributo y valor) usuario
             misesion.setAttribute("password", password); //password de la variable de sesion
             
             String usuarioSesion=(String)misesion.getAttribute("username");  //(String parseo a string)
             out.print(usuarioSesion);
             out.print("<br>");
             out.print(" <a href=\".\\nuevoTipoUsuario.jsp\">Crear Nuevo Tipo</a>");
             out.print(" <a href=\".\\cerrar.jsp\">Cerrar sesión</a>");
          }else{
              out.print("Usuario no existe");
          }
          

        %>
       
    </body>
</html>
