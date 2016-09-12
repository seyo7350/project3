<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<fmt:requestEncoding value="utf-8"/>

<!-- <input type="file" onchange="previewImage(this,'previewId')">
<div id='previewId'
    style='width: 50px; height: 50px; color: black; font-size: 9pt; border: 2px solid black; position: absolute; left: 300px; top: 200px;'>
</div> -->

<main class="_6ltyr _rnpza" role="main">
	<section class="_jx516">
		<div class="_qj7yb">
			<div>
				<form class="_8ab8k _j5hrx _pieko" id="_frmForm" method="post" enctype="multipart/form-data">
					<header class="_s6yvg">
						<a class="_5lote _pss4f _vbtk2" href="/아이디/" style="width: 30px; height: 30px;">
							<img class="_a012k" src="주소">
						</a>
						<div class="_f95g7">
							<a class="_4zhc5 notranslate _ook48" title="아이디" href="/아이디 프로필/">${login.id}</a>
							<input type="hidden" name="member_seq" value="${login.seq}">
							<!-- <a class="_ku19p _rnlnu" title="장소태그명" href="지도로 이동하는곳">장소명</a> -->
						</div>
						<div class="filebox">				
							<label for="ff">사진</label>
							<input type="file" id="ff" name="fileload" onchange="previewImage(this,'previewId');">
						</div>
						<!-- <a class="_ljyfo _8snt5" href="/시간에 게시물 상세히 보기 페이지/">
								<time class="_379kp" datetime="날짜 .시간" title="날짜">몇시간전에 올렸는지</time>
						</a> -->
					</header><!-- 게시글 상단 메뉴  끝-->
					<div>
						<div class="_22yr2 _e0mru">
							<div class="_jjzlb" style="padding-buttom: 100%">
								<!-- <img alt="content내용을 보여줌" class="_icyx7" id="pImage_52" src="이미지 경로" style> -->
							</div>
							<!-- react - empthy : 3308 -->
							<div class="_ovg3g _icyx7" id="previewId">
								<!-- <font style="margin-top: 5px; font-size: 40px; text-align: right; margin-right: 30px;">↑</font>
								<font style="margin-top: 10px; font-size: 30px; text-align: right; margin-right: 30px;">버튼을 클릭하여 사진을 올려주세요</font> -->						
							</div>
						</div><!-- 이미지 부분 끝 -->
					</div>
						<div class="_es1du _rgrbt">							
							<ul class="_mo9iw _pnraw">
								<li class="_nk46a">
									<h1>
										<!-- <a class="_4zhc5 notranslate _iqaka" title="어아다" href="/게시물 아이디 프로필페이지주소/">게시물 쓴 사람 아이디</a> -->
										<span title="수정됨">
											<textarea style="resize: none;" rows="5" cols="25" name="content" class="_7uiwk _qy55y" aria-label="Add a content..." placeholder="Add a content..."></textarea>
											<!-- <button class="_9q0pi coreSpriteEllipsis _soakw">옵션더보기</button> -->
											<button type="button" class="wbtn" id="_btnAdd">글 쓰기</button>
										</span>
									</h1>
								</li>
							</ul>
							<!-- <section class="_jveic _dsvln">
								<a class="_ebwb5 _1tv0k" href="#" role="button" aria-disbled="false">
									<span class="_soakw coreSpriteHeartOpen">좋아요</span>
								</a>
								<div class="_k3t69">
									<input type="text" class="_7uiwk _qy55y" aria-label="Add a comment..." placeholder="Add a comment..." value="">
								</div>
								<button class="_9q0pi coreSpriteEllipsis _soakw">옵션더보기</button>
							</section> -->
						</div>
				</form>
				
			</div>
		</div>
	</section>
</main>

<script type="text/javascript">

	function previewImage(targetObj, previewId) {		
		var preview = document.getElementById(previewId); //div id   
		var ua = window.navigator.userAgent;

		if (ua.indexOf("MSIE") > -1) {//ie일때

			targetObj.select();

			try {
				var src = document.selection.createRange().text; // get file full path 
				var ie_preview_error = document
						.getElementById("ie_preview_error_" + previewId);

				if (ie_preview_error) {
					preview.removeChild(ie_preview_error); //error가 있으면 delete
				}

				var img = document.getElementById(previewId); //이미지가 뿌려질 곳 

				img.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='"
						+ src + "', sizingMethod='scale')";
			} catch (e) {
				if (!document.getElementById("ie_preview_error_" + previewId)) {
					var info = document.createElement("<p>");
					info.id = "ie_preview_error_" + previewId;
					info.innerHTML = "a";
					preview.insertBefore(info, null);
				}
			}
		} else { //ie가 아닐때
			var files = targetObj.files;
			for (var i = 0; i < files.length; i++) {

				var file = files[i];

				var imageType = /image.*/; //이미지 파일일경우만.. 뿌려준다.
				if (!file.type.match(imageType))
					continue;

				var prevImg = document.getElementById("prev_" + previewId); //이전에 미리보기가 있다면 삭제
				if (prevImg) {
					preview.removeChild(prevImg);
				}

				var img = document.createElement("img");
				img.id = "prev_" + previewId;
				img.classList.add("obj");
				img.file = file;
				img.style.width = '600px'; //기본설정된 div의 안에 뿌려지는 효과를 주기 위해서 div크기와 같은 크기를 지정해준다.
				img.style.height = '600px';

				preview.appendChild(img);

				if (window.FileReader) { // FireFox, Chrome, Opera 확인.
					var reader = new FileReader();
					reader.onloadend = (function(aImg) {
						return function(e) {
							aImg.src = e.target.result;
						};
					})(img);
					reader.readAsDataURL(file);
				} else { // safari is not supported FileReader
					//alert('not supported FileReader');
					if (!document.getElementById("sfr_preview_error_"
							+ previewId)) {
						var info = document.createElement("p");
						info.id = "sfr_preview_error_" + previewId;
						info.innerHTML = "not supported FileReader";
						preview.insertBefore(info, null);
					}
				}
			}
		}
	}
	
	$('#_btnAdd').click(function(){
		$('#_frmForm').attr({'target':'_self', "action":"writeAf.do"}).submit();
	});
</script>