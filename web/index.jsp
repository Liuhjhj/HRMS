<%--
  Created by IntelliJ IDEA.
  User: liu24
  Date: 2019/6/4
  Time: 9:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
  <meta http-equiv="content-type" content="text/html;charset=utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <title>用户登录</title>
  <link rel="stylesheet" type="text/css" href="css/style.css">
  <script type="text/javascript" src="js/jquery.min.js"></script>
  <script type="text/javascript" src="js/vector.js"></script>

</head>
<body>

<div id="container">
  <div id="output">
    <div class="containerT">
      <h1>用户登录</h1>
      <form class="form" id="entry_form" action="check.jsp" method="post">
        <input type="text" placeholder="用户名" name="username" value="root">
        <input type="password" placeholder="密码" name="password">
        <button type="submit" id="entry_btn">登录</button>
        <div id="prompt" class="prompt"></div>
      </form>
    </div>
  </div>
</div>

<script type="text/javascript">
  $(function(){
    Victor("container", "output");
    $("#entry_name").focus();
    $(document).keydown(function(event){
      if(event.keyCode==13){
        $("#entry_btn").click();
      }
    });
  });
</script>
</body>
</html>
