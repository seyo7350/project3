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
									<c:if test="${follow_connect_cnt eq 1 }">
										<input type="button" class="btn btn-primary" style="background-color: green;" value="팔로잉" />
									</c:if>
									
									<c:if test="${login.seq ne follow.seq && follow_connect_cnt ne 1}">
										<input type="button" class="_aj7mu _2hpcs _kenyh _o0442" value="팔로우" id="send_follow_btn" onclick="sendFollow(${follow.seq})" />
									</c:if>
									
									<c:if test="${login.id eq follow.id }">
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
	alert(follow_seq);
	$.ajax({
		type:"POST",
		url:"sendFollow.do",
		async:true,
		data:"follow="+follow_seq+"&member_seq=${login.seq}",
		success: function(follow_check){
			if(follow_check==2){
				$('#send_follow_btn').attr({'class':'_aj7mu _r4e4p _kenyh _o0442','value':'팔로우 취소','id':'cancle_follow_btn','onclick':'cancleFollow('+follow_seq+')'});				
			}else{ 
				alert('팔로우 실패');
			}
		}
	});
}

function cancleFollow(follow_seq){
	alert('팔로우 취소');
	$.ajax({
		type:"POST",
		url:"cancleFollow.do",
		async:true,
		data:"follow="+follow_seq+"&member_seq=${login.seq}",
		success: function(follow_check){
			/* alert(follow_check); */

			if(follow_check==true){
				$('#cancle_follow_btn').attr({'class':'_aj7mu _2hpcs _kenyh _o0442','value':'팔로우','id':'send_follow_btn','onclick':'sendFollow('+follow_seq+')'});				
			}else{ 
				alert('팔로우 취소 실패');
			}
		}
	});
}
</script>