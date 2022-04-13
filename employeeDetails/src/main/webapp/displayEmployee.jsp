<%@page import="java.sql.*" %>
<html>
<head>
<style>
</style>
</head>
<body>

    <table align="center" border="1">

    <%
        Class.forName("com.mysql.jdbc.Driver");
        
         Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/rms","root","mysql");
         Statement st=con.createStatement();
         ResultSet rs=st.executeQuery("select * from empdetails");
         ResultSetMetaData rsmd=rs.getMetaData();
         int cc=rsmd.getColumnCount();
         out.println("<tr>");
            for(int i=1;i<=cc;i++)
            {
                
                %>
                <td><%=rsmd.getColumnName(i)%></td>
                <%
            }
        out.println("</tr>"); 
        while(rs.next())
         {
            out.println("<tr>") ;
            for(int i=1;i<=cc;i++)
            {
            	
                %>
                <td><%=rs.getString(i)%></td>
                <%
            	
            }
            %>
            <td><a href='#' onclick='delConfirm(<%=rs.getString(1)%>);' >Delete</a></td></tr> 
            <%
        }
         
        %>
    </table>
</body>

<script>
	function delConfirm(eno) {
		var result = confirm("are you Sure!");
		if(result==true) {
		location.href="deleteEmployD.jsp?id="+eno;	
			}
	}
</script>
</html>


