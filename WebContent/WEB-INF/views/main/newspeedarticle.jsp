<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<fmt:requestEncoding value="utf-8"/>

<c:if test="${empty peedlist  }">
	<div class="_s6b3o _i5nnf">
		<div class="_3fhxa coreSpriteWelcomeDesktop"></div>
			<h2 class="_9sg67">인수다구래문에 오신 것을 환영합니다!</h2>
			<p class="_qq0ct">피드에서 사진을 보려면 다른 사람의 계정을 팔로우하세요.</p>
	</div>
</c:if>

<c:if test="${not empty peedlist }">
   <c:forEach items="${peedlist }" var="peed" varStatus="peedVs">
   <article class="_8ab8k _j5hrx _pieko">
         <header class="_s6yvg">
         <a class="_5lote _pss4f _vbtk2" href="profile.do?id=${peed.member_id}">
         <c:if test="${peed.member_profile_image eq null}">
              <img alt="이미지 오류" class="_a012k" src="image/not.jpg" id="blah">
            </c:if>
            <c:if test="${peed.member_profile_image ne null}">
               <img class="_a012k" src="upload/${peed.member_profile_image}">
            </c:if>
      </a>
      <div class="_f95g7">
        <%--  <input type="hidden" id="_peed_seq${peed.seq}" name="peed_seq" value="${peed.seq}"/> --%>
         <a class="_4zhc5 notranslate _ook48" title="아이디" href="profile.do?id=${peed.member_id}">${peed.member_id }</a>
         <!-- <a class="_ku19p _rnlnu" title="장소태그명" href="지도로 이동하는곳">장소명</a> -->
      </div>
     <!-- <a class="_ljyfo _8snt5" href="#"> -->
            <time class="_379kp" datetime="날짜 .시간" title="날짜"><fmt:formatDate value="${peed.regi_date }" pattern="yyyy-MM-dd HH:mm:ss"/>
           <br>
            <span class="_timestamp" date="<fmt:formatDate value="${peed.regi_date }" pattern="yyyy-MM-dd HH:mm:ss"/>"></span></time>
     <!--  </a>  -->
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
              <div class="_iuf51 _oajsw">
				<span class="_tf9x3">좋아요 <span id="_countThumbsUp${peed.seq}">${peed.peed_like}</span>개</span>
			  </div>
            </section><!-- 좋아요 아이콘 부분 끝 -->
            <ul class="_mo9iw _pnraw" style="z-index: 2;" id="_ul${peed.seq}">
               <li class="_nk46a">
                  <h1>
                     <a class="_4zhc5 notranslate _iqaka" title="아이디" href="profile.do?id=${peed.member_id}">${peed.member_id }</a>
                        ${peed.content }
                  </h1>
               </li><!-- content 내용 부분 끝 -->
               
               <c:set var="replyIndex" value="-1"/>
               <c:forEach items="${peedreplylist }" var="reply" varStatus="replyVs">
                  <c:if test="${peed.seq eq reply[0].peed_seq }" >
                     <c:set var="replyIndex" value="${replyVs.index}"/>
                  </c:if>
               </c:forEach>               
               <c:if test="${empty peedreplylist[replyIndex] }">
                  <li></li>
               </c:if>
                        
               <c:if test="${not empty peedreplylist[replyIndex] }">
                  <c:if test="${(fn:length(peedreplylist[replyIndex])) > 2 }">
                     <button class="_l086v _ifrvy" id="_replybtn" onclick="replyplus(${peed.seq})">댓글더보기</button>
                     <div id="_replydiv${peed.seq }" style="display: none">
                     	<c:forEach begin="2" end="${fn:length(peedreplylist[replyIndex])}" var="i">
                     		<li class="_nk46a">                  
                        		<a class="_4zhc5 notranslate _iqaka" title="댓글 쓴 아이디" href="profile.do?id=${peedreplylist[replyIndex][i].member_id}">${peedreplylist[replyIndex][i].member_id}</a>
                              	<span>
                              	<!-- react text:3330 -->
                             	${peedreplylist[replyIndex][i].content}
                              	<!-- /react text -->
                           		</span>
                        	</li>
                     	</c:forEach>
                     </div>
                  </c:if>
                  
                  <c:if test="${replyIndex ne -1}">
                     <c:forEach begin="0" end="1" var="i">
                        <li class="_nk46a">                  
                           <a class="_4zhc5 notranslate _iqaka" title="댓글 쓴 아이디" href="profile.do?id=${peedreplylist[replyIndex][i].member_id}">${peedreplylist[replyIndex][i].member_id}</a>
                              <span>
                              <!-- react text:3330 -->
                              ${peedreplylist[replyIndex][i].content}
                              <!-- /react text -->
                           </span>
                        </li>
                     </c:forEach>
                  </c:if>
               </c:if>
            </ul>
            <section class="_jveic _rhgel">
            	<div id="searchDiv${peed.seq}" class="_jacrq2"></div>        	
				<a class="_ebwb5 _1tv0k" style="z-index: 2;" href="javascript:;" role="button" aria-disabled="false" id="thumbsUp">
					<c:choose>
						<c:when test="${likeList[peedVs.index] eq 0}">
							<span class="_soakw coreSpriteHeartOpen" id="like${peed.seq}" onclick="changeHeart(this, ${peed.seq},'${peed.image }' , ${peed.member_seq});">좋아요</span>
						</c:when>
						
						<c:when test="${likeList[peedVs.index] eq 1}">
							<span class="_soakw coreSpriteHeartFull" id="like${peed.seq}" onclick="changeHeart(this, ${peed.seq})">좋아요</span>
						</c:when>
					</c:choose>
				</a>
				<form class="_k3t69" style="z-index: 2;" onsubmit="return false;">					
					<input type="text" id="_reply${peed.seq}" class="_7uiwk _qy55y" aria-label="Add a comment…" placeholder="Add a comment…" onkeydown="javascript:if(event.keyCode==13){insertreply(${peed.seq})};" onkeyup="javascript:autoSearch(${peed.seq});" value="">
				</form>
				<button class="_9q0pi coreSpriteEllipsis _soakw">옵션 더 보기</button>
			</section>
         </div>
   </article>
   </c:forEach>
