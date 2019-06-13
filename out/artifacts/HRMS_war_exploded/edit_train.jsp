<%@ page import="java.io.PrintWriter" %><%--
  Created by IntelliJ IDEA.
  User: liu24
  Date: 2019/6/6
  Time: 15:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="edit" class="com.connect_database"/>
<html>
<head>
    <title>保存培训信息</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    edit.setUsername((String) session.getAttribute("username"));
    edit.setPassword((String) session.getAttribute("password"));
    edit.connect();
    try {   //删除-更新-添加
        String delete;
        String[] deleteString = request.getParameterValues("checkbox");
        if (deleteString != null) {   //删除数据
            if (deleteString.length > 0) {
                delete = deleteString[0];
                for (int i = 0; i < deleteString.length; i++) {
                    delete = deleteString[i];
                    if (delete != null) {
                        String sql = "delete from train where number='" + delete + "';";
                        edit.executeUpdate(sql);
                    }
                }
            }
        }
    }catch (Exception e) {
        e.printStackTrace();
    }
    try {
        int count = (int) session.getAttribute("count");
        session.removeAttribute("count");
        for (int i = 0; i <= count; i++) {  //更新数据
            String name = request.getParameter(i + "name");
            String number = request.getParameter(i + "number");
            String age = request.getParameter(i + "age");
            String sex = request.getParameter(i + "sex");
            String department = request.getParameter(i + "department");
            if ((!name.equals("")) && (!number.equals(""))
                    && (!age.equals("")) && (!sex.equals(""))
                    && (!department.equals(""))) {
                String sql = "update train set name = '" + name + "' " +
                        ", age = " + age + " "+
                        ", sex = '" + sex + "' " +
                        ", department = '" + department +
                        "' where number=" + number + ";";
                edit.executeUpdate(sql);
            }
        }
    }catch (Exception e) {
        e.printStackTrace();
    }
    try {
        String add_name=request.getParameter("add_name");   //添加数据
        String add_age = request.getParameter("add_age");
        String add_sex = request.getParameter("add_sex");
        String add_department = request.getParameter("add_department");
        if ((!add_name.equals("")) && (!add_age.equals(""))
                && (!add_sex.equals("")) && (!add_department.equals(""))) {
            String sql = "insert into train values(null,'" + add_name +
                    "',"+ add_age + ",'" + add_sex + "','" + add_department + "');";
            edit.executeUpdate(sql);
        }
    }catch (Exception e){
        e.printStackTrace();
    }
    edit.disconnect();
    response.setCharacterEncoding("utf-8"); //弹出窗口
    PrintWriter output = response.getWriter();
    output.print("<script>alert('保存完成'); " +
            "window.location='train.jsp' </script>");
    output.flush();
    output.close();
%>
</body>
</html>
