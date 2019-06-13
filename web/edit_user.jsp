<%@ page import="java.io.PrintWriter" %><%--
  Created by IntelliJ IDEA.
  User: liu24
  Date: 2019/6/10
  Time: 20:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="user" class="com.connect_database"/>
<html>
<head>
    <title>修改用户密码</title>
</head>
<body>
    <%
        String new_password=request.getParameter("new_password");
        user.setUsername((String)session.getAttribute("username"));
        user.setPassword((String)session.getAttribute("password"));
        user.connect();
        try {
            String sql="alter user '"+user.getUsername()+"'@'%' identified " +
                    "with mysql_native_password BY '"+new_password+"';";
            if(user.executeUpdate(sql)) {    //更改mysql用户密码
                sql = "update admin set password='" + new_password + "' where " +
                        "username='" + user.getUsername() + "';";   //更新表
                user.executeUpdate(sql);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        user.disconnect();
        response.setCharacterEncoding("utf-8"); //弹出窗口
        PrintWriter output = response.getWriter();
        output.print("<script>alert('密码修改完成,请重新登录'); " +
                "window.location='exit.jsp' </script>");
        output.flush();
        output.close();
    %>
</body>
</html>
