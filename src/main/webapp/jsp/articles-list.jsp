<%--
  Created by IntelliJ IDEA.
  User: 刘楷川
  Date: 2019/2/21
  Time: 20:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>文章阅读</title>



    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
    <script src="js/html5.js"></script></script>
    <![endif]-->


    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <link rel="shortcut icon" href="images/favicon.png"/>
    <!-- Style Sheet-->
    <link rel="stylesheet" href="style.css"/>
    <link rel='stylesheet' id='bootstrap-css-css' href='css/bootstrap5152.css?ver=1.0' type='text/css' media='all'/>
    <link rel='stylesheet' id='responsive-css-css' href='css/responsive5152.css?ver=1.0' type='text/css' media='all'/>
    <link rel='stylesheet' id='pretty-photo-css-css' href='js/prettyphoto/prettyPhotoaeb9.css?ver=3.1.4' type='text/css'media='all'/>
    <link rel='stylesheet' id='main-css-css' href='css/main5152.css?ver=1.0' type='text/css' media='all'/>
    <link rel='stylesheet' id='custom-css-css' href='css/custom5152.html?ver=1.0' type='text/css' media='all'/>
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->

</head>

<body>
<%
    String type = request.getParameter("type");
%>
<jsp:include page="navigation.jsp" />
<!-- Start of Page Container -->
<div class="page-container">
    <div class="container">
        <div class="row">

            <!-- start of page content -->
            <div class="span8 main-listing">

                <article class="format-standard type-post hentry clearfix">

                    <header class="clearfix">

                        <h3 class="post-title">
                            <a href="jsp/single.jsp?type=<%=type %>">Integrating WordPress with Your Website</a>
                        </h3>

                        <div class="post-meta clearfix">
                            <span class="date">25 Feb, 2013</span>
                            <span class="category"><a href="#" title="View all posts in Server &amp; Database">Server &amp; Database</a></span>
                            <span class="comments"><a href="#" title="Comment on Integrating WordPress with Your Website">3 Comments</a></span>
                            <span class="like-count">66</span>
                        </div><!-- end of post meta -->

                    </header>

                    <p>Many of us work in an endless stream of tasks, browser tasks, social media, emails, meetings,
                        rushing from one thing to another, never pausing and never ending.&nbsp;Then the day is over,
                        and we are exhausted, and we often have very little to show for it. And we start the next . . .

                </article>

                <article class="format-standard type-post hentry clearfix">

                    <header class="clearfix">

                        <h3 class="post-title">
                            <a href="jsp/single.jsp?type=<%=type %>">Using Javascript</a>
                        </h3>

                        <div class="post-meta clearfix">
                            <span class="date">25 Feb, 2013</span>
                            <span class="category"><a href="#" title="View all posts in Advanced Techniques">Advanced Techniques</a></span>
                            <span class="comments"><a href="#" title="Comment on Using Javascript">0 Comments</a></span>
                            <span class="like-count">18</span>
                        </div><!-- end of post meta -->

                    </header>

                    <p>Many of us work in an endless stream of tasks, browser tasks, social media, emails, meetings,
                        rushing from one thing to another, never pausing and never ending.&nbsp;Then the day is over,
                        and we are exhausted, and we often have very little to show for it. And we start the next . . .

                </article>

                <article class=" type-post format-image hentry clearfix">

                    <header class="clearfix">

                        <h3 class="post-title">
                            <a href="jsp/single.jsp?type=<%=type %>">Using Images</a>
                        </h3>

                        <div class="post-meta clearfix">
                            <span class="date">25 Feb, 2013</span>
                            <span class="category"><a href="#" title="View all posts in Designing in WordPress">Designing in WordPress</a></span>
                            <span class="comments"><a href="#" title="Comment on Using Images">0 Comments</a></span>
                            <span class="like-count">7</span>
                        </div><!-- end of post meta -->

                    </header>

                    <a href="#" title="Using Images"><img width="770" height="501"
                                                          src="images/temp/living-room-770x501.jpg"
                                                          class="attachment-std-thumbnail wp-post-image"
                                                          alt="Living room"></a>

                    <p>Many of us work in an endless stream of tasks, browser tasks, social media, emails, meetings,
                        rushing from one thing to another, never pausing and never ending.&nbsp;Then the day is over,
                        and we are exhausted, and we often have very little to show for it. And we start the next . . .

                </article>

                <article class=" type-post  format-standard hentry clearfix">

                    <header class="clearfix">

                        <h3 class="post-title">
                            <a href="jsp/single.jsp?type=<%=type %>">WordPress Site Maintenance</a>
                        </h3>

                        <div class="post-meta clearfix">
                            <span class="date">24 Feb, 2013</span>
                            <span class="category"><a href="#"
                                                      title="View all posts in Website Dev">Website Dev</a></span>

                            <span class="comments"><a href="#"
                                                      title="Comment on WordPress Site Maintenance">0 Comments</a></span>

                            <span class="like-count">15</span>
                        </div><!-- end of post meta -->

                    </header>

                    <p>Many of us work in an endless stream of tasks, browser tasks, social media, emails, meetings,
                        rushing from one thing to another, never pausing and never ending.&nbsp;Then the day is over,
                        and we are exhausted, and we often have very little to show for it. And we start the next . . .

                </article>

                <div id="pagination">
                    <a href="#" class="btn active">1</a>
                    <a href="#" class="btn">2</a>
                    <a href="#" class="btn">3</a>
                    <a href="#" class="btn">Next »</a>
                    <a href="#" class="btn">Last »</a>
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
<script type='text/javascript' src='js/jquery-1.8.3.min.js'></script>
<script type='text/javascript' src='js/jquery.easing.1.34e44.js?ver=1.3'></script>
<script type='text/javascript' src='js/prettyphoto/jquery.prettyPhotoaeb9.js?ver=3.1.4'></script>
<script type='text/javascript' src='js/jquery.liveSearchd5f7.js?ver=2.0'></script>
<script type='text/javascript' src='js/jflickrfeed.js'></script>
<script type='text/javascript' src='js/jquery.formd471.js?ver=3.18'></script>
<script type='text/javascript' src='js/jquery.validate.minfc6b.js?ver=1.10.0'></script>
<script type='text/javascript' src='js/custom5152.js?ver=1.0'></script>

<div style="display:none">
    <script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script>
</div>
</body>
</html>

