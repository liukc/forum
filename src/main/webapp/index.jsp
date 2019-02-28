<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>技术交流论坛</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <!-- Style Sheet-->

    <link rel='stylesheet' id='bootstrap-css-css'  href='css/bootstrap5152.css?ver=1.0' type='text/css' media='all' />
    <link rel='stylesheet' id='responsive-css-css'  href='css/responsive5152.css?ver=1.0' type='text/css' media='all' />
    <link rel='stylesheet' id='pretty-photo-css-css'  href='js/prettyphoto/prettyPhotoaeb9.css?ver=3.1.4' type='text/css' media='all' />
    <link rel='stylesheet' id='main-css-css'  href='css/main5152.css?ver=1.0' type='text/css' media='all' />
    <link rel='stylesheet' id='custom-css-css'  href='css/custom5152.html?ver=1.0' type='text/css' media='all' />
    <link rel="stylesheet" href="css/guide.css">
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->
</head>

<body>

<jsp:include page="jsp/navigation.jsp" />

<!-- Start of middle guide-->
<div class="BigGuide">
    <div class="MidGuide">
        <table class="tableGuide">
            <td style="line-height: 160px"><img src="images/timg.jpg" height="120" width="120"/></td>
            <td><a href="servlet/QuestionServlet?type1=showQuestion&page=1&pageSize=10">学习交流</a></td>
        </table>
    </div>
    <div class="MidGuide">
        <table class="tableGuide">
            <td style="line-height: 160px"><img src="images/timg2.jpg" height="120" width="120"/></td>
            <td><a href="servlet/QuestionServlet?type1=showQuestion&page=1&pageSize=10">文章阅读</a></td>
        </table>
    </div>
    <div class="MidGuide">
        <table class="tableGuide">
            <td style="line-height: 160px"><img src="images/timgIUAQ7XZ2.jpg" height="120" width="120"/></td>
            <td><a href="servlet/NewsServlet?type1=showNews&page=1&pageSize=10">新闻专题</a></td>
        </table>
    </div>
    <div class="MidGuide">
        <table class="tableGuide">
            <td style="line-height: 160px"><img src="images/timgASF6FYCH.jpg" height="120" width="120"/></td>
            <td><a href="jsp/relaxing.jsp">轻松一刻</a></td>
        </table>
    </div>
</div>
<!-- end of middle guide-->

