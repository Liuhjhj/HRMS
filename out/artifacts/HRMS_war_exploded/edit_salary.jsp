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
    <title>保存薪资信息</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    edit.setUsername((String) session.getAttribute("username"));
    edit.setPassword((String) session.getAttribute("password"));
    edit.connect();
    try {
        String delete;
        String[] deleteString = request.getParameterValues("checkbox"); //利用CheckBox的value属性来进行删除
        if (deleteString != null) {
            if (deleteString.length > 0) {
                delete = deleteString[0];
                for (int i = 0; i < deleteString.length; i++) {
                    delete = deleteString[i];
                    if (delete != null) {
                        String sql = "delete from salary where number='" + delete + "';";
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
        for (int i = 0; i <= count; i++) {
            String name = request.getParameter(i + "name");
            String number = request.getParameter(i + "number");
            String age = request.getParameter(i + "age");
            String sex = request.getParameter(i + "sex");
            String department = request.getParameter(i + "department");
            String salary=request.getParameter(i+"salary");
            if ((!name.equals("")) && (!number.equals(""))
                    && (!age.equals("")) && (!sex.equals(""))
                    && (!department.equals("")) && (!salary.equals(""))) {
                String sql = "update salary set name = '" + name + "' " +
                        ", age = " + age + " "+
                        ", sex = '" + sex + "' " +
                        ", department = '" + department +
                        "' , salary = "+salary+
                        " where number=" + number + ";";
                edit.executeUpdate(sql);
            }
        }
    }catch (Exception e) {
        e.printStackTrace();
    }
    try {
        String add_name=request.getParameter("add_name");
        String add_age = request.getParameter("add_age");
        String add_sex = request.getParameter("add_sex");
        String add_department = request.getParameter("add_department");
        String add_salary=request.getParameter("add_salary");
        if ((!add_name.equals("")) && (!add_age.equals(""))
                && (!add_sex.equals("")) && (!add_department.equals(""))
                && (!add_salary.equals(""))) {
            String sql = "insert into salary values(null,'" + add_name +
                    "',"+ add_age + ",'" + add_sex + "','" + add_department
                    + "',"+add_salary+");";
            edit.executeUpdate(sql);
        }
    }catch (Exception e){
        e.printStackTrace();
    }
    edit.disconnect();
    response.setCharacterEncoding("utf-8");
    PrintWriter output = response.getWriter();
    output.print("<script>alert('保存完成'); " +
            "window.location='salary.jsp' </script>");
    output.flush();
    output.close();
%>
</body>
</html>