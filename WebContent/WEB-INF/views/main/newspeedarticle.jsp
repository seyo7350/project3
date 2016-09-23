<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<fmt:requestEncoding value="utf-8"/>

<c:if test="${empty peedlist  }">
		<div class="_s6b3o _i5nnf">
			<div class="_3fhxa coreSpriteWelcomeDesktop"></div>
			<h2 class="_9sg67">Instagram에 오신 것을 환영합니다!</h2>
			<p class="_qq0ct">피드에서 사진과 동영상을 보려면 다른 사람의 계정을 팔로우하세요.</p>
		</div>
</c:if>
<c:if test="${not empty peedlist }">
	<c:forEach items="${peedlist }" var="peed" varStatus="peedVs">
	<article class="_8ab8k _j5hrx _pieko">
			<header class="_s6yvg">
			<a class="_5lote _pss4f _vbtk2" href="/아이디/" style="width: 30px; height: 30px;">
			<c:if test="${peed.member_profile_image eq null}">
              <img alt="이미지 오류" class="_a012k" src="image/not.jpg" id="blah">
            </c:if>
            <c:if test="${peed.member_profile_image ne null}">
               <img class="_a012k" src="upload/${peed.member_profile_image}">
            </c:if>
		</a>
		<div class="_f95g7">
			<a class="_4zhc5 notranslate _ook48" title="아이디" href="/아이디 프로필/">${peed.member_id }</a>
			<!-- <a class="_ku19p _rnlnu" title="장소태그명" href="지도로 이동하는곳">장소명</a> -->
		</div>
		<a class="_ljyfo _8snt5" href="/시간에 게시물 상세히 보기 페이지/">
				<time class="_379kp" datetime="날짜 .시간" title="날짜">${peed.regi_date }</time>
		</a>
	</header><!-- 게시글 상단 메뉴  끝-->
		<div>
			<div class="_22yr2 _e0mru">
				<div class="_jjzlb" style="padding-buttom: 100%">
					<img alt="content내용을 보여줌" class="_icyx7" id="pImage_52" src="upload/${peed.image}" style>
				</div>
				<!-- react - empthy : 3308 -->
				<div class="_ovg3g"></div>
			</div><!-- 이미지 부분 끝 -->
		</div>
			<div class="_es1du _rgrbt">
				<section class="_tfkbw _hpiil">
					<div class="_iuf51  _oajsw">
						<span>
							<!-- react text: 3316 -->
							좋아요
							<!-- /react text -->
							<span>${peed.peed_like }</span>
							<!-- reat-text : 3318 -->
							개
							<!-- /react-text -->
						</span>
					</div>
				</section><!-- 좋아요 아이콘 부분 끝 -->
				<ul class="_mo9iw _pnraw">
					<li class="_nk46a">
						<h1>
							<a class="_4zhc5 notranslate _iqaka" title="어아다" href="profile.do?seq=${peed.member_seq}">${peed.member_id }</a>
								${peed.content }
						</h1>
					</li><!-- content 내용 부분 끝 -->
					
					<c:set var="replyIndex" value="-1"/>
					<c:forEach items="${peedreplylist }" var="reply" varStatus="replyVs">
						<c:if test="${peed.seq eq reply[0].peed_seq }" >
							<c:set var="replyIndex" value="${replyVs.index}"/>
						</c:if>
					</c:forEach>
			
					<%-- <c:out value="${fn:length(peedreplylist[replyIndex])}"/> --%>
					
					<c:if test="${empty peedreplylist[replyIndex] }">
						<li></li>
					</c:if>
					
					<c:if test="${not empty peedreplylist[replyIndex] }">
						<c:if test="${(fn:length(peedreplylist[replyIndex])) > 2 }">
							<button class="_1086v _ifrvy">댓글더보기</button>
						</c:if>
						<c:if test="${replyIndex ne -1}">
							<li class="_nk46a">						
								<a class="_4zhc5 notranslate _iqaka" title="댓글 쓴 아이디" href="댓글 쓴 아이디 프로필 페이지">${peedreplylist[replyIndex][0].member_seq}</a>
								<span>
								<!-- react text:3330 -->
								${peedreplylist[replyIndex][0].content }
								<!-- /react text -->
								</span>
							</li><!-- 댓글 부분 끝 -->
						</c:if>
						<c:if test="${replyIndex ne -1}">
							<li class="_nk46a">						
								<a class="_4zhc5 notranslate _iqaka" title="댓글 쓴 아이디" href="댓글 쓴 아이디 프로필 페이지">${peedreplylist[replyIndex][1].member_seq}</a>
								<span>
								<!-- react text:3330 -->
								${peedreplylist[replyIndex][1].content }
								<!-- /react text -->
								</span>
							</li><!-- 댓글 부분 끝 -->
						</c:if>
					</c:if>
				</ul>
				<section class="_jveic _dsvln">
					<a class="_ebwb5 _1tv0k" href="#" role="button" aria-disbled="false">
						<span class="_soakw coreSpriteHeartOpen">좋아요</span>
					</a>
					<form class="_k3t69" name="replyform">
						<input type="text" name="reply" class="_7uiwk _qy55y" aria-label="Add a comment....." placeholder="Add a comment..." value="">
					</form>
					<!-- <button class="_9q0pi coreSpriteEllipsis _soakw">옵션더보기</button> -->
				</section>
			</div>
	</article>
	</c:forEach>
</c:if>
<script  type="text/javascript">
/* $(document).ready(function(){
	$('#reply input[name=reply]').keydown(function(e){
		if(e.keyCode == 13){
			e.cancelBubble = true;
			alert('엔터키');
		}
	});
}); */
</script> 