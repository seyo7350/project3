<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<header class="_s6yvg">
	<a class="_5lote _pss4f _vbtk2">
		<c:if test="${peedList[peedIndex].member_profile_image eq null}">
          <img alt="이미지 오류" class="_a012k" src="image/not.jpg" id="blah">
        </c:if>
        <c:if test="${peedList[peedIndex].member_profile_image ne null}">
           <img class="_a012k" src="upload/${peedList[peedIndex].member_profile_image }">
        </c:if>
	</a>
	<div class="_f95g7">
		<a class="_4zhc5 notranslate _ook48" title="anhwichan" href="#">${peedList[peedIndex].member_id}</a>
		<a class="_kul9p _rnlnu" title="페넬로페" href="#">위치정보</a>
	</div>
	<span class="_fbms8 _e616g">
		<button class="_aj7mu _2hpcs _kenyh _o0442" id="send_follow_btn">
			팔로우
		</button>
	</span>
</header>
<div>
	<div class="_22yr2 _e0mru">
		<div class="_jjzlb" style="padding-bottom: 100%; height: 600px; width: 600px">
			<img alt="이미지 없음${peedIndex }" src="upload/${peedList[peedIndex].image }" style="height: 600px; width: 600px;">
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
				${peedList[peedIndex].image }
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
				친하게 지내도 될까요^^?? 인친해요~😃
				</span>
			</h1>
		</li>
	</ul>
	<section class="_jveic _rhgel">
		<a class="_ebwb5 _1tv0k" href="#" role="button" aria-disabled="false">
			<span class="_soakw coreSpriteHeartOpen">좋아요</span>
		</a>
		<form class="_k3t69">
			<input type="text" class="_7uiwk _qy55y" aria-label="Add a comment…" placeholder="Add a comment…" value>
		</form>
		<button class="_9q0pi coreSpriteEllipsis _soakw">옵션 더 보기</button>
	</section>
</div>
<script>
$('#send_follow_btn').click(function(){
	alert('팔로우');
	$.ajax({
		type:"POST",
		url:"sendFollow.do",
		async:true,
		data:"follow=${mem.id}&member_seq=${login.id}",
		success: function(data){
			alert(data);
		}
	});
});
</script>	