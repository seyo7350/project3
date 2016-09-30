<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<header class="_s6yvg">
	 <a class="_5lote _pss4f _vbtk2">
		<c:if test="${peedList[peed_index].member_profile_image eq null}">
          <img alt="이미지 오류" class="_a012k" src="image/not.jpg" id="blah">
        </c:if>
        <c:if test="${peedList[peed_index].member_profile_image ne null}">
           <img class="_a012k" src="upload/${peedList[peed_index].member_profile_image }">
        </c:if>
	
	</a> 
	<div class="_f95g7">
		<a class="_4zhc5 notranslate _ook48" title="${mem.id }" href="#">${mem.id }</a>
		<a class="_kul9p _rnlnu" title="페넬로페" href="#">위치정보</a>

	</div>
	<span class="_fbms8 _e616g" id="fbms8">
		
		<c:choose>
			<c:when test="${mem.id ne login.id && follow ne 2}">
				<input type="button" class="_aj7mu _2hpcs _kenyh _o0442" id="send_follow_btn" value="팔로우"/>
			</c:when>
			<c:when test="${mem.id ne login.id && follow eq 2 }">
				<input type="button" class="_aj7mu _r4e4p _kenyh _o0442" id="cancle_follow_btn" value="팔로우 취소"/>
			</c:when> 
		</c:choose>	
		 
	</span>
</header>
<div>
	<div class="_22yr2 _e0mru">
		<div class="_jjzlb" style="padding-bottom: 100%; height: 600px; width: 600px">
			<img alt="이미지 없음${peed_index }" src="upload/${peedList[peed_index].image }" style="height: 600px; width: 600px;">
		</div>
		<div class="_ovg3g"></div>
	</div>
</div>
<div class="_es1du _rgrbt">
	<section class="_tfkbw _d39wz">
		<div class="_iuf51 _oajsw">
			<span class="_tf9x3">좋아요 <span id="_countThumbsUp">${countThumbsUp}</span>개</span>
		</div>
		<a class="_rmo1e" href="#">
			<time class="_379kp" datetime="2016-08-29T16:26:48.000Z" title="2016년 8월 30일">1주</time>
		</a>
	</section>
	<ul class="_mo9iw _123ym">
		<c:if test="${empty detailReplyList}">
			<li class="_nk46a">
				<h1>
					<a class="_4zhc5 notranslate _iqaka" title="" href="#" style="text-decoration: none;"></a>
					<span>
					댓글이 없습니다. 님이 댓글 달면 1빠
					</span>
				</h1>
			</li>
		</c:if>
		
		<c:if test="${not empty detailReplyList }">
			<c:forEach items="${detailReplyList }" var="detailReply" varStatus="vs">
					<li class="_nk46a">
						<h1>
							<a class="_4zhc5 notranslate _iqaka" title="" href="#">${detailReply.member_id }</a>
							<span>
							${detailReply.content }
							<br>
							</span>
						</h1>
					</li>
			</c:forEach>
		</c:if>
		
	</ul>
	<section class="_jveic _rhgel">
		<a class="_ebwb5 _1tv0k" href="#" role="button" aria-disabled="false" id="thumbsUp">
			
			<c:choose>
				<c:when test="${like_state eq 0}">
					<span class="_soakw coreSpriteHeartOpen" id="like" onclick="changeHeart(this)">좋아요</span>
				</c:when>
				
				<c:when test="${like_state eq 1}">
					<span class="_soakw coreSpriteHeartFull" id="like" onclick="changeHeart(this)">좋아요</span>
				</c:when>
			</c:choose>
		</a>
		
		<form class="_k3t69" onsubmit="return false;">
			<input type="text" id="detail_reply" class="_7uiwk _qy55y" aria-label="Add a comment…" placeholder="Add a comment…" onkeydown="javascript:if(event.keyCode==13){insertReply(${peedList[peed_index].seq})};" value="">
		</form>
		<button class="_9q0pi coreSpriteEllipsis _soakw">옵션 더 보기</button>
	</section>
