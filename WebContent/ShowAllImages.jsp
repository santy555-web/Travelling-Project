<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
Connection con=null;
try{
    Class.forName("oracle.jdbc.driver.OracleDriver");
    con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521","admin","str654321");
    PreparedStatement ps = con.prepareStatement("select * from addimage");
    ResultSet rs = ps.executeQuery();
    while(rs.next())
    {%>
    	<p><img src='getimage.jsp?id=<%=rs.getInt(1)%>' height="100" width="100"/></p>
  <%
  }}
catch(Exception e){
    e.printStackTrace();
}   
finally{
    if(con != null){
        try{
            con.close();
        }
        catch(Exception e){
            e.printStackTrace();
        }
    }
}
%>


</body>
</html>