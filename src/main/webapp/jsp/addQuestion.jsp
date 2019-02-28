<%--
  Created by IntelliJ IDEA.
  User: 刘楷川
  Date: 2019/2/21
  Time: 20:49
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
    <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="../plugin/wangEditor-3.1.1/release/wangEditor.min.js"></script>
</head>

<body>
<div class="div-out" >
    <form action="/forum/servlet/QuestionServlet?type1=add" name="form1" method="post">
        <table width="600" align="center" border="1">
            <tbody>
            <tr><td>标题：</td><td>
                <input type="text" size="100" name="caption" id="caption"></td>
            </tr>
            <tr><td>类型：</td><td>
                <select name="questionType" id="questionType">
                    <option>学习</option>
                    <option>生活</option>
                </select>
            </td>
            </tr>
            <tr>
                <td>作者：</td>
                <td><input type="text" name="author" id="author"></td>
            </tr>
            <tr>
                <td>日期：</td>
                <td><input type="datetime-local" name="questionTime" id="newsTime"></td>
            </tr>
            </tbody>
        </table>
        <div id="div1" style="width: 719px;margin: auto">

        </div>
        <textarea id="text1" style="width:100%; height:200px;display: none" name="editorValue"></textarea>
        <table width="718px" align="center" border="1">
            <tr>
                <td colspan="2">
                        </td>
                        <td>&nbsp;</td>
                        <td style="text-align: right"><input type="submit" value="发帖" id="btn1" ></td>
            </tr>
        </table>

    </form>
</div>

<script type="text/javascript">
    var E = window.wangEditor
    var editor = new E('#div1')
    var $text1 = $('#text1')
    editor.customConfig.onchange = function (html) {
        // 监控变化，同步更新到 textarea
        $text1.val(html)
    }
    editor.create()
    // 初始化 textarea 的值
    $text1.val(editor.txt.html())
</script>

</body>
</html>