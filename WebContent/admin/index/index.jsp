<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ include file="/templates/admin/inc/header.jsp" %>
<div class="slider-container">
  <div class="menu">
    <label for="slide-dot-1"></label>
    <label for="slide-dot-2"></label>
    <label for="slide-dot-3"></label>
  </div>
  
  <input id="slide-dot-1" type="radio" name="slides" checked>
    <div class="slide slide-1"></div>
  
  <input id="slide-dot-2" type="radio" name="slides">
    <div class="slide slide-2"></div>
  
  <input id="slide-dot-3" type="radio" name="slides">
    <div class="slide slide-3"></div>
</div>

<script>
    document.getElementById("menu-item-1").classList.add('current-menu-item');
</script>
 <%@ include file="/templates/admin/inc/footer.jsp" %>
        
