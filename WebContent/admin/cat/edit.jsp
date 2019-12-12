<%@page import="model.bean.Category"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/templates/admin/inc/header.jsp" %>
<div id="page-wrapper">
    <div id="page-inner">
        <div class="row">
            <div class="col-md-12">
                <h2>Sửa danh mục</h2>
            </div>
        </div>
        <!-- /. ROW  -->
        <%
        	Category category= (Category) request.getAttribute("category");
        	String catName="";
        	if (category!=null){
              	catName=category.getName();
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
                                <form action="<%=request.getContextPath() %>/admin/cat/edit?id=<%=category.getId() %>" role="form" method="post" id="form">
                                    <div class="form-group">
                                        <label for="name">Tên danh mục</label>
                                        <input type="text" id="name" value="<%=catName %>" name="name" class="form-control" />
                                    </div> 
                                    <div class="form-group">
                                        <label for="category">Danh mục cha</label>
                                        <select id="category" name="category" class="form-control">
                                        	<option value="0">Không</option>
                                        <%
                                        if (request.getAttribute("listCat")!=null){
                                        	ArrayList<Category> list=(ArrayList<Category>) request.getAttribute("listCat");
                                        	if (list.size()>0)
                                        		for (Category obj:list){
                                        			String cat_Name=obj.getName();
                                        			int catId=obj.getId();                                        
                                        %>
	                                        <option value="<%=catId%>"><%=cat_Name %></option>
	                                        <%}} %>
                                        </select>
                                    </div>                                                                    
                                    <button type="submit" name="submit" class="btn btn-success btn-md">Sửa</button>
                                </form>
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
    document.getElementById("category").classList.add('active-menu');
</script>
<!-- /. PAGE WRAPPER  -->
<%@ include file="/templates/admin/inc/footer.jsp" %>