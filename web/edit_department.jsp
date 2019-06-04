<%@ page import="java.io.PrintWriter" %><%--
  Created by IntelliJ IDEA.
  User: liu24
  Date: 2019/6/4
  Time: 17:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="edit" class="com.connect_database"></jsp:useBean>
<html>
<head>
    <title>正在保存......</title>
</head>
<body>
    <%
        String name=request.getParameter("name");
        String number=request.getParameter("number");
        String add_name=request.getParameter("add_name");
        String add_number=request.getParameter("add_number");
        String sql="insert into department values("+add_number+",'"+add_name+"');";
        String sql2="update department set name = '"+name+"' where number="+number+";";
        try {
            edit.setUsername((String)session.getAttribute("username"));
            edit.setPassword((String)session.getAttribute("password"));
            edit.connect();
            edit.executeUpdate(sql);
            edit.executeUpdate(sql2);
            edit.disconnect();
            response.setCharacterEncoding("utf-8");
            PrintWriter output = response.getWriter();
            output.print("<script>alert('保存完成'); " +
                    "window.location='department.jsp' </script>");
            output.flush();
            output.close();
        }catch (Exception e){
            e.printStackTrace();
        }

    %>
</body>
</html>
