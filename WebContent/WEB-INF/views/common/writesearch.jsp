<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<fmt:requestEncoding value="utf-8"/>

<div>	
	<div class="writesearch">
		<div class="writesearchsub">			
			<c:if test="${not empty writesearchList}">						
				<c:forEach items="${writesearchList}" var="search" varStatus="vs">
					<a class="_k2vj6" href="javascript:;" onclick="changeKeyword('${search.top}')" id="_a${vs.index}">
						<div class="_oluat">
							<c:if test="${search.state eq 0}">
								<span class="_90x7z coreSpriteHashtag"></span>
							</c:if>
							<c:if test="${search.state eq 1}">
								<img class="_q6fzq" src="">
							</c:if>
							<div class="_orhxc">
								<span class="_qfezm">${search.top}</span>
							</div>
							<div class="_qasqy">
								<span>${search.bottom}</span>
							</div>
						</div>
					</a>
				</c:forEach>
			</c:if>
			<c:if test="${empty writesearchList}">
				<div class="_a2lxa">검색 결과가 없습니다.</div>
			</c:if>
		</div>
	</div>
</div>

<script>
$(document).ready(function(){
	var size = '${fn:length(writesearchList)}';
	if(size == 0){
		$('.writesearch').css('top', '-62px');
	}else if(size > 4){
		$('.writesearch').css('top', '-314px');
	}else{
		var top = ((size-1)*66)+80;
		$('.writesearch').css('top', '-'+top+'px');
	}	
});
</script>