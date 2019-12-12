<%@page import="model.bean.User"%>
<%@page import="model.bean.Category"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/templates/admin/inc/header.jsp" %>
<div id="page-wrapper">
    <div id="page-inner">
        <div class="row">
            <div class="col-md-12">
                <h2>Sửa người dùng</h2>
            </div>
        </div>
        <!-- /. ROW  -->
        <%
        	String err=request.getParameter("err");
        	String username=request.getParameter("username");
        	String fullname=request.getParameter("fullname");
			User user= (User) request.getAttribute("user");
			if (user!=null){
				username=user.getUsername();
				fullname=user.getFullname();
			}
      		 if ("1".equals(err)){
        		out.print("<span style=\"background:yellow;color:red;font-weight: bold; padding:px\">Có lỗi xảy ra khi sửa</span>");
      		 }
        	if ("2".equals(err)){
            	out.print("<span style=\"background:yellow;color:red;font-weight: bold; padding:px\">Username đã tồn tại </span>");
        	}
        	if(request.getParameter("msg")!=null){
				int msg = Integer.parseInt(request.getParameter("msg"));
				switch(msg){
				case 0: out.print("<span style=\"background:yellow;color:red;font-weight: bold; padding:px\">Vui lòng nhập đầy đủ</span>"); break;
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
                                <form action="<%=request.getContextPath() %>/admin/user/edit?id=<%=user.getId() %>" role="form" method="post" id="form">
                                    <div class="form-group">
                                        <label for="username">Tên đăng nhập</label>
                                        <input type="text" id="username" value="<% if (username!=null) out.print(username); %>" name="username" class="form-control" disabled="disabled"/>
                                    </div>
                                    <div class="form-group">
                                        <label for="password">Password</label>
                                        <input type="password" id="password" value="" name="password" class="form-control" />
                                    </div>
                                    <div class="form-group">
                                        <label for="fullname">Họ tên</label>
                                        <input type="text" id="fullname" value="<% if (fullname!=null) out.print(fullname); %>" name="fullname" class="form-control" />
                                    </div>
                                    <div class="form-group">
                                        <label for="position">Chức vụ</label>
                                        <select id="position" name="position" class="form-control">                                       
	                                        <option value="admin">Admin</option>
	                                      	<option value="mod">Nhân viên</option>
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
	document.getElementById("menu-item-4").classList.add('current-menu-item');
</script>
<!-- /. PAGE WRAPPER  -->
<%@ include file="/templates/admin/inc/footer.jsp" %>