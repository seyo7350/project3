<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<fmt:requestEncoding value="utf-8"/>

<article class="_60k3m">
	<div class="_p8ymb">
		<div class="_nvyyp">
			<h1 class="_du7bh _soakw coreSpriteLoggedOutWordmark">Instagram</h1>
			<div class="_uikn3">
				<form class="_rwf8p" method="POST">
					<div class="_ccek6 _i31zu">
						<input type="text" class="_kp5f7 _qy55y" aria-describedby aria-label="사용자 이름" aria-required="true" autocapitalize="off" autocorrect="off" maxlength="30" name="username" placeholder="사용자 이름">
					</div>
					<div class="_ccek6 _i31zu">
						<input type="password" class="_kp5f7 _qy55y" aria-describedby aria-label="비밀번호" aria-required="true" autocapitalize="off" autocorrect="off" maxlength="30" name="password" placeholder="비밀번호">
						<div class="_j4ox0">
							<a class="_19gtn" href="#">비밀번호를 잊으셨나요?</a>
						</div>
					</div>
					<span class="_rz1lq _e616g">
						<button class="_aj7mu _taytv _ki5uo _o0442">
							로그인
						</button>
					</span>
				</form>
			</div>
		</div>
		<div class="_nvyyp">
			<p class="_dyp7q">
				계정이 없으신가요?
				<a class="_fcn8k" href="#">가입하기</a>
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

<script type="text/javascript">
$('._fcn8k').click(function(){
	$.ajax({
		type:"POST",
		url:"./regi.do",
		async:true,
		success: function(data) {
			$('._60k3m').html(data);
		}
	});
});

$('._aj7mu').click(function(){
	$('._rwf8p').attr({'target':'_self', 'action':'newspeed.do'}).submit();
});
</script>