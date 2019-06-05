<%@ page import="java.io.PrintWriter" %><%--
  Created by IntelliJ IDEA.
  User: liu24
  Date: 2019/6/4
  Time: 17:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="edit" class="com.connect_database"/>
<html>
<head>
    <title>保存部门信息</title>
</head>
<body>
    <%
        try {
            edit.setUsername((String) session.getAttribute("username"));
            edit.setPassword((String) session.getAttribute("password"));
            edit.connect();
            int count = (int) session.getAttribute("count");
            session.removeAttribute("count");
            for (int i = 0; i <= count; i++) {  //更新数据
                String name = request.getParameter(i + "name");
                String number = request.getParameter(i + "number");
                String sql = "update department set name = '" + name + "' where number=" + number + ";";
                edit.executeUpdate(sql);
            }
        }catch (Exception e) {
            e.printStackTrace();
        }
        try {
            String delete;
            String[] deleteString = request.getParameterValues("checkbox");
            if (deleteString != null) {   //删除数据
                if (deleteString.length > 0) {
                    delete = deleteString[0];
                    for (int i = 0; i < deleteString.length; i++) {
                        delete = deleteString[i];
                        if (delete != null) {
                            String sql = "delete from department where name='" + delete + "';";
                            edit.executeUpdate(sql);
                        }
                    }
                }
            }
        }catch (Exception e) {
            e.printStackTrace();
        }
        try {
            String add_name=request.getParameter("add_name");   //添加数据
            String add_number=request.getParameter("add_number");
            if ((!add_name.equals("")) && (!add_number.equals(""))) {
                String sql = "insert into department values(" + add_number + ",'" + add_name + "');";
                edit.executeUpdate(sql);
            }
            edit.disconnect();
        }catch (Exception e){
            e.printStackTrace();
        }
            response.setCharacterEncoding("utf-8");
            PrintWriter output = response.getWriter();
            output.print("<script>alert('保存完成'); " +
                    "window.location='department.jsp' </script>");
            output.flush();
            output.close();
    %>
</body>
</html>
