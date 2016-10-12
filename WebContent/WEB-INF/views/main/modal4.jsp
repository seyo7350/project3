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
								<a class="_5lote _pfo25 _vbtk2" href="profile.do?id=${follower.id}" >
						
						<c:if test="${mem.profile_image eq null}">
								<img class="_a012k" src="image/not.jpg" alt="이미지 없음"> 
						</c:if> 
						
						<c:if test="${mem.profile_image ne null}">
								<img class="_a012k" src="upload/${mem.profile_image}" alt="profile">
						</c:if>
						</a>
								<div class="_mmgca"><!--  아이디, 이름 -->
									<div class="_gzjax"><a class="_4zhc5 notranslate _j71fh" title="아이디" href="profile.do?id=${follow.id }">${follow.id }</a></div>
									<div class="_2uju6">${follow.name}</div>
								</div>
						
							<div class="_72gdz">
								<span class="_e616g">
									<c:if test="${login.id ne follow.id}">
										<c:if test="${follow.follow_connect eq 1 }">
											<input type="button" class="_aj7mu _r4e4p _kenyh _o0442" value="팔로잉" onclick="myFollowDel(${follow.follow});" id="_myFollowDel${follow.follow}"/>
										</c:if>
										
										<c:if test="${follow.follow_connect ne 1}">
											<input type="button" class="_aj7mu _2hpcs _kenyh _o0442" value="팔로우" id="send_follow_btn${follow.follow}" onclick="sendFollow(${follow.follow})" />
										</c:if>
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

<script>
function sendFollow(follow_seq) {
	$.ajax({
		type:"POST",
		url:"sendFollow.do",
		async:true,
		data:"follow="+follow_seq+"&member_seq=${login.seq}",
		success: function(follow_check){
			if(follow_check==2){
				$('#send_follow_btn'+follow_seq).attr({'class':'_aj7mu _r4e4p _kenyh _o0442','value':'팔로잉','id':'cancle_follow_btn'+follow_seq,'onclick':'cancleFollow('+follow_seq+')'});
				follow_cnt++;
				$('#follow_count').html(follow_cnt);
			}else{ 
				alert('팔로우 실패');
			}
		}
	});
}

function cancleFollow(follow_seq){
	$.ajax({
		type:"POST",
		url:"cancleFollow.do",
		async:true,
		data:"follow="+follow_seq+"&member_seq=${login.seq}",
		success: function(follow_check){
			/* alert(follow_check); */
			if(follow_check==true){
				$('#cancle_follow_btn'+follow_seq).attr({'class':'_aj7mu _2hpcs _kenyh _o0442','value':'팔로우','id':'send_follow_btn'+follow_seq,'onclick':'sendFollow('+follow_seq+')'});				
			}else{ 
				alert('팔로우 취소 실패');
			}
		}
	});
}

function myFollowDel(follow_seq) {
	$.ajax({
		type:"POST",
		url:"cancleFollow.do",
		async:true,
		data:"follow="+follow_seq+"&member_seq=${login.seq}",
		success: function(follow_check){
			if(follow_check==true){
				$('#_myFollowDel'+follow_seq).attr({'class':'_aj7mu _2hpcs _kenyh _o0442','value':'팔로우','id':'send_follow_btn'+follow_seq,'onclick':'sendFollow('+follow_seq+')'});				
				follow_cnt--;
				$('#follow_count').html(follow_cnt);
			}else{ 
				alert('팔로우 취소 실패');
			}
		}
	});
}
</script>