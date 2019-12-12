<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="util.DefineUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
    <%@ include file="/templates/public/inc/header.jsp" %>
<div id="content"	class="site-content">
<div class="container">
	<div class="row">
		<div class="islemag-content-left col-md-9">
		<%
			String[] color={ "blue", "purple", "orange", "red", "yellow", "green", "blue", "pink", "orange"};
			Category cat=(Category) request.getAttribute("category");
	    	String urlSlug1 = request.getContextPath()+"/danh-muc/"+StringUtil.makeSlug(cat.getName())+"-"+cat.getId()+"/page-";    
			@SuppressWarnings("unchecked")	
	    	ArrayList<News> listNews=(ArrayList<News>) request.getAttribute("listNews");	
        	int i=0;
		%>
					<header class="page-header">
					<h1 class="page-title"><%=cat.getName() %></h1>						
					</header><!-- .page-header -->				
				<div class="islemag-section5">
                                <div class="post-section islemag-template4 mb30">
                                    <div class="islemag-template4-posts smaller-nav no-radius">
                                        <div class="entry-wrapper">
                                        <%	for (News item:listNews){
                                        	SimpleDateFormat df=new SimpleDateFormat("dd/MM/yyyy");
                                        	Date date=new Date(item.getDate_create().getTime());
                                        	String stringdate= df.format(date);
                                    		String urlSlug = request.getContextPath()+"/tin-tuc/"+StringUtil.makeSlug(item.getName())+"-"+item.getId();

                                        	%>
                                            <article class="entry entry-overlay entry-block eb-small <%=color[i%9] %>">
                                                <div class="entry-media">
                                                    <a href="" class="category-block" ><%=item.getCat().getName() %></a>
                                                    <figure>
                                                        <noscript>
                                                            <a href="<%=urlSlug %>">
                                                                <img width="110"  src="<%=request.getContextPath()%>/<%=DefineUtil.DIR_UPLOAD %>/<%=item.getPicture() %>" alt="" /> </a>
                                                        </noscript>
                                                        <a href="<%=urlSlug %>">
                                                            <img width="110"  data-opt-src="<%=request.getContextPath()%>/<%=DefineUtil.DIR_UPLOAD %>/<%=item.getPicture() %>" src="<%=request.getContextPath()%>/<%=DefineUtil.DIR_UPLOAD %>/<%=item.getPicture() %>" class="attachment-islemag_sections_small_thumbnail size-islemag_sections_small_thumbnail wp-post-image" alt="" /> </a>
                                                    </figure>
                                                    <!-- End figure -->
                                                </div>
                                                <!-- End .entry-media -->

                                                <h3 class="entry-title"><a href="<%=urlSlug %>"><%=item.getName() %></a></h3>
                                                <div class="entry-meta">
                                                    <span class="entry-overlay-date"><i class="fa fa-calendar"></i><%=stringdate %></span>
                                                    <span class="entry-separator">/</span>
                                                    <a href="" class="entry-comments"><%=item.getCounter() %></a>
                                                    <div>
                                                        Posted By<a href="" class="entry-author"><%=item.getUser().getUsername() %></a>
                                                    </div>
                                                </div>
                                                <!-- End .entry-meta -->

                                            </article>
                                            <%i++;} %>
                                            <!-- End .entry-overlay -->

                                        </div>
                                        <!-- End .entry-wrapper -->

                                    </div>
                                    <!-- End .islemag-template4-posts -->
                                </div>
                                <!-- End .post-section -->
                            </div>
                            <div class="nav-links">
			<%
               int numberOfItems= (Integer) request.getAttribute("numberOfItems");
               int numberOfPages= (Integer) request.getAttribute("numberOfPages");
               int currentPage= (Integer) request.getAttribute("currentPage");
               if (listNews!=null && listNews.size()>0){        	                
               for (int j=1;j<=numberOfPages;j++){
                    if (currentPage==j){ %>
                    <span aria-current="page" class="page-numbers current"><%=j %></span>
              <%    }else { %>			
				<a class="page-numbers" href="<%=urlSlug1+j%>"><%=j %></a> 
 				<%}
                    } %>
				<a class="next page-numbers" href="<%=urlSlug1+ (currentPage+1)%>">			
				<span class="screen-reader-text">Next Posts</span>»</a>		
				<%} %>		
			</div>
    	</div>
    <%@ include file="/templates/public/inc/rightbar.jsp" %>
	</div><!-- End .row -->
	
</div><!-- End .container -->
</div><!-- #content -->
    <%@ include file="/templates/public/inc/footer.jsp" %>