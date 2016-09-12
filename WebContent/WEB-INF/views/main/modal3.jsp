<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<ul class="_539vh _4j13h">
	<c:if test="${empty followerList }">
		<li class="_cx1ua">
			<div class="_6jvgy">
				팔로워가 없습니다.
			</div>
		</li>
	</c:if>
	
	<c:if test="${not empty followerList }">	
		<c:forEach items="${followerList }" var="follower" varStatus="vs">
			<li class="_cx1ua">
				<div class="_6jvgy">
					<div class="_9tu8m">
						<a class="_5lote _pfo25 _vbtk2" href="#none" style="width: 30px; height: 30px;"><img class="_a012k" src="123.jpg" alt="이미지 없음"></a>
						<div class="_mmgca">
							<div class="_gzjax"><a class="_4zhc5 notranslate _j71fh" title="아이디">${follower.id }</a></div> 아이디
							<div class="_2uju6">${follower.name }</div>
						</div>	
											
						<div class="_72gdz">
							<span class="_e616g">
								<button type="button" class="btn btn-primary" style="background-color: green;">팔로잉</button>
							</span>
						</div>
					</div>
				</div> 
			</li>
		</c:forEach>
	</c:if>
</ul>