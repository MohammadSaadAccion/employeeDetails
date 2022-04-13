<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        String eno=request.getParameter("id");
        
        Class.forName("com.mysql.jdbc.Driver");
        
         Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sys","root","mysql");
         PreparedStatement ps=con.prepareStatement("delete from employee where id=?");
         ps.setString(1, eno);
         
         ps.executeUpdate();
        %>
        <jsp:forward page="displayEmployee.jsp"/>
       </body>
</html>
