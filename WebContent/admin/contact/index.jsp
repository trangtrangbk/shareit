<%@page import="model.bean.Contact"%>
<%@page import="util.DefineUtil"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/templates/admin/inc/header.jsp" %>
 <div class="limiter">
        <!-- /. ROW  -->
        <%
        	String err=request.getParameter("err");
        	String msg=request.getParameter("msg");
        	if ("1".equals(msg)){
        		out.print("<span style=\"background:yellow;color:green;font-weight: bold; padding:5px\">Xoá liên hệ thành công</span>");
        	}
        	if ("1".equals(err)){
        		out.print("<span style=\"background:yellow;color:red;font-weight: bold; padding:5px\">ID không tồn tại</span>");
        	}
        	if ("2".equals(err)){
        		out.print("<span style=\"background:yellow;color:red;font-weight: bold; padding:5px\">Có lỗi xảy ra</span>");
        	}
        	
        %>
         <hr />
        <div class="container-table100">
			<div class="wrap-table100">
			<h2>Quản lý liên hệ</h2>
					<div class="table">							
						<div class="row header">
							<div class="cell"  style="width: 100px;">ID người dùng</div>
							<div class="cell" style="width: 100px;">Tên</div>
							<div class="cell"  style="width: 200px;">Email</div>
							<div class="cell" style="width: 180px;">Subject</div>
							<div class="cell" style="width: 250px;">Message</div>
							<div class="cell" style="width: 130px;">Chức năng</div>
						</div>
								<% 
                                @SuppressWarnings("unchecked")
                                	ArrayList<Contact> contacts=(ArrayList<Contact>) request.getAttribute("contacts");
                                if (contacts!=null & contacts.size()>0) 
                                	for (Contact obj:contacts ) {
                                %>
                                	<div class="row">
										<div class="cell" style="width: 100px;"><%=obj.getId() %></div>
										<div class="cell" style="width: 100px;"><%=obj.getName() %></div>
										<div class="cell" style="width: 200px;"><%=obj.getEmail() %></div>
										<div class="cell" style="width: 180px;"><%=obj.getSubject() %></div>
										<div class="cell" style="width: 250px;"><%=obj.getMessage() %></div>										
										<div class="cell" style="width: 130px;">										
										     <a href="<%=request.getContextPath() %>/admin/contact/del?id=<%=obj.getId() %>" title="Xoá" style="color: white" class="btn btn-danger" onclick="return confirm('Bạn có chắc muốn xoá?')"><i class="fas fa-trash-alt"></i> Xóa</a>											
										</div>										
									</div>
						<%} %>
					</div>
			<br>
			<div class="nav-links">
			<%
               int numberOfItems= (Integer) request.getAttribute("numberOfItems");
               int numberOfPages= (Integer) request.getAttribute("numberOfPages");
               int currentPage= (Integer) request.getAttribute("currentPage");
               if (contacts!=null && contacts.size()>0){        	                
               for (int i=1;i<=numberOfPages;i++){
                    if (currentPage==i){ %>
                    <span aria-current="page" class="page-numbers current"><%=i %></span>
              <%    }else { %>			
				<a class="page-numbers" href="<%=request.getContextPath()%>/admin/contact/index?page=<%=i%>"><%=i %></a> 
 				<%}
                    } %>
				<a class="next page-numbers" href="<%=request.getContextPath()%>/admin/contact/index?page=<%=currentPage+1%>">			
				<span class="screen-reader-text">Next Posts</span>»</a>		
				<%} %>		
			</div>
			</div>
		</div>
	</div> 
<script>
	document.getElementById("menu-item-6").classList.add('current-menu-item');
</script>
<!-- /. PAGE INNER  -->
<%@ include file="/templates/admin/inc/footer.jsp" %>