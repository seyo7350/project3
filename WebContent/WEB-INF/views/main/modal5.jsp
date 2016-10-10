<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<fmt:requestEncoding value="utf-8"/>

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
				<input type="button" class="_aj7mu _r4e4p _kenyh _o0442" id="cancle_follow_btn" value="팔로잉"/>
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
	<ul class="_mo9iw _123ym" style="overflow: auto;">
		<c:if test="${empty detailReplyList}">
			<li class="_nk46a" id="first_reply_view">
				<!-- <h1> -->
					<a class="_4zhc5 notranslate _iqaka" title="" href="#" style="text-decoration: none;"></a>
					<span>
					댓글이 없습니다. 님이 댓글 달면 1빠
					</span>
				<!-- </h1> -->
			</li>
		</c:if>
		
		<c:if test="${not empty detailReplyList }">
			<c:forEach items="${detailReplyList }" var="detailReply" varStatus="vs">
					<li class="_nk46a${detailReply.seq }">
						<c:if test="${detailReply.member_id eq login.id }">
							<button class="_4vltl" title="댓글 삭제" onclick="delReply(${detailReply.seq},${detailReply.peed_seq })"></button>
						</c:if>
						<!-- <h1> -->
							<a class="_4zhc5 notranslate _iqaka" title="${detailReply.member_id }" href="profile.do?id=${detailReply.member_id }" id="after_del_reply_a">${detailReply.member_id }</a>
							<span id="after_del_reply_span">
							${detailReply.content }
							<br>
							</span>
						<!-- </h1> -->
					</li>
			</c:forEach>
		</c:if>
		
	</ul>
	<section class="_jveic _rhgel">
		<div id="searchDiv"></div>
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
		<form class="_k3t69" style="z-index: 2;" onsubmit="return false;">			
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
				$('#send_follow_btn').attr({'class':'_aj7mu _r4e4p _kenyh _o0442','value':'팔로잉','id':'cancle_follow_btn'});				
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
//${detailReply.member_id eq login.id }">
var login_id = '${login.id}';
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
		success: function(linkedContent) {
			$('#first_reply_view').hide();
			var s = '<li class="_nk46a">';
			s += '<button class="_4vltl" title="댓글 삭제"></button>';
			s += '<a class="_4zhc5 notranslate _iqaka" title="" href="#">'+login_id;//+map_id.write_id;
			s += '</a>';
			s += '<span>';
			s += '&nbsp';
			s += linkedContent;
			s += '<br>';
			s += '</span>';
			s += '</li>';
			$('._mo9iw').append(s);
			$('#detail_reply').val('');
				
			$.ajax({
				type:"POST",
				url:"detailReply2.do",
				async:true,
				data:"seq="+peed_seq,
				success: function(data) {
					reply = data.seq;
					
					$('._nk46a').attr('class','_nk46a'+reply);
					
					$('._mo9iw').scrollTop($('._mo9iw').prop('scrollHeight'));
				}
			});
				
			$('._4vltl').on("click", function () {
				delReply(reply, peed_seq);
			});
		}
	});
	
}

function delReply(reply_seq, peed_seq) {
	/* alert(reply_seq); */
	/* alert(peed_seq); */
	$.ajax({
		type:"POST",
		url:"delReply.do",
		async:true,
		data:"seq="+reply_seq+"&peed_seq="+peed_seq,
		success : function(reply_seq){
			/* alert(reply_seq); */
			$('._nk46a'+reply_seq).html('');
			
		}
	});
}

var text = ''; 		//content 내용
var r = -1;			// 커서 위치
var s = '';			// 커서위치까지의 문자열
var enter_pos = -1;	// 커서 위치부터 가까운 엔터 위치
var space_pos = -1;	// 커서 위치부터 가까운 스페이스 위치
var hash_pos = -1;	// 커서 위치부터 가까운 # 위치
var at_pos = -1;	// 커서 위치부터 가까운 @ 위치
var end_pos = -1;	// keyword가 끝나는 위치, 한글이면 맞지 않아서 계산해야 함
var end_enter_pos = -1;	// 태그로부터 뒤로 가까운 엔터 위치
var end_space_pos = -1;	// 태그로부터 뒤로 가까운 스페이스 위치
var keyword = '';

$.fn.selectRange = function(start, end) {		// 커서 위치 변경하는 함수
    return this.each(function() {
         if(this.setSelectionRange) {
             this.focus();
             this.setSelectionRange(start, end);
         } else if(this.createTextRange) {
             var range = this.createTextRange();
             range.collapse(true);
             range.moveEnd('character', end);
             range.moveStart('character', start);
             range.select();
         }
     });
 };
	
