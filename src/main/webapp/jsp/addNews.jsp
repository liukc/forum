<%--
  Created by IntelliJ IDEA.
  User: 刘楷川
  Date: 2019/2/21
  Time: 20:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="tools.WebProperties" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <link href="css/1.css" rel="stylesheet" type="text/css">
</head>

<body>
<div class="div-out">
    <form action="/forum/servlet/NewsServlet?type1=add" name="form1" method="post" onsubmit="return submit1()">
        <table width="600" align="center" border="1">
            <tbody>
            <tr><td>标题：</td><td>
                <input type="text" size="100" name="caption" id="caption"></td>
            </tr>
            <tr><td>类型：</td><td>
                <select name="newsType" id="newsType">
                    <c:forEach items="${applicationScope.newsTypes}"  var="newsType">
                        <option value="${newsType.name}">${newsType.name}</option>
                    </c:forEach>
                </select>
            </td>
            </tr>
            <tr>
                <td>作者：</td>
                <td><input type="text" name="author" id="author"></td>
            </tr>
            <tr>
                <td>日期：</td>
                <td><input type="datetime-local" name="newsTime" id="newsTime"></td>
            </tr>
            <tr>
                <td colspan="2">
                    <div>
                        <script id="content" type="text/plain" style="width:800px;height:500px;"></script>
                        </div>
                        </td>
                        <td>&nbsp;</td>
                        <td><input type="submit" value="发帖" ></td>
                            </tr>
                            </tbody>
                            </table>
                            </form>
                            </div>
                            <div>
                        </div>

                        </body>
                        </html>
                        <script type="text/javascript">
                         var ue = UE.getEditor('content');
                        </script>