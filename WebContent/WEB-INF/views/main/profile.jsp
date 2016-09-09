<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
    

		<main class="_6ltyr _rnpza" role="main">
		<div class="_40h7m">
			<ul class="_g2cyn">
               <li><a class="_9hbou _siw05" href="edit.do">프로필 편집</a></li>
				<li><a class="_9hbou _g6sjr" href="pwdchange.do">비밀번호 변경</a></li>
			</ul>
			<article class="_e5cd3">
			<div class="_ljqf0">
				<div class="_8gpiy _f7gj7">
					<button class="_jzgri" title="프로필 사진 변경"  data-toggle="modal" data-target="#myModal">
						<img alt="프로필 사진 변경" class="_g5pg0" 	src="https://scontent.cdninstagram.com/t51.2885-19/s150x150/13768311_1786432404968210_1975323943_a.jpg">
					</button>
					<form enctype="multipart/form-data">
						<input type="file" accept="image/jpeg" class="_loq3v">
					</form>
				</div>
				<h1 class="_4s1oa">${login.id }</h1>
			</div>

			<form class="_cmoxu">
				<div class="_9w2xs">
					<aside class="_891mt">
					<label for="pepName">이름</label></aside>
					<div class="_lxlnj">
						<input type="text" class="_cm95b _qy55y" aria-required="false"
							id="pepName" value="${login.name }">
					</div>
				</div>
				<div class="_9w2xs">
					<aside class="_891mt">
					<label for="pepUsername">사용자 이름</label></aside>
					<div class="_lxlnj">
						<input type="text" class="_cm95b _qy55y" aria-required="true" id="pepUsername" value="${login.id }">
					</div>
				</div>
				<div class="_9w2xs">
					<aside class="_891mt">
					<label for="pepWebsite">웹사이트(비활성화)</label></aside>
					<div class="_lxlnj">
						<input type="text" class="_cm95b _qy55y" aria-required="false" id="pepWebsite" value="">
					</div>
				</div>
				<div class="_9w2xs">
					<aside class="_891mt">
					<label for="pepBio">웹사이트(비활성화)</label></aside>
					<div class="_lxlnj">
						<textarea class="_9pfjt" id="pepBio"></textarea>
					</div>
				</div>
				<div class="_9w2xs">
					<aside class="_891mt">
					<label></label></aside>
					<div class="_lxlnj">
						<div class="_sdis1">
							<h2 class="_bgfey">개인 정보</h2>
						</div>
					</div>
				</div>
				<div class="_9w2xs">
					<aside class="_891mt">
					<label for="pepEmail">이메일</label></aside>
					<div class="_lxlnj">
						<input type="text" class="_cm95b _qy55y" aria-required="false" id="pepEmail" value="${login.email }">
					</div>
				</div>
				<div class="_9w2xs">
					<aside class="_891mt">
					<label for="pepPhone Number">전화번호(비활성화)</label></aside>
					<div class="_lxlnj">
						<input type="text" class="_cm95b _qy55y" aria-required="false" id="pepPhone Number" value="">
					</div>
				</div>
				<div class="_9w2xs">
					<aside class="_891mt">
					<label for="pepGender">성별(비활성화)</label></aside>
					<div class="_lxlnj">
						<div class="_3m0ft">
							<span class="_fu55f _soakw coreSpriteChevronDownGrey"></span>
							<select class="_g6a4a _aifc3" id="pepGender">
							    <option	class="_ldrzi" value="1">남성</option>
								<option class="_ldrzi" value="2">여성</option>
								<option class="_ldrzi" value="3">선택 안 함</option></select>
						</div>
					</div>
				</div>
				<div class="_9w2xs">
					<aside class="_891mt">
					<label>비슷한 계정 추천(비활성화)</label></aside>
					<div class="_lxlnj">
						<div class="_pjb58">
							<input type="checkbox" class="_32vu6" id="pepChainingEnabled"
								value="on">
						</div>
						<label class="_q3o2l" for="pepChainingEnabled">
							<!-- react-text: 2947 -->팔로우할 만한 비슷한 계정을 추천할 때 회원님의 계정을 포함합니다.<!-- /react-text -->
							<a class="_6dth5"
							href="https://help.instagram.com/530450580417848" target="_blank">[?]</a>
						</label>
					</div>
				</div>
				<div class="_9w2xs">
					<aside class="_891mt">
					<label></label></aside>
					<div class="_lxlnj">
						<div class="_c7q5m">
							<span class="_e616g">
							   <button	class="_aj7mu _2hpcs _kenyh _o0442">제출</button></span>
							   <a	class="_5r95g" href="/accounts/remove/request/temporary/">
							   계정을	일시적으로 비활성화</a>
						</div>
					</div>
				</div>
			</form>
			</article>
		</div>
		</main>


<!-- Modal -->
<div>
  <div class="modal modal-center" id="myModal" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  	<div data-reactroot class="_a1rcs _ea084">
  	<div class="_quk42">
		<div class="_7629j">
			<div class="_hj98d">
									
			</div>
		</div>
	</div>
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-body">
          <ul class="_pdba0" role="menu">
            <li class="_gwvmk">프로필 사진 바꾸기</li>
            <li class="_bt6iq"><button class="_4y3e3">현재 사진 삭제</button></li>
            <li class="_bt6iq"><button class="_4y3e3">사진 업로드</button></li>
            <li class="_bt6iq"> <button class="_4y3e3" data-dismiss="modal" style="border: none;">닫기</button></li></ul>
        </div>
      </div>
    </div>
    </div>
  </div>
  </div>
  
  <script>
  $(document).ready(function(){
		$('._quk42').click(function(){
			 /* alert(this.className); */
			$('#myModal').modal('hide');
		});
  });
  </script>