</div>
<script>
/* $(document).ready(function(){
	var s = '';
	s += '<input type="button" class="_aj7mu _2hpcs _kenyh _o0442" id="send_follow_btn" value="팔로우"/>';
	$('#fbms8').html(s);
}); */
$('#send_follow_btn').click(function(){
	/* alert('팔로우');
	alert('${mem.id}');
	alert('${login.id}'); */
	$.ajax({
		type:"POST",
		url:"sendFollow.do",
		async:true,
		data:"follow=${mem.seq}&member_seq=${login.seq}",
		success: function(follow_check){
			/* alert(follow_check); */
			
			if(follow_check==2){
				$('#send_follow_btn').attr({'class':'_aj7mu _r4e4p _kenyh _o0442','value':'팔로우 취소','id':'cancle_follow_btn'});				
			}else{ 
				alert('팔로우 실패');
			}
		}
	});
});

$('#cancle_follow_btn').click(function(){
	/* alert('팔로우 취소'); */
	$.ajax({
		type:"POST",
		url:"cancleFollow.do",
		async:true,
		data:"follow=${mem.seq}&member_seq=${login.seq}",
		success: function(follow_check){
			/* alert(follow_check); */

			if(follow_check==true){
				$('#cancle_follow_btn').attr({'class':'_aj7mu _2hpcs _kenyh _o0442','value':'팔로우','id':'send_follow_btn'});				
			}else{ 
				alert('팔로우 취소 실패');
			}
		}
	});
});



function changeHeart(info) {
	if(info.className == '_soakw coreSpriteHeartOpen'){
		$('#like').attr('class','_soakw coreSpriteHeartFull');
		
		$.ajax({
			type:"POST",
			url:"plusPeedCnt.do",
			async:true,
			data:"member_seq=${login.seq}&peed_index=${peed_index}",
			success: function(p_countThumbsUp){
				/* alert('좋아요 성공'); */
				/* alert(p_countThumbsUp); */
				$('#_countThumbsUp').html(p_countThumbsUp);
			}
			
		});
		
	}else if(info.className == '_soakw coreSpriteHeartFull'){
		$('#like').attr('class','_soakw coreSpriteHeartOpen');
		
		$.ajax({
			type:"POST",
			url:"minusPeedCnt.do",
			async:true,
			data:"member_seq=${login.seq}&peed_index=${peed_index}",
			success: function(m_countThumbsUp){
				/* alert('좋아요 취소'); */
				/* alert(m_countThumbsUp); */
				$('#_countThumbsUp').html(m_countThumbsUp);
			}
		});
		
	}
}



function insertReply(peed_seq) {
	/* alert(peed_seq); */
	var reply_msg = $('#detail_reply').val();
	
	/* var msg = jQuery('._nk46a h1').html(); */

	<%-- var test = <%=detailReplyList[0].member_id %>; --%>
	
	$.ajax({
		type:"POST",
		url:"detailReply.do",
		async:true,
		data:"content="+reply_msg+"&peed_seq="+peed_seq+"&member_seq=${login.seq}&member_id=${login.id}",
		dataType:"json",
		success: function(map_id) {
			/* alert(map_id); */
			//alert(map.detailReplyList2.member_id);
			/* alert(map.detailReplyList2); */
			//for (var idx = 0; idx < map.detailReplyList2.length; idx++) {
				var s = '<li class="_nk46a">';
					s += '<h1>';
					//s += '<a class="_4zhc5 notranslate _iqaka" title="" href="#">${detailReplyList[peed_seq].member_id }</a>';
					//s += '<a class="_4zhc5 notranslate _iqaka" title="" href="#"><c:out value="${detailReplyList[0].member_id}"/>'; */
					//s += '<a class="_4zhc5 notranslate _iqaka" title="" href="#">'+map.detailReplyList2[idx].member_id;
					s += '<a class="_4zhc5 notranslate _iqaka" title="" href="#">'+map_id.write_id;
					s += '</a>';
					s += '<span>';
					s += '&nbsp';
					s += reply_msg;
					s += '<br>';
					s += '</span>';
					s += '</h1>';
					s += '</li>';
					/* alert(s); */
				$('._mo9iw').append(s);
				$('#detail_reply').val('');
			//}
			
			
		}
		
	});
}
</script>














	