$('#detail_reply').keyup(function(e){
	text = $('#detail_reply').val();
	r = $('#detail_reply').prop("selectionEnd");	// 커서 위치
	s = text.substring(0, r);	// 커서위치까지의 문자열
			
	enter_pos = s.lastIndexOf('\n');
	space_pos = s.lastIndexOf(' ');
	hash_pos = s.lastIndexOf('#');
	at_pos = s.lastIndexOf('@');
	end_pos = -1;
	keyword = '';
	
	// 커서로부터 무엇이 더 가까운지
	if(enter_pos>hash_pos && enter_pos>at_pos){			// enter, 리턴
		$('div._jacrq2').prevAll().remove();
		$('#searchDiv').removeClass();
		return;
	}
	if(space_pos>hash_pos && space_pos>at_pos){			// space, 리턴
		$('div._jacrq2').prevAll().remove();
		$('#searchDiv').removeClass();
		return;
	}else if(hash_pos>space_pos && hash_pos>at_pos){	// hash, 해시태그 검색
		end_enter_pos = text.indexOf('\n', hash_pos);
		end_space_pos = text.indexOf(' ', hash_pos);
		
		if(end_enter_pos < 0){			// enter가 없을 때
			end_pos = end_space_pos;
		}else if(end_space_pos < 0){	// space가 없을 때
			end_pos = end_enter_pos;
		}else{							// enter가 멀면 space, space가 멀면 enter
			end_pos = (end_enter_pos > end_space_pos) ? end_space_pos : end_enter_pos;
		}
		
		end_pos = (end_pos == -1) ? text.length : end_pos;	// enter, space 둘 다 없을 경우엔 text.length
		keyword = text.substring(hash_pos, end_pos);			
	}else if(at_pos>space_pos && at_pos>hash_pos){		// at, 멤버 검색
		end_enter_pos = text.indexOf('\n', at_pos);
		end_space_pos = text.indexOf(' ', at_pos);
		
		if(end_enter_pos < 0){			// enter가 없을 때
			end_pos = end_space_pos;
		}else if(end_space_pos < 0){	// space가 없을 때
			end_pos = end_enter_pos;
		}else{							// enter가 멀면 space, space가 멀면 enter
			end_pos = (end_enter_pos > end_space_pos) ? end_space_pos : end_enter_pos;
		}
		
		end_pos = (end_pos == -1) ? text.length : end_pos;	// enter, space 둘 다 없을 경우엔 text.length
		keyword = text.substring(at_pos, end_pos);
	}		
			
	if(keyword==''||keyword=='#'||keyword=='@'||e.which==13){	// 검색 예외		
		$('div._jacrq2').prevAll().remove();
		$('#searchDiv').removeClass();
		return;
	}
			
	$.ajax({
		type:"POST",
		url:"writesearch.do",
		data:"keyword="+keyword,
		async:true,
		success: function(data){
			$('#searchDiv').addClass('_jacrq2');
			$('div._jacrq2').prevAll().remove();
			$('div._jacrq2').before(data);
			$('div.writesearch').css('width', '287px');
		}
	});
	
});

function changeKeyword(searchKeyword){
	$('div._jacrq2').prevAll().remove();
	var prevStr = '';		// keyword 앞 내용
	var afterStr = '';		// keyword 뒷 내용
	var replacedStr = '';	// 대체될 문자열
	var cursorIndex = -1;	// 대체 후 커서 위치
	
	if(hash_pos>at_pos){	// hash	해시태그 검색			
		prevStr = text.substring(0, hash_pos+1);	// 처음부터 #까지의 문자열
		afterStr = text.substring(end_pos);			// keyword 뒷 문자열
		replacedStr = prevStr + searchKeyword + ' ' + afterStr;	// keyword 후 한칸 띄워줌
		cursorIndex = replacedStr.indexOf(' ', hash_pos);
	}else if(at_pos>hash_pos){		// at 멤버 검색
		prevStr = text.substring(0, at_pos+1);		// 처음부터 @까지의 문자열
		afterStr = text.substring(end_pos);
		replacedStr = prevStr + searchKeyword + ' ' + afterStr;
		cursorIndex = replacedStr.indexOf(' ', at_pos);
	}
	$('#detail_reply').val(replacedStr);
	/* $('#_content').focus(); */
	$('#detail_reply').selectRange(cursorIndex+1, cursorIndex+1);
}

$('._jacrq2').click(function(){
	$('div._jacrq2').prevAll().remove();
	$('#searchDiv').removeClass();
});

</script>

