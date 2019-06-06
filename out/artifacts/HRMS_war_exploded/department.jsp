<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: liu24
  Date: 2019/6/4
  Time: 10:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="department" class="com.connect_database"/>
<!doctype html>
<html class="no-js h-100" lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>首页</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="css/all.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" id="main-stylesheet" data-version="1.1.0" href="styles/shards-dashboards.1.1.0.min.css">
    <link rel="stylesheet" href="styles/extras.1.1.0.min.css">
    <script async defer src="js/buttons.js"></script>
</head>
<body class="h-100">
<div class="container-fluid">
    <div class="row">
        <!-- Main Sidebar -->
        <aside class="main-sidebar col-12 col-md-3 col-lg-2 px-0">
            <div class="main-navbar">
                <nav class="navbar align-items-stretch navbar-light bg-white flex-md-nowrap border-bottom p-0">
                    <a class="navbar-brand w-100 mr-0" href="#" style="line-height: 25px;">
                        <div class="d-table m-auto">
                            <img id="main-logo" class="d-inline-block align-top mr-1" style="max-width: 25px;" src="images/shards-dashboards-logo.svg" alt="Shards Dashboard">
                            <span class="d-none d-md-inline ml-1"><%=session.getAttribute("username")%></span>
                        </div>
                    </a>
                    <a class="toggle-sidebar d-sm-inline d-md-none d-lg-none">
                        <i class="material-icons">&#xE5C4;</i>
                    </a>
                </nav>
            </div>
            <form action="#" class="main-sidebar__search w-100 border-right d-sm-flex d-md-none d-lg-none">
                <div class="input-group input-group-seamless ml-3">
                    <div class="input-group-prepend"></div>
                </div>
            </form>
            <div class="nav-wrapper">
                <ul class="nav flex-column">
                    <li class="nav-item">
                        <a class="nav-link active" href="department.jsp">
                            <i class="material-icons">edit</i>
                            <span>部门管理</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link " href="staff.jsp">
                            <i class="material-icons">vertical_split</i>
                            <span>员工管理</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link " href="hire.jsp">
                            <i class="material-icons">note_add</i>
                            <span>招聘管理</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link " href="form-components.html">
                            <i class="material-icons">view_module</i>
                            <span>培训管理</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link " href="tables.html">
                            <i class="material-icons">table_chart</i>
                            <span>奖惩管理</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link " href="user-profile-lite.html">
                            <i class="material-icons">person</i>
                            <span>薪资管理</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link " href="errors.html">
                            <i class="material-icons">error</i>
                            <span>系统管理</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link " href="errors.html">
                            <i class="material-icons">error</i>
                            <span>用户修改</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link " href="exit.jsp">
                            <i class="material-icons">error</i>
                            <span>安全退出</span>
                        </a>
                    </li>
                </ul>
            </div>
        </aside>
        <!-- End Main Sidebar -->
        <main class="main-content col-lg-10 col-md-9 col-sm-12 p-0 offset-lg-2 offset-md-3">
            <form method="post" action="edit_department.jsp">
            <!-- / .main-navbar -->
                <div class="main-content-container container-fluid px-4">
                <!-- Page Header -->
                    <div class="page-header row no-gutters py-4">
                        <div class="col-12 col-sm-4 text-center text-sm-left mb-0">
                            <span class="text-uppercase page-subtitle">Overview</span>
                            <h3 class="page-title">部门数据表</h3>
                        </div>
                    </div>
                    <!-- End Page Header -->
                    <!-- Default Light Table -->
                    <div class="row">
                        <div class="col">
                            <div class="card card-small mb-4">
                                <div class="card-header border-bottom">
                                    <h6 class="m-0">修改部门</h6>
                                </div>
                                <div class="card-body p-0 pb-3 text-center">
                                    <table class="table mb-0">
                                        <thead class="bg-light">
                                        <tr>
                                            <th scope="col" class="border-0">是否删除</th>
                                            <th scope="col" class="border-0">部门编号</th>
                                            <th scope="col" class="border-0">部门名称</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                try {
                                                    department.setUsername((String) session.getAttribute("username"));
                                                    department.setPassword((String) session.getAttribute("password"));
                                                    department.connect();
                                                    String sql="select * from department;";
                                                    ResultSet resultSet = department.executeQuery(sql);
                                                    int count = 0;
                                                    while (resultSet.next()){
                                            %>
                                            <tr>
                                                <td><div class="custom-control custom-checkbox mb-1">
                                                    <input type="checkbox" id="<%=count+"checkbox"%>" class="custom-control-input" name="checkbox" value="<%=resultSet.getString("name")%>">
                                                    <label class="custom-control-label" for="<%=count+"checkbox"%>"><%=resultSet.getString("name")%></label>
                                                </div></td>
                                                <td><input type="text" readonly="readonly" class="form-control" name="<%=count + "number"%>" value="<%=resultSet.getInt("number")%>"></td>
                                                <td><input type="text" class="form-control" name="<%=count + "name"%>" value="<%=resultSet.getString("name")%>"></td>
                                            </tr>
                                            <%
                                                        count++;
                                                    }
                                                    session.setAttribute("count",count);
                                                    department.disconnect();
                                                }catch (Exception e){
                                                    e.printStackTrace();
                                                }

                                            %>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- End Default Light Table -->
                    <!-- Default Dark Table -->
                    <div class="row">
                        <div class="col">
                            <div class="card card-small overflow-hidden mb-4">
                                <div class="card-header bg-dark">
                                    <h6 class="m-0 text-white">添加部门</h6>
                                </div>
                                <div class="card-body p-0 pb-3 bg-dark text-center">
                                    <table class="table table-dark mb-0">
                                        <thead class="thead-dark">
                                        <tr>
                                            <th scope="col" class="border-bottom-0">部门名称</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <td><input type="text" class="form-control" name="add_name"></td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- End Default Dark Table -->
                    <div class="col text-center view-report">
                        <button type="submit" class="btn btn-accent" >保存更改</button>
                    </div>
                </div>
            </form>
        </main>
    </div>
</div>
<script src="scripts/jquery-3.3.1.min.js"></script>
<script src="scripts/popper.min.js"></script>
<script src="scripts/bootstrap.min.js"></script>
<script src="scripts/Chart.min.js"></script>
<script src="scripts/shards.min.js"></script>
<script src="scripts/jquery.sharrre.min.js"></script>
<script src="scripts/extras.1.1.0.min.js"></script>
<script src="scripts/shards-dashboards.1.1.0.min.js"></script>
<script src="scripts/app/app-blog-overview.1.1.0.js"></script>
</body>
</html>