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
							<div class="cell"  style="width: 10%;">ID tin</div>
							<div class="cell" style="width: 20%;">Tên tin</div>
							<div class="cell"  style="width: 20%;">Danh mục</div>
							<div class="cell" style="width: 30%;">Hình ảnh</div>
							<div class="cell" style="width: 20%;">Chức năng</div>
						</div>
								<% 
                                @SuppressWarnings("unchecked")
                                	ArrayList<News> news=(ArrayList<News>) request.getAttribute("news");
                                if (news!=null & news.size()>0)
                                	for (News obj:news ) {  
                                %>
                                	<div class="row">
										<div class="cell" style="width: 10%;"><%=obj.getId() %></div>
										<div class="cell" style="width: 20%;"><%=obj.getName() %></div>
										<div class="cell" style="width: 20%;"><%=obj.getCat().getName() %></div>
										<div class="cell" style="width: 30%;">
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
										<div class="cell" style="width: 20%;">
										<a href="javascript:void(0)" onclick="document.getElementById('<%=obj.getId() %>').style.display='block'" title="" style="color: white" class="btn btn-info"><i class="fa fa-eye"></i></a>
											<a href="<%=request.getContextPath() %>/admin/news/edit?id=<%=obj.getId() %>" title="" style="color: white" class="btn btn-success"><i class="fa fa-edit "></i></a>
			                                <a href="<%=request.getContextPath() %>/admin/news/del?id=<%=obj.getId() %>" title="" style="color: white" class="btn btn-danger" onclick="return confirm('Bạn có chắc muốn xoá?')"><i class="fas fa-trash-alt"></i></a>
										</div>
										  <div id="<%=obj.getId() %>" class="w3-modal" >
    <div class="w3-modal-content" style="padding: 40px !important;">
      <div class="w3-container">
        <span onclick="document.getElementById('<%=obj.getId() %>').style.display='none'" class="w3-button w3-display-topright">&times;</span>
        <p style="font-size: 25px; font-weight: bold"><%=obj.getName() %></p>
        <p style="font-size: 15px; color: #0000008a">Ngày đăng: <%=obj.getDate_create() %> - Lượt xem: <%=obj.getCounter() %></p>
        <p  style=" font-weight: bold"><%=obj.getPreview_text() %></p>
       <p><%=obj.getDetail_text() %></p>
      </div>
    </div>
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
            if(currentPage > 1){%>
            <a class="next page-numbers" href="<%=request.getContextPath()%>/admin/news/index?page=<%=currentPage-1%>">			
			prev</a>	
            <% }
               for (int i=1;i<=numberOfPages;i++){
                    if (currentPage==i){ %>
                    <span aria-current="page" class="page-numbers current"><%=i %></span>
              <%    }else { %>			
				<a class="page-numbers" href="<%=request.getContextPath()%>/admin/news/index?page=<%=i%>"><%=i %></a> 
 				<%}
                    }
               if(currentPage <numberOfPages){
               %>
				<a class="next page-numbers" href="<%=request.getContextPath()%>/admin/news/index?page=<%=currentPage+1%>">			
				next</a>		
				<%}} %>		
			</div>
			</div>
		</div>
		
	</div> 
<script>
    document.getElementById("menu-item-3").classList.add('current-menu-item');
</script>    
<%@ include file="/templates/admin/inc/footer.jsp" %>