<%--
  Created by IntelliJ IDEA.
  User: 刘楷川
  Date: 2019/2/21
  Time: 20:54
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

    <title>My JSP 'message.jsp' starting page</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->

</head>

<body>
<table width="300" border="0" align="center" style="margin:50px;">
    <tbody>
    <tr><td>${requestScope.message.message}  </td>
    </tr>
    <tr><td>
        <c:if test="${requestScope.message.redirectTime < 10}">
            ${requestScope.message.redirectTime}秒后将跳转页面。<br>
            如果没有跳转,请按 <a href="${requestScope.message.redirectUrl}">这里</a>!!!
        </c:if>
        <c:if test="${requestScope.message.redirectTime >= 10}">
            <a href="javascript:void(0);" onclick="history.go(-1);">返回上一步</a>
        </c:if>
        &nbsp;&nbsp;<a href="javascript:self.close()" >关闭窗口</a>
    </td></tr>
    </tbody>
</table>
</body>
</html>

