<%@ page import="java.io.PrintWriter" %><%--
  Created by IntelliJ IDEA.
  User: liu24
  Date: 2019/6/10
  Time: 16:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="delete" class="com.connect_database"/>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%
        delete.setUsername((String)session.getAttribute("username"));
        delete.setPassword((String)session.getAttribute("password"));
        delete.connect();
        try {
            String number = request.getParameter("number");
            String sql="delete from reward where number="+number+";";
            delete.executeUpdate(sql);
        }catch (Exception e){
            e.printStackTrace();
        }
        response.setCharacterEncoding("utf-8"); //弹出窗口
        PrintWriter output = response.getWriter();
        output.print("<script>alert('保存完成'); " +
                "window.location='reward.jsp' </script>");
        output.flush();
        output.close();
    %>
</body>
</html>
