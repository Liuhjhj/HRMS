<%@ page import="java.io.PrintWriter" %><%--
  Created by IntelliJ IDEA.
  User: liu24
  Date: 2019/6/5
  Time: 16:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%
        if (session.getAttribute("username")!=null)
            session.removeAttribute("username");
        if (session.getAttribute("password")!=null)
            session.removeAttribute("password");
        response.setCharacterEncoding("utf-8");
        PrintWriter output = response.getWriter();
        output.print("<script>window.location='index.jsp' </script>");
        output.flush();
        output.close();
    %>
</body>
</html>
