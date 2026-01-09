<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <%@ include file="../../static/head.jsp" %>
</head>
<body>

<div class="loading">
    <div class="spinner">
        <div class="double-bounce1"></div>
        <div class="double-bounce2"></div>
    </div>
</div>

<div class="wrapper">
    <div id="content">
        <%@ include file="../../static/topNav.jsp" %>

        <div class="container menu-nav">
            <nav class="navbar navbar-expand-lg lochana-bg text-white">
                <button class="navbar-toggler" type="button" data-toggle="collapse"
                        data-target="#navbarSupportedContent"
                        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="ti-menu text-white"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul id="navUl" class="navbar-nav mr-auto"></ul>
                </div>
            </nav>
        </div>

        <div class="container mt-0">
            <div class="row breadcrumb-bar">
                <div class="col-md-6">
                    <h3 class="block-title">数据统计</h3>
                </div>
                <div class="col-md-6">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="${pageContext.request.contextPath}/index.jsp"><span class="ti-home"></span></a>
                        </li>
                        <li class="breadcrumb-item">数据统计</li>
                        <li class="breadcrumb-item active">统计报表</li>
                    </ol>
                </div>
            </div>
        </div>

        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="widget-area-2 lochana-box-shadow">
                        <h3 class="widget-title">统计概览</h3>

                        <div class="row">
                            <div class="col-md-3 col-sm-6 mb-3">
                                <div class="p-3 border rounded">
                                    <div>实验室预约</div>
                                    <h3 id="count_kecheng">—</h3>
                                </div>
                            </div>
                            <div class="col-md-3 col-sm-6 mb-3">
                                <div class="p-3 border rounded">
                                    <div>设备/耗材服务</div>
                                    <h3 id="count_yiqi">—</h3>
                                </div>
                            </div>
                            <div class="col-md-3 col-sm-6 mb-3">
                                <div class="p-3 border rounded">
                                    <div>实验数据记录</div>
                                    <h3 id="count_shiyanshuju">—</h3>
                                </div>
                            </div>
                            <div class="col-md-3 col-sm-6 mb-3">
                                <div class="p-3 border rounded">
                                    <div>预约审核记录</div>
                                    <h3 id="count_liuyanxinxi">—</h3>
                                </div>
                            </div>
                            <div class="col-md-3 col-sm-6 mb-3">
                                <div class="p-3 border rounded">
                                    <div>公告交流</div>
                                    <h3 id="count_xitonggonggao">—</h3>
                                </div>
                            </div>
                            <div class="col-md-3 col-sm-6 mb-3">
                                <div class="p-3 border rounded">
                                    <div>实验室（基础信息）</div>
                                    <h3 id="count_zhuanye">—</h3>
                                </div>
                            </div>
                            <div class="col-md-3 col-sm-6 mb-3">
                                <div class="p-3 border rounded">
                                    <div>学生用户</div>
                                    <h3 id="count_xueshengxinxi">—</h3>
                                </div>
                            </div>
                            <div class="col-md-3 col-sm-6 mb-3">
                                <div class="p-3 border rounded">
                                    <div>教师用户</div>
                                    <h3 id="count_laoshixinxi">—</h3>
                                </div>
                            </div>
                        </div>

                        <hr/>

                        <h3 class="widget-title">明细统计</h3>
                        <div class="table-responsive">
                            <table class="table table-bordered table-striped">
                                <thead>
                                <tr>
                                    <th style="width: 60%;">模块</th>
                                    <th>数据量（条）</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr><td>实验室预约</td><td id="td_kecheng">—</td></tr>
                                <tr><td>设备/耗材服务</td><td id="td_yiqi">—</td></tr>
                                <tr><td>实验数据记录</td><td id="td_shiyanshuju">—</td></tr>
                                <tr><td>预约审核记录</td><td id="td_liuyanxinxi">—</td></tr>
                                <tr><td>公告交流</td><td id="td_xitonggonggao">—</td></tr>
                                <tr><td>实验室（基础信息）</td><td id="td_zhuanye">—</td></tr>
                                <tr><td>学生用户</td><td id="td_xueshengxinxi">—</td></tr>
                                <tr><td>教师用户</td><td id="td_laoshixinxi">—</td></tr>
                                </tbody>
                            </table>
                            <div class="text-muted" style="font-size: 12px;">
                                说明：通过各模块分页接口返回的 totalCount/total 字段统计总数据量（若没有则回退 totalPage）。
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>

    </div>
</div>

<a id="back-to-top" href="#" class="back-to-top">
    <span class="ti-angle-up"></span>
</a>

<%@ include file="../../static/foot.jsp" %>

<script>
    <%@ include file="../../utils/menu.jsp"%>
    <%@ include file="../../static/setMenu.js"%>
    <%@ include file="../../utils/baseUrl.jsp"%>
    <%@ include file="../../static/myInfo.js"%>

    function pickTotal(res){
        if(!res || res.code !== 0 || !res.data) return "—";
        if(res.data.totalCount != null) return res.data.totalCount;
        if(res.data.total != null) return res.data.total;
        if(res.data.totalElements != null) return res.data.totalElements;
        if(res.data.totalPage != null) return res.data.totalPage; // 兜底
        return "—";
    }

    function setCount(key, val) {
        $("#count_" + key).text(val);
        $("#td_" + key).text(val);
    }

    function getTotal(apiName, key) {
        http(apiName + "/page", "GET", { page: 1, limit: 1 }, (res) => {
            setCount(key, pickTotal(res));
        });
    }

    function loadStats() {
        getTotal("kecheng", "kecheng");
        getTotal("yiqi", "yiqi");
        getTotal("shiyanshuju", "shiyanshuju");
        getTotal("liuyanxinxi", "liuyanxinxi");
        getTotal("xitonggonggao", "xitonggonggao");
        getTotal("zhuanye", "zhuanye");
        getTotal("xueshengxinxi", "xueshengxinxi");
        getTotal("laoshixinxi", "laoshixinxi");
    }

    $(document).ready(function () {
        $('.dropdown-menu h5').html(window.sessionStorage.getItem('username'));
        $('.sidebar-header h3 a').html(projectName);
        setMenu();
        loadStats();
    });
</script>
</body>
</html>

