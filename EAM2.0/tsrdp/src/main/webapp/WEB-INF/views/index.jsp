<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>

<html>
<head>
    <%--<meta charset="utf-8">--%>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>天溯智慧运维平台</title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">

    <!--plugins的css-->
    <link rel="stylesheet" type="text/css" href="/resource/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/resource/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="/resource/plugins/datatables/dataTables.bootstrap.css">
    <link rel="stylesheet" type="text/css" href="/resource/plugins/ztree/css/zTreeStyle/zTreeStyle.css">
    <link rel="stylesheet" type="text/css" href="/resource/plugins/webupload/webuploader.css">
    <link rel="stylesheet" type="text/css" href="/resource/plugins/fullcalendar/fullcalendar.min.css">
    <link rel="stylesheet" type="text/css" href="/resource/plugins/fullcalendar/fullcalendar.css">
    <link rel="stylesheet" type="text/css" href="/resource/plugins/select2/select2.min.css">
    <link rel="stylesheet" type="text/css"
          href="/resource/plugins/jQuery-Timepicker-Addon/jquery-ui-timepicker-addon.css">
    <link rel="stylesheet" href="/resource/plugins/jedate/skin/jedate.css">
    <script type="text/javascript" src="/static/ckfinder/ckfinder.js"></script>
    <script type="text/javascript" src="/resource/plugins/DateUtil.js"></script>



    <%--<link rel="stylesheet" type="text/css" href="/resource/plugins/jQuery-Timepicker-Addon/jquery-ui-timepicker-addon.css">--%>
    <%--<script type="text/javascript" src="/resource/plugins/jQuery-Timepicker-Addon/jquery-ui-timepicker-addon.js"></script>--%>
    <%--<script type="text/javascript" src="/resource/plugins/jQuery-Timepicker-Addon/jquery.ui.datepicker-zh-CN.js"/>--%>
    <!--<link rel="stylesheet" href="dest/plugins/plugins.min.css">-->


    <!--首页的css-->
    <link rel="stylesheet" type="text/css" href="/resource/index.css">
</head>
<style class="css-attr"></style>
<body class="hold-transition skin-tiansu-green sidebar-mini">
<div class="wrapper">
    <header class="main-header">
        <!-- Logo -->
        <!--<a class="logo">-->
        <!--&lt;!&ndash; mini logo for sidebar mini 50x50 pixels &ndash;&gt;-->
        <!--<span class="logo-mini"><b>A</b>LT</span>-->
        <!--&lt;!&ndash; logo for regular state and mobile devices &ndash;&gt;-->
        <!--<span class="logo-lg"><b>Admin</b>LTE</span>-->
        <!--</a>-->
        <!-- Header Navbar: style can be found in header.less -->
        <nav class="navbar navbar-static-top">
            <!-- Sidebar toggle button-->
            <!--<a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">-->
            <!--<span class="sr-only">Toggle navigation</span>-->
            <!--</a>-->

            <div class="collapse navbar-collapse">
                <%--<ul class="nav navbar-nav">--%>

                <%--<li class="dropdown">--%>
                <%--<a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown <span class="caret"></span></a>--%>

                <%--</li>--%>
                <%--<li class="dropdown">-->--%>
                <%--<a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown <span class="caret"></span></a>-->--%>
               <%----%>
                <%--</li>-->--%>
                <%--<li class="dropdown">-->--%>
                <%--<a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown <span class="caret"></span></a>-->--%>
                <%--<ul class="dropdown-menu" role="menu">-->--%>
                <%--<li><a href="#">Action</a></li>-->--%>
                <%--<li><a href="#">Another action</a></li>-->--%>
                <%--<li><a href="#">Something else here</a></li>-->--%>
                <%--<li class="divider"></li>-->--%>
                <%--<li><a href="#">Separated link</a></li>-->--%>
                <%--<li class="divider"></li>-->--%>
                <%--<li><a href="#">One more separated link</a></li>-->--%>
                <%--</ul>-->--%>
                <%--</li>-->--%>
                <%--</ul>--%>
                <div class="header" id="header">
                    <div class="logo">
                        <img alt="" src="/resource/img/header_log.png">
                        <img src="/resource/img/customer_logo.png">
                    </div>
                    <div class="dropdown-menu_list">
                        <ul class="top-menu">
                        </ul>

                    </div>

                    <ul class="nav navbar-nav navbar-right">
                    <li><a class="timeCode"></a></li>
                    <li class="dropdown notifications-menu">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <i class="fa fa-bell-o"></i>
                            <span class="label label-warning">10</span>
                        </a>
                        <ul class="dropdown-menu">
                            <li class="header">You have 10 notifications</li>
                            <li>
                                <!-- inner menu: contains the actual data -->
                                <ul class="menu">
                                    <li>
                                        <a href="#">
                                            <i class="fa fa-users text-aqua"></i> 5 new members joined today
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <i class="fa fa-warning text-yellow"></i> Very long description here that
                                            may not fit into the
                                            page and may cause design problems
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <i class="fa fa-users text-red"></i> 5 new members joined
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <i class="fa fa-shopping-cart text-green"></i> 25 sales made
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <i class="fa fa-user text-red"></i> You changed your username
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li class="footer"><a href="#">View all</a></li>
                        </ul>
                    </li>
                    <li class="dropdown user user-menu">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <img src="/resource/img/user2-160x160.jpg" class="user-image" alt="User Image">
                            <span class="hidden-xs span_word"></span>
                        </a>
                        <li><a href="${ctx}/logout" title="退出登录">退出</a></li>
                        <ul class="dropdown-menu">
                            <!-- User image -->
                            <li class="user-header">
                                <img src="/resource/img/user2-160x160.jpg" class="img-circle" alt="User Image">
                            </li>
                            <li class="user-footer">
                                <div class="pull-middle">
                                    <a href="#" class="btn btn-default btn-flat">Sign out</a>
                                </div>
                            </li>
                        </ul>
                    </li>
                </ul>
                </div>
            </div>
        </nav>
    </header>
    <div class="mianbaoxie">
        <a href="#" class="menuTitle sidebar-toggle" data-toggle="offcanvas"></i>菜单导航</a>
        <span class="urlRecord">
            <%--<i class="fa fa-map-marker"></i>--%>
            <img src="/resource/img/locate.png">
            <a href="#" onclick="common.loadModule('modules/module1/overview')">总览</a>
            <%--<a href="#" onclick="common.loadModule('modules/faultOrder/faultNotify',1069)">总览</a>--%>
        </span>
    </div>
    <div id="menu-bar" class="down-content">
        <aside class="main-sidebar">
            <section class="sidebar">
                <ul class="sidebar-menu">
                    <!--<li class="header">菜单导航</li>-->
                </ul>
            </section>
        </aside>

        <div class="content-wrapper">

        </div>
    </div>
</div>
<script data-main="/resource/index.js" src="/resource/plugins/require/require.js"></script>
</body>
</html>
