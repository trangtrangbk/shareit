<%@page import="model.bean.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html lang="">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="profile" href="http://gmpg.org/xfn/11">
    <title>Admin</title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/templates/admin/css/coin-slider.css" />
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/templates/admin/css/custom.css" />
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/templates/admin/css/main.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/templates/admin/vendor/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/templates/admin/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/templates/admin/vendor/animate/animate.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/templates/admin/vendor/select2/select2.min.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/templates/admin/vendor/perfect-scrollbar/perfect-scrollbar.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/templates/admin/css/util.css">
	
	<script type="text/javascript" src="<%=request.getContextPath() %>/templates/admin/js/coin-slider.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/templates/admin/vendor/ckeditor/ckeditor.js"></script>
    <link rel="stylesheet" href="https://preview.themezee.com/chronus/wp-content/cache/min/79/55bc2c57ad9dc382cf75ecd50907a232.css" data-minify="1" />
    <link rel='dns-prefetch' href='//s.w.org' />
    <link rel="alternate" type="application/rss+xml" title="Chronus &raquo; Feed" href="https://preview.themezee.com/chronus/feed/" />
    <link rel="alternate" type="application/rss+xml" title="Chronus &raquo; Comments Feed" href="https://preview.themezee.com/chronus/comments/feed/" />
    <style type="text/css">
        img.wp-smiley,
        img.emoji {
            display: inline!important;
            border: none!important;
            box-shadow: none!important;
            height: 1em!important;
            width: 1em!important;
            margin: 0 .07em!important;
            vertical-align: -0.1em!important;
            background: none!important;
            padding: 0!important
        }
        input{
        border: 1px solid rgba(0,0,0,.075);}
    </style>
    <script type='text/javascript'>
        /* <![CDATA[ */
        var chronus_menu_title = "<svg class=\"icon icon-menu\" aria-hidden=\"true\" role=\"img\"> <use xlink:href=\"https:\/\/preview.themezee.com\/chronus\/wp-content\/themes\/chronus\/assets\/icons\/genericons-neue.svg#menu\"><\/use> <\/svg>Menu"; /* ]]> */
    </script>
    <link rel='https://api.w.org/' href='https://preview.themezee.com/chronus/wp-json/' />
    <link rel="EditURI" type="application/rsd+xml" title="RSD" href="https://preview.themezee.com/chronus/xmlrpc.php?rsd" />
    <link rel="wlwmanifest" type="application/wlwmanifest+xml" href="https://preview.themezee.com/chronus/wp-includes/wlwmanifest.xml" />
    <meta name="generator" content="WordPress 5.0.3" />
    <script src="<%=request.getContextPath() %>/templates/admin/vendor/jquery/jquery-3.2.1.min.js"></script>
	<script src="<%=request.getContextPath() %>/templates/admin/vendor/bootstrap/js/popper.js"></script>
	<script src="<%=request.getContextPath() %>/templates/admin/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="<%=request.getContextPath() %>/templates/admin/vendor/select2/select2.min.js"></script>
	<script src="<%=request.getContextPath() %>/templates/admin/js/main.js"></script>
    <script type="text/javascript">
        (function(i, s, o, g, r, a, m) {
            i['GoogleAnalyticsObject'] = r;
            i[r] = i[r] || function() {
                (i[r].q = i[r].q || []).push(arguments)
            }, i[r].l = 1 * new Date();
            a = s.createElement(o),
                m = s.getElementsByTagName(o)[0];
            a.async = 1;
            a.src = g;
            m.parentNode.insertBefore(a, m)
        })(window, document, 'script', '//www.google-analytics.com/analytics.js', '__gaTracker');

        __gaTracker('create', 'UA-4734666-2', 'auto');
        __gaTracker('set', 'forceSSL', true);
        __gaTracker('set', 'anonymizeIp', true);
        __gaTracker('require', 'displayfeatures');
        __gaTracker('send', 'pageview');
    </script>
</head>

<body class="home blog"><a class="skip-link screen-reader-text" href="#content">Skip to content</a>
    <div id="page" class="hfeed site">
        <header id="masthead" class="site-header clearfix" role="banner">
            <div class="header-main container clearfix">
            <% User userLogin= (User) session.getAttribute("userInfo"); %>
            <div style="padding: 15px 50px 5px 50px;float: right;font-size: 16px;">Xin chào <%=userLogin.getUsername() %>
            <b> &nbsp; <a href="<%=request.getContextPath() %>/auth/logout" title="Đăng xuất" style="color: white" class="btn btn-danger">Đăng xuất</a> </b>
            </div>
                <div id="logo" class="site-branding clearfix">
                    <h1 class="site-title"><a href="<%=request.getContextPath()%>/admin/index" rel="home">SHARE IT</a></h1>
                    <p class="site-description">Chào mừng đến với trang quản lí Share IT</p>
                </div>
            </div>
            
            <div id="main-navigation-wrap" class="primary-navigation-wrap">
                <nav id="main-navigation" class="primary-navigation navigation container clearfix" role="navigation">
                    <ul id="menu-navigation" class="main-navigation-menu">
                        <li id="menu-item-1" class="menu-item menu-item-type-custom menu-item-object-custom current_page_item menu-item-home menu-item-2732"><a href="<%=request.getContextPath()%>/admin/index">Trang chủ</a></li>
                        <li id="menu-item-2" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-2741"><a href="<%=request.getContextPath()%>/admin/cat/index">Quản lý danh mục</a></li>
                        <li id="menu-item-3" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-2737"><a href="<%=request.getContextPath()%>/admin/news/index">Quản lý tin tức</a></li>
                        <li id="menu-item-4" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-2746"><a href="<%=request.getContextPath()%>/admin/user/index">Quản lý người dùng</a></li>
                        <li id="menu-item-5" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-2746"><a href="<%=request.getContextPath()%>/admin/comment/index">Quản lý bình luận</a></li>
                        <li id="menu-item-6" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-2746"><a href="<%=request.getContextPath()%>/admin/contact/index">Quản lý liên hệ</a></li>
                    </ul>
                </nav>
            </div>
        </header>