<%--
  Created by IntelliJ IDEA.
  User: 刘楷川
  Date: 2019/2/21
  Time: 20:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

    <title>My JSP 'userDelete.jsp' starting page</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <script src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
    <script src="http://code.highcharts.com/highcharts.js"></script>
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/popper.js/1.12.5/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/css/bootstrap.min.css">
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->

</head>

<body>
<form action="servlet/UserServlet?type1=delete" id="myform" method="post">
    <table class="table table-bordered" style="width: 700px;
text-align: center;
margin-left: auto;
margin-right: auto;">
        <tr >
            <td><input id="checkboxAll" type='checkbox' onchange="checkAll1(this);"></td>
            <td><a href='javascript:void(0);' onclick="getOnePage('','userId');">Id</a></td>
            <td>用户类型</td><td>用户名</td><td>注册日期</td><td>帐号可用性</td>
        </tr>
        <c:forEach items="${sessionScope.users}"  var="user">
            <tr class="trDefault">
                <td><input name="checkbox1"  type="checkbox" value="${user.userId}"></td>
                <td>${user.userId}</td>
                <td>${user.type}</td>
                <td>${user.name}</td>
                <td>${user.registerDate}</td>
                <td>${user.enable}</td>
            </tr>
        </c:forEach>
    </table>
    <table align="center" class="tableDefault">
        <tr>
            <td width="200"><input type="button"  value="  删 除 所 选 项  " onclick="deleteUsers();"></td>
            <c:if test="${sessionScope.pageInformation.page > 1}">
                <td><a href="javascript:void(0);" onclick="getOnePage('first','');">首页</a></td>
            </c:if>

            <c:if test="${sessionScope.pageInformation.page > 1}">
                <td><a href="javascript:void(0);" onclick="getOnePage('pre','');">上一页</a></td>
            </c:if>

            <c:if test="${sessionScope.pageInformation.page < sessionScope.pageInformation.totalPageCount}">
                <td><a href="javascript:void(0);" onclick="getOnePage('next','');">下一页</a></td>
            </c:if>
            <c:if test="${sessionScope.pageInformation.page < sessionScope.pageInformation.totalPageCount}">
                <td><a href="javascript:void(0);" onclick="getOnePage('last','');">尾页</a></td>
            </c:if>
            <td>共${sessionScope.pageInformation.totalPageCount}页</td>
        </tr>
    </table>
    <input type="hidden" name="page" id="page" value="${sessionScope.pageInformation.page}">
    <input type="hidden" name="pageSize" id="pageSize" value="${sessionScope.pageInformation.pageSize}">
    <input type="hidden" name="totalPageCount" id="totalPageCount" value="${sessionScope.pageInformation.totalPageCount}">
    <input type="hidden" name="allRecordCount" id="allRecordCount" value="${sessionScope.pageInformation.allRecordCount}">
    <input type="hidden" name="orderField" id="orderField" value="${sessionScope.pageInformation.orderField}">
    <input type="hidden" name="order" id="order" value="${sessionScope.pageInformation.order}">
    <input type="hidden" name="ids" id="ids" value="${sessionScope.pageInformation.ids}">
    <input type="hidden" name="searchSql" id="searchSql" value="${sessionScope.pageInformation.searchSql}">
    <input type="hidden" name="result" id="result" value="${sessionScope.pageInformation.result}">
</form>


<script type="text/javascript">
    function checkAll1(obj){
        var checkboxs= document.getElementsByName("checkbox1");
        for (var i = 0; i < checkboxs.length; i++)
            checkboxs[i].checked =obj.checked;
    }

    function deleteUsers(){
        var checkboxs= document.getElementsByName("checkbox1");
        var ids="";
        ////拼接id为 ：1,2,
        for(i=0;i<checkboxs.length;i++){
            if(checkboxs[i].checked == true)
                ids+=checkboxs[i].value+",";
        }
        if(ids.length<1){
            alert("请选择至少一个需删除的元素！");
            return false;//阻止提交
        }
        ids=ids.substring(0,ids.length-1);//删除最后的逗号
        ids1=document.getElementById("ids");
        ids1.value=ids;
        //提交
        document.getElementById('myform').submit();
    }

    function getOnePage(type,orderFieldName){
        var url1;
        var page=document.getElementById("page");
        var pageSize=document.getElementById("pageSize");
        var totalPageCount=document.getElementById("totalPageCount");

        var order=document.getElementById("order");
        var orderField=document.getElementById("orderField");

        if(orderFieldName!=""){//切换排序
            orderField.value=orderFieldName;//设置排序字段名
            if(order.value == "asc")//切换排序
                order.value="desc";
            else
                order.value="asc";

            page.value=1;//排序后从第一页开始显示
        }

        pageValue=parseInt(page.value);
        if(type=="first")
            page.value="1";
        else if(type=="pre"){
            pageValue-=1;
            page.value=pageValue.toString();
        }else if(type=="next"){
            pageValue+=1;
            page.value=pageValue.toString();
        }else if(type=="last"){
            page.value=totalPageCount.value;
        }
        //提交
        document.getElementById('myform').submit();
    }
</script>
</body>
</html>
