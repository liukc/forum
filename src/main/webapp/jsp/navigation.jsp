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

    <title>My JSP 'navigation.jsp' starting page</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->
    <!-- Style Sheet-->
    <link rel="stylesheet" href="style.css"/>
    <link rel='stylesheet' id='bootstrap-css-css'  href='css/bootstrap5152.css?ver=1.0' type='text/css' media='all' />
    <link rel='stylesheet' id='responsive-css-css'  href='css/responsive5152.css?ver=1.0' type='text/css' media='all' />
    <link rel='stylesheet' id='pretty-photo-css-css'  href='js/prettyphoto/prettyPhotoaeb9.css?ver=3.1.4' type='text/css' media='all' />
    <link rel='stylesheet' id='main-css-css'  href='css/main5152.css?ver=1.0' type='text/css' media='all' />
    <link rel='stylesheet' id='custom-css-css'  href='css/custom5152.html?ver=1.0' type='text/css' media='all' />
    <link rel="stylesheet" href="../css/guide.css">

</head>

<body>
<!-- Start of Header -->
<div class="header-wrapper">
    <header>
        <div class="container">


            <div class="logo-container">
                <!-- Website Logo -->
                <a href="index.jsp"  title="提一个问题">
                    <img src="images/logo.png" alt="Knowledge Base">
                </a>
                <span class="tag-line">技术交流论坛</span>
            </div>


            <!-- Start of Main Navigation -->
            <nav class="main-nav">
                <div class="menu-top-menu-container">
                    <ul id="menu-top-menu" class="clearfix">
                        <li class="current-menu-item">
                            <a href="index.jsp">首页</a></li>
                        <c:if test="${sessionScope.user.getType() eq 'manager'}">
                            <li><button id="button1">备份</button></li>
                            <li><button id="button2">还原</button></li>
                        </c:if>
                        <c:if test="${sessionScope.user.getType() eq 'manager'}">
                            <li><a href="servlet/UserServlet?type1=showPage&page=1&pageSize=10">用户管理</a></li>
                        </c:if>
                        <li><a href="servlet/QuestionServlet?type1=showQuestion&page=1&pageSize=10">学习交流</a></li>
                        <li><a href="servlet/QuestionServlet?type1=showQuestion&page=1&pageSize=10">文章列表</a></li>
                        <li><a href="servlet/NewsServlet?type1=showNews&page=1&pageSize=10">新闻专题</a></li>
                        <li><a href="servlet/NewsServlet?type1=showNews&page=1&pageSize=10">轻松一刻</a></li>
                        <li><a href="jsp/contact.jsp">联系我们</a></li>
                        <li>
                            <c:choose>
                                <c:when test="${!(empty sessionScope.user) }">
                                    <a href="servlet/UserServlet?type1=showPrivate"><img src="${ sessionScope.user.headIconUrl}" height="20" width="20"/></a>
                                </c:when>
                                <c:otherwise><a href="jsp/login.jsp"><img src="images/timg5.jpg" height="20" width="20"/></a></c:otherwise>
                            </c:choose>
                        </li>
                    </ul>
                </div>
            </nav>
            <!-- End of Main Navigation -->

        </div>
    </header>
</div>
<!-- End of Header -->

<!-- Start of Search Wrapper -->
<div class="search-area-wrapper">
    <div class="search-area container">
        <h3 class="search-header">提出一个问题</h3>
        <p class="search-tag-line">如 果 你 有 一 个 问 题，你 可 通 过 下 面 的 搜 索 找 到 你 需 要 的 答 案</p>

        <form id="search-form" class="search-form clearfix" method="get" action="servlet/SearchServlet" autocomplete="off">
            <input class="search-term required" type="text" id="s" name="search" placeholder="输入问题描述或关键字" title="请输入搜索关键字" />
            <input class="search-btn" type="submit" value="Search" />
            <div id="search-error-container"></div>
        </form>
    </div>
</div>
<!-- End of Search Wrapper -->

<!-- script -->
<script type='text/javascript' src='js/jquery-1.8.3.min.js'></script>
<script type='text/javascript' src='js/jquery.easing.1.3.js'></script>
<script type='text/javascript' src='js/prettyphoto/jquery.prettyPhoto.js'></script>
<script type='text/javascript' src='js/jflickrfeed.js'></script>
<script type='text/javascript' src='js/jquery.liveSearch.js'></script>
<script type='text/javascript' src='js/jquery.form.js'></script>
<script type='text/javascript' src='js/jquery.validate.min.js'></script>
<script type='text/javascript' src='js/custom.js'></script>
<script type="text/javascript" src="js/sqlOperate.js"></script>
<div style="display:none"><script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script></div>
</body>
</html>
