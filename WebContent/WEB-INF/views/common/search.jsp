<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<fmt:requestEncoding value="utf-8"/>

<div>
	<div class="_pnw2j"></div>
	<div class="_o1o4h">
		<div class="_q8rex">			
			<c:if test="${not empty searchList}">						
				<c:forEach items="${searchList}" var="search" varStatus="vs">				
					<!-- <a class="_k2vj6" href="#">
						<div class="_oluat"> -->
							<c:if test="${search.state eq 0}">
								<a class="_k2vj6" href="javascript:;" onclick="goHash(${search.seq}, '${search.top}', '${search.bottom}')">
									<div class="_oluat">
										<span class="_90x7z coreSpriteHashtag"></span>
							</c:if>
							<c:if test="${search.state eq 1}">
								<a class="_k2vj6" href="profile.do?seq=${search.seq}">
									<div class="_oluat">
										<img class="_q6fzq" src="${search.image}">
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
			<c:if test="${empty searchList}">
				<div class="_a2lxa">검색 결과가 없습니다.</div>
			</c:if>
		</div>
	</div>
</div>

<form action="hash.do" name="searchFrm" method="post">
	<input type="hidden" name="seq" value="">
	<input type="hidden" name="top" value="">
	<input type="hidden" name="bottom" value="">
</form>

<script>
function goHash(seq, top, bottom){
	var frm = document.searchFrm;
	frm.seq.value = seq;
	frm.top.value = top;
	frm.bottom.value = bottom;
	frm.submit();
}
</script>