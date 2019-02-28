<%--
  Created by IntelliJ IDEA.
  User: 刘楷川
  Date: 2019/2/21
  Time: 20:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="bean.User" %>
<%@ page import="dao.UserDao" %>
<%@ page import="service.UserService" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en" xmlns:v-bind="http://www.w3.org/1999/xhtml" xmlns:v-if="http://www.w3.org/1999/xhtml"
      xmlns:v-on="http://www.w3.org/1999/xhtml">
<head>
    <base href="<%=basePath%>">

    <title>登陆</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <link rel="stylesheet" href="css/discuss.css">
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->
    <script src="https://cdn.jsdelivr.net/npm/vue"></script>
</head>

<body background="images/5236.jpg">
<div class="login">
    <div class="loginTop">
        <form action="servlet/UserServlet?type1=login" method="post">
            <p>账号：<input type="text" name="name" >&nbsp;&nbsp;<a href="jsp/register.jsp">注册账号</a></p>
            <p>密码：<input type="password" name="password">&nbsp;&nbsp;<a href="#">忘记密码</a></p>
            <p style="color:red"><%
                String type = request.getParameter("type");
                if("wrongPassword".equals(type)){
                    System.out.println("密码错误！");
                }
            %></p>
            <p>
                <input  type="submit" value="登录">
                <span id="qqLoginBtn"><a href="oauth/qqLogin.do"><button>qq登陆</button></a></span>
            </p>
        </form>
    </div>
</div>
<div id="app">
    <template v-if="loginType === 'username'">
        <label>Username</label>
        <input placeholder="Enter your username" key="username-input">
    </template>
    <template v-else>
        <label>Email</label>
        <input placeholder="Enter your email address" key="email-input">
    </template>
    <button @click="toggleLoginType">Toggle login type</button>
</div>
<script type="text/javascript">
    QC.Login({
            //btnId：插入按钮的节点id，必选
            btnId:"qqLoginBtn",
            //用户需要确认的scope授权项，可选，默认all
            scope:"all",
            //按钮尺寸，可用值[A_XL| A_L| A_M| A_S|  B_M| B_S| C_S]，可选，默认B_S
            size: "A_XL"
        }, function(reqData, opts){//登录成功
            //根据返回数据，更换按钮显示状态方法
            var dom = document.getElementById(opts['btnId']),
                _logoutTemplate=[
                    //头像
                    '<span><img src="{figureurl}" class="{size_key}"/></span>',
                    //昵称
                    '<span>{nickname}</span>',
                    //退出
                    '<span><a href="javascript:QC.Login.signOut();">退出</a></span>'
                ].join("");
            dom && (dom.innerHTML = QC.String.format(_logoutTemplate, {
                nickname : QC.String.escHTML(reqData.nickname), //做xss过滤
                figureurl : reqData.figureurl
            }));
        }, function(opts){//注销成功
            alert('QQ登录 注销成功');
        }
    );
</script>
<script type="text/javascript"  charset="utf-8"
        src="http://connect.qq.com/qc_jssdk.js"
        data-appid="101550193"
        data-redirecturi="http://localhost:8080/forum/index.jsp"
></script>
<script>
    var vm = new Vue({
        el:'#app',
        data:{
            loginType:'username'
        },
        methods:{
            toggleLoginType: function () {
                return this.loginType = this.loginType === 'username' ? 'email' : 'username'
            }
        }
    })
</script>
</body>
</html>