<!-- Start of Page Container -->
<div class="page-container">
    <div class="container">
        <div class="row">

            <!-- start of page content -->
            <div class="span8 page-content">

                <!-- Basic Home Page Template -->
                <div class="row separator">
                    <section class="span4 articles-list">
                        <h3>热门文章</h3>
                        <ul class="articles">
                            <li class="article-entry standard">
                                <h4><a href="single.html">Integrating WordPress with Your Website</a></h4>
                                <span class="article-meta">25 Feb, 2013 in <a href="#" title="View all posts in Server &amp; Database">Server &amp; Database</a></span>
                                <span class="like-count">66</span>
                            </li>
                            <li class="article-entry standard">
                                <h4><a href="single.html">WordPress Site Maintenance</a></h4>
                                <span class="article-meta">24 Feb, 2013 in <a href="#" title="View all posts in Website Dev">Website Dev</a></span>
                                <span class="like-count">15</span>
                            </li>
                            <li class="article-entry video">
                                <h4><a href="single.html">Meta Tags in WordPress</a></h4>
                                <span class="article-meta">23 Feb, 2013 in <a href="#" title="View all posts in Website Dev">Website Dev</a></span>
                                <span class="like-count">8</span>
                            </li>
                            <li class="article-entry image">
                                <h4><a href="single.html">WordPress in Your Language</a></h4>
                                <span class="article-meta">22 Feb, 2013 in <a href="#" title="View all posts in Advanced Techniques">Advanced Techniques</a></span>
                                <span class="like-count">6</span>
                            </li>
                            <li class="article-entry standard">
                                <h4><a href="single.html">Know Your Sources</a></h4>
                                <span class="article-meta">22 Feb, 2013 in <a href="#" title="View all posts in Website Dev">Website Dev</a></span>
                                <span class="like-count">2</span>
                            </li>
                            <li class="article-entry standard">
                                <h4><a href="single.html">Validating a Website</a></h4>
                                <span class="article-meta">21 Feb, 2013 in <a href="#" title="View all posts in Website Dev">Website Dev</a></span>
                                <span class="like-count">3</span>
                            </li>
                        </ul>
                    </section>


                    <section class="span4 articles-list">
                        <h3>最新文章</h3>
                        <ul class="articles">
                            <li class="article-entry standard">
                                <h4><a href="single.html">Integrating WordPress with Your Website</a></h4>
                                <span class="article-meta">25 Feb, 2013 in <a href="#" title="View all posts in Server &amp; Database">Server &amp; Database</a></span>
                                <span class="like-count">66</span>
                            </li>
                            <li class="article-entry standard">
                                <h4><a href="single.html">Using Javascript</a></h4>
                                <span class="article-meta">25 Feb, 2013 in <a href="#" title="View all posts in Advanced Techniques">Advanced Techniques</a></span>
                                <span class="like-count">18</span>
                            </li>
                            <li class="article-entry image">
                                <h4><a href="single.html">Using Images</a></h4>
                                <span class="article-meta">25 Feb, 2013 in <a href="#" title="View all posts in Designing in WordPress">Designing in WordPress</a></span>
                                <span class="like-count">7</span>
                            </li>
                            <li class="article-entry video">
                                <h4><a href="single.html">Using Video</a></h4>
                                <span class="article-meta">24 Feb, 2013 in <a href="#" title="View all posts in WordPress Plugins">WordPress Plugins</a></span>
                                <span class="like-count">7</span>
                            </li>
                            <li class="article-entry standard">
                                <h4><a href="single.html">WordPress Site Maintenance</a></h4>
                                <span class="article-meta">24 Feb, 2013 in <a href="#" title="View all posts in Website Dev">Website Dev</a></span>
                                <span class="like-count">15</span>
                            </li>
                            <li class="article-entry standard">
                                <h4><a href="single.html">WordPress CSS Information and Techniques</a></h4>
                                <span class="article-meta">24 Feb, 2013 in <a href="#" title="View all posts in Theme Development">Theme Development</a></span>
                                <span class="like-count">1</span>
                            </li>
                        </ul>
                    </section>
                </div>
            </div>
            <!-- end of page content -->


            <!-- start of sidebar -->
            <aside class="span4 page-sidebar">

                <section class="widget">
                    <div class="support-widget">
                        <h3 class="title">帮助</h3>
                        <p class="intro">需要更多的帮助吗? 如果没有找到您所需要的答案，请联系我们.</p>
                    </div>
                </section>

                <section class="widget">
                    <h3 class="title">热门标签</h3>
                    <div class="tagcloud">
                        <a href="#" class="btn btn-mini">basic</a>
                        <a href="#" class="btn btn-mini">beginner</a>
                        <a href="#" class="btn btn-mini">blogging</a>
                        <a href="#" class="btn btn-mini">colour</a>
                        <a href="#" class="btn btn-mini">css</a>
                        <a href="#" class="btn btn-mini">date</a>
                        <a href="#" class="btn btn-mini">design</a>
                        <a href="#" class="btn btn-mini">files</a>
                        <a href="#" class="btn btn-mini">format</a>
                        <a href="#" class="btn btn-mini">header</a>
                        <a href="#" class="btn btn-mini">images</a>
                        <a href="#" class="btn btn-mini">plugins</a>
                        <a href="#" class="btn btn-mini">setting</a>
                        <a href="#" class="btn btn-mini">templates</a>
                        <a href="#" class="btn btn-mini">theme</a>
                        <a href="#" class="btn btn-mini">time</a>
                        <a href="#" class="btn btn-mini">videos</a>
                        <a href="#" class="btn btn-mini">website</a>
                        <a href="#" class="btn btn-mini">wordpress</a>
                    </div>
                </section>

            </aside>
            <!-- end of sidebar -->
        </div>
    </div>
</div>
<!-- End of Page Container -->


<jsp:include page="jsp/foot.jsp" />
<!-- script -->
<script type="text/javascript"
        src="//connect.qq.com/qc_jssdk.js" charset="utf-8" data-callback="true">

</script>
<script type='text/javascript' src='js/jquery-1.8.3.min.js'></script>
<script type='text/javascript' src='js/jquery.easing.1.3.js'></script>
<script type='text/javascript' src='js/prettyphoto/jquery.prettyPhoto.js'></script>
<script type='text/javascript' src='js/jflickrfeed.js'></script>
<script type='text/javascript' src='js/jquery.liveSearch.js'></script>
<script type='text/javascript' src='js/jquery.form.js'></script>
<script type='text/javascript' src='js/jquery.validate.min.js'></script>
<script type='text/javascript' src='js/custom.js'></script>

<div style="display:none"><script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script></div>
</body>
</html>
