<%--
  Created by IntelliJ IDEA.
  User: 刘楷川
  Date: 2019/2/21
  Time: 20:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>注册</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <link rel="stylesheet" href="css/discuss.css">
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->

</head>

<body background="images/5236.jpg">
<div class="register">
    <div class="registerTop">
        <form action="/forum/servlet/UserServlet?type1=register" method="post" onsubmit="return submit1()">
            <p>账&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号：<input name="name" type="text" id="name" onBlur="valName()">
                <br><span id="namespan"  style="color: #E7060A;"></span></p>
            <p>密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：<input name="password" type="password" id="password" onBlur="valPassword()">
                <br><span id="passwordspan"  style="color: #E7060A;"></span>
            </p>
            <p>确认密码：<input type="password" name="password2" id="password2" onBlur="passwordSame()">
                <br><span id="passwordspan2"  style="color: #E7060A;"></span>
            </p>
            <p>电子邮箱：<input type="text" name="email" id="email"></p>
            验证码：<img src="<%=request.getContextPath()%>/servlet/ImageServlet" alt="验证码" id="imgObj">
            <input type="text" id="verifyCode" name="verifyCode" size="6" />
            <a href="jsp/register.jsp" onclick="changeImg()">换一张</a><br/>
            <p>用户类型：<select name="type">
                <option value="user">普通用户</option>
                <option value="newsAuthor">小编</option>
                <option value="manager">管理员</option>
            </select></p>
            <p>
                <input  type="submit" value="注册">
            </p>
        </form>
    </div>
</div>
<script type="text/javascript">
    function changeImg() {
        var imgSrc = $("#imgObj");
        var src = imgSrc.attr("src");
        imgSrc.attr("src", chgUrl(src));
    }

    // 时间戳
    // 为了使每次生成图片不一致，即不让浏览器读缓存，所以需要加上时间戳
    function chgUrl(url) {
        var timestamp = (new Date()).valueOf();
        url = url.substring(0, 20);
        if ((url.indexOf("&") >= 0)) {
            url = url + "×tamp=" + timestamp;
        } else {
            url = url + "?timestamp=" + timestamp;
        }
        return url;
    }


    function valName(){
        var pattern = new RegExp("^[a-z]([a-z0-9])*[-_]?([a-z0-9]+)$","i");//创建模式对象
        var str1=document.getElementById("name").value;//获取文本框的内容

        if(str1==null || str1==""){
            document.getElementById("namespan").innerHTML="*不能为空";
            return false;
        }else if(str1.length>=8 && pattern.test(str1)){//pattern.test() 模式如果匹配，会返回true，不匹配返回false
            document.getElementById("namespan").innerHTML="ok";
            return true;
        }else{
            document.getElementById("namespan").innerHTML="*至少需要8个字符，以字母开头，以字母或数字结尾，可以有-和_";
            return false;
        }
    }

    function valPassword(){
        var str = document.getElementById("password").value;
        var pattern=/^(\w){6,20}$/;

        if(document.getElementById("password").value==null || document.getElementById("password").value==""){
            document.getElementById("passwordspan").innerHTML="*不能为空";
            return false;
        }else if(str.match(pattern)==null){
            document.getElementById("passwordspan").innerHTML="*只能输入6-20个字母、数字、下划线";
            return false;
        }else{
            document.getElementById("passwordspan").innerHTML="ok";
            return true;
        }
    }

    function passwordSame(){
        var str = document.getElementById("password").value;
        if(document.getElementById("password2").value==null || document.getElementById("password2").value==""){
            document.getElementById("passwordspan2").innerHTML="*不能为空";
            return false;
        }else if(document.getElementById("password").value==document.getElementById("password2").value){
            document.getElementById("passwordspan2").innerHTML="ok";
            return true ;
        }else{
            document.getElementById("passwordspan2").innerHTML="*两次密码不一样";
            return false;
        }

    }

    function submit1(){
        result1=valName();
        result1=valPassword() && result1;
        result1=passwordSame() && result1;
        if( result1)
            return true;//提交
        else
            return false;//阻止提交
    }

</script>
</body>
</html>

