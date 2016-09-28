<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<header class="_s6yvg">
	<a class="_5lote _pss4f _vbtk2">
		<img class="_a012k" src="${peedList[peed_index].image }" >
	</a>
	<div class="_f95g7">
		<a class="_4zhc5 notranslate _ook48" title="${mem.id }" href="#">${mem.id }</a>
		<a class="_kul9p _rnlnu" title="페넬로페" href="#">위치 정보(나중에 할 것)</a>
	</div>
	<span class="_fbms8 _e616g" id="fbms8">
		
		<c:choose>
			<c:when test="${mem.id ne login.id && follow_connect_cnt ne 1}">
				<input type="button" class="_aj7mu _2hpcs _kenyh _o0442" id="send_follow_btn" value="팔로우"/>
			</c:when>
			<c:when test="${mem.id ne login.id && follow_connect_cnt eq 1 }">
				<input type="button" class="_aj7mu _r4e4p _kenyh _o0442" id="send_follow_btn" value="팔로우 취소"/>
			</c:when> 
		</c:choose>	
		 
	</span>
</header>
<div>
	<div class="_22yr2 _e0mru">
		<div class="_jjzlb" style="padding-bottom: 100%; height: 600px; width: 600px">
			<img alt="이미지 없음${follow_connect_cnt}" src="${peedList[peed_index].image }" style="height: 600px; width: 600px;">
		</div>
		<div class="_ovg3g"></div>
	</div>
</div>
<div class="_es1du _rgrbt">
	<section class="_tfkbw _d39wz">
		<div class="_iuf51 _oajsw">
			<span class="_tf9x3">좋아요 <span>57</span>개</span>
		</div>
		<a class="_rmo1e" href="#">
			<time class="_379kp" datetime="2016-08-29T16:26:48.000Z" title="2016년 8월 30일">1주</time>
		</a>
	</section>
	<ul class="_mo9iw _123ym">
		<li class="_nk46a">
			<h1>
				<a class="_4zhc5 notranslate _iqaka" title="selimee_e" href="#">selimee_e</a>
				<span>
				기다림이 즐거워🙄💕
				${peedList[peed_index].image }
				<br>
				케이크 먹고싶다는 한마디에 뚝!딱!
				<br>
				<a href="#">#케이크</a>
				</span>
			</h1>
		</li>
		<li class="_nk46a">
			<h1>
				<a class="_4zhc5 notranslate _iqaka" title="yumyumiku2" href="#">yumyumiku2</a>
				<span>
				친하게 지내도 될까요^^?? 인친해요~😃${thumbsUpDTO.member_seq }${thumbsUpDTO.peed_seq}${peedDTO.peed_like}
				</span>
			</h1>
		</li>
	</ul>
	<section class="_jveic _rhgel">
		<a class="_ebwb5 _1tv0k" href="#" role="button" aria-disabled="false" id="thumbsUp">
			
			<c:choose>
				<c:when test="${like_state ne 1}">
					<span class="_soakw coreSpriteHeartOpen" id="like" onclick="changeHeart(this)">좋아요</span>
				</c:when>
				
				<c:when test="${like_state eq 1}">
					<span class="_soakw coreSpriteHeartFull" id="like" onclick="changeHeart(this)">좋아요</span>
				</c:when>
			</c:choose>
		</a>
		
		<form class="_k3t69">
			<input type="text" class="_7uiwk _qy55y" aria-label="Add a comment…" placeholder="Add a comment…" value>
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
	alert('팔로우');
	$.ajax({
		type:"POST",
		url:"sendFollow.do",
		async:true,
		data:"follow=${mem.id}&member_seq=${login.id}",
		success: function(follow_check){
			alert(follow_check);
			/* var s = '';
				s += '<input type="button" class="_aj7mu _2hpcs _kenyh _o0442" id="send_follow_btn" value="팔로우"/>'; */
			/* var follow_check_val = '<c:out value="${follow_check}" />';
			alert(follow_check_val);	 */
			
			
			/* if(follow_check==2){
				s = '';
				s += '<input type="button" class="_aj7mu _r4e4p _kenyh _o0442" id="send_follow_btn" value="팔로우 취소"/>';
			}
			$('#fbms8').html(s); */
			
			if(follow_check==2){
				$('#send_follow_btn').attr({'class':'_aj7mu _r4e4p _kenyh _o0442','value':'팔로우 취소'});				
			}else{ 
				alert('팔로우 실패');
			}
		}
	});
});

/* $('#thumbsUp').on('click', function(){
	$('#like').attr('class','_soakw coreSpriteHeartFull');
});
 */
function changeHeart(info) {
	if(info.className == '_soakw coreSpriteHeartOpen'){
		$('#like').attr('class','_soakw coreSpriteHeartFull');
		
		$.ajax({
			type:"POST",
			url:"plusPeedCnt.do",
			async:true,
			data:"member_seq=${login.seq}&peed_seq=${peed_index}",
			success: function(data){
				alert('좋아요 성공');
			}
			
		});
		
	}else if(info.className == '_soakw coreSpriteHeartFull'){
		$('#like').attr('class','_soakw coreSpriteHeartOpen');
		
		$.ajax({
			type:"POST",
			url:"minusPeedCnt.do",
			async:true,
			data:"member_seq=${login.seq}&peed_seq=${peed_index}",
			success: function(data){
				alert('좋아요 취소');
			}
		});
		
	}
}

</script>














	