<%@ page import="java.io.PrintWriter" %><%--
  Created by IntelliJ IDEA.
  User: liu24
  Date: 2019/6/10
  Time: 19:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="system" class="com.connect_database"/>
<html>
<head>
    <title>保存管理员信息</title>
</head>
<body>
    <%
        request.setCharacterEncoding("UTF-8");
        system.setUsername((String) session.getAttribute("username"));
        system.setPassword((String) session.getAttribute("password"));
        system.connect();
        try {
            String delete;
            String[] deleteString = request.getParameterValues("checkbox");
            if (deleteString != null) {   //删除用户
                if (deleteString.length > 0) {
                    delete = deleteString[0];
                    for (int i = 0; i < deleteString.length; i++) {
                        delete = deleteString[i];
                        if (delete != null) {
                            String sql="drop user '"+delete+"'@'%'";
                            system.executeUpdate(sql);
                            sql = "delete from admin where username='" + delete + "';";
                            system.executeUpdate(sql);
                        }
                    }
                }
            }
            String add_name=request.getParameter("add_name");   //添加用户
            String add_username=request.getParameter("add_username");
            String add_password=request.getParameter("add_password");
            if ((!add_name.equals("")) && (!add_username.equals(""))
                    && (!add_password.equals(""))) {
                String sql="Create user '"+add_username+"'@'%' identified by '"+add_password+"';";
                system.executeUpdate(sql);
                sql="grant all privileges on *.* to '"+add_username+"'@'%' with grant option";
                system.executeUpdate(sql);
                sql="flush privileges;";
                system.executeUpdate(sql);
                sql = "insert into admin values(null,'" + add_name +
                        "','"+ add_username + "','" + add_password + "');";
                system.executeUpdate(sql);
            }
            system.disconnect();
            response.setCharacterEncoding("utf-8"); //弹出窗口
            PrintWriter output = response.getWriter();
            output.print("<script>alert('创建完成'); " +
                    "window.location='system.jsp' </script>");
            output.flush();
            output.close();
        }catch (Exception e){
            e.printStackTrace();
            system.disconnect();
            response.setCharacterEncoding("utf-8"); //弹出窗口
            PrintWriter output = response.getWriter();
            output.print("<script>alert('操作失败,请确认你是否具有相应权限'); " +
                    "window.location='system.jsp' </script>");
            output.flush();
            output.close();
        }
    %>
</body>
</html>
