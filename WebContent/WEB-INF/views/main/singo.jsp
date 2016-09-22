<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


<main class="_6ltyr _rnpza" role="main">
  <article class="_42elc">
    <header class=" _o2h6b">
      <div class="_de9bg">
	   
		  <h1 class="_i572c notranslate" >신고하기</h1><br><br>
		  <form id="Form" method="post">
              <div><!-- 내용 --> 
                    내용<br>
                     <input type="hidden" value="${seq }" id="seq" name="seq">
<textarea name="content1" cols="30" rows="4" style="width:75%; resize:none" readonly="readonly">
신고자 시퀀스: ${seq }  신고자 id: ${id }
신고 시퀀스: ${sseq }    신고 id: ${sid }</textarea>
                    <textarea name="content2" cols="120" rows="12" style="width:75%; resize:none" placeholder="신고 사유를 적어주세요" class="form-control"></textarea>
              </div>
          </form>
		  
    	    <br><br>
            <div class="_9w2xs">
					<aside class="_891mt">
					<label></label></aside>
					<div class="_lxlnj">
						<div class="_c7q5m">
							<span class="_e616g">
							       <input type="button" class="_aj7mu _2hpcs _kenyh _o0442" value="신고하기" onclick="gosingo();">
							  </span>&nbsp;&nbsp;&nbsp;&nbsp;
							  <span class="_e616g">
							      <input type="button" class="_aj7mu _2hpcs _kenyh _o0442" value="돌아가기" onclick="goback();">
							  </span>
						</div>
					</div>
				</div>
      </div>
    </header>
  </article>
</main>

<script>
function goback(){
	location.href='profile.do?seq=${sseq }';
}

function gosingo(){
	alert("신고가 사실이 아닐경우 본인에게 이용에 불이익이 올 수 있습니다.");
	$('#Form').attr({'target':'_self', "action":"singoAF.do"}).submit();
}

</script>
