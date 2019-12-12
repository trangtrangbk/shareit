<%@page import="model.bean.News"%>
<%@page import="model.bean.Category"%>
<%@page import="util.DefineUtil"%>
<%@page import="model.dao.CategoryDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
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
        if ("3".equals(err)){
    		out.print("<span style=\"background:yellow;color:red;font-weight: bold; padding:px\">Có lỗi xảy ra khi sửa</span>");
    	}
    	if ("1".equals(msg)){
    		out.print("<span style=\"background:yellow;color:green;font-weight: bold; padding:px\">Thêm tin tức thành công</span>");
    	}
    	if ("2".equals(msg)){
    		out.print("<span style=\"background:yellow;color:green;font-weight: bold; padding:px\">Sửa tin tức thành công</span>");
    	}
    	if ("3".equals(msg)){
    		out.print("<span style=\"background:yellow;color:green;font-weight: bold; padding:px\">Xoá tin tức thành công</span>");
    	}
        %>
<div class="container-table100">
			<div class="wrap-table100">
			<h2>Quản lý tin tức</h2>
					<div class="table">
						<div class="col-sm-6">
                              <a href="<%=request.getContextPath() %>/admin/news/add" style="color: white" class="btn btn-success btn-md">Thêm</a>
                        </div>
                        <br>
						<div class="row header">
							<div class="cell"  style="width: 100px;">ID tin</div>
							<div class="cell" style="width: 300px;">Tên tin</div>
							<div class="cell"  style="width: 120px;">Danh mục</div>
							<div class="cell" style="width: 200px;">Hình ảnh</div>
							<div class="cell" style="width: 80px;">Trạng thái</div>
							<div class="cell" style="width: 160px;">Chức năng</div>
						</div>
								<% 
                                @SuppressWarnings("unchecked")
                                	ArrayList<News> news=(ArrayList<News>) request.getAttribute("news");
                                if (news!=null & news.size()>0)
                                	for (News obj:news ) {  
                                %>
                                	<div class="row">
										<div class="cell" style="width: 100px;"><%=obj.getId() %></div>
										<div class="cell" style="width: 300px;"><%=obj.getName() %></div>
										<div class="cell" style="width: 120px;"><%=obj.getCat().getName() %></div>
										<div class="cell" style="width: 200px;">
											<%
                                        	if (!obj.getPicture().equals("")){
                                        	%>
											<img width="200px" height="200px" 
											src="<%=request.getContextPath() %>/<%=DefineUtil.DIR_UPLOAD %>/<%=obj.getPicture() %>" 
											alt="<%=obj.getPicture() %>"/>
                                        	<%}else {%>
                                            <img width="200px" height="200px" 
    											src="<%=DefineUtil.URL_ADMIN %>/images/noimage.png" 
    											alt=""/>
    											<%} %>
										</div>
										<div class="cell" style="width:80px;">
											<% if (obj.isState()!=false){ %>
											<div id="state-<%=obj.getId()%>"><a href="javascript:void(0)" onclick="return xulyan(<%=obj.getId() %>)" title="" style="color: green;" ><i class="fas fa-check-circle"></i></a></div>
											<%}else{ %>
											<div id="state-<%=obj.getId()%>"><a href="javascript:void(0)" title="" onclick="return xulyhien(<%=obj.getId() %>)"><i class="fas fa-eye-slash"></i></a></div>
											<%} %>
										</div>
										<div class="cell" style="width: 160px;">
											<a href="<%=request.getContextPath() %>/admin/news/edit?id=<%=obj.getId() %>" title="" style="color: white" class="btn btn-success"><i class="fa fa-edit "></i> Sửa</a>
			                                <a href="<%=request.getContextPath() %>/admin/news/del?id=<%=obj.getId() %>" title="" style="color: white" class="btn btn-danger" onclick="return confirm('Bạn có chắc muốn xoá?')"><i class="fas fa-trash-alt"></i> Xóa</a>
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
               if (news!=null && news.size()>0){        	                
               for (int i=1;i<=numberOfPages;i++){
                    if (currentPage==i){ %>
                    <span aria-current="page" class="page-numbers current"><%=i %></span>
              <%    }else { %>			
				<a class="page-numbers" href="<%=request.getContextPath()%>/admin/news/index?page=<%=i%>"><%=i %></a> 
 				<%}
                    } %>
				<a class="next page-numbers" href="<%=request.getContextPath()%>/admin/news/index?page=<%=currentPage+1%>">			
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
						url: '<%=request.getContextPath()%>/admin/active?id='+id,
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
				url: '<%=request.getContextPath()%>/admin/active?id='+id,
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
    document.getElementById("menu-item-3").classList.add('current-menu-item');
</script>    
<%@ include file="/templates/admin/inc/footer.jsp" %>