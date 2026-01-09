<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh-cn">

<head>
    <%@ include file="../../static/head.jsp" %>
    <link href="http://www.bootcss.com/p/bootstrap-datetimepicker/bootstrap-datetimepicker/css/datetimepicker.css"
          rel="stylesheet">
    <script type="text/javascript" charset="utf-8">
        window.UEDITOR_HOME_URL = "${pageContext.request.contextPath}/resources/ueditor/";
    </script>
    <script type="text/javascript" charset="utf-8"
            src="${pageContext.request.contextPath}/resources/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8"
            src="${pageContext.request.contextPath}/resources/ueditor/ueditor.all.min.js"></script>
    <script type="text/javascript" charset="utf-8"
            src="${pageContext.request.contextPath}/resources/ueditor/lang/zh-cn/zh-cn.js"></script>
</head>
<style>
    .error { color: red; }
</style>

<body>
<!-- Pre Loader -->
<div class="loading">
    <div class="spinner">
        <div class="double-bounce1"></div>
        <div class="double-bounce2"></div>
    </div>
</div>
<!--/Pre Loader -->

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

        <!-- Page Title -->
        <div class="container mt-0">
            <div class="row breadcrumb-bar">
                <div class="col-md-6">
                    <h3 class="block-title">实验数据</h3>
                </div>
                <div class="col-md-6">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="${pageContext.request.contextPath}/index.jsp">
                                <span class="ti-home"></span>
                            </a>
                        </li>
                        <li class="breadcrumb-item">管理</li>
                        <li class="breadcrumb-item active">实验数据录入/编辑</li>
                    </ol>
                </div>
            </div>
        </div>

        <!-- Main Content -->
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="widget-area-2 lochana-box-shadow">
                        <h3 class="widget-title">实验数据信息</h3>

                        <form id="addOrUpdateForm">
                            <div class="form-row">
                                <input id="updateId" name="id" type="hidden">

                                <div class="form-group col-md-12" id="divNote">
                                    <label>实验数据内容</label>
                                    <input id="note" name="note" class="form-control" placeholder="请输入实验数据内容">
                                </div>

                                <div class="form-group col-md-6" id="divYhnote">
                                    <label>记录人</label>
                                    <input id="yhnote" name="yhnote" class="form-control" placeholder="系统自动填充" readonly>
                                </div>

                                <div class="form-group col-md-6" id="divNoteTime">
                                    <label>记录时间</label>
                                    <input id="noteTime" name="noteTime" class="form-control" placeholder="系统自动填充" readonly>
                                </div>

                                <div class="form-group col-md-12" id="divReply">
                                    <label>备注</label>
                                    <input id="reply" name="reply" class="form-control" placeholder="可填写备注（选填）">
                                </div>

                                <div class="form-group col-md-6" id="divGlreply">
                                    <label>备注人</label>
                                    <input id="glreply" name="glreply" class="form-control" placeholder="系统自动填充" readonly>
                                </div>

                                <div class="form-group col-md-6" id="divReplyTime">
                                    <label>备注时间</label>
                                    <input id="replyTime" name="replyTime" class="form-control" placeholder="系统自动填充" readonly>
                                </div>

                                <div class="form-group col-md-12 mb-3">
                                    <button id="exitBtn" type="button" class="btn btn-primary btn-lg">返回</button>
                                    <button id="submitBtn" type="button" class="btn btn-primary btn-lg">提交</button>
                                </div>
                            </div>
                        </form>

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
<script src="${pageContext.request.contextPath}/resources/js/vue.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.ui.widget.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.fileupload.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.form.js"></script>
<script type="text/javascript" charset="utf-8"
        src="${pageContext.request.contextPath}/resources/js/validate/jquery.validate.min.js"></script>
<script type="text/javascript" charset="utf-8"
        src="${pageContext.request.contextPath}/resources/js/validate/messages_zh.js"></script>
<script type="text/javascript" charset="utf-8"
        src="${pageContext.request.contextPath}/resources/js/validate/card.js"></script>
<script type="text/javascript" charset="utf-8"
        src="${pageContext.request.contextPath}/resources/js/datetimepicker/bootstrap-datetimepicker.min.js"></script>

