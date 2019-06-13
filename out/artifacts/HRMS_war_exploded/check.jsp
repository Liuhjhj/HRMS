<%@ page import="java.io.PrintWriter" %><%--
  Created by IntelliJ IDEA.
  User: liu24
  Date: 2019/5/20
  Time: 16:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"%>
<jsp:useBean id="check" class="com.connect_database"/>
<html>
<head>
    <title>Check</title>
</head>
<body>
    <%
        request.setCharacterEncoding("UTF-8");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        check.setUsername(username);
        check.setPassword(password);
        //接收index的用户名和密码作为登录数据库的账户和密码
        if (check.connect()){   //登录成功,保存用户名和密码
            session.setAttribute("username",username);
            session.setAttribute("password",password);
            check.disconnect();
            response.sendRedirect("department.jsp");
        }else {
            response.setCharacterEncoding("utf-8");
            PrintWriter output = response.getWriter();
            output.print("<script>alert('登录失败'); " +
                    "window.location='index.jsp' </script>");
            output.flush();
            output.close();
        }
    %>
</body>
</html>
