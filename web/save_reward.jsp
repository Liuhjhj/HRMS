<%@ page import="java.io.PrintWriter" %><%--
  Created by IntelliJ IDEA.
  User: liu24
  Date: 2019/6/10
  Time: 8:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="save" class="com.connect_database"/>
<html>
<head>
    <title>保存奖惩情况</title>
</head>
<body>
    <%
        request.setCharacterEncoding("UTF-8");
        String name=request.getParameter("name");
        String department=request.getParameter("department");
        String reward=request.getParameter("reward");
        String number=request.getParameter("number");
        save.setUsername((String)session.getAttribute("username"));
        save.setPassword((String)session.getAttribute("password"));
        save.connect();
        String sql;
        try {
            if (number==null || number.equals("")) {
                sql = "insert into reward values(null,'" + name + "','"
                        + department + "','" + reward + "');";
            }else {
                sql="update reward set name='"+name+"', "
                +"department='"+department+"', "
                +"reward='"+reward+"' where number="+number+";";
            }
            save.executeUpdate(sql);
        }catch (Exception e){
            e.printStackTrace();
        }
        save.disconnect();
        response.setCharacterEncoding("utf-8"); //弹出窗口
        PrintWriter output = response.getWriter();
        output.print("<script>alert('保存完成'); " +
                "window.location='reward.jsp' </script>");
        output.flush();
        output.close();
    %>
</body>
</html>
