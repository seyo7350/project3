<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
    

		<main class="_6ltyr _rnpza" role="main">
		<div class="_40h7m">
			<ul class="_g2cyn">
               <li><a class="_9hbou _siw05" href="edit.do?seq=${login.seq}">프로필 편집</a></li>
				<li><a class="_9hbou _g6sjr" href="pwdchange.do?seq=${login.seq}">비밀번호 변경</a></li>
			</ul>
			<article class="_e5cd3">
			<div class="_ljqf0">
				<div class="_8gpiy _f7gj7">
				<button class="_jzgri" title="프로필 사진 변경"  data-toggle="modal" data-target="#myModal">
					<c:if test="${mem.profile_image eq null}">
						     <img alt="이미지 오류" class="_g5pg0" src="image/not.jpg" id="blah">
					      </c:if>
					      <c:if test="${mem.profile_image ne null}">
						      <img alt="이미지 오류" class="_g5pg0" src="${file }"  id="blah" > 
					 </c:if>
					</button>
					<form id="_frmForm" method="post" enctype="multipart/form-data">
						<input type="hidden" name="seq" value="${mem.seq}">
						<input type="file" name="fileload"  id="image_file" size="60" class="_loq3v" onchange="previewUploadImg(this);"  accept="image/*" /> 
					</form>
				</div>
				<h1 class="_4s1oa">${mem.id }</h1>

			</div>

			<form class="_cmoxu" action="editAF.do" method="post" name ="form" onsubmit="return checkIt()">
				<div class="_9w2xs">
					<aside class="_891mt">
					<label for="pepName">성명</label></aside>
					
					<div class="_lxlnj">
						<input type="text" class="_cm95b _qy55y" aria-required="false"
							id="name" name="name" value="${mem.name }" onkeyup="noSpaceForm(this)">
					</div>
				</div>
				<div class="_9w2xs">
					<aside class="_891mt">
					<label for="pepUsername">사용자 이름</label></aside>
					<div class="_lxlnj">
						<input type="text" class="_cm95b _qy55y" aria-required="true" id="cid" name="cid" value="${mem.id }" onkeyup="noSpaceForm(this)"><br>
					    &nbsp;&nbsp;<span class="_e616g"><input type="button" class="_cm95b _qy55y _aj7mu _2hpcs _kenyh _o0442" value="중복 체크" onclick="chkMbId();"></span>
					    <input type="hidden" id="chkid" value="false">
					</div>
				</div>
				
				<c:if test="${mem.homepage == null}">
				<div class="_9w2xs">
					<aside class="_891mt">
					<label for="pepWebsite">웹사이트</label></aside>
					<div class="_lxlnj">
						<input type="text" class="_cm95b _qy55y" aria-required="false" 
						id="homepage" name="homepage"  value="" onkeyup="noSpaceForm(this)" 
						placeholder="http://를 제외한 웹페이지 주소를 입력하세요">
					</div>
				</div>
				</c:if>
				
				<c:if test="${mem.homepage != null}">
				<div class="_9w2xs">
					<aside class="_891mt">
					<label for="pepWebsite">웹사이트</label></aside>
					<div class="_lxlnj">
						<input type="text" class="_cm95b _qy55y" aria-required="false" 
						id="homepage" name="homepage"  value="${mem.homepage }" onkeyup="noSpaceForm(this)"
						placeholder="http://를 제외한 웹페이지 주소를 입력하세요">
					</div>
				</div>
				</c:if>
				
				<c:if test="${mem.intro != null}">
				<div class="_9w2xs">
					<aside class="_891mt">
					<label for="pepBio">소개</label></aside>
					<div class="_lxlnj">
						<textarea class="_9pfjt" id="intro" name="intro">${mem.intro }</textarea>
					</div>
				</div>
				</c:if>
				
				<c:if test="${mem.intro == null}">
				<div class="_9w2xs">
					<aside class="_891mt">
					<label for="pepBio">소개</label></aside>
					<div class="_lxlnj">
						<textarea class="_9pfjt" id="intro" name="intro"></textarea>
					</div>
				</div>
				</c:if>
				
				<div class="_9w2xs">
					<aside class="_891mt">
					<label for="pepEmail">이메일</label></aside>
					<div class="_lxlnj">
						<input type="text" class="_cm95b _qy55y" aria-required="false" id="email" name="email" value="${mem.email }" onkeyup="noSpaceForm(this)">
					     &nbsp;&nbsp;<span class="_e616g"><input type="button" class="_cm95b _qy55y _aj7mu _2hpcs _kenyh _o0442" value="중복 체크" onclick="chkMbEmail();"></span>
					    <input type="hidden" id="chkemail" value="false">
					</div>
				</div>

				<div class="_9w2xs">
					<aside class="_891mt">
					<label></label></aside>
					<div class="_lxlnj">
						<div class="_c7q5m">
							<span class="_e616g">
							   <input type="hidden" name="id" value="${mem.id}">
							   <input type="hidden" name="cemail" value="${mem.email}">
							   <input type="hidden" name="seq" value="${mem.seq}">
							   <input type="hidden" name="pwd" value="${mem.pwd}">
							   <button	class="_aj7mu _2hpcs _kenyh _o0442">수정하기</button>
							  </span>&nbsp;&nbsp;&nbsp;&nbsp;
							  <span class="_e616g">
							      <input type="button" class="_aj7mu _2hpcs _kenyh _o0442" value="리셋" onclick="reset();">
							  </span>
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
            <li class="_bt6iq"><button class="_4y3e3" id="delete">현재 사진 삭제</button></li>
            <li class="_bt6iq"><button class="_4y3e3" id="upload">사진 업로드</button></li>
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
  
  $(document).ready(function(){
	 if("${mem.seq }" != "${login.seq}"){
		 alert("다른사람의 정보를 수정하는 것은 불법입니다.");
		 history.go(-1);
		 }
});
  
  function noSpaceForm(obj) { // 공백사용못하게
	    var str_space = /\s/;  // 공백체크
	    if(str_space.exec(obj.value)) { //공백 체크
	        alert("해당 항목에는 공백을 사용할수 없습니다.");
	        obj.focus();
	        obj.value = obj.value.replace(' ',''); // 공백제거
	        return false;
	    }
	}
  
	function email_check(email) {
		var regex=/([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
	    return (email != '' && email != 'undefined' && regex.test(email) === true);
	}
	

	function checkIt() {
		var user = document.form;

		if (user.name.value == '') {
			alert('이름을 입력하세요!');
			user.name.focus();
			return false;
		}
		
		if (user.id.value == '') {
			alert('사용자 이름을 입력하세요');
			user.cid.focus();
			return false;
		}
		
		if (user.chkid.value == 'false' && user.cid.value != user.cid.value ) {
			alert('아이디 중복체크를 제대로 해주세요');
			user.cid.focus();
			return false;
		}
		
		if (user.email.value == '') {
			alert('이메일을 입력하세요');
			user.email.focus();
			return false;
		}
		
		if ( !email_check(user.email.value) ) {
			alert('올바른 이메일 형식이 아닙니다.');
			user.email.focus();
			return false;
		}
		
		if (user.chkemail.value == 'false' && user.email.value != user.cemail.value ) {
			alert('이메일 중복체크를 제대로 해주세요');
			user.email.focus();
			return false;
		}
		
	   alert("회원정보 수정을 시작합니다.");
	}
	
	function reset(){
		location.reload(true);
	}

	
	function chkMbId(){

		  $.ajax({
		   url : "chkMbId.do",
		   type : "post",
		   data : {
		    id : $("#cid").val()
		   },
		   dataType : "json",
		   success : function(data){
		       
			   if(data.resultMsg =="사용가능한 아이디입니다."){
				   alert(data.resultMsg);
				   $('input[id=chkid]').attr('value',true); 
			   }else{
				   alert(data.resultMsg);
				   $('input[id=chkid]').attr('value',false); 
			   }
			   
		   }
		        });
		 }
	
	function chkMbEmail(){
		  $.ajax({
		   url : "chkMbEmail.do",
		   type : "post",
		   data : {
		    email : $("#email").val()
		   },
		   dataType : "json",
		   success : function(data){
			   if(data.resultMsg =="사용가능한 이메일입니다."){
				   alert(data.resultMsg);
				   $('input[id=chkemail]').attr('value',true); 
			   }else{
				   alert(data.resultMsg);
				   $('input[id=chkemail]').attr('value',false); 
			   }
			   
		   }
		        });
		 }
	
	$('#upload').click(function(){
		document.all.image_file.click();
	});
	
	function reviewUploadImg(fileObj) {
		var filePath = fileObj.value;
		var fileName = filePath.substring(filePath.lastIndexOf("\\") + 1);
		var fileKind = fileName.split(".")[1];
		if (fileKind != "jpg" && fileKind != "gif" && fileKind != "png"
				&& fileKind != "JPG" && fileKind != "GIF" && fileKind != "PNG") {
			alert("jpg, gif, png 확장자를 가진 이미지 파일만 올려주세요.");
			document.getElementById("image_file").value = "";
			document.getElementById("image_file").select();
			document.selection.clear();
		}
	}

	$(function() {
		$("#image_file").on('change', function() {
			readURL(this);
			goUpload();
		});
	});

	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$('#blah').attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
	
	function goUpload(){
		$('#_frmForm').attr({'target':'_self', "action":"uploadAF.do"}).submit();
	}

	$('#delete').click(function(){
		alert("프로필 사진을 기본사진으로 변경합니다.");
		location.href='imageDelAF.do?seq=${mem.seq}';
	});

  </script>
  

