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
        request.setCharacterEncoding("UTF-8");
        edit.setUsername((String) session.getAttribute("username"));
        edit.setPassword((String) session.getAttribute("password"));
        edit.connect(); //连接数据库
        //删除-更新-添加
        try {   //每一个操作(增删改)对应一个try-catch块
            String delete;
            String[] deleteString = request.getParameterValues("checkbox"); //利用CheckBox传递数据库表中number(主键)的值
            if (deleteString != null) {   //删除数据                         //若CheckBox的checked为true,CheckBox的value为number
                if (deleteString.length > 0) {                              //否则value为null
                    for (int i = 0; i < deleteString.length; i++) {
                        delete = deleteString[i];
                        if (delete != null) {   //检查delete是否==null来判断CheckBox的checked是否为true
                            String sql = "delete from department where number='" + delete + "';";
                            edit.executeUpdate(sql);
                        }
                    }
                }
            }
        }catch (Exception e) {
            e.printStackTrace();
        }
        try {   //同时进行删除和更新操作会导致此try-catch块报错
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
            String add_name=request.getParameter("add_name");   //添加数据
            if ((!add_name.equals(""))) {   //有try-catch块,这行if可去掉(去掉可能会报SQL错误)
                String sql = "insert into department values(null,'" + add_name + "');";
                edit.executeUpdate(sql);
            }
            edit.disconnect();
        }catch (Exception e){
            e.printStackTrace();
        }
        response.setCharacterEncoding("utf-8");
        PrintWriter output = response.getWriter();
        output.print("<script>alert('保存完成'); " +    //弹出窗口
                "window.location='department.jsp' </script>");
        output.flush();
        output.close();
    %>
</body>
</html>