<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<fmt:requestEncoding value="utf-8"/>

<link rel="stylesheet" type="text/css" href="css/profile.css">     
 <!--모달  -->
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>



<!--실제내용 시작  -->
	<span id="react-root"><section data-reactroot="" class="_8f735">
			<main class="_6ltyr _rnpza" role="main">
			<article class="_42elc">
				<header class=" _o2h6b">
					<div class="_o0ohn">
						<div class="_8gpiy _r43r5">
							<button class="_jzgri" title="프로필 사진 변경"  data-toggle="modal" data-target="#myModal">
								<img alt="프로필 사진 변경" class="_g5pg0"
									src="https://scontent.cdninstagram.com/t51.2885-19/s150x150/13768311_1786432404968210_1975323943_a.jpg">
							</button>
							<form enctype="multipart/form-data">
								<input type="file" accept="image/jpeg" class="_loq3v">
							</form>
						</div>
					</div>
					<div class="_de9bg">
						<div class="_8mm5v">
							<h1 class="_i572c notranslate" title="leehy860930">leehy860930</h1>
							<div class="_38y5t">
								<button class="_fcwm8 coreSpriteEllipsis _soakw" data-toggle="modal" data-target="#myModal2">옵션</button>
							</div>
						</div>
						<div class="_bugdy">
							<h2 class="_79dar">leehy0930</h2>
							<a class="_56pjv" href="http://www.naver.com" target="_blank">www.naver.com</a>
						</div>
						<div class="_hcch2">
							<a class=" _t2uoe" href="edit.jsp">
							  <span	class="_5ji7m _e616g">
							    <button	class="_aj7mu _je2uz _kenyh _o0442">프로필 편집</button></span></a>
						</div>
					
				
				<ul class=" _i305n">
					<li class=" _7gq8o"><span class="_s53mj _13vpi">
							게시물 
							<span class="_bkw5z _kjym7">1</span>개
					</span></li>
					<li class=" _7gq8o"><span class="_s53mj _13vpi">
							팔로워
							<span class="_bkw5z _kjym7" title="0">0</span>명
					</span></li>
					<li class=" _7gq8o"><a class="_s53mj _13vpi" href="/leehy860930/following/">
							팔로우
							<span class="_bkw5z _kjym7">6</span>명
					</a></li>
				</ul>
				</div>
				</header>
				
				<div>
					<div class="_nljxa">
						<div class="_myci9">
						<!--그림1  -->
							<a class="_8mlbc _vbtk2 _t5r8b"	href="/p/BJ_zpWyhOlg/?taken-by=leehy860930">
							   <div class="_22yr2">
									<div class="_jjzlb">
										<img alt="고고" class="_icyx7" id="pImage_12"
											src="https://scontent.cdninstagram.com/t51.2885-15/s640x640/sh0.08/e35/14262823_149945558786032_1677948224_n.jpg?ig_cache_key=MTMzMzAxMTE1NzA2NTQ2MDA2NA%3D%3D.2"/>
									</div>
								</div></a>
								
						<!--그림2  -->
							<a class="_8mlbc _vbtk2 _t5r8b"	href="/p/BJ_zpWyhOlg/?taken-by=leehy860930">
							   <div class="_22yr2">
									<div class="_jjzlb">
										<img alt="고고" class="_icyx7" id="pImage_12"
											src="https://scontent.cdninstagram.com/t51.2885-15/s640x640/sh0.08/e35/14262823_149945558786032_1677948224_n.jpg?ig_cache_key=MTMzMzAxMTE1NzA2NTQ2MDA2NA%3D%3D.2"/>
									</div>
								</div></a>
								
							<div class="_t5r8b _81g1f"></div>
							<div class="_t5r8b _81g1f"></div>
						</div>
					</div>
				</div>
			</article>
			</main>
		</section>
	</span>

<!--실제내용 끝  -->

<script src="//instagramstatic-a.akamaihd.net/h1/bundles/ko_KR_Commons.js/efd84397bd12.js" type="text/javascript" crossorigin="anonymous"></script>
<script src="//instagramstatic-a.akamaihd.net/h1/bundles/ko_KR_FeedPage.js/3cb0f1947120.js" type="text/javascript" crossorigin="anonymous"></script>


<!-- Modal -->
  <div class="modal modal-center" id="myModal" role="dialog">
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
  
<!-- Modal2 -->
  <div class="modal modal-center" id="myModal2" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-body">
          <ul class="_pdba0" role="menu">
            <li class="_bt6iq"><button class="_4y3e3">로그아웃</button></li>
            <li class="_bt6iq"><button class="_4y3e3" data-dismiss="modal" style="border: none;">닫기</button></li></ul>
        </div>
      </div>
    </div>
  </div>

