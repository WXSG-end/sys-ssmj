<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<title>高校实验中心服务平台</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/xznstatic/css/bootstrap4.2.1.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/xznstatic/css/style.default.css" id="theme-stylesheet">

	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets2/js/jquery.min.js"></script>
    <style>
        /* ===== 登录页：背景图 + 模糊 + 遮罩 ===== */
        :root{
            --ly-blue-1: #A5D8FF;  /* 浅蓝（更浅） */
            --ly-blue-2: #74C0FC;  /* 浅蓝（稍深） */
            --ly-blue-3: #339AF0;  /* 按钮蓝（浅蓝系主色） */
        }

        html, body { height: 100%; }

        /* 你的页面 body 里是：<div class="page login-page"> ... */
        .page.login-page{
            position: relative;
            min-height: 100vh;
            overflow: hidden;
            background: transparent !important;
        }

        /* 背景图层 */
        .page.login-page::before{
            content: "";
            position: fixed;
            inset: 0;
            background: url("${pageContext.request.contextPath}/upload/login-bg.jpg") center/cover no-repeat;
            filter: blur(10px);         /* 模糊强度：0~20，想更清晰就改小，比如 6 */
            transform: scale(1.06);     /* 防止模糊后四周露白 */
            z-index: -2;
        }

        /* 遮罩层（让登录框更清楚） */
        .page.login-page::after{
            content: "";
            position: fixed;
            inset: 0;
            background: rgba(0, 0, 0, 0.18); /* 越大越暗：0~0.35 */
            z-index: -1;
        }

        /* ===== 左侧色块改成“浅蓝” ===== */
        .page.login-page .info{
            background: linear-gradient(135deg, var(--ly-blue-2) 0%, var(--ly-blue-1) 100%) !important;
            color: #fff;
        }

        /* ===== 登录按钮改成浅蓝系（和左侧统一）===== */
        .page.login-page .btn.btn-primary{
            background: var(--ly-blue-3) !important;
            border-color: var(--ly-blue-3) !important;
        }
        .page.login-page .btn.btn-primary:hover{
            filter: brightness(0.95);
        }

        /* 确保内容在背景上方 */
        .page.login-page .container,
        .page.login-page .form-holder{
            position: relative;
            z-index: 1;
        }
    </style>

</head>

<body>
	<div class="page login-page">
        <div class="container d-flex align-items-center">
            <div class="form-holder has-shadow">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="info d-flex align-items-center">
                            <div class="content">
                                <div class="logo">
                                    <h1>欢迎登录</h1>
                                </div>
                                <p>高校实验中心服务平台</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 bg-white">
                        <div class="form d-flex align-items-center">
                            <div class="content">
                                <form id="loginForm" action="" method="post" class="form-validate">
                                    <input type="text" required placeholder="用户名" id="username" name="username" class="input-material">
                                    <input type="password" name="password" required placeholder="密码" class="input-material">
                                    <div style="margin: 10px 0;" id="submitBtn"></div>
                                    <button type="submit" class="btn btn-primary" onclick="login()">登录</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="${pageContext.request.contextPath}/resources/xznstatic/js/bootstrap4.2.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/xznstatic/js/jquery.validate.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/xznstatic/js/front.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.form.js"></script>
	
	<script type="text/javascript">
		
		<%@ include file="utils/menu.jsp"%>
		
		<%@ include file="utils/baseUrl.jsp"%>

		var role = "";
		var accountTableName = "";
		//渲染角色选择
		function setRoleOption() {
			for (var i = 0; i < menus.length; i++) {
				var divRoot = '<div class="custom-control custom-checkbox "><input type="radio" name="chk" class="custom-control-input" id="check' + i + '" value="' + menus[i].roleName + '" onclick="checkRole(\'' + menus[i].roleName + '\', \'' + menus[i].tableName + '\')"><label class="custom-control-label" for="check' + i + '">' + menus[i].roleName + '</label></div>';
				$('#submitBtn').append(divRoot);
			}
		}
		function checkRole(roleName, tableName) {			
			role = roleName;
			$('#loginForm').attr('action', baseUrl + tableName + '/login?role='+role);
			accountTableName = tableName;
		}
		function login() {
			$("#loginForm").ajaxForm(function(res) {
				if (role == "" || role == null) {
					alert("请选择角色后再登录");
				} else {
					if (res.code == 0) {
						alert("登录成功");
						var username = $('#username').val();
						window.sessionStorage.setItem('accountTableName',accountTableName)
						window.sessionStorage.setItem('username',username);
						window.sessionStorage.setItem('token', res.token);
						window.sessionStorage.setItem('role', role);
						window.location.href = "${pageContext.request.contextPath}/index.jsp";
					} else {
						alert(res.msg);
					}
				}
			});
		}
		function ready() {
			setRoleOption();
		}
		document.addEventListener("DOMContentLoaded", ready);
	</script>
</body>

</html>
