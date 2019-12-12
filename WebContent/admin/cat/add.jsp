<%@page import="model.bean.Category"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/templates/admin/inc/header.jsp" %>
<div id="page-wrapper">
    <div id="page-inner">
        <div class="row">
            <div class="col-md-12">
                <h2>Thêm danh mục</h2>
            </div>
        </div>
        <!-- /. ROW  -->
        <hr />
        <div class="row">
            <div class="col-md-12">
                <!-- Form Elements -->
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-md-12">
                                <form action="<%=request.getContextPath() %>/admin/cat/add" role="form" method="post" id="form">                                
                                    <div class="form-group" >
                                        <label for="name">Tên danh mục</label>
                                        <input style="border: 1px solid black" type="text" id="name" value="" name="name" class="form-control" />
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
                                        			String catName=obj.getName();
                                        			int catId=obj.getId();                                        
                                        %>
	                                        <option value="<%=catId%>"><%=catName %></option>
	                                        <%}} %>
                                        </select>
                                    </div>                                                                   
                                    <button type="submit" name="submit" class="btn btn-success btn-md">Thêm</button>
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
    document.getElementById("menu-item-2").classList.add('current-menu-item');
</script>
<!-- /. PAGE WRAPPER  -->
<%@ include file="/templates/admin/inc/footer.jsp" %>