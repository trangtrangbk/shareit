<%@page import="util.DefineUtil"%>
<%@page import="model.bean.User"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/templates/admin/inc/header.jsp" %>
 <div class="limiter">
        <!-- /. ROW  -->
        <%
       		 User userLogin1= (User) session.getAttribute("userInfo");
        	String err=request.getParameter("err");
        	String msg=request.getParameter("msg");
        	if ("1".equals(msg)){
        		out.print("<span style=\"background:yellow;color:green;font-weight: bold; padding:px\">Thêm người dùng thành công</span>");
        	}
        	if ("2".equals(msg)){
        		out.print("<span style=\"background:yellow;color:green;font-weight: bold; padding:px\">Sửa người dùng thành công</span>");
        	}
        	if ("3".equals(msg)){
        		out.print("<span style=\"background:yellow;color:green;font-weight: bold; padding:px\">Xoá người dùng thành công</span>");
        	}
        	if ("1".equals(err)){
        		out.print("<span style=\"background:yellow;color:red;font-weight: bold; padding:px\">Có lỗi xảy ra</span>");
        	}
        	if ("2".equals(err)){
        		out.print("<span style=\"background:yellow;color:red;font-weight: bold; padding:px\">ID không tồn tại</span>");
        	}
        	if ("3".equals(err)){
        		out.print("<span style=\"background:yellow;color:red;font-weight: bold; padding:px\">Có lỗi khi xoá</span>");
        	}
        	if ("4".equals(err)){
        		out.print("<span style=\"background:yellow;color:red;font-weight: bold; padding:px\">Không có quyền thêm</span>");
        	}
        	if ("5".equals(err)){
        		out.print("<span style=\"background:yellow;color:red;font-weight: bold; padding:px\">Không có quyền sửa</span>");
        	}
        	if ("6".equals(err)){
        		out.print("<span style=\"background:yellow;color:red;font-weight: bold; padding:px\">Không có quyền xoá</span>");
        	}
        %>
        <hr />
        <div class="container-table100">
			<div class="wrap-table100">
			<h2>Quản lý người dùng</h2>
					<div class="table">
							<%
								if (userLogin.getPosition().equals("admin")){
							%>
						<div class="col-sm-6">
                              <a href="<%=request.getContextPath() %>/admin/user/add" style="color: white" class="btn btn-success btn-md">Thêm</a>
                        </div>
                        <%} %>
                        <br>
						<div class="row header">
							<div class="cell"  style="width: 100px;">ID người dùng</div>
							<div class="cell" style="width: 300px;">Username</div>
							<div class="cell"  style="width: 200px;">Full name</div>
							<div class="cell" style="width: 200px;">Chức vụ</div>
							<div class="cell" style="width: 160px;">Chức năng</div>
						</div>
								<% 
								@SuppressWarnings("unchecked")
                            	ArrayList<User> users=(ArrayList<User>) request.getAttribute("users");
                            		if (users!=null & users.size()>0) 
                            			for (User obj:users ) {
                                %>
                                	<div class="row">
										<div class="cell" style="width: 100px;"><%=obj.getId() %></div>
										<div class="cell" style="width: 300px;"><%=obj.getUsername() %></div>
										<div class="cell" style="width: 200px;"><%=obj.getFullname() %></div>
										<div class="cell" style="width: 200px;">
											<%
                                        	if ("admin".equals(obj.getPosition())){
                                        		out.print("admin");
                                        	}else out.print("mod");
                                        	%>
											
										</div>
										<%
											if (userLogin.getPosition().equals("admin")){
										%>
										<div class="cell" style="width: 160px;">
											<a href="<%=request.getContextPath() %>/admin/user/edit?id=<%=obj.getId() %>" title="Sửa" style="color: white" class="btn btn-success"><i class="fa fa-edit "></i> Sửa</a>
											<% if (!obj.getPosition().equals("admin")){ %>
										     <a href="<%=request.getContextPath() %>/admin/user/del?id=<%=obj.getId() %>" title="Xoá" style="color: white" class="btn btn-danger" onclick="return confirm('Bạn có chắc muốn xoá?')"><i class="fas fa-trash-alt"></i> Xóa</a>											
											<%} %>
										</div>
										<%}else 
											if (userLogin1.getId()==obj.getId()){  %>
											<div class="cell" style="width: 160px;">
											  <a href="<%=request.getContextPath() %>/admin/user/edit?id=<%=obj.getId() %>" title="Sửa" style="color: white" class="btn btn-success"><i class="fa fa-edit "></i> Sửa</a>                                            											
											</div>
											<%} %>
									</div>
						<%} %>
					</div>
			<br>
			<div class="nav-links">
			<%
               int numberOfItems= (Integer) request.getAttribute("numberOfItems");
               int numberOfPages= (Integer) request.getAttribute("numberOfPages");
               int currentPage= (Integer) request.getAttribute("currentPage");
               if (users!=null && users.size()>0){        	                
               for (int i=1;i<=numberOfPages;i++){
                    if (currentPage==i){ %>
                    <span aria-current="page" class="page-numbers current"><%=i %></span>
              <%    }else { %>			
				<a class="page-numbers" href="<%=request.getContextPath()%>/admin/user/index?page=<%=i%>"><%=i %></a> 
 				<%}
                    } %>
				<a class="next page-numbers" href="<%=request.getContextPath()%>/admin/user/index?page=<%=currentPage+1%>">			
				<span class="screen-reader-text">Next Posts</span>»</a>		
				<%} %>		
			</div>
			</div>
		</div>
	</div> 
<script>
    document.getElementById("menu-item-4").classList.add('current-menu-item');
</script>
<!-- /. PAGE INNER  -->
<%@ include file="/templates/admin/inc/footer.jsp" %>