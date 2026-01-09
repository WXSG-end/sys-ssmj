<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh-cn">

<head>
    <%@ include file="../../static/head.jsp" %>
    <link href="http://www.bootcss.com/p/bootstrap-datetimepicker/bootstrap-datetimepicker/css/datetimepicker.css"
          rel="stylesheet">
    <script type="text/javascript" charset="utf-8">
        window.UEDITOR_HOME_URL = "${pageContext.request.contextPath}/resources/ueditor/"; //UEDITOR_HOME_URL、config、all这三个顺序不能改变
    </script>
    <script type="text/javascript" charset="utf-8"
            src="${pageContext.request.contextPath}/resources/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8"
            src="${pageContext.request.contextPath}/resources/ueditor/ueditor.all.min.js"></script>
    <script type="text/javascript" charset="utf-8"
            src="${pageContext.request.contextPath}/resources/ueditor/lang/zh-cn/zh-cn.js"></script>
</head>
<style>
    .error {
        color: red;
    }
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
    <!-- Page Content -->
    <div id="content">
        <!-- Top Navigation -->
        <%@ include file="../../static/topNav.jsp" %>
        <!-- Menu -->
        <div class="container menu-nav">
            <nav class="navbar navbar-expand-lg lochana-bg text-white">
                <button class="navbar-toggler" type="button" data-toggle="collapse"
                        data-target="#navbarSupportedContent"
                        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="ti-menu text-white"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul id="navUl" class="navbar-nav mr-auto">

                    </ul>
                </div>
            </nav>
        </div>
        <!-- /Menu -->
        <!-- Breadcrumb -->
        <!-- Page Title -->
        <div class="container mt-0">
            <div class="row breadcrumb-bar">
                <div class="col-md-6">
                    <h3 class="block-title">编辑资源信息</h3>
                </div>
                <div class="col-md-6">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="${pageContext.request.contextPath}/index.jsp">
                                <span class="ti-home"></span>
                            </a>
                        </li>
                        <li class="breadcrumb-item">设备/耗材服务</li>
                        <li class="breadcrumb-item active">编辑资源信息</li>
                    </ol>
                </div>
            </div>
        </div>
        <!-- /Page Title -->

        <!-- /Breadcrumb -->
        <!-- Main Content -->
        <div class="container">

            <div class="row">
                <!-- Widget Item -->
                <div class="col-md-12">
                    <div class="widget-area-2 lochana-box-shadow">
                        <h3 class="widget-title">资源信息</h3>
                        <form id="addOrUpdateForm">
                            <div class="form-row">
                                <input id="updateId" name="id" type="hidden">
                                <div class="form-group col-md-6">
                                    <label>资源名称</label>
                                    <input id="serial" name="serial" class="form-control"
                                           placeholder="资源名称">
                                </div>
                                <div class="form-group col-md-6">
                                    <label>资源类别</label>
                                    <select id="lxTypesSelect" name="lxTypes" class="form-control">
                                    </select>
                                </div>
                                <div class="form-group col-md-6">
                                    <label>所属实验室</label>
                                    <select id="zyTypesSelect" name="zyTypes" class="form-control">
                                    </select>
                                </div>
                                <div class="form-group col-md-6">
                                    <label>资源类型（设备/耗材）</label>
                                    <select id="resourceTypesSelect" name="resourceTypes" class="form-control">
                                    </select>
                                </div>

                                <div class="form-group col-md-6">
                                    <label>库存（耗材）</label>
                                    <input id="stock" name="stock" class="form-control" placeholder="库存（耗材）">
                                </div>

                                <div class="form-group col-md-6">
                                    <label>单位（耗材）</label>
                                    <input id="unit" name="unit" class="form-control" placeholder="例如：盒/瓶/支/个">
                                </div>

                                <div class="form-group col-md-6">
                                    <label>预警阈值（耗材）</label>
                                    <input id="threshold" name="threshold" class="form-control"
                                           placeholder="例如：10（低于10预警）">
                                </div>

                                <div class="form-group col-md-12 mb-3">
                                    <button id="exitBtn" type="button" class="btn btn-primary btn-lg">返回</button>
                                    <button id="submitBtn" type="button" class="btn btn-primary btn-lg">提交</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <!-- /Widget Item -->
            </div>
        </div>
        <!-- /Main Content -->
    </div>
    <!-- /Page Content -->
</div>
<!-- Back to Top -->
<a id="back-to-top" href="#" class="back-to-top">
    <span class="ti-angle-up"></span>
