<%@page import="model.bean.Comment"%>
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
        		out.print("<span style=\"background:yellow;color:green;font-weight: bold; padding:5px\">Xoá bình luận thành công</span>");
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
			<h2>Quản lý bình luận</h2>
					<div class="table">							
						<div class="row header">
							<div class="cell"  style="width: 100px;">ID người dùng</div>
							<div class="cell" style="width: 280px;">Tên tin</div>
							<div class="cell"  style="width: 200px;">Email</div>
							<div class="cell" style="width: 300px;">Nội dung</div>							
							<div class="cell" style="width: 80px;">Trạng thái</div>
						</div>
								<% 
                                @SuppressWarnings("unchecked")
                                	ArrayList<Comment> comments=(ArrayList<Comment>) request.getAttribute("comments");
                                if (comments!=null & comments.size()>0) 
                                	for (Comment obj:comments ) {
                                %>
                                	<div class="row">
										<div class="cell" style="width: 100px;"><%=obj.getId() %></div>
										<div class="cell" style="width: 280px;"><%=obj.getNews().getName() %></div>
										<div class="cell" style="width: 200px;"><%=obj.getEmail() %></div>
										<div class="cell" style="width: 300px;"><%=obj.getContent() %></div>
										<div class="cell" style="width: 80px;">
											<% if (obj.isState()!=false){ %>
											<div id="state-<%=obj.getId()%>"><a href="javascript:void(0)" onclick="return xulyan(<%=obj.getId() %>)" title="" style="color: green;" ><i class="fas fa-check-circle"></i></a></div>
											<%}else{ %>
											<div id="state-<%=obj.getId()%>"><a href="javascript:void(0)" title="" onclick="return xulyhien(<%=obj.getId() %>)"><i class="fas fa-eye-slash"></i></a></div>
											<%} %>
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
               if (comments!=null && comments.size()>0){        	                
               for (int i=1;i<=numberOfPages;i++){
                    if (currentPage==i){ %>
                    <span aria-current="page" class="page-numbers current"><%=i %></span>
              <%    }else { %>			
				<a class="page-numbers" href="<%=request.getContextPath()%>/admin/comment/index?page=<%=i%>"><%=i %></a> 
 				<%}
                    } %>
				<a class="next page-numbers" href="<%=request.getContextPath()%>/admin/comment/index?page=<%=currentPage+1%>">			
				<span class="screen-reader-text">Next Posts</span>»</a>		
				<%} %>		
			</div>
			</div>
		</div>
	</div> 
	<script type="text/javascript">
				function xulyan(id){
					var tmp="#state-"+id;
					$.ajax({
						url: '<%=request.getContextPath()%>/admin/comment/active?id='+id,
						cache: false,
						data: {},
						success: function(data){
							$(tmp).html('<a href="javascript:void(0)" title="" onclick="return xulyhien('+id+')"><i style="color:red;" class="fas fa-eye-slash"></i></a>');
						},
						error: function (){
							alert('Có lỗi xảy ra');
						}
					});					
					return false;
				}				
		</script>
		<script>
		function xulyhien(id){
			var tmp="#state-"+id;
			$.ajax({
				url: '<%=request.getContextPath()%>/admin/comment/active?id='+id,
				cache: false,
				data: {},
				success: function(data){
					$(tmp).html('<a href="javascript:void(0)" onclick="return xulyan('+id+')" title="" style="color: green;" ><i class="fas fa-check-circle"></i></a>');
				},
				error: function (){
					alert('Có lỗi xảy ra');
				}
			});					
			return false;
		}
		</script>
<script>
	document.getElementById("menu-item-5").classList.add('current-menu-item');
</script>
<!-- /. PAGE INNER  -->
<%@ include file="/templates/admin/inc/footer.jsp" %>