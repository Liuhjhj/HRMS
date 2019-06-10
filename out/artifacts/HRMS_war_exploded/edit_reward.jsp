<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: liu24
  Date: 2019/6/4
  Time: 10:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="edit" class="com.connect_database"/>
<!doctype html>
<html class="no-js h-100" lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>保存奖惩信息</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="css/all.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" id="main-stylesheet" data-version="1.1.0" href="styles/shards-dashboards.1.1.0.min.css">
    <link rel="stylesheet" href="styles/extras.1.1.0.min.css">
    <script async defer src="https://buttons.github.io/buttons.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/quill/1.3.6/quill.snow.css">
    <script language="JavaScript">
        function setValue() {
            var a=document.getElementById("editor-container").innerText;
            document.getElementById('reward').value=a;
        }
    </script>
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
                    <div class="input-group-prepend">
                        <div class="input-group-text">
                            <i class="fas fa-search"></i>
                        </div>
                    </div>
                    <input class="navbar-search form-control" type="text" placeholder="Search for something..." aria-label="Search"> </div>
            </form>
            <div class="nav-wrapper">
                <ul class="nav flex-column">
                    <li class="nav-item">
                        <a class="nav-link " href="department.jsp">
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
                        <a class="nav-link " href="train.jsp">
                            <i class="material-icons">view_module</i>
                            <span>培训管理</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="reward.jsp">
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
        <div class="main-content col-lg-10 col-md-9 col-sm-12 p-0 offset-lg-2 offset-md-3">
            <!-- / .main-navbar -->
            <form method="post" onsubmit="setValue()" action="save_reward.jsp">
                <div class="main-content-container container-fluid px-4">
                    <!-- Page Header -->
                    <div class="page-header row no-gutters py-4">
                        <div class="col-12 col-sm-6 text-center text-sm-left mb-0 ">
                            <span class="text-uppercase page-subtitle">Components</span>
                            <h3 class="page-title">奖惩情况</h3>
                        </div>
                        <div class="col-12 col-sm-6 text-center text-sm-right mb-0 mt-3">
                            <button type="submit" class="btn btn-accent">保存</button>
                        </div>
                    </div>
                    <!-- End Page Header -->
                    <div class="row">
                        <div class="col-lg-12 col-md-12">
                            <!-- Add New Post Form -->
                            <div class="card card-small mb-3">
                                <div class="card-body">
                                    <form class="add-new-post" >
                                        <div class="form-row">
                                            <div class="form-group col-md-6">
                                                <label for="name">姓名</label>
                                                <input type="hidden" name="number" value="<%=request.getParameter("number")%>">
                                                <input type="text" class="form-control" id="name" placeholder="姓名" name="name" value="<%=request.getParameter("name")%>"> </div>
                                            <div class="form-group col-md-6">
                                                <label for="department">部门</label>
                                                <input type="text" class="form-control" id="department" placeholder="部门" name="department" value="<%=request.getParameter("department")%>"> </div>
                                        </div>
                                        <div id="editor-container" class="add-new-post__editor mb-1" ></div>
                                        <input type="hidden" name="reward" id="reward" value="<%=request.getParameter("reward")%>">
                                        <script language="JavaScript">
                                            document.getElementById("editor-container").innerText=document.getElementById("reward").value;
                                        </script>
                                    </form>
                                </div>
                            </div>
                            <!-- / Add New Post Form -->
                        </div>
                    </div>
                </div>
            </form>
        </div>
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/quill/1.3.6/quill.min.js"></script>
<script src="scripts/app/app-blog-new-post.1.1.0.js"></script>
</body>
</html>