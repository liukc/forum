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

    <title>新闻专题</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <!-- Style Sheet-->
    <link rel="stylesheet" href="style.css"/>
    <link rel='stylesheet' id='bootstrap-css-css'  href='css/bootstrap5152.css?ver=1.0' type='text/css' media='all' />
    <link rel='stylesheet' id='responsive-css-css'  href='css/responsive5152.css?ver=1.0' type='text/css' media='all' />
    <link rel='stylesheet' id='pretty-photo-css-css'  href='js/prettyphoto/prettyPhotoaeb9.css?ver=3.1.4' type='text/css' media='all' />
    <link rel='stylesheet' id='main-css-css'  href='css/main5152.css?ver=1.0' type='text/css' media='all' />
    <link rel='stylesheet' id='custom-css-css'  href='css/custom5152.html?ver=1.0' type='text/css' media='all' />
    <link rel="stylesheet" href="css/guide.css">
    <link rel="stylesheet" href="css/discuss.css">
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->

</head>

<body>
<jsp:include page="navigation.jsp" />
<!-- Start of Page Container -->
<div class="page-container">
    <div class="container">
        <div class="row">

            <!-- start of page content -->
            <div class="span8 main-listing">
                <form action="servlet/NewsServlet?type1=showNews" id="myform" method="post">
                    <c:forEach items="${sessionScope.newss}"  var="news">
                        <article class=" type-post  format-standard hentry clearfix">

                            <header class="clearfix">

                                <h3 class="post-title">
                                    <a href="servlet/NewsServlet?type1=showANews&newsId=${news.newsId}&page=1&pageSize=2">${news.caption}</a>
                                </h3>

                                <div class="post-meta clearfix">
                                    <span class="date">${news.newsTime}</span>
                                    <span class="category">${news.author}</span>
                                    <span class="comments">${news.newsId}</span>

                                </div><!-- end of post meta -->

                            </header>
                        </article>
                    </c:forEach>
                    <div id="pagination">
                        <c:if test="${sessionScope.pageInformation.page > 1}">
                            <a href="javascript:void(0);" class="btn" onclick="getOnePage('first','');">首页</a>
                        </c:if>

                        <c:if test="${sessionScope.pageInformation.page > 1}">
                            <a href="javascript:void(0);" class="btn" onclick="getOnePage('pre','');">上一页</a>
                        </c:if>

                        <c:if test="${sessionScope.pageInformation.page < sessionScope.pageInformation.totalPageCount}">
                            <a href="javascript:void(0);" class="btn" onclick="getOnePage('next','');">下一页</a>
                        </c:if>
                        <c:if test="${sessionScope.pageInformation.page < sessionScope.pageInformation.totalPageCount}">
                            <a href="javascript:void(0);" class="btn" onclick="getOnePage('last','');">尾页</a>
                        </c:if>
                        <div class="btn">共${sessionScope.pageInformation.totalPageCount}页</div>
                    </div>
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
            </div>
            <!-- end of page content -->


            <!-- start of sidebar -->
            <aside class="span4 page-sidebar" style="margin:10px">
                <c:if test="${sessionScope.user.getType() eq 'manager'}">
                    <a href="/forum/jsp/addNews.jsp" class="btn">发帖</a>
                    <a href="#" class="btn">删帖</a>
                </c:if>
                <section class="widget">
                    <div class="support-widget">
                        <h3 class="title">帮助</h3>
                        <p class="intro">需要更多的帮助吗? 如果没有找到您所需要的答案，请联系我们.</p>
                    </div>
                </section>


                <section class="widget">
                    <h3 class="title">热门文章</h3>
                    <ul class="articles">
                        <li class="article-entry standard">
                            <h4><a href="single.html">Integrating WordPress with Your Website</a></h4>
                            <span class="article-meta">25 Feb, 2013 in <a href="#"
                                                                          title="View all posts in Server &amp; Database">Server &amp; Database</a></span>
                            <span class="like-count">66</span>
                        </li>
                        <li class="article-entry standard">
                            <h4><a href="single.html">WordPress Site Maintenance</a></h4>
                            <span class="article-meta">24 Feb, 2013 in <a href="#"
                                                                          title="View all posts in Website Dev">Website Dev</a></span>
                            <span class="like-count">15</span>
                        </li>
                        <li class="article-entry video">
                            <h4><a href="single.html">Meta Tags in WordPress</a></h4>
                            <span class="article-meta">23 Feb, 2013 in <a href="#"
                                                                          title="View all posts in Website Dev">Website Dev</a></span>
                            <span class="like-count">8</span>
                        </li>
                        <li class="article-entry image">
                            <h4><a href="single.html">WordPress in Your Language</a></h4>
                            <span class="article-meta">22 Feb, 2013 in <a href="#"
                                                                          title="View all posts in Advanced Techniques">Advanced Techniques</a></span>
                            <span class="like-count">6</span>
                        </li>
                    </ul>
                </section>


                <section class="widget">
                    <h3 class="title">最新评论</h3>
                    <ul id="recentcomments">
                        <li class="recentcomments"><a href="#" rel="external nofollow" class="url">John Doe</a> on <a
                                href="#">Integrating WordPress with Your Website</a></li>
                        <li class="recentcomments">saqib sarwar on <a href="#">Integrating WordPress with Your
                            Website</a></li>
                        <li class="recentcomments"><a href="#" rel="external nofollow" class="url">John Doe</a> on <a
                                href="#">Integrating WordPress with Your Website</a></li>
                        <li class="recentcomments"><a href="#" rel="external nofollow" class="url">Mr WordPress</a> on
                            <a href="#">Installing WordPress</a></li>
                    </ul>
                </section>

            </aside>
            <!-- end of sidebar -->
        </div>
    </div>
</div>
<!-- End of Page Container -->
<jsp:include page="foot.jsp" />
<!-- script -->
<script type="text/javascript">
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
<script type='text/javascript' src='js/jquery-1.8.3.min.js'></script>
<script type='text/javascript' src='js/jquery.easing.1.3.js'></script>
<script type='text/javascript' src='js/prettyphoto/jquery.prettyPhoto.js'></script>
<script type='text/javascript' src='js/jflickrfeed.js'></script>
<script type='text/javascript' src='js/jquery.liveSearch.js'></script>
<script type='text/javascript' src='js/jquery.form.js'></script>
<script type='text/javascript' src='js/jquery.validate.min.js'></script>
<script type='text/javascript' src='js/custom.js'></script>
</body>
</html>