</a>
<!-- /Back to Top -->
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
    <%@ include file="../../static/setMenu.js"%>
    <%@ include file="../../utils/baseUrl.jsp"%>

    var tableName = "yiqi";
    var pageType = "add-or-update";
    var updateId = "";
    var crossTableId = -1;
    var crossTableName = '';
    var ruleForm = {};
    var crossRuleForm = {};

    var lxTypesOptions = [];
    var zyTypesOptions = [];
    var resourceTypesOptions = [];

    // 注意：这个 vm 在当前页面其实没参与数据回显逻辑，但为了不影响你原项目结构，这里保留
    var vm = new Vue({
        el: '#addOrUpdateForm',
        data: { ruleForm: {} },
        beforeCreate: function () {
            var id = window.sessionStorage.getItem("updateId");
            if (id != null && id != "" && id != "null") {
                $.ajax({
                    type: "GET",
                    url: baseUrl + "yiqi/info/" + id,
                    beforeSend: function (xhr) {
                        xhr.setRequestHeader("token", window.sessionStorage.getItem('token'));
                    },
                    success: function (res) {
                        if (res.code == 0) {
                            vm.ruleForm = res.data;
                        } else if (res.code == 401) {
                            <%@ include file="../../static/toLogin.jsp"%>
                        } else {
                            alert(res.msg)
                        }
                    },
                });
            }
        },
        methods: {}
    });

    // 文件上传
    function upload() {}

    // 表单提交
    function submit() {
        if (validform() == true && compare() == true) {
            let data = {};
            getContent();
            let value = $('#addOrUpdateForm').serializeArray();
            $.each(value, function (index, item) {
                data[item.name] = item.value;
            });

            var urlParam;
            var successMes = '';
            if (updateId != null && updateId != "null" && updateId != '') {
                urlParam = 'update';
                successMes = '修改成功';
            } else {
                urlParam = 'save';
                successMes = '添加成功';
            }

            httpJson("yiqi/" + urlParam, "POST", data, (res) => {
                if (res.code == 0) {
                    window.sessionStorage.removeItem('id');
                    alert(successMes);

                    if (window.sessionStorage.getItem('onlyme') != null && window.sessionStorage.getItem('onlyme') == "true") {
                        window.sessionStorage.removeItem('onlyme');
                        window.parent.location.href = "${pageContext.request.contextPath}/index.jsp";
                    } else {
                        window.location.href = "list.jsp";
                    }
                } else if (res.code == 401) {
                    <%@ include file="../../static/toLogin.jsp"%>
                } else {
                    alert(res.msg || "提交失败");
                }
            });
        } else {
            alert("表单未填完整或有错误");
        }
    }

    // ======== 下拉框数据查询（改：拉到数据后再渲染 option，再回显） ========
    function lxTypesSelect() {
        http("dictionary/page?page=1&limit=100&sort=&order=&dicCode=lx_types", "GET", {}, (res) => {
            if (res.code == 0) {
                lxTypesOptions = res.data.list || [];
                initializationLxtypesSelect();
                setSelectOption();
            }
        });
    }

    function zyTypesSelect() {
        // 所属实验室来自实验室表（你项目里还是 zhuanye 表）
        http("zhuanye/page?page=1&limit=100&sort=&order=", "GET", {}, (res) => {
            if (res.code == 0) {
                zyTypesOptions = res.data.list || [];
                initializationZytypesSelect();
                setSelectOption();
            }
        });
    }

    function resourceTypesSelect() {
        http("dictionary/page?page=1&limit=100&sort=&order=&dicCode=resource_types", "GET", {}, (res) => {
            if (res.code == 0) {
                resourceTypesOptions = res.data.list || [];
                initializationResourceTypesSelect();
                setSelectOption();
            }
        });
    }

    // ======== 初始化下拉框（改：先清空，防止重复叠加） ========
    function initializationLxtypesSelect() {
        var lxTypesSelect = document.getElementById('lxTypesSelect');
        lxTypesSelect.options.length = 0;
        for (var i = 0; i < lxTypesOptions.length; i++) {
            lxTypesSelect.add(new Option(lxTypesOptions[i].indexName, lxTypesOptions[i].codeIndex));
        }
    }

    function initializationZytypesSelect() {
        var zyTypesSelect = document.getElementById('zyTypesSelect');
        zyTypesSelect.options.length = 0;
        for (var i = 0; i < zyTypesOptions.length; i++) {
            zyTypesSelect.add(new Option(zyTypesOptions[i].serial, zyTypesOptions[i].id));
        }
    }

    function initializationResourceTypesSelect() {
        var resourceTypesSelect = document.getElementById('resourceTypesSelect');
        resourceTypesSelect.options.length = 0;
        for (var i = 0; i < resourceTypesOptions.length; i++) {
            resourceTypesSelect.add(new Option(resourceTypesOptions[i].indexName, resourceTypesOptions[i].codeIndex));
        }
    }

    // ======== 下拉框选项回显（修复版：避免你原来那段 i 重复/大括号错位导致 JS 报错） ========
    function setSelectOption() {
        if (!ruleForm) return;

        if (ruleForm.lxTypes != null) {
            $("#lxTypesSelect").val(String(ruleForm.lxTypes));
        }
        if (ruleForm.zyTypes != null) {
            $("#zyTypesSelect").val(String(ruleForm.zyTypes));
        }
        if (ruleForm.resourceTypes != null) {
            $("#resourceTypesSelect").val(String(ruleForm.resourceTypes));
        }
    }

    // 填充富文本框
    function setContent() {}

    // 获取富文本框内容
    function getContent() {}

    function exit() {
        window.sessionStorage.removeItem("updateId");
        window.location.href = "list.jsp";
    }

    // 表单校验
    function validform() {
        return $("#addOrUpdateForm").validate({
            rules: {
                serial: {},
                lxTypes: {},
                zyTypes: {}
            },
            messages: {
                serial: {},
                lxTypes: {},
                zyTypes: {}
            }
        }).form();
    }

    // 添加表单校验方法
    function addValidation() {
        jQuery.validator.addMethod("isPhone", function (value, element) {
            var length = value.length;
            var mobile = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1})|(17[0-9]{1}))+\d{8})$/;
            return this.optional(element) || (length == 11 && mobile.test(value));
        }, "请填写正确的手机号码");
        jQuery.validator.addMethod("isIdCardNo", function (value, element) {
            return this.optional(element) || idCardNoUtil.checkIdCardNo(value);
        }, "请正确输入您的身份证号码");
    }

    // 获取当前详情
    function getDetails() {
        var id = window.sessionStorage.getItem("updateId");
        if (id != null && id != "" && id != "null") {
            updateId = id;
            window.sessionStorage.removeItem('updateId');

            http("yiqi/info/" + id, "GET", {}, (res) => {
                if (res.code == 0) {
                    ruleForm = res.data;

                    // ★先填输入框（库存/单位/阈值等）
                    dataBind();

                    // ★再回显下拉框（依赖 option 已渲染；如果 option 还没回来，稍后回调里也会 setSelectOption）
                    setSelectOption();

                    // 设置图片src
                    showImg();

                    // 富文本框回显
                    setContent();

                    //注册表单验证
                    $(validform());
                } else if (res.code == 401) {
                    <%@ include file="../../static/toLogin.jsp"%>
                } else {
                    alert(res.msg || "获取详情失败");
                }
            });
        } else {
            $(validform());
        }
    }

    function dataBind() {
        $("#updateId").val(ruleForm.id);
        $("#serial").val(ruleForm.serial);

        // ★库存/单位/阈值回显
        $("#stock").val(ruleForm.stock);
        $("#unit").val(ruleForm.unit);
        $("#threshold").val(ruleForm.threshold);
    }

    //图片显示
    function showImg() {}

    function dateTimePick() {
        $.fn.datetimepicker.dates['zh-CN'] = {
            days: ["星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六", "星期日"],
            daysShort: ["周日", "周一", "周二", "周三", "周四", "周五", "周六", "周日"],
            daysMin: ["日", "一", "二", "三", "四", "五", "六", "日"],
            months: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],
            monthsShort: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],
            today: "今天",
            suffix: [],
            meridiem: ["上午", "下午"]
        };
    }

    function calculationPre() {}

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

        dateTimePick();
        addValidation();

        // 拉下拉框数据（回调里会渲染 option 并回显）
        lxTypesSelect();
        zyTypesSelect();
        resourceTypesSelect();

        // 取详情并回显
        getDetails();

        upload();
        calculationPre();

        <%@ include file="../../static/myInfo.js"%>

        $('#submitBtn').on('click', function (e) {
            e.preventDefault();
            submit();
        });

        readonly();
    });

    function readonly() {
        if (window.sessionStorage.getItem('role') != '管理员') {
            $('#jifen').attr('readonly', 'readonly');
        }
    }

    //比较大小
    function compare() {
        var largerVal = null;
        var smallerVal = null;
        if (largerVal != null && smallerVal != null) {
            if (largerVal <= smallerVal) {
                alert(smallerName + '不能大于等于' + largerName);
                return false;
            }
        }
        return true;
    }

    // 用户登出
    <%@ include file="../../static/logout.jsp"%>
</script>
</body>
</html>
