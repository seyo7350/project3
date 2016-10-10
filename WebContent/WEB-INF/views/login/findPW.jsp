<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<script src="http://code.jquery.com/jquery-1.11.1.js"></script>

      <input type="text" value="${msg }" style="text-align: center; font-size: 30px; color: black; font-weight: bold;">
      <main class="_6ltyr _rnpza" role="main">
		<div class="_40h7m">
			<article class="_e5cd3">
			<form class="_cmoxu" action="findPWAF.do"  method="post" name ="form" onsubmit="return checkIt()">
					<div class="_9w2xs">
					<aside class="_891mt">
					<label for="pepName">비밀번호 찾기</label></aside>
					</div>
				
				<div class="_9w2xs">
					<aside class="_891mt">
					<label for="pepName">사용자 이름</label></aside>
					<div class="_lxlnj">
						<input type="text" class="_cm95b _qy55y" aria-required="false"
							id="id" name="id" onkeyup="noSpaceForm(this)" placeholder="사용자 이름(ID)을 입력해주세요">
					</div>
				</div>
				
				<div class="_9w2xs">
					<aside class="_891mt">
					<label for="pepName">성명</label></aside>
					<div class="_lxlnj">
						<input type="text" class="_cm95b _qy55y" aria-required="false"
							id="name" name="name" onkeyup="noSpaceForm(this)" placeholder="성명(Name)을 입력해주세요">
					</div>
				</div>
		
				<div class="_9w2xs">
					<aside class="_891mt">
					<label></label></aside>
					<div class="_lxlnj">
						<div class="_c7q5m">
							<span class="_e616g">
							    <input type="hidden" id="pwd" name="pwd" value="${t_pwd }">
							   <button class="_aj7mu _2hpcs _kenyh _o0442" id="btn">제출</button>
							   </span>
							    &nbsp;&nbsp;&nbsp;<input type="button" class="_aj7mu _2hpcs _kenyh _o0442"  onclick="goback()" value="돌아가기">
						</div>
					</div>
				</div>
			</form>
			</article>
		</div>
		</main>

		<script>
		  function noSpaceForm(obj) { // 공백사용못하게
			    var str_space = /\s/;  // 공백체크
			    if(str_space.exec(obj.value)) { //공백 체크
			        alert("해당 항목에는 공백을 사용할수 없습니다.");
			        obj.focus();
			        obj.value = obj.value.replace(' ',''); // 공백제거
			        return false;
			    }
			}
		  
		  function goback() {
			  location.href='index.do';
		  }
		  
		  
		  function checkIt() {
				var user = document.form;
				
				if (user.id.value == '') {
					alert('사용자 이름을 입력하세요');
					user.id.focus();
					return false;
				}
				
				if (user.name.value == '') {
					alert('성명을 입력하세요!');
					user.name.focus();
					return false;
				}

			   alert("비밀번호 찾기를 시작합니다. 고객님이 입력하신 정보가 올바른 경우 회원가입 시 입력한 이메일 걔정으로 임시 비밀번호를 보내드립니다.");
			}
		  

		</script>