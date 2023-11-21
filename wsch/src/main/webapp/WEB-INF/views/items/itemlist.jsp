<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="styleSheet" href="/wsch/resources/css/itemlist.css">
<link rel="styleSheet" href="/wsch/resources/css/listanddetail.css">

</head>
<body>
	<main>
	    <div id="topWrap">
	        <div id="bannerImg">
	            <img src="/wsch/resources/img/items/img_8343_1.png" alt="">
	        </div>
	        <div id="navBar">
	            <ul id="nav">
	                <li class="selected"><a href="?type=all">전체(123)</a></li>
	                <li class=""><a href="?type=1">탁주(1)</a></li>
	                <li class=""><a href="?type=2">청주/약주(2)</a></li>
	                <li class=""><a href="${pageContext.servletContext.contextPath }/items?type=3">과실주(3)</a></li>
	                <li class=""><a href="${pageContext.servletContext.contextPath }/items?type=4">증류주(4)</a></li>
	                <li class=""><a href="${pageContext.servletContext.contextPath }/items?type=5">리큐르/기타(5)</a></li>
	            </ul>
	        </div>
	        <div id="searchBar">
	            <div class="row">
	            	<input type="radio"/>검색옵션1
	            	<input type="radio"/>검색옵션2
	            	
	            	<input type="text"/>
	            	<input type="button" value="검색">
	            </div>
	        </div>
	    </div>
	
	    <div id="product_list">
	    	<c:forEach var="product" items="${products}">
	     	<div class="item">
	             <div class="image">
	                 <a href="${pageContext.servletContext.contextPath }/items/detail?proNo=${product.no}">
	                     <img class="productImg" src= ${product.imgurl }>
	                 </a>
	             </div>
	             <div class="information">
	                 <div class="title">${product.name }</div>
	                	<div class="review">평점 4.5 리뷰 32(리뷰평점빼기)</div>
	                 
	                 <div class="detail">
	                     <ul class="menuUl"> 
	                         <hr/>
	                         <li>	
	                             ${product.description }
	                         </li>
	                         <hr/>
	                         <li>분류        ${product.type }</li>
	                         <li>제조사      ${product.company }</li>
	                         <li>주 원료     ${product.materials }</li>
	                         <li>규격/도수   ${product.capacity } / ${product.alcohol } </li>
	
	                     </ul>
	                 </div>
	             </div>
	         </div>
	    	</c:forEach>
		</div>
		<div class="paging">
		    <p> &lt; 1 2 3 4 5 &gt; </p>
		</div>
	 </main>
<script>
	window.onload = function(){
		var type = console.log($(location).attr('search'));
	}
</script>
        
</body>