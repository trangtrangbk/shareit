<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="util.DefineUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
    <%@ include file="/templates/public/inc/header.jsp" %>
        <div id="content" class="site-content">
            <div class="islemag-top-container">
                <div class="owl-carousel islemag-top-carousel rect-dots">
                    <% String[] color={ "blue", "purple", "orange", "red", "yellow", "green", "blue", "pink", "orange"};
                    NewsDAO newsDAO1=new NewsDAO();
                    ArrayList<News> list1= newsDAO1.getItems(9);
                    if (list1.size()>0 && list1!=null){
                    	int i=0; for (News item:list1){ 
                    		SimpleDateFormat df=new SimpleDateFormat("dd/MM/yyyy");
                        	Date date=new Date(item.getDate_create().getTime());
                        	String stringdate= df.format(date);
                    		String urlSlug = request.getContextPath()+"/tin-tuc/"+StringUtil.makeSlug(item.getName())+"-"+item.getId();
                    %>
                        <article class="entry entry-overlay entry-block <%=color[i] %>">
                            <div class="entry-media">
                                <figure>
                                    <a href="<%=urlSlug%>" title="">
                                        <img class="owl-lazy" data-src="<%=request.getContextPath()%>/<%=DefineUtil.DIR_UPLOAD %>/<%=item.getPicture() %>" />
                                    </a>
                                </figure>
                            </div>
                            <!-- End .entry-media -->

                            <div class="entry-overlay-meta">
                                <h2 class="entry-title"><a href="<%=urlSlug%>" rel="bookmark"><%=item.getName() %></a></h2>
                                <span class="entry-overlay-date"><i class="fa fa-calendar"></i><%=stringdate%></span>
                                <span class="entry-separator">/</span>                                
                                <a href="" class="entry-author"><i class="fa fa-user"></i><%=item.getUser().getUsername() %></a>
                            </div>
                            <!-- End .entry-overlay-meta -->
                        </article>
                        <% i++;} } %>
                </div>
                <!--end a article  -->
                <!-- End .islemag-top-container -->
                <!-- end section 1 -->
                <div class="container">
                    <div class="row">
                        <div class="islemag-content-left col-md-9">
                            <div class="islemag-section1	">
                                <h2 class="title-border title-bg-line light_red mb30"><span>Tin tức</span></h2>
                                <div class="post-section islemag-template1">

                                    <div class="owl-carousel islemag-template1-posts smaller-nav no-radius">
									<%
									@SuppressWarnings("unchecked")
									  ArrayList<News> listNews=(ArrayList<News>) request.getAttribute("allListNews");
									  if (listNews.size()>0) {
										  int i=0;
										 for (News item:listNews){
											 SimpleDateFormat df=new SimpleDateFormat("dd/MM/yyyy");
	                                        	Date date=new Date(item.getDate_create().getTime());
	                                        	String stringdate= df.format(date);
	                                    		String urlSlug = request.getContextPath()+"/tin-tuc/"+StringUtil.makeSlug(item.getName())+"-"+item.getId();

									%>
                                        <article class="entry entry-overlay entry-block <%=color[i%9] %>">
                                            <a href="" class="category-block" ><%=item.getCat().getName() %></a>
                                            <div class="entry-media">
                                                <figure>
                                                    <a href="<%=urlSlug %>" >
                                                        <img class="owl-lazy" data-src="<%=request.getContextPath()%>/<%=DefineUtil.DIR_UPLOAD %>/<%=item.getPicture() %>" /> </a>
                                                </figure>
                                                <!-- End figure -->
                                                <div class="entry-overlay-meta">
                                                    <span class="entry-overlay-date"><i class="fa fa-calendar"></i><%=stringdate %></span>
                                                    <span class="entry-separator">/</span>                                                    
                                                    <a href="" class="entry-author"><i class="fa fa-user"></i><%=item.getUser().getUsername() %></a>
                                                </div>
                                                <!-- End .entry-overlay-meta -->
                                            </div>
                                            <!-- End .entry-media -->

                                            <h3 class="entry-title"><a href="<%=urlSlug%>"><%=item.getName() %></a></h3>
                                        </article>
                                        <% i++;} } %>
                                        <!-- End .entry-overlay -->

                                    </div>
                                    <!-- End .islemag-template1-posts -->
                                </div>
                                <!-- End .islemag-template1 -->
                            </div>
                            
                             <!-- end all news -->
                            <%  for (int j=1;j<=3;j++){
                            	@SuppressWarnings("unchecked")	
							    ArrayList<News> listNews1=(ArrayList<News>) request.getAttribute("ListNews"+j);	
                                int i=0;
                            %>                   
                            <div class="islemag-section5">
                                <a href="<%=request.getContextPath() %>/public/cat?id=<%=listNews1.get(0).getCat().getId() %>" ><h2 class="title-border title-bg-line green mb30"><span><%=listNews1.get(0).getCat().getName() %></span></h2></a>
                                <div class="post-section islemag-template4 mb30">
                                    <div class="islemag-template4-posts smaller-nav no-radius">
                                        <div class="entry-wrapper">
                                        <%	for (News item:listNews1){
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
                                                                <img width="110" height="110" src="<%=request.getContextPath()%>/<%=DefineUtil.DIR_UPLOAD %>/<%=item.getPicture() %>" alt="" /> </a>
                                                        </noscript>
                                                        <a href="<%=urlSlug %>">
                                                            <img width="110" height="110" data-opt-src="<%=request.getContextPath()%>/<%=DefineUtil.DIR_UPLOAD %>/<%=item.getPicture() %>" src="<%=request.getContextPath()%>/<%=DefineUtil.DIR_UPLOAD %>/<%=item.getPicture() %>" class="attachment-islemag_sections_small_thumbnail size-islemag_sections_small_thumbnail wp-post-image" alt="" /> </a>
                                                    </figure>
                                                    <!-- End figure -->
                                                </div>
                                                <!-- End .entry-media -->

                                                <h3 class="entry-title"><a href="<%=urlSlug %>"><%=item.getName() %></a></h3>
                                                <div class="entry-meta">
                                                    <span class="entry-overlay-date"><i class="fa fa-calendar"></i><%=stringdate %></span>                                                 
                                                    <div>
                                                        Posted By<a href="" class="entry-author"><%=item.getUser().getUsername() %></a>
                                                    </div>
                                                </div>
                                                <!-- End .entry-meta -->

                                            </article>
                                            <%} %>
                                            <!-- End .entry-overlay -->

                                        </div>
                                        <!-- End .entry-wrapper -->

                                    </div>
                                    <!-- End .islemag-template4-posts -->
                                </div>
                                <!-- End .post-section -->
                            </div>
                        <%} %>
                        </div>
                        
                        <!-- End .islemag-content-left -->
                        <%@ include file="/templates/public/inc/rightbar.jsp" %>
                    </div>
                    <!-- End .row -->
                </div>
                <!-- End .container -->

            </div>
            </div>
            <!-- #content -->


            <%@ include file="/templates/public/inc/footer.jsp" %>