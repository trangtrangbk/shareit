<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="model.bean.Comment"%>
<%@page import="util.DefineUtil" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ include file="/templates/public/inc/header.jsp" %>
<div id="content" class="site-content">
	<div class="container">
		<div class="row">
			<div class="islemag-content-left col-md-9">
				<% String[] color={ "blue", "purple", "orange", "red", "yellow", "green", "blue", "pink", "orange"};
				News news=( News) request.getAttribute( "news"); %>
				<div class="col-md-12">
					<article id="post-2342" class="entry single post-2342 post type-post status-publish format-standard has-post-thumbnail hentry category-technology">
					<h1 class="entry-title">
					<%=news.getName() %>
					</h1>
					<div>
                     Posted By	<a href="" class="entry-author"><%=news.getUser().getUsername() %></a>
                     <span>/	Lượt xem: <%=news.getCounter() %></span>
                    </div>
					<div class="entry-content">
						<%=news.getDetail_text() %>
					</div>
					</article>
				</div>
				<div class="islemag-section1	">
					<h2 class="title-border title-bg-line light_red mb30"><span>Liên quan</span></h2>
					<div class="post-section islemag-template1">
						<div class="owl-carousel islemag-template1-posts smaller-nav no-radius">
							<% @SuppressWarnings( "unchecked") 
							ArrayList<News>listNews=(ArrayList <News>) request.getAttribute("relatedNews");
							if (listNews.size()>0) { 
								int i=0; 
								for (News item:listNews){
									SimpleDateFormat df=new SimpleDateFormat("dd/MM/yyyy");
                                    Date date=new Date(item.getDate_create().getTime());
                                    String stringdate= df.format(date);
                            		String urlSlug = request.getContextPath()+"/tin-tuc/"+StringUtil.makeSlug(item.getName())+"-"+item.getId();

                                    %> 
								<article class="entry entry-overlay entry-block <%=color[i%9] %>"> 
								<a href="" class="category-block">
							<%=item.getCat().getName() %>
							</a>
							<div class="entry-media">
								<figure>
								<a href="<%=urlSlug%>"> <img class="owl-lazy" data-src="<%=request.getContextPath()%>/<%=DefineUtil.DIR_UPLOAD %>/<%=item.getPicture() %>" /> </a>
								</figure>
								<!-- End figure -->
								<div class="entry-overlay-meta">
									<span class="entry-overlay-date">
									<i class="fa fa-calendar">
									</i>
									<%=stringdate %>
									</span>
									<span class="entry-separator">/ </span>
									<a href="" class="entry-comments"><i class="fa fa-comments"></i><%=item.getCounter() %></a>
									<span class="entry-separator">/ </span>
									<a href="" class="entry-author"><i class="fa fa-user"></i><%=item.getUser().getUsername() %></a>
								</div>
								<!-- End .entry-overlay-meta -->
							</div>
							<!-- End .entry-media -->
							<h3 class="entry-title">
							<a href="<%=urlSlug %>"><%=item.getName() %></a>
							</h3>
							</article>
							<% i++;} } %>
							<!-- End .entry-overlay -->
						</div>
						<!-- End .islemag-template1-posts -->
					</div>
					<!-- End .islemag-template1 -->
				</div>
				                  
                            <div class="islemag-section5">
                            	<h2 class="title-border title-bg-line light_red mb30"><span>Bình luận</span></h2>
                            	<%  
		                          @SuppressWarnings("unchecked")	
									ArrayList<Comment> listComments=(ArrayList<Comment>) request.getAttribute("listComments");	
									if (listComments.size()>0 && listComments!=null){
		                				  
		                		%> 
                                <div class="post-section islemag-template4 mb30">
                                    <div class="islemag-template4-posts smaller-nav no-radius">
                                        <div class="entry-wrapper">
                                        <%	for (Comment item:listComments){
                                        	SimpleDateFormat df=new SimpleDateFormat("dd/MM/yyyy");
                                        	Date date=new Date(item.getDate_create().getTime());
                                        	String stringdate= df.format(date);
                                        	%>
                                            <article class="entry entry-overlay entry-block eb-small ">
                                                <div class="entry-media">                                                                                                                                                           
                                                                <img width="110" height="110" src="<%=request.getContextPath() %>/templates/public/images/icon1.png" alt="" />                        
                                                    <p><%=item.getEmail() %></p>
                                                    <!-- End figure -->
                                                </div>
                                                <!-- End .entry-media -->

                                                <h3 class="entry-title"><%=item.getContent() %></h3>
                                                <div class="entry-meta">
                                                    <span class="entry-overlay-date"><i class="fa fa-calendar"></i><%=stringdate %></span>                                                                                                   
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
                           
                        <%} %> </div>
				<div id="comments" class="comments-area">
					<div id="respond" class="comment-respond">
						<h3 id="reply-title" class="comment-reply-title">Tham gia bình luận <small>
						<a rel="nofollow" id="cancel-comment-reply-link" href="/islemag/2016/04/20/selfie/#respond" style="display:none;">Cancel reply</a>
						</small>
						</h3>
						<div id="msg">
									
						</div>
						<form action="" method="post" id="commentform" class="comment-form" novalidate>
							<div class="row">
								<div class="col-sm-4">
									<div class="form-group">
										<label for="email" class="input-desc">Email <span class="required">* </span>
										</label>
										<input id="email" class="form-control" placeholder="Your E-mail" name="email" type="text" value="" size="30" aria-required='true'/>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label for="comment" class="input-desc">Comment </label>
								<textarea class="form-control" id="comment" name="comment" aria-required="true" placeholder="Your Message">
								</textarea>
							</div>
							<p class="form-submit">
								<a href="javascript:void(0)" title="" class="pirate-forms-submit-button btn btn-primary" onclick="return xulyguibinhluan(<%=news.getId()%>)">Send Message</a>
							</p>
						</form>
					</div>
					<!-- #respond -->
				</div>
				<!-- #comments -->
			</div>
			<%@ include file="/templates/public/inc/rightbar.jsp" %>
		</div>
		<!-- End .row -->
	</div>
	<!-- End .container -->
</div>
<script type="text/javascript">
				function xulyguibinhluan(id){		
					var email=$("#email").val();
					var message=$("#comment").val();
					$.ajax({
						url: '<%=request.getContextPath() %>/admin/comment/add',
						type: 'POST',
						cache: false,
						data: {aname:name,aemail:email,amessage:message,anews_id:id},
						success: function(data){
							$("#msg").html(data);
						},
						error: function (){
							alert('Có lỗi xảy ra');
						}
					});
					
					return false;
				}
						
			</script>
<!-- #content -->
<%@ include file="/templates/public/inc/footer.jsp" %>