<script>
    <%@ include file="../../utils/menu.jsp"%>
    <%@ include file="../../static/getRoleButtons.js"%>
    <%@ include file="../../static/setMenu.js"%>
    <%@ include file="../../utils/baseUrl.jsp"%>

    // ✅ 关键：这里必须是 shiyanshuju
    var tableName = "shiyanshuju";
    var pageType = "add-or-update";
    var updateId = "";
    var ruleForm = {};

    // 用于兼容你原本页面结构（不强依赖 Vue 绑定）
    var vm = new Vue({
        el: '#addOrUpdateForm',
        data: { ruleForm: {} },
        beforeCreate: function () {
            // 这里不做事也行，保留结构不影响
        },
        methods: {}
    });

    function formatDateTime(d) {
        const pad = (n) => (n < 10 ? '0' + n : n);
        return d.getFullYear() + '-' + pad(d.getMonth() + 1) + '-' + pad(d.getDate())
            + ' ' + pad(d.getHours()) + ':' + pad(d.getMinutes()) + ':' + pad(d.getSeconds());
    }

    // 表单提交
    function submit() {
        if (validform() == true && compare() == true) {
            // ✅ 新增时自动填充记录人/记录时间
            if (!$('#yhnote').val()) $('#yhnote').val(window.sessionStorage.getItem('username') || '');
            if (!$('#noteTime').val()) $('#noteTime').val(formatDateTime(new Date()));

            // ✅ 如果填了备注但没填备注人/时间，则自动填充
            if ($('#reply').val() && !$('#glreply').val()) $('#glreply').val(window.sessionStorage.getItem('username') || '');
            if ($('#reply').val() && !$('#replyTime').val()) $('#replyTime').val(formatDateTime(new Date()));

            let data = {};
            let value = $('#addOrUpdateForm').serializeArray();
            $.each(value, function (index, item) {
                data[item.name] = item.value;
            });

            var urlParam;
            var successMes = '';
            if (updateId != null && updateId != "null" && updateId != '') {
                urlParam = 'update';
                successMes = '更新成功';
            } else {
                urlParam = 'save';
                successMes = '保存成功';
            }

            // ✅ 关键：接口必须走 shiyanshuju
            httpJson(tableName + "/" + urlParam, "POST", data, (res) => {
                if (res.code == 0) {
                    window.sessionStorage.removeItem('id');
                    alert(successMes);
                    window.location.href = "list.jsp";
                } else if (res.code == 401) {
                    <%@ include file="../../static/toLogin.jsp"%>
                } else {
                    alert(res.msg || "操作失败");
                }
            });
        } else {
            alert("表单未填完整或有错误");
        }
    }

    function exit() {
        window.sessionStorage.removeItem("updateId");
        window.location.href = "list.jsp";
    }

    // 表单校验
    function validform() {
        return $("#addOrUpdateForm").validate({
            rules: {
                note: { required: true },
                reply: {},
                yhnote: {},
                noteTime: {},
                glreply: {},
                replyTime: {},
            },
            messages: {
                note: { required: "请填写实验数据内容" },
            }
        }).form();
    }

    // 获取当前详情（编辑时回显）
    function getDetails() {
        var id = window.sessionStorage.getItem("updateId");
        if (id != null && id != "" && id != "null") {
            updateId = id;
            window.sessionStorage.removeItem('updateId');

            // ✅ 关键：详情接口必须走 shiyanshuju
            http(tableName + "/info/" + id, "GET", {}, (res) => {
                if (res.code == 0) {
                    ruleForm = res.data || {};
                    dataBind();
                    $(validform());
                } else if (res.code == 401) {
                    <%@ include file="../../static/toLogin.jsp"%>
                } else {
                    alert(res.msg || "获取详情失败");
                }
            });
        } else {
            // 新增模式默认填充
            $('#yhnote').val(window.sessionStorage.getItem('username') || '');
            $('#noteTime').val(formatDateTime(new Date()));
            $(validform());
        }
    }

    function dataBind() {
        $("#updateId").val(ruleForm.id || '');
        $("#note").val(ruleForm.note || '');
        $("#yhnote").val(ruleForm.yhnote || (window.sessionStorage.getItem('username') || ''));
        $("#noteTime").val(ruleForm.noteTime || '');
        $("#reply").val(ruleForm.reply || '');
        $("#glreply").val(ruleForm.glreply || '');
        $("#replyTime").val(ruleForm.replyTime || '');
    }

    // 用户登出
    <%@ include file="../../static/logout.jsp"%>

    //比较大小（保留原结构）
    function compare() { return true; }

    $(document).ready(function () {
        //设置右上角用户名
        $('.dropdown-menu h5').html(window.sessionStorage.getItem('username'))
        //设置项目名
        $('.sidebar-header h3 a').html(projectName)
        //设置导航栏菜单
        setMenu();

        $('#exitBtn').on('click', function (e) {
            e.preventDefault();
            exit();
        });
        $('#submitBtn').on('click', function (e) {
            e.preventDefault();
            submit();
        });

        getDetails();

        <%@ include file="../../static/myInfo.js"%>
    });
</script>
</body>
</html>
