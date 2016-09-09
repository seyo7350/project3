<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<fmt:requestEncoding value="utf-8"/>

<main class="_6ltyr _rnpza" role="main">
	<article class="_60k3m">
		<div class="_p8ymb">
			<div class="_nvyyp">
				<h1 class="_du7bh _soakw coreSpriteLoggedOutWordmark">Instagram</h1>
				<div class="_56wku">
					<form class="_3bqd5" method="POST">
						<h2 class="_9qbcz">친구들의 사진과 동영상을 보려면 가입하세요.</h2>
						<div class="_djahe _i31zu">
							<input type="text" class="_kp5f7 _qy55y" aria-describedby aria-label="이메일" aria-required="true" autocapitalize="off" autocorrect="off" maxlength="30" name="email" id="_email" placeholder="이메일">
						</div>
						<div class="_djahe _i31zu">
							<input type="text" class="_kp5f7 _qy55y" aria-describedby aria-label="성명" aria-required="true" autocapitalize="off" autocorrect="off" maxlength="30" name="fullName" id="_fullName" placeholder="성명">
						</div>
						<div class="_djahe _i31zu">
							<input type="text" class="_kp5f7 _qy55y" aria-describedby aria-label="사용자 이름" aria-required="true" autocapitalize="off" autocorrect="off" maxlength="30" name="username" id="_username" placeholder="사용자 이름">
						</div>
						<div class="_djahe _i31zu">
							<input type="password" class="_kp5f7 _qy55y" aria-describedby aria-label="비밀번호" aria-required="true" autocapitalize="off" autocorrect="off" maxlength="30" name="password" id="_password" placeholder="비밀번호">
						</div>
						<div>
							<span class="_1on88 _e616g">
								<button type="button" class="_aj7mu _taytv _ki5uo _o0442" id="btnJoin">
									가입
								</button>
							</span>				
						</div>
						<p class="_rpioj">
							가입하면 Instagram의
							<a class="_m4qul" href="#">약관</a>
							 및 
							<a class="_m4qul" href="#">개인정보취급방침</a>
							에 동의하게 됩니다.
						</p>
					</form>
				</div>		
			</div>
			<div class="_nvyyp">
				<p class="_dyp7q">
					계정이 있으신가요? 
					<a class="_fcn8k" href="#">로그인</a>
				</p>
			</div>
			<div class="_m8ogu">
				<p class="_gnsgq">앱을 다운로드하세요.</p>
				<div class="_rwl8x">
					<a class="_okmo7" href="#">
						<img class="_t5w1b" src="//instagramstatic-a.akamaihd.net/h1/images/appstore-install-badges/badge_ios_korean-ko.png/a5b7c639e096.png">
					</a>
					<a class="_okmo7" href="#">
						<img class="_t5w1b" src="//instagramstatic-a.akamaihd.net/h1/images/appstore-install-badges/korean_get.png/0e2ed99efd27.png">
					</a>
				</div>
			</div>
		</div>
	</article>
</main>

<script type="text/javascript">
$('._fcn8k').click(function(){
	/* $.ajax({
		type:"POST",
		url:"./login.do",
		async:true,
		success: function(data) {
			alert(data);
			$('._60k3m').html(data);
		}
	}); */
	location.href='index.do';
}); 

$('#btnJoin').click(function(){
	if($('#_email').val() == ""){
		alert('이메일을 정확히 입력해주세요.');
		$('#_email').focus();
	}else if($('#_fullName').val() == ""){
		alert('이름을 정확히 입력해주세요.');
		$('#_fullName').focus();
	}else if($('#_username').val() == ""){
		alert('사용자 이름을 정확히 입력해주세요.');
		$('#_username').focus();
	}else if($('#_password').val() == ""){
		alert('비밀번호를 정확히 입력해주세요.');
		$('#_password').focus();
	}else{
	
	
		var email = $('#_email').val();
		var fullname = $('#_fullName').val();
		var username = $('#_username').val();
		var password = $('#_password').val();
		
		goJoin(email, fullname, username, password);
		
	}
	
});

function goJoin(email, fullname, username, password){
	$.ajax({
		type:"POST",
		url:"regiAf.do",
		async:true,
		data:"email="+email+"&name="+fullname+"&id="+username+"&pwd="+password,
		success: function(ok){
			alert(ok.message);
			if(ok.message=='회원가입 성공'){
				alert('회원 가입 성공');
				location.href='index.do';
			}else{
				alert('회원가입 실패');
				$('#_email').val("");
				$('#_fullName').val("");
				$('#_username').val("");
				$('#_password').val("");
			}
		}
	});
	
};


</script>