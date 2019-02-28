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

    <title>My JSP 'personal.jsp' starting page</title>

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
    <li style="margin-left: 40px;line-height:80px">
        昵称：
        ${ sessionScope.user.name}
    </li>
    <li>
        <ul>
            头像：
        </ul>
        <ul>
            <div class="personalHead">
                <img src="${ sessionScope.user.headIconUrl}" height="100px" width="100px"/></div>
        </ul>
    <li style="margin-left: 40px;line-height: 100px">
    </li>
    </li>
    <c:if test="${sessionScope.user.type=='user'}" >
        <li style="margin-left: 40px">性别：${ sessionScope.userinformation.sex}</li>

        <li style="margin-left: 40px">爱好：${ sessionScope.userinformation.hobby} </li>

    </c:if>
    <li style="margin-left: 40px">
        个性签名：${ sessionScope.userinformation.signature}
    </li>
    <li style="margin-left: 40px;line-height: 100px">
        <a href="index.jsp?type=logined">返回首页</a>
        <a href="servlet/UserServlet?type1=exit" style="margin-left:20px">注销</a>
        <a href="/forum/jsp/changePrivate.jsp" style="margin-left:20px">修改信息</a>
    </li>
</div>
</body>
</html>

