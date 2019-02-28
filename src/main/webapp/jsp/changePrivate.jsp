<%--
  Created by IntelliJ IDEA.
  User: 刘楷川
  Date: 2019/2/21
  Time: 20:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>My JSP 'changePrivate.jsp' starting page</title>

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

<div class="personal">
    <form action="servlet/UserServlet?type1=changePrivate2" method="post"  enctype="multipart/form-data"  target="frame">
        <li style="margin-left:40px; line-height:50px">
            昵称：${ sessionScope.user.name}</li>
        <li>
            <ul>
                头像：
            </ul>
            <ul>
                <div class="personalHead">
                    <img src="${ sessionScope.user.headIconUrl}" height="100px" width="100px"/></div>
            </ul>
            <input id="myFile" name="myFile" type="file" onchange="preview()" value="null">
            <br>预览：<img id="myImage" height="100"/>
            <c:if test="${sessionScope.user.type=='user'}" >
        <li style="margin-left: 40px">性别：
            <select name="sex" id="sex">
                <option value="男">男</option>
                <option value="女">女</option>
            </select></li>

        <li style="margin-left: 40px">爱好：<input name="hobby" value="${ sessionScope.userinformation.hobby}"/></li>

        </c:if>
        <li style="margin-left: 40px">
            个性签名：<textarea cols="60" rows="3"  name="signature">${ sessionScope.userinformation.signature}</textarea>
        </li>
        <li style="margin-left: 40px;line-height: 100px">
            <input type="submit" value="提交"/>
        </li>
    </form>
</div>

<script language=javascript>
    function preview() {
        var preview = document.getElementById("myImage");
        var file  = document.getElementById("myFile").files[0];
        var reader = new FileReader();
        reader.onloadend = function () {
            preview.src = reader.result;
        }

        if (file)
            reader.readAsDataURL(file);
        else
            preview.src ="";
    }

    var sex = document.getElementById("sex");
    for (var i = 0; i < sex.options.length; i++) {
        if (sex.options[i].value == "${sessionScope.userinformation.sex}") {
            sex.options[i].selected = true;
            break;
        }
    }
</script>
</body>
</html>
