<%@page import="util.StringUtil"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="util.DefineUtil"%>
<%@page import="model.bean.Category"%>
<%@page import="model.dao.CategoryDAO"%>
<%@page import="model.bean.News"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.dao.NewsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<aside class="col-md-3 sidebar islemag-content-right"role="complementary">
	<div id="st_latest_posts_widget-3" class="widget widget_st_latest_posts_widget">
	<h3 class="title-border dkgreen title-bg-line"><span>Latest Posts</span></h3>
	<div class="sp-latest-posts-widget latest-posts">
	<%
  	NewsDAO newsDAO=new NewsDAO();
  	ArrayList<News> latestNews= newsDAO.getItems(4);
  	if (latestNews.size()>0)
  		for (News item:latestNews){
  			SimpleDateFormat df=new SimpleDateFormat("dd/MM/yyyy");
        	Date date=new Date(item.getDate_create().getTime());
        	String stringdate= df.format(date);
  		String urlSlug = request.getContextPath()+"/tin-tuc/"+StringUtil.makeSlug(item.getName())+"-"+item.getId();
  %>
	<!-- begin a latest post  -->
	<div class="media"><div class="pull-left">
	<noscript><a href="">
	<img width="64" height="64" src="<%=request.getContextPath()%>/<%=DefineUtil.DIR_UPLOAD %>/<%=item.getPicture() %>" class="img-responsive wp-post-image" alt="" /></a>
	</noscript>
	<a href="<%=urlSlug %>">
	<img width="64" height="64"  data-opt-src="<%=request.getContextPath()%>/<%=DefineUtil.DIR_UPLOAD %>/<%=item.getPicture() %>"  src="<%=request.getContextPath()%>/<%=DefineUtil.DIR_UPLOAD %>/<%=item.getPicture() %>" alt="" /></a></div><div class="media-body">
	<h3 class="entry-title"><a href="<%=urlSlug %>"><%=item.getName() %></a></h3>
	<div class="entry-meta small">
	<span class="st-lp-date"><%=stringdate %></span></div></div></div>
	<!-- end a latest post  -->
	<%} %>
</div></div>
 	<!-- end latest post  -->
		
<div id="categories-2" class="widget widget_categories">
<h3 class="title-border dkgreen title-bg-line"><span>Categories</span></h3>		
<%
	CategoryDAO categoryDAO1=new CategoryDAO();
	ArrayList<Category> categories=categoryDAO1.getItems();
	categoryDAO1.ShowCategoryPublic(categories, 0, request, response, out);
%>
</div>

</aside><!-- #secondary -->