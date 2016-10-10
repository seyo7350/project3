<%@page import="java.util.Date"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<fmt:requestEncoding value="utf-8" />

<div id="cc">
	<div class="_4i862"></div>
	<div class="_f8scm"></div>
	<div class="_qfu95"></div>
	<div class="_57q29">

		<c:if test="${not empty noticeList}">
		<c:forEach items="${noticeList}" var="notice" varStatus="vs">	
			<ul>
				<c:if test="${notice.what ne 2}">
				<li class="_mkiio _8kllr"><div class="_6haw6">
						<div class="_lr5co">
						<a href="profile.do?id=${notice.who_id}"style="width: 34px; height: 34px;">
									<c:if test="${notice.who_profile eq null}">
										<img class="_q6fzq"  src="image/not.jpg" alt="profile">
									</c:if> 
									<c:if test="${notice.who_profile ne null}">
										<img class="_q6fzq" src="upload/${notice.who_profile }" alt="profile">
									</c:if>
								</a> 
							</div> 
					</div>
					<div class="_auspy">
						<a class="_4zhc5 notranslate _gpve0"  href="profile.do?id=${notice.who_id}">${notice.who_id}</a>
						
						<c:if test="${notice.what eq 0}">
						님이 댓글을 남겼습니다. <!-- <span>댓글내용</span> -->
						</c:if>
						
						<c:if test="${notice.what eq 1}">
						님이 좋아요를 했습니다. 
						</c:if>
						<time class="_gaey8 _379kp">
                           <span class="_timestamp" date="<fmt:formatDate value="${notice.regi_date}" pattern="yyyy-MM-dd HH:mm:ss"/>"></span>
                       </time>
					</div>
					
		           <div class="_1hskn">
		              <a class="_vbtk2" href="#none">
		                  <img class="_p57su" src="upload/${notice.peed_image }">
		              </a>
	               </div>			
	              </li>
				</c:if>
				
				    <c:if test="${notice.what eq 2}">
					<li class="_mkiio _8kllr"><div class="_6haw6">
						<div class="_lr5co">
  					    <a href="profile.do?id=${notice.who_id}"style="width: 34px; height: 34px;">
									<c:if test="${notice.who_profile eq null}">
										<img class="_q6fzq" src="image/not.jpg" alt="profile">
									</c:if> 
									<c:if test="${notice.who_profile ne null}">
										<img class="_q6fzq" src="upload/${notice.who_profile }" alt="profile">
									</c:if>
								</a>
							</div>
					</div>
					<div class="_auspy">
						<a class="_4zhc5 notranslate _gpve0"  href="profile.do?id=${notice.who_id}">${notice.who_id}</a>
						님이 팔로우를 했습니다.
						<time class="_gaey8 _379kp">
                            <span class="_timestamp" date="<fmt:formatDate value="${notice.regi_date}" pattern="yyyy-MM-dd HH:mm:ss"/>"></span>
                       </time>
					</div>
				</li>
				</c:if>
			</ul>
			</c:forEach>
		</c:if>

		<c:if test="${empty noticeList}">
			<div class="_tcw2n">
				<div class="_5t8re">알림 창</div>
				<div class="_iz1bp">누군가 회원님의 피드에 댓글을 남기거나 좋아요를 누르면 또는 팔로우 신청시 여기에 표시됩니다.</div>
			</div>
		</c:if>
	</div>
</div>




