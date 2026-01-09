<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
var menus = [{
"backMenu": [{
"child": [{
"buttons": ["新增", "修改", "删除"],
"menu": "学生用户",
"menuJump": "列表",
"tableName": "xueshengxinxi"
}],
"menu": "用户管理-学生"
}, {
"child": [{
"buttons": ["新增", "修改", "删除"],
"menu": "教师用户",
"menuJump": "列表",
"tableName": "laoshixinxi"
}],
"menu": "用户管理-教师"
}, {
"child": [{
"buttons": ["新增", "修改", "删除"],
"menu": "预约信息",
"menuJump": "列表",
"tableName": "kecheng"
}],
"menu": "实验室预约"
}, {
"child": [{
"buttons": ["新增", "修改", "删除"],
"menu": "资源信息",
"menuJump": "列表",
"tableName": "yiqi"
}],
"menu": "设备/耗材服务"
}, {
"child": [{
"buttons": ["新增", "修改", "删除"],
"menu": "实验数据信息",
"menuJump": "列表",
"tableName": "shiyanshuju"
}],
"menu": "实验数据管理"
}, {
"child": [{
"buttons": ["新增", "修改", "删除"],
"menu": "预约审核记录",
"menuJump": "列表",
"tableName": "liuyanxinxi"
}],
"menu": "预约审核"
}, {
"child": [{
"buttons": ["新增", "修改", "删除"],
"menu": "公告信息",
"menuJump": "列表",
"tableName": "xitonggonggao"
}],
"menu": "公告交流"
}, {
"child": [{
"buttons": [],
"menu": "统计报表",
"menuJump": "列表",
"tableName": "center"
}],
"menu": "数据统计"
}],
"frontMenu": [],
"roleName": "管理员",
"tableName": "users"
}, {
"backMenu": [{
"child": [{
"buttons": ["新增"],
"menu": "学生用户",
"menuJump": "列表",
"tableName": "xueshengxinxi"
}],
"menu": "用户管理-学生"
}, {
"child": [{
"buttons": ["修改"],
"menu": "教师用户",
"menuJump": "列表",
"tableName": "laoshixinxi"
}],
"menu": "用户管理-教师"
}, {
"child": [{
"buttons": ["修改"],
"menu": "预约信息",
"menuJump": "列表",
"tableName": "kecheng"
}],
"menu": "实验室预约"
}, {
"child": [{
"buttons": ["新增", "修改"],
"menu": "资源信息",
"menuJump": "列表",
"tableName": "yiqi"
}],
"menu": "设备/耗材服务"
}, {
"child": [{
"buttons": ["新增", "修改"],
"menu": "实验数据信息",
"menuJump": "列表",
"tableName": "shiyanshuju"
}],
"menu": "实验数据管理"
}, {
"child": [{
"buttons": ["新增", "修改"],
"menu": "预约审核记录",
"menuJump": "列表",
"tableName": "liuyanxinxi"
}],
"menu": "预约审核"
}, {
"child": [{
"buttons": [],
"menu": "公告信息",
"menuJump": "列表",
"tableName": "xitonggonggao"
}],
"menu": "公告交流"
}, {
"child": [{
"buttons": [],
"menu": "统计报表",
"menuJump": "列表",
"tableName": "center"
}],
"menu": "数据统计"
}],
"frontMenu": [],
"roleName": "老师",
"tableName": "laoshixinxi"
}, {
"backMenu": [{
"child": [{
"buttons": ["修改"],
"menu": "学生用户",
"menuJump": "列表",
"tableName": "xueshengxinxi"
}],
"menu": "用户管理-学生"
}, {
"child": [{
"buttons": [],
"menu": "预约信息",
"menuJump": "列表",
"tableName": "kecheng"
}],
"menu": "实验室预约"
}, {
"child": [{
"buttons": [],
"menu": "资源信息",
"menuJump": "列表",
"tableName": "yiqi"
}],
"menu": "设备/耗材服务"
}, {
"child": [{
"buttons": ["新增"],
"menu": "实验数据信息",
"menuJump": "列表",
"tableName": "shiyanshuju"
}],
"menu": "实验数据管理"
}, {
"child": [{
"buttons": ["新增"],
"menu": "预约审核记录",
"menuJump": "列表",
"tableName": "liuyanxinxi"
}],
"menu": "预约审核"
}, {
"child": [{
"buttons": [],
"menu": "公告信息",
"menuJump": "列表",
"tableName": "xitonggonggao"
}],
"menu": "公告交流"
}, {
"child": [{
"buttons": [],
"menu": "统计报表",
"menuJump": "列表",
"tableName": "center"
}],
"menu": "数据统计"
}],
"frontMenu": [],
"roleName": "学生",
"tableName": "xueshengxinxi"
}];
var hasMessage = '';
