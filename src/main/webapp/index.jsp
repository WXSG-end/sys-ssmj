<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>入口页</title>

    <link href="${pageContext.request.contextPath}/resources/xznstatic/css/jquery.dataTables.min.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/resources/xznstatic/css/jquery.toast.min.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/resources/xznstatic/css/style.css" rel="stylesheet" type="text/css">
</head>

<style>
    /* =========================
       左侧菜单：深蓝但不太深
       ========================= */
    :root{
        --ly-side-bg: #2F63B5;        /* 主深蓝 */
        --ly-side-hover: #295AA6;     /* 悬停 */
        --ly-side-active: #234F93;    /* 选中/展开 */
        --ly-side-text: rgba(255,255,255,.92);
        --ly-side-text-dim: rgba(255,255,255,.80);
    }

    /* 左侧整体背景 */
    .fixed-sidebar-left{
        background: var(--ly-side-bg) !important;
    }

    /* sidebar 内部 ul 也压一层，防止模板给它单独上色 */
    #side-menu{
        background: transparent !important;
    }

    /* 一级菜单文字/图标 */
    #side-menu > li > a{
        color: var(--ly-side-text) !important;
    }

    #side-menu > li > a i{
        color: var(--ly-side-text) !important;
    }

    /* 一级 hover */
    #side-menu > li > a:hover,
    #side-menu > li > a:focus{
        background: var(--ly-side-hover) !important;
        color: #fff !important;
    }

    /* active / open 状态（不同模板 class 可能叫 active/open） */
    #side-menu > li.active > a,
    #side-menu > li.open > a{
        background: var(--ly-side-active) !important;
        color: #fff !important;
    }

    /* 二级菜单（如果有折叠子菜单） */
    #side-menu li ul li a{
        color: var(--ly-side-text-dim) !important;
    }

    #side-menu li ul li a:hover{
        background: var(--ly-side-hover) !important;
        color: #fff !important;
    }

    /* =========================
       右上角头像：避免拉伸
       ========================= */
    .user-auth-img{
        object-fit: cover;
    }
</style>

<body>
<div class="preloader-it">
    <div class="la-anim-1"></div>
</div>
<div class="wrapper  theme-1-active pimary-color-blue">
    <nav class="navbar navbar-inverse navbar-fixed-top">
        <div class="mobile-only-brand pull-left">
            <div class="nav-header pull-left">
                <div class="logo-wrap">
                    <a href="#"><span class="brand-text" id="pName"></span></a>
                </div>
            </div><a id="toggle_nav_btn" class="toggle-left-nav-btn inline-block ml-20 pull-left"
                     href="javascript:void(0);"><i class="zmdi zmdi-menu"></i></a><a id="toggle_mobile_search"
                                                                                     data-toggle="collapse" data-target="#search_form" class="mobile-only-view"
                                                                                     href="javascript:void(0);"><i class="zmdi zmdi-search"></i></a><a id="toggle_mobile_nav"
                                                                                                                                                       class="mobile-only-view" href="javascript:void(0);"><i class="zmdi zmdi-more"></i></a>
        </div>
        <div id="mobile_only_nav" class="mobile-only-nav pull-right">
            <ul class="nav navbar-right top-nav pull-right">
                <li class="dropdown auth-drp">
                    <a href="#" class="dropdown-toggle pr-0" data-toggle="dropdown">
                        <!-- ✅ 头像改这里：改成 upload 下的 avatar.png -->
                        <img src="${pageContext.request.contextPath}/upload/avatar.png"
                             alt="avatar"
                             class="user-auth-img img-circle" />
                        <span class="user-online-status"></span>
                    </a>
                    <ul class="dropdown-menu user-auth-dropdown" data-dropdown-in="flipInX"
                        data-dropdown-out="flipOutX">
                        <li><a href="#" onclick="logout()"><i class="zmdi zmdi-power"></i><span>退出</span></a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </nav>
    <div class="fixed-sidebar-left">
        <ul class="nav navbar-nav side-nav nicescroll-bar" id="side-menu">
            <li>
                <a href="${pageContext.request.contextPath}/jsp/modules/home/home.jsp" onclick="navClick(this);return false;">
                    <div class="pull-left">
                        <i class="zmdi zmdi-flag mr-20"></i>
                        <span class="right-nav-text">主页</span>
                    </div>
                    <div class="clearfix"></div>
                </a>
            </li>
        </ul>
    </div>
    <div class="page-wrapper">
        <div class="container-fluid pt-30">
            <iframe id="mainIframe" src="${pageContext.request.contextPath}/jsp/modules/home/home.jsp" width="100%" frameborder="0" scrolling="auto" ></iframe>
        </div>
        <footer class="footer container-fluid pl-30 pr-30">
            <div class="row">
                <div class="col-sm-12">
                    <p id="copyright" style="text-align: center;"></p>
                </div>
            </div>
        </footer>
    </div>
</div>

<script src="${pageContext.request.contextPath}/resources/xznstatic/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/xznstatic/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/xznstatic/js/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/xznstatic/js/jquery.slimscroll.js"></script>
<script src="${pageContext.request.contextPath}/resources/xznstatic/js/jquery.waypoints.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/xznstatic/js/jquery.counterup.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/xznstatic/js/dropdown-bootstrap-extended.js"></script>
<script src="${pageContext.request.contextPath}/resources/xznstatic/js/jquery.sparkline.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/xznstatic/js/owl.carousel.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/xznstatic/js/switchery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/xznstatic/js/echarts-en.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/xznstatic/js/echarts-liquidfill.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/xznstatic/js/jquery.toast.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/xznstatic/js/init.js"></script>
<script src="${pageContext.request.contextPath}/resources/xznstatic/js/dashboard-data.js"></script>

<script>
    <%@ include file = "jsp/utils/menu.jsp" %>
    <%@ include file = "jsp/static/setMenu.js" %>
    <%@ include file = "jsp/utils/baseUrl.jsp" %>
    // 用户登出
    <%@ include file = "jsp/static/logout.jsp" %>

    $(document).ready(function () {
        //我的后台,session信息转移
        if (window.localStorage.getItem("Token") != null && window.localStorage.getItem("Token") != 'null') {
            if (window.sessionStorage.getItem("token") == null || window.sessionStorage.getItem("token") ==
                'null') {
                window.sessionStorage.setItem("token", window.localStorage.getItem("Token"));
                window.sessionStorage.setItem("role", window.localStorage.getItem("role"));
                window.sessionStorage.setItem("accountTableName", window.localStorage.getItem("sessionTable"));
                window.sessionStorage.setItem("username", window.localStorage.getItem("adminName"));
            }
        }

        $('.dropdown-toggle .hidden-xs').html(window.sessionStorage.getItem('username'));
        $('#pName').text(projectName);
        $('#copyright').text('欢迎使用' + projectName)
        var token = window.sessionStorage.getItem("token");
        if (token == "null" || token == null) {
            alert("请登录后再操作");
            window.location.href = ("jsp/login.jsp");
        }
        setMenu();
    });
</script>
</body>

</html>
