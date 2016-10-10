<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
    

		<main class="_6ltyr _rnpza" role="main">
		<div class="_40h7m">
			<ul class="_g2cyn">
				<li><a class="_9hbou _g6sjr" href="edit.do?seq=${login.seq}">프로필 편집</a></li>
				<li><a class="_9hbou _siw05" href="pwdchange.do?seq=${login.seq}">비밀번호 변경</a></li>
			</ul>
			<article class="_e5cd3">
			<div class="_ljqf0">
				  <c:if test="${login.profile_image eq null}">
						     <img alt="이미지 오류" class="_8gpiy _f7gj7"" src="image/not.jpg">
					      </c:if>
					      <c:if test="${login.profile_image ne null}">
						      <img alt="이미지 오류" class="_8gpiy _f7gj7"" src="${file }"  > 
					 </c:if>
				<h1 class="_4s1oa">${login.id }</h1>
			</div>
			<form class="_tf7jx" action="pwdchangeAF.do" method="post" name ="form" onsubmit="return checkIt()">
				<div class="_9w2xs">
					<aside class="_891mt">
					<label for="cppNewPassword">기존 비밀번호</label></aside>
					<div class="_lxlnj">
						<input type="password" class="_1n8j5 _qy55y" aria-required="true"
							name="oldpwd" id="oldpwd" onkeyup="noSpaceForm(this)" maxlength='20'>
						<input type="hidden" class="_1n8j5 _qy55y" aria-required="true"
							name=Confirmoldpwd id="Confirmoldpwd" value="${login.pwd }">
					</div>
				</div>

				<div class="_9w2xs">
					<aside class="_891mt">
					<label for="cppNewPassword">새 비밀번호</label></aside>
					<div class="_lxlnj">
						<input type="password" class="_1n8j5 _qy55y" aria-required="true"
							name="pwd" id="pwd" onkeyup="noSpaceForm(this)" maxlength='20'>
					</div>
				</div>
				<div class="_9w2xs">
					<aside class="_891mt">
					<label for="cppConfirmPassword">새 비밀번호 확인</label></aside>
					<div class="_lxlnj">
						<input type="password" class="_1n8j5 _qy55y" aria-required="true"
							name="ConfirmPassword" id="ConfirmPassword"onkeyup="noSpaceForm(this)" maxlength='20'>
					</div>
				</div>
				<div class="_9w2xs">
					<aside class="_891mt">
					<label></label></aside>
					<div class="_lxlnj">
						<div class="_rlb47">
							<span class="_e616g">
							  <input type="hidden" name="seq" value="${login.seq}">
							  <input type="hidden" name="id" value="${login.id}">
							  <button class="_aj7mu _2hpcs _kenyh _o0442" id="button">비밀번호 변경</button></span>
						</div>
					</div>
				</div>
			</form>
			</article>
		</div>
		</main>

		
<script type="text/javascript">
function noSpaceForm(obj) { // 공백사용못하게
    var str_space = /\s/;  // 공백체크
    if(str_space.exec(obj.value)) { //공백 체크
        alert("해당 항목에는 공백을 사용할수 없습니다.");
        obj.focus();
        obj.value = obj.value.replace(' ',''); // 공백제거
        return false;
    }
}

function checkIt() {
	var user = document.form;
		
	if (user.oldpwd.value == "") {
		alert('기존 비밀번호를 입력하세요!');
		user.oldpwd.focus();
		return false;
	}
	
	if (user.oldpwd.value != user.Confirmoldpwd.value) {
		alert('기존 비밀번호가 입력하신 것과 다릅니다. 확인하세요!');
		user.oldpwd.focus();
		return false;
	}
	
	if (user.pwd.value == '') {
		alert('새 비밀번호를 입력하세요!');
		user.pwd.focus();
		return false;
	}
	
	if (user.ConfirmPassword.value == '') {
		alert('새 비밀번호 확인을 입력하세요!');
		user.ConfirmPassword.focus();
		return false;
	}
	
	if (user.pwd.value != user.ConfirmPassword.value) {
		alert('새 비밀번호와 새 비밀번호 확인이 다릅니다. 확인하세요!');
		user.ConfirmPassword.focus();
		return false;
	}

   alert("비밀번호 수정을 시작합니다.");
}

$("#oldpwd").keypress(function () {
	if(event.which =="13"){
		event.preventDefault();
		$("#pwd").focus();
	}
});

$("#pwd").keypress(function () {
	if(event.which =="13"){
		event.preventDefault();
		$("#ConfirmPassword").focus();
	}
});

$("#ConfirmPassword").keypress(function () {
	if(event.which =="13"){
		event.preventDefault();
		$("#button").click();
	}
});
</script>

