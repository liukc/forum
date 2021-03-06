<%--
  Created by IntelliJ IDEA.
  User: 刘楷川
  Date: 2019/2/21
  Time: 20:51
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

    <title>联系方式</title>

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


    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
    <script src="js/html5.js"></script></script>
    <![endif]-->
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

                <article class="type-page hentry clearfix">
                    <h1 class="post-title">
                        <a href="#">联系我们</a>
                    </h1>
                    <hr>
                    <p>
                        如果您对我们网站有什么问题或者有什么需要改进的地方，请联系我们。
                    </p>
                </article>


                <form id="contact-form" class="row" action="http://inspirythemes.com/templates/knowledgebase-html/contact_form_handler.php" method="post">

                    <div class="span2">
                        <label for="name">姓名 <span>*</span> </label>
                    </div>
                    <div class="span6">
                        <input type="text" name="name" id="name" class="required input-xlarge" value="" title="* Please provide your name">
                    </div>

                    <div class="span2">
                        <label for="email">电子邮件<span>*</span></label>
                    </div>
                    <div class="span6">
                        <input type="text" name="email" id="email" class="email required input-xlarge" value="" title="* Please provide a valid email address">
                    </div>

                    <div class="span2">
                        <label for="reason" >类别</label>
                    </div>
                    <div class="span6">
                        <input type="text" name="reason" id="reason" class="input-xlarge" value="">
                    </div>

                    <div class="span2">
                        <label for="message">你想说的话<span>*</span> </label>
                    </div>
                    <div class="span6">
                        <textarea name="message" id="message" class="required span6" rows="6" title="* Please enter your message"></textarea>
                    </div>

                    <div class="span6 offset2 bm30">
                        <input type="submit" name="submit" value="提交" class="btn btn-inverse">
                        <img src="images/loading.gif" id="contact-loader" alt="Loading...">
                    </div>

                    <div class="span6 offset2 error-container"></div>
                    <div class="span8 offset2" id="message-sent"></div>

                </form>
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
                    <h3 class="title">最新文章</h3>
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
</body>
</html>

