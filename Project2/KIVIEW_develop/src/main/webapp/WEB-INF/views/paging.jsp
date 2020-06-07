<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<div class="jsx-1407906967 board-list-footer">
		<ul class="jsx-3635512122 pagination pagination--kindergarten" id = "n_paging">
			<c:if test = "${pageMaker.prev}">
			<li class="jsx-3635512122 prev disabled" >
			<a href = "${pageMaker.makeQuery(pageMaker.startPage - 1)}">
			<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
				viewBox="0 0 24 24" fill="none" stroke="#dfdfdf"
				stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
			style="position: relative;">
			<polyline points="11 17 6 12 11 7"></polyline>
			<polyline points="18 17 13 12 18 7"></polyline></svg> 
			</a>
			<span class="jsx-3635512122 alt-text">앞으로</span>
			</li>
			</c:if>
						
			<c:forEach begin = "${pageMaker.startPage}" end = "${pageMaker.endPage}" var = "idx">
			<li class="jsx-3635512122 " id = "page${idx}">
			<c:choose>
			<c:when test="${idx eq param.page}">
			<a href = "${pageMaker.makeQuery(idx)}" class = "on" id = "pageclick${idx}">${idx}</a>
			</c:when>
			<c:otherwise>
			<a href = "${pageMaker.makeQuery(idx)}" class = "off" id = "pageclick${idx}">${idx}</a>
			</c:otherwise>
			</c:choose>
			</li>
			</c:forEach>
						
			<c:if test = "${pageMaker.next && pageMaker.endPage > 0}">
			<li class="jsx-3635512122 next">
			<a href = "${pageMaker.makeQuery(pageMaker.endPage + 1)}">
		    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
				viewBox="0 0 24 24" fill="none" stroke="#dfdfdf"
				stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
				style="position: relative;">
			<polyline points="13 17 18 12 13 7"></polyline>
			<polyline points="6 17 11 12 6 7"></polyline>
			</svg> 
			<span class="jsx-3635512122 alt-text">뒤로</span>
			</a>
			</li>
			</c:if>
		</ul>
	</div>