</c:if>

<script  type="text/javascript">
function insertreply(val){
   
   var content=$('#_reply'+val).val();
   alert(content);
   var id = '${login.id}';
   alert('id'+id);
   

   if(content==""){
      alert('댓글 입력하세요');
   }else{
      alert('content:'+content+'val'+val);
      
      $.ajax({
         type:"POST",
            url:"./insertreply.do",
            data:{content:content,val:val},
            success: function(linkedContent){
               var s='<li class="_nk46a">';
               s+='<a class="_4zhc5 notranslate _iqaka" title="댓글 쓴 아이디" href="">' + id + '</a>';
               s+='<span>';
               s+= linkedContent;
               s+='</span>';
               s+='</li>';
               $('#_ul'+val+' li:last-child').after(s);
               $('#_reply'+val).val('');
            }         
      }); 
   } 
}

function replyplus(val){
	alert('val'+val);
	
	$('#_replydiv'+val).toggle();
}

/* #_countThumbsUp 뒤에 피드 시퀀스를 줘서 알아보게 해야되는데 안도미!!!! */
function changeHeart(info, seq, peed_image, writer_seq) {

	if(info.className == '_soakw coreSpriteHeartOpen'){
		$('#like'+seq).attr('class','_soakw coreSpriteHeartFull');
		
		$.ajax({
			type:"POST",
			url:"fplusPeedCnt.do",
			async:true,
			data:"member_seq=${login.seq}&id=${login.id}&profile_image=${login.profile_image}&peed_seq="+seq+"&peed_image="+peed_image+"&writer_seq="+writer_seq,
			success: function(p_countThumbsUp){
				alert('좋아요 성공'); 
				/* alert(p_countThumbsUp); */
				$('#_countThumbsUp'+seq).html(p_countThumbsUp);
			}
			
		});
		
	}else if(info.className == '_soakw coreSpriteHeartFull'){
		$('#like'+seq).attr('class','_soakw coreSpriteHeartOpen');
		
		$.ajax({
			type:"POST",
			url:"fminusPeedCnt.do",
			async:true,
			data:"member_seq=${login.seq}&peed_seq="+seq,
			success: function(m_countThumbsUp){
				alert('좋아요 취소');
				/* alert(m_countThumbsUp); */
				$('#_countThumbsUp'+seq).html(m_countThumbsUp);
			}
		});
		
	} 
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

var currentSeq = -1;

function autoSearch(seq){
	currentSeq = seq;
	text = $('#_reply'+seq).val();
	r = $('#_reply'+seq).prop("selectionEnd");	// 커서 위치
	s = text.substring(0, r);	// 커서위치까지의 문자열
			
	enter_pos = s.lastIndexOf('\n');
	space_pos = s.lastIndexOf(' ');
	hash_pos = s.lastIndexOf('#');
	at_pos = s.lastIndexOf('@');
	end_pos = -1;
	keyword = '';
	
	// 커서로부터 무엇이 더 가까운지
	if(enter_pos>hash_pos && enter_pos>at_pos){			// enter, 리턴
		$('#searchDiv'+seq).prevAll().remove();
		return;
	}
	if(space_pos>hash_pos && space_pos>at_pos){			// space, 리턴
		$('#searchDiv'+seq).prevAll().remove();
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
			
	/* if(keyword==''||keyword=='#'||keyword=='@'||e.which==13){	
		$('#searchDiv'+seq).prevAll().remove();
		return;
	} */
	if(keyword.length <= 1){
		$('#searchDiv'+seq).prevAll().remove();
		return;
	}
			
	$.ajax({
		type:"POST",
		url:"writesearch.do",
		data:"keyword="+keyword,
		async:true,
		success: function(data){
			$('#searchDiv'+seq).prevAll().remove();
			$('#searchDiv'+seq).before(data);
		}
	});
	
}

function changeKeyword(searchKeyword){
	$('#searchDiv'+currentSeq).prevAll().remove();
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
	$('#_reply'+currentSeq).val(replacedStr);
	/* $('#_content').focus(); */
	$('#_reply'+currentSeq).selectRange(cursorIndex+1, cursorIndex+1);
}

$('._jacrq2').click(function(){
	$('#searchDiv'+currentSeq).prevAll().remove();
});

</script> 