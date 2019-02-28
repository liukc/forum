<%--
  Created by IntelliJ IDEA.
  User: 刘楷川
  Date: 2019/2/21
  Time: 20:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="tools.WebProperties" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>My JSP 'single.jsp' starting page</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <link rel="shortcut icon" href="images/favicon.png" />
    <!-- Style Sheet-->
    <link rel="stylesheet" href="style.css"/>
    <link rel='stylesheet' id='bootstrap-css-css'  href='css/bootstrap5152.css?ver=1.0' type='text/css' media='all' />
    <link rel='stylesheet' id='responsive-css-css'  href='css/responsive5152.css?ver=1.0' type='text/css' media='all' />
    <link rel='stylesheet' id='pretty-photo-css-css'  href='js/prettyphoto/prettyPhotoaeb9.css?ver=3.1.4' type='text/css' media='all' />
    <link rel='stylesheet' id='main-css-css'  href='css/main5152.css?ver=1.0' type='text/css' media='all' />
    <link rel='stylesheet' id='custom-css-css'  href='css/custom5152.html?ver=1.0' type='text/css' media='all' />
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
            <div class="span8 page-content">

                <ul class="breadcrumb">
                    <li><a href="#">技术交流论坛</a><span class="divider">/</span></li>
                    <li><a href="#" title="View all posts in Server &amp; Database">${sessionScope.news.newsType}</a> <span class="divider">/</span></li>
                    <li class="active">${sessionScope.news.caption }</li>
                </ul>

                <article class=" type-post format-standard hentry clearfix">

                    <h1 class="post-title"><a href="#">${sessionScope.news.caption}</a></h1>

                    <div class="post-meta clearfix">
                        <span class="date">${sessionScope.news.newsTime }</span>
                        <span class="category"><a href="#" title="View all posts in Server &amp; Database">${sessionScope.news.newsType}</a></span>
                        <span class="comments"><a href="#" title="Comment on Integrating WordPress with Your Website">3 Comments</a></span>
                        <span class="like-count">66</span>
                    </div><!-- end of post meta -->

                    ${sessionScope.news.content}
                </article>

                <div class="like-btn">

                    <form id="like-it-form" action="#" method="post">
                        <span class="like-it ">66</span>
                        <input type="hidden" name="post_id" value="99">
                        <input type="hidden" name="action" value="like_it">
                    </form>

                    <span class="tags">
                                                                <strong>Tags:&nbsp;&nbsp;</strong><a href="#" rel="tag">basic</a>, <a href="#" rel="tag">setting</a>, <a href="http://knowledgebase.inspirythemes.com/tag/website/" rel="tag">website</a>
                                                        </span>

                </div>

                <section id="comments">

                    <h3 id="comments-title">(3) Comments</h3>

                    <ol class="commentlist">

                        <li class="comment even thread-even depth-1" id="li-comment-2">
                            <article id="comment-2">

                                <a href="#">
                                    <img alt="" src="http://1.gravatar.com/avatar/50a7625001317a58444a20ece817aeca?s=60&amp;d=http%3A%2F%2F1.gravatar.com%2Favatar%2Fad516503a11cd5ca435acc9bb6523536%3Fs%3D60&amp;r=G" class="avatar avatar-60 photo" height="60" width="60">
                                </a>

                                <div class="comment-meta">

                                    <h5 class="author">
                                        <cite class="fn">
                                            <a href="#" rel="external nofollow" class="url">John Doe</a>
                                        </cite>
                                        - <a class="comment-reply-link" href="#">Reply</a>
                                    </h5>

                                    <p class="date">
                                        <a href="#">
                                            <time datetime="2013-02-26T13:18:47+00:00">February 26, 2013 at 1:18 pm</time>
                                        </a>
                                    </p>

                                </div><!-- end .comment-meta -->

                                <div class="comment-body">
                                    写的好</div><!-- end of comment-body -->

                            </article><!-- end of comment -->

                            <ul class="children">

                                <li class="comment byuser comment-author-saqib-sarwar bypostauthor odd alt depth-2" id="li-comment-3">
                                    <article id="comment-3">

                                        <a href="#">
                                            <img alt="" src="http://0.gravatar.com/avatar/2df5eab0988aa5ff219476b1d27df755?s=60&amp;d=http%3A%2F%2F0.gravatar.com%2Favatar%2Fad516503a11cd5ca435acc9bb6523536%3Fs%3D60&amp;r=G" class="avatar avatar-60 photo" height="60" width="60">
                                        </a>

                                        <div class="comment-meta">

                                            <h5 class="author">
                                                <cite class="fn">saqib sarwar</cite>
                                                - <a class="comment-reply-link" href="#">Reply</a>
                                            </h5>

                                            <p class="date">
                                                <a href="#">
                                                    <time datetime="2013-02-26T13:20:14+00:00">February 26, 2013 at 1:20 pm</time>
                                                </a>
                                            </p>

                                        </div><!-- end .comment-meta -->

                                        <div class="comment-body">
                                            你也这么认为啊</div><!-- end of comment-body -->

                                    </article><!-- end of comment -->

                                </li>
                            </ul>
                        </li>

                        <li class="comment even thread-odd thread-alt depth-1" id="li-comment-4">
                            <article id="comment-4">

                                <a href="#">
                                    <img alt="" src="http://1.gravatar.com/avatar/50a7625001317a58444a20ece817aeca?s=60&amp;d=http%3A%2F%2F1.gravatar.com%2Favatar%2Fad516503a11cd5ca435acc9bb6523536%3Fs%3D60&amp;r=G" class="avatar avatar-60 photo" height="60" width="60">
                                </a>

                                <div class="comment-meta">

                                    <h5 class="author">
                                        <cite class="fn"><a href="#" rel="external nofollow" class="url">John Doe</a></cite>
                                        - <a class="comment-reply-link" href="#">Reply</a>
                                    </h5>

                                    <p class="date">
                                        <a href="http://knowledgebase.inspirythemes.com/integrating-wordpress-with-your-website/#comment-4">
                                            <time datetime="2013-02-26T13:27:04+00:00">February 26, 2013 at 1:27 pm</time>
                                        </a>
                                    </p>

                                </div><!-- end .comment-meta -->

                                <div class="comment-body">
                                    不错 </div><!-- end of comment-body -->

                            </article><!-- end of comment -->
                        </li>
                    </ol>

                    <div id="respond">

                        <h3>留下足迹</h3>

                        <div class="cancel-comment-reply">
                            <a rel="nofollow" id="cancel-comment-reply-link" href="#" style="display:none;">Click here to cancel reply.</a>
                        </div>


                        <form action="#" method="post" id="commentform">


                            <div>

                                <textarea class="span8" name="comment" id="comment" cols="58" rows="10"></textarea>
                            </div>
                            <div>
                                <input class="btn" name="submit" type="submit" id="submit"  value="发表">
                            </div>

                        </form>

                    </div>

                </section><!-- end of comments -->

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
                    </ul>
                </section>



                <section class="widget"><h3 class="title">分类</h3>
                    <ul>
                        <li><a href="#" title="Lorem ipsum dolor sit amet,">Advanced Techniques</a> </li>
                        <li><a href="#" title="Lorem ipsum dolor sit amet,">Designing in WordPress</a></li>
                        <li><a href="#" title="Lorem ipsum dolor sit amet,">Server &amp; Database</a></li>
                        <li><a href="#" title="Lorem ipsum dolor sit amet, ">Theme Development</a></li>
                        <li><a href="#" title="Lorem ipsum dolor sit amet,">Website Dev</a></li>
                        <li><a href="#" title="Lorem ipsum dolor sit amet,">WordPress for Beginners</a></li>
                        <li><a href="#" title="Lorem ipsum dolor sit amet, ">WordPress Plugins</a></li>
                    </ul>
                </section>

                <section class="widget">
                    <h3 class="title">最新评论</h3>
                    <ul id="recentcomments">
                        <li class="recentcomments"><a href="#" rel="external nofollow" class="url">John Doe</a> on <a href="#">Integrating WordPress with Your Website</a></li>
                        <li class="recentcomments">saqib sarwar on <a href="#">Integrating WordPress with Your Website</a></li>
                        <li class="recentcomments"><a href="#" rel="external nofollow" class="url">John Doe</a> on <a href="#">Integrating WordPress with Your Website</a></li>
                        <li class="recentcomments"><a href="#" rel="external nofollow" class="url">Mr WordPress</a> on <a href="#">Installing WordPress</a></li>
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
