<%@page import="model.bean.News"%>
<%@page import="util.DefineUtil"%>
<%@page import="model.bean.Category"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/templates/admin/inc/header.jsp" %>
<div id="page-wrapper">
    <div id="page-inner">
        <div class="row">
            <div class="col-md-12">
                <h2>Sửa tin tức</h2>
            </div>
        </div>
        <!-- /. ROW  -->
        <%
	        if(request.getParameter("msg")!=null){
				int msg = Integer.parseInt(request.getParameter("msg"));
				switch(msg){
				case 0: out.print("Vui lòng nhập đầy đủ"); break;
				}
			}
        	String err=request.getParameter("err");
      		 if ("1".equals(err)){
        		out.print("<span style=\"background:yellow;color:red;font-weight: bold; padding:px\">Có lỗi xảy ra khi sửa</span>");
      		 } 
                News news=(News) request.getAttribute("news");
               String newsName="",preview_text="",detail_text="",picture="";
               if (news!=null){
            	     newsName=news.getName();
                     preview_text=news.getPreview_text();
                     detail_text=news.getDetail_text();
                     picture=news.getPicture();
               }
         %>
        <hr />
        <div class="row">
            <div class="col-md-12">
                <!-- Form Elements -->
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-md-12">
                                <form action="<%=request.getContextPath() %>/admin/news/edit?id=<%=news.getId() %>" role="form" method="post" enctype="multipart/form-data" id="form">
                                    <div class="form-group">
                                        <label for="name">Tên tin</label>
                                        <input type="text" id="name" value="<%=newsName %>" name="name" class="form-control" />
                                    </div>
                                    <div class="form-group">
                                        <label for="category">Danh mục tin</label>
                                        <select id="category" name="category" class="form-control">
                                        <%if (request.getAttribute("listCat")!=null){
                                        	ArrayList<Category> list=(ArrayList<Category>) request.getAttribute("listCat");
                                        	if (list.size()>0)
                                        		for (Category obj:list){
                                        			String catName=obj.getName();
                                        			int catId=obj.getId();
                                        
                                        %>
	                                        <option value="<%=catId%>"><%=catName %></option>
	                                        <%}} %>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="picture">Hình ảnh</label>
                                        <input type="file" name="picture" />
                                        <%
                                        	if (!picture.isEmpty()){
                                        %>
                                        <br />
                                        <img  width="200px" alt="Ảnh" src="<%=request.getContextPath() %>/<%=DefineUtil.DIR_UPLOAD %>/<%=picture%>">
                                        <%} %>
                                    </div>
                                    <div class="form-group">
                                        <label for="preview">Mô tả</label>
                                        <textarea id="preview" class="form-control" rows="3" name="preview"><%=preview_text %></textarea>
                                    </div>
                                    <div class="form-group">
                                        <label for="detail">Chi tiết</label>
                                        <textarea id="detail" class="form-control" id="detail" rows="5" name="detail"><%=detail_text %></textarea>
                                    </div>
                                    <button type="submit" name="submit" class="btn btn-success btn-md">Sửa</button>
                                </form>
                                <script type="text/javascript" >CKEDITOR.replace( 'detail');</script>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End Form Elements -->
            </div>
        </div>
        <!-- /. ROW  -->
    </div>
    <!-- /. PAGE INNER  -->
</div>
<script>
    document.getElementById("menu-item-3").classList.add('current-menu-item');
</script>
<!-- /. PAGE WRAPPER  -->
<%@ include file="/templates/admin/inc/footer.jsp" %>