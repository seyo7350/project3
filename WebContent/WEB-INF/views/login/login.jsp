<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<fmt:requestEncoding value="utf-8"/>

<main class="_6ltyr _rnpza" role="main">
	<article class="_60k3m">
		<div class="_p8ymb">
			<div class="_nvyyp">
				<h1 class="_du7bh _soakw coreSpriteLoggedOutWordmark">Instagram</h1>
				<div class="_uikn3">
					<form class="_rwf8p" method="post" id="_frmForm">
						<div class="_ccek6 _i31zu">
							<input type="text" class="_kp5f7 _qy55y" aria-describedby aria-label="사용자 이름" aria-required="true" autocapitalize="off" autocorrect="off" maxlength="30" name="username" id="_username" placeholder="사용자 이름">
						</div>
						<div class="_ccek6 _i31zu">
							<input type="password" class="_kp5f7 _qy55y" aria-describedby aria-label="비밀번호" aria-required="true" autocapitalize="off" autocorrect="off" maxlength="30" name="password" id="_password" placeholder="비밀번호">
							<div class="_j4ox0">
								<a class="_19gtn" href="#">비밀번호를 잊으셨나요?</a>
							</div>
						</div>
						<span class="_rz1lq _e616g">
							<button type="button" class="_aj7mu _taytv _ki5uo _o0442" id="btnLogin">
								로그인
							</button>
						</span>
					</form>
				</div>
			</div>
			<div class="_nvyyp">
				<p class="_dyp7q">
					계정이 없으신가요?
					<a class="_fcn8k" href="#" id="a_join">가입하기</a>
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
$('#a_join').click(function(){
 	$.ajax({
		type:"POST",
		url:"./regi.do",
		async:true,
		success: function(data) {
			$('._60k3m').html(data);
		}
	});
	
});

$('#btnLogin').click(function(){
	if($('#_username').val() == '') {
		alert('아이디를 입력해 주십시오');
	}else if($('#_password').val() == ''){
		alert('비밀번호를 입력해 주십시오');
	}else{
		/* $('#_frmForm').attr('target', '_self').submit(); */
			var id = $('#_username').val();
			var pwd = $('#_password').val();
			
			$.ajax({
				type:"POST",
				url:"loginAf.do",
				async:true,
				data:"id="+id+"&pwd="+pwd,
				success: function(check){
					if(check.message == '로그인 성공'){
						alert('로그인 성공');
						location.href='newspeed.do';
					}else{
						alert('로그인 실패');
						location.href='index.do';
					}
				}
			});
	}
	
});

$('#_username').keypress(function(){
	if(event.which == '13'){
		event.preventDefault();
		$('#_password').focus();
	}
});

$('#_password').keypress(function(){
	if(event.which == '13'){
		event.preventDefault();
		$('#btnLogin').click();
	}
});

//$('._rwf8p').attr({'target':'_self', 'action':'newspeed.do'}).submit();
</script>