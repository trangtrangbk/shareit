<%@page import="model.bean.Category"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/templates/admin/inc/header.jsp" %>
<div id="page-wrapper">
    <div id="page-inner">
        <div class="row">
            <div class="col-md-12">
                <h2>Thêm tin tức</h2>
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
        %>
        <hr />
        <div class="row">
            <div class="col-md-12">
                <!-- Form Elements -->
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-md-12">
                                <form action="<%=request.getContextPath() %>/admin/news/add" role="form" method="post" enctype="multipart/form-data" id="form">
                                    <div class="form-group">
                                        <label for="name">Tên tin</label>
                                        <input type="text" id="name" value="" name="name" class="form-control" />
                                    </div>
                                    <div class="form-group">
                                        <label for="category">Danh mục</label>
                                        <select id="category" name="category" class="form-control">
                                        <%
                                        if (request.getAttribute("listCat")!=null){
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
                                    </div>
                                    <div class="form-group">
                                        <label for="preview">Mô tả</label>
                                        <textarea id="preview" class="form-control" rows="3" name="preview"></textarea>
                                    </div>
                                    <div class="form-group">
                                        <label for="detail">Chi tiết</label>
                                        <textarea id="detail" class="form-control"  rows="5" name="detail"></textarea>
                                    </div>
                                    <button type="submit" name="submit" class="btn btn-success btn-md">Thêm</button>
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