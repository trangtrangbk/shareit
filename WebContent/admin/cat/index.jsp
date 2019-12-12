<%@page import="util.FileUtil"%>
<%@page import="util.AuthUtil"%>
<%@page import="model.dao.CategoryDAO"%>
<%@page import="model.bean.Category"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ include file="/templates/admin/inc/header.jsp" %>
 <div class="limiter">
		<%
        String msg=request.getParameter("msg");
        String err=request.getParameter("err");
        if ("1".equals(err)){
    		out.print("<span style=\"background:yellow;color:red;font-weight: bold; padding:px\">Có lỗi xảy ra</span>");
    	}
        if ("2".equals(err)){
    		out.print("<span style=\"background:yellow;color:red;font-weight: bold; padding:px\">Có lỗi xảy ra khi xoá</span>");
    	}
    	if ("1".equals(msg)){
    		out.print("<span style=\"background:yellow;color:green;font-weight: bold; padding:px\">Thêm danh mục thành công</span>");
    	}
    	if ("2".equals(msg)){
    		out.print("<span style=\"background:yellow;color:green;font-weight: bold; padding:px\">Sửa danh mục thành công</span>");
    	}
    	if ("3".equals(msg)){
    		out.print("<span style=\"background:yellow;color:green;font-weight: bold; padding:px\">Xoá danh mục thành công</span>");
    	}
        %>
		<div class="container-table100">
			<div class="wrap-table100">
			<h2>Quản lý danh mục</h2>
					<div class="table">
						<div class="col-sm-6">
                              <a href="<%=request.getContextPath() %>/admin/cat/add" style="color: white" class="btn btn-success btn-md">Thêm</a>
                        </div>
                        <br>
						<div class="row header">
							<div class="cell"  style="width: 200px;">ID danh mục</div>
							<div class="cell" style="width: 600px;">Tên danh mục</div>
							<div class="cell" style="width: 160px;">Chức năng</div>
						</div>
						<% 
								CategoryDAO categoryDAO=new CategoryDAO();
                                @SuppressWarnings("unchecked")
                                ArrayList<Category> categories=(ArrayList<Category>) request.getAttribute("categories");
                                if (categories!=null & categories.size()>0) {
                                	for (Category obj:categories ) {
                                		if (obj.getParent_id()==0){
                                		%>
                                	<div class="row">
										<div class="cell" style="width: 200px;"><%=obj.getId() %></div>
										<div class="cell" style="width: 600px;"><%=obj.getName() %>											
                                			<% 
                                			categoryDAO.ShowCategory(categories, obj.getId(), request, response,out);
                                			 %>
										</div>
										<div class="cell" style="width: 160px;">
											<a href="<%=request.getContextPath() %>/admin/cat/edit?id=<%=obj.getId() %>" title="" style="color: white" class="btn btn-success"><i class="fa fa-edit "></i> Sửa</a>
			                                <a href="<%=request.getContextPath() %>/admin/cat/del?id=<%=obj.getId() %>" title="" style="color: white" class="btn btn-danger" onclick="return confirm('Bạn có chắc muốn xoá?')"><i class="fas fa-trash-alt"></i> Xóa</a>
										</div>
									</div>
						<%}}} %>
					</div>
			<br>
			<div class="nav-links">
			<%
               int numberOfItems= (Integer) request.getAttribute("numberOfItems");
               int numberOfPages= (Integer) request.getAttribute("numberOfPages");
               int currentPage= (Integer) request.getAttribute("currentPage");
               if (categories!=null && categories.size()>0){            	                
               String active="";
               for (int i=1;i<=numberOfPages;i++){
                    if (currentPage==i){ %>
                    <span aria-current="page" class="page-numbers current"><%=i %></span>
              <%    }else { %>			
				<a class="page-numbers" href="<%=request.getContextPath()%>/admin/cat/index?page=<%=i%>"><%=i %></a> 
 				<%}} %>
				<a class="next page-numbers" href="<%=request.getContextPath()%>/admin/cat/index?page=<%=currentPage+1%>">			
				<span class="screen-reader-text">Next Posts</span>»</a>
				<%} %>
			</div>
			</div>
			
		</div>
	</div> 
<script>
    document.getElementById("menu-item-2").classList.add('current-menu-item');
</script>    
 <%@ include file="/templates/admin/inc/footer.jsp" %>
        
