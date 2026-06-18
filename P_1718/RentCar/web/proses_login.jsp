<%@page import="java.sql.*"%>
<%@page import="config.Koneksi"%>

<%
String username = request.getParameter("username");
String password = request.getParameter("password");

try {
    Connection conn = new Koneksi().getKoneksi();
    Statement st = conn.createStatement();

    ResultSet rs = st.executeQuery(
        "SELECT * FROM user WHERE username='" + username + "' AND password='" + password + "'"
    );

    if(rs.next()){
        session.setAttribute("user", username);
        response.sendRedirect("index.jsp");
    } else {
        out.println("<script>alert('Login gagal');location='login.jsp';</script>");
    }

} catch(Exception e){
    out.println(e);
}
%>