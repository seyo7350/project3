<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<ul class="_539vh _4j13h" id="contentList">
	<c:if test="${empty followList }">
		<li class="_cx1ua">
			<div class="_6jvgy">
				팔로우가 없습니다.
			</div>
		</li>
	</c:if>
	
	<c:if test="${not empty followList }">
		<c:forEach items="${followList }" var="follow" varStatus="vs">
				<li class="_cx1ua">
					<div class="_6jvgy">
						<div class="_9tu8m">
								<a class="_5lote _pfo25 _vbtk2" href="#none" style="width: 30px; height: 30px;"><img class="_a012k" src="123.jpg" alt="이미지 없음"></a>
								<div class="_mmgca"><!--  아이디, 이름 -->
									<div class="_gzjax"><a class="_4zhc5 notranslate _j71fh" title="아이디">${follow.id }</a></div>
									<div class="_2uju6">${follow.name}</div>
								</div>
						
							<div class="_72gdz">
								<span class="_e616g">
									<c:if test="${login.seq eq mem.seq }">
										<button type="button" class="btn btn-primary" style="background-color: green;">팔로잉</button>
									</c:if>
									
									<c:if test="${login.seq ne mem.seq }">
										<button type="button" class="_aj7mu _2hpcs _kenyh _o0442">팔로우</button>
									</c:if>
									<!-- <button class="_aj7mu _2hpcs _95tat _o0442">팔로우</button> -->
								</span>
							</div>
						</div>
					</div> 
				</li>
		</c:forEach>
	</c:if>
</ul>