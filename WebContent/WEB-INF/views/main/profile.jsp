<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

    



<!--실제내용 시작  -->

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
					<li class=" _7gq8o"><span class="_s53mj _13vpi" href="#none" id="popbutton2">
							팔로워
							<span class="_bkw5z _kjym7" title="0">0</span>명
					</span></li>
					<li class=" _7gq8o"><a class="_s53mj _13vpi" href="#none" id="popbutton">
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
  
  
  <div class="container">

	<!-- 버튼 -->
	<!-- <button type="button" class="btn btn-primary btn-lg" id="popbutton">
	  팔로우
	</button> -->
	
	
	
	<!-- 모달 팝업3 -->
	<div class="modal" id="myModal3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog">	 
	     <div class="modal-content">
	      <div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true" style="float: right;">×</span><span class="sr-only">Close</span></button>
			<h4 class="modal-title" id="myModalLabel">팔로잉</h4>
	      </div>
	      <div class="modal-body">
			<ul class="_539vh _4j13h">
				<li class="_cx1ua">
				<div class="_6jvgy">
					<div class="_9tu8m">
							<a class="_5lote _pfo25 _vbtk2" href="#none" style="width: 30px; height: 30px;"><img class="_a012k" src="123.jpg" alt="이미지 없음"></a> <!-- 사진 링크 -->
							<div class="_mmgca"> <!-- 아이디, 이름 -->
								<div class="_gzjax"><a class="_4zhc5 notranslate _j71fh" title="아이디">아이디</a></div> <!-- 아이디 -->
								<div class="_2uju6">이름</div> <!-- 이름-->
							</div>
					
						<div class="_72gdz">
							<span class="_e616g">
								<button type="button" class="btn btn-primary" style="background-color: green;">팔로잉</button>
								<!-- <button class="_aj7mu _2hpcs _95tat _o0442">팔로잉</button> -->
							</span>
						</div>
					</div>
				</div> 
				</li>
			</ul>
	      </div>
	      
	      <!-- <div class="modal-footer">
	      </div> -->
	    </div>
	  </div>
	</div>
	
	<!-- 모달 팝업4 -->
	<div class="modal" id="myModal4" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true" style="float: right;">×</span><span class="sr-only">Close</span></button>
		<h4 class="modal-title" id="myModalLabel">팔로워</h4>
	      </div>
	      <div class="modal-body">
			<ul class="_539vh _4j13h">
				<li class="_cx1ua">
				<div class="_6jvgy">
					<div class="_9tu8m">
							<a class="_5lote _pfo25 _vbtk2" href="#none" style="width: 30px; height: 30px;"><img class="_a012k" src="123.jpg" alt="이미지 없음"></a> <!-- 사진 링크 -->
							<div class="_mmgca"> <!-- 아이디, 이름 -->
								<div class="_gzjax"><a class="_4zhc5 notranslate _j71fh" title="아이디">아이디</a></div> <!-- 아이디 -->
								<div class="_2uju6">이름</div> <!-- 이름-->
							</div>
					
						<div class="_72gdz">
							<span class="_e616g">
								<button type="button" class="btn btn-primary">팔로우</button>
								<!-- <button class="_aj7mu _2hpcs _95tat _o0442">팔로우</button> -->
							</span>
						</div>
					</div>
				</div> 
				</li>
			</ul>
	      </div>
	      
	      <!-- <div class="modal-footer">
	      </div> -->
	    </div>
	  </div>
	</div>

<!--컨테이너  -->
</div>


  
  <script type="text/javascript">
$(function(){
    $('#popbutton').click(function(){
        $('#myModal3').modal();
    })
    
});

$(function(){
    $('#popbutton2').click(function(){
        $('#myModal4').modal();
    })
    
});
</script>
  
  