<%@page import="java.util.Collections"%>
<%@page import="sist.co.model.PeedDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!--실제내용 시작  -->
         
         <main class="_6ltyr _rnpza" role="main">
         <article class="_42elc">
         <c:if test="${login.seq eq mem.seq}">
            <header class=" _o2h6b">
               <div class="_o0ohn">
                  <div class="_8gpiy _r43r5">
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
               </div>
               <div class="_de9bg">
						<div class="_8mm5v">
						   	<h1 class="_i572c notranslate" >${mem.id }&nbsp;&nbsp;</h1>
		                    <input type="hidden" value="${mem.seq }" id="seq">	
    						<a class=" _t2uoe" href="edit.do?seq=${mem.seq}">
							  <span	class="_5ji7m _e616g">
							    <button	class="_aj7mu _2hpcs _kenyh _o0442">프로필 편집</button></span></a>
							<div class="_38y5t">
								<button class="_fcwm8 coreSpriteEllipsis _soakw" data-toggle="modal" data-target="#myModal2">옵션</button>
							</div>
						</div>
						
					<c:if test="${mem.homepage == null}">
				        <div class="_bugdy">
							<h2 class="_79dar">${mem.name }</h2>&nbsp;&nbsp;&nbsp;
							<a class="_56pjv" href="#none" target="_blank"></a>
						</div>
				    </c:if>
				
					<c:if test="${mem.homepage != null}">
				        <div class="_bugdy">
							<h2 class="_79dar">${mem.name }</h2>&nbsp;&nbsp;&nbsp;
							<a class="_56pjv" href="http://${mem.homepage }" target="_blank">${mem.homepage }</a>
						</div>
				    </c:if>
               
            
            <ul class=" _i305n">
               <li class=" _7gq8o">
                     게시물 
                     <span class="_bkw5z _kjym7">${peedCount }</span>개
               </li>
               <li class=" _7gq8o"><a class="_s53mj _13vpi"  href="javacript:;" id="popbutton">
                     팔로워
                     <span class="_bkw5z _kjym7" title="0">${followerCount }</span>명
               </a></li>
               <li class=" _7gq8o"><a class="_s53mj _13vpi" href="javacript:;" id="popbutton2">
                     팔로우
                     <span class="_bkw5z _kjym7"  title="0">${followCount }</span>명
               </a></li>
            </ul>
            </div>
            </header>
            </c:if>
            
            <!--다른사람 프로필  -->
            <c:if test="${login.seq ne mem.seq}">
				<header class=" _o2h6b">
					<div class="_o0ohn">
						<div class="_8gpiy _r43r5">
                       <button class="_jzgri" title="프로필 사진 변경" >
						  <c:if test="${mem.profile_image eq null}">
						     <img alt="이미지 오류" class="_g5pg0" src="image/not.jpg">
					      </c:if>
					      <c:if test="${mem.profile_image ne null}">
						      <img alt="이미지 오류" class="_g5pg0"	src="${file }">
					      </c:if>
					   </button>
							<form enctype="multipart/form-data" >
								<input type="file" accept="image/*" class="_loq3v" id="file">
							</form>
						</div>
					</div>
					<div class="_de9bg">
						<div class="_8mm5v">
							<h1 class="_i572c notranslate" >${mem.id }&nbsp;&nbsp;</h1>
		                    <form id="Form" method="post">
		                        <input type="hidden" value="${mem.seq }" name="follow" id="follow">
		                        <input type="hidden" value="${mem.id }" name="sid" id="sid">
		                        <input type="hidden" value="${follow }" name="connection" id="connection">
		                        <input type="hidden" value="${login.seq }" name="member_seq" id="member_seq">
		                        <input type="hidden" value="${login.id }" name="id" id="id">
		                     </form>
		                      <span	class="_5ji7m _e616g">
		                        <c:if test="${2 eq follow }">
  		                           <button class="_aj7mu _r4e4p _kenyh _o0442" onclick="DelFollow()">팔로우 삭제</button>
		                        </c:if>
		                        <c:if test="${2 ne follow }">
		                          <button class="_aj7mu _2hpcs _kenyh _o0442" onclick="IntFollow()">팔로우</button>
		                        </c:if>	
		                      </span>
   
							<div class="_38y5t">
								<button class="_fcwm8 coreSpriteEllipsis _soakw" data-toggle="modal" data-target="#myModal2">옵션</button>
							</div>
						</div>
						
					<c:if test="${mem.homepage == null}">
				        <div class="_bugdy">
							<h2 class="_79dar">${mem.name }</h2>&nbsp;&nbsp;&nbsp;
							<a class="_56pjv" href="#none" target="_blank"></a>
						</div>
				    </c:if>
				
					<c:if test="${mem.homepage != null}">
				        <div class="_bugdy">
							<h2 class="_79dar">${mem.name }</h2>&nbsp;&nbsp;&nbsp;
							<a class="_56pjv" href="http://${mem.homepage }" target="_blank">${mem.homepage }</a>
						</div>
				    </c:if>
			 <ul class=" _i305n">
               <li class=" _7gq8o"><a class="_s53mj _13vpi">
                     게시물 
                     <span class="_bkw5z _kjym7">${peedCount }</span>개
               </a></li>
               <li class=" _7gq8o"><a class="_s53mj _13vpi" href="javacript:;" id="popbutton">
                     팔로워
                     <span class="_bkw5z _kjym7" title="0">${followerCount }</span>명
               </a></li>
               <li class=" _7gq8o"><a class="_s53mj _13vpi" href="javacript:;" id="popbutton2">
                     팔로우
                     <span class="_bkw5z _kjym7">${followCount }</span>명
               </a></li>
            </ul>
            </div>
            </header>
            </c:if>
			
            <div>
               <c:if test="${empty peedList }">
                  <div class="_nljxa">
                     <div class="_myci9">
                        <a class="_8mlbc _vbtk2 _t5r8b"   href="#none" id="img1"> 
                            <div class="_22yr2">
                               <div class="_jjzlb">
                                  등록된 게시물이 없습니다.
                               </div>
                            </div>
                        </a>
                     </div>
                     
                     <div class="_t5r8b _81g1f"></div>
                     <div class="_t5r8b _81g1f"></div>
                  </div>
               </c:if>
                <c:if test="${not empty peedList }">
          		<div class="_nljxa">
          		
          		<c:set var="peedlists" value="${peedList }" />
          		<%-- <%
          			List<PeedDTO> r_peedlists = (List<PeedDTO>)pageContext.getAttribute("peedlists");
          			Collections.reverse(r_peedlists);
          			pageContext.setAttribute("peedlists", r_peedlists);
          		%> --%>
          		
                   <c:forEach items="${peedlists }" var="peed" varStatus="vs">
                   	<c:if test="${vs.count%3 eq 1 }">
             			<div class="_myci9">
                   	</c:if>
                           <a class="_8mlbc _vbtk2 _t5r8b" href="#none"> 
                               <div class="_22yr2">
                                  <div class="_jjzlb">
                                     <img alt="이미지 없음${vs.index }" class="_icyx7" src="upload/${peed.image }" onclick="openModal5(${vs.index})" />
                                  </div>
                               </div>
                               
                               <!-- <div class="_sppa1">
	                               	<ul class="_m9z3c">
	                               		<li class="_sjq6j _ajqft">
	                               			<span class="_4aw90 _soakw coreSpriteHeartSmall"></span>
	                               			<span>6</span>"개"
	                               		</li>
	                               		<li class="_qq2if">
	                               			<span class="_fuu7c _soakw coreSpriteSpeechBubbleSmall"></span>
	                               			<span>2</span>"개"
	                               		</li>
	                               	</ul>
                               </div> -->
                            </a>
                       <c:if test="${vs.last && (vs.count%3 eq 1)}">
                        	<div class="_t5r8b _81g1f"></div>
          				<div class="_t5r8b _81g1f"></div>
                       </c:if> 
                         
                       <c:if test="${vs.last && (vs.count%3 eq 2)}">
                        	<div class="_t5r8b _81g1f"></div>
                       </c:if>      
                       
                       <c:if test="${vs.count%3 eq 0 }">
                       	</div>
                       </c:if> 	
                   </c:forEach>
                </c:if>
             </div>
         </article>
         </main>

<!--실제내용 끝  -->

<script src="//instagramstatic-a.akamaihd.net/h1/bundles/ko_KR_Commons.js/efd84397bd12.js" type="text/javascript" crossorigin="anonymous"></script>
<script src="//instagramstatic-a.akamaihd.net/h1/bundles/ko_KR_FeedPage.js/3cb0f1947120.js" type="text/javascript" crossorigin="anonymous"></script>


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
  
<!-- Modal2 -->
  <div class="modal modal-center" id="myModal2" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
            <li class="_bt6iq"><a href="logout.do"><button class="_4y3e3">로그아웃</button></a></li>
            <c:if test="${login.seq ne mem.seq}">
            <li class="_bt6iq"><button class="_4y3e3" onclick="singo()">사용자 신고</button></li>
            </c:if>
            <li class="_bt6iq"><button class="_4y3e3" data-dismiss="modal" style="border: none;">닫기</button></li></ul>
        </div>
      </div>
    </div>
    </div>
  </div>

   <!-- 버튼 -->
   <!-- <button type="button" class="btn btn-primary btn-lg" id="popbutton">
     팔로우
   </button> -->
   
   
   
   <!-- 모달 팝업3 -->
   <div class="modal" id="myModal3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
   <div data-reactroot class="_a1rcs _ea084">
   
      <div class="_quk42">
         <div class="_7629j">
            <div class="_hj98d">
                              
            </div>
         </div>
      </div>
      
     <div class="modal-dialog">
        
        <div class="modal-content">
         <div class="modal-header">
         <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true" style="float: right;">×</span><span class="sr-only">Close</span></button>
         <h4 class="modal-title" id="myModalLabel">팔로워</h4>
         </div>
         <div class="modal-body" id="modal3">
         <!-- <ul class="_539vh _4j13h">
            <li class="_cx1ua">
               <div class="_6jvgy">
                  <div class="_9tu8m">
                     <a class="_5lote _pfo25 _vbtk2" href="#none" style="width: 30px; height: 30px;"><img class="_a012k" src="123.jpg" alt="이미지 없음"></a> 사진 링크
                     <div class="_mmgca"> 아이디, 이름
                        <div class="_gzjax"><a class="_4zhc5 notranslate _j71fh" title="아이디">아이디</a></div> 아이디
                        <div class="_2uju6">이름</div> 이름
                     </div>                  
                     <div class="_72gdz">
                        <span class="_e616g">
                           <button type="button" class="btn btn-primary" style="background-color: green;">팔로잉</button>
                           <button class="_aj7mu _2hpcs _95tat _o0442">팔로잉</button>
                        </span>
                     </div>
                  </div>
               </div> 
            </li>
         </ul> -->
         </div>
       </div>
     </div>
    </div>
   </div>
   
   <!-- 모달 팝업4 -->

   <div class="modal" id="myModal4" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
   <div data-reactroot class="_a1rcs _ea084">
   
   <div class="_quk42">
      <div class="_7629j">
         <div class="_hj98d">
                           
         </div>
      </div>
   </div>
      
     <div class="modal-dialog">
       <div class="modal-content">
         <div class="modal-header">
      <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true" style="float: right;">×</span><span class="sr-only">Close</span></button>
      <h4 class="modal-title" id="myModalLabel">팔로잉</h4>
         </div>
         <div class="modal-body" id="modal4">
         <!-- <ul class="_539vh _4j13h" id="contentList">
            <li class="_cx1ua">
            <div class="_6jvgy">
               <div class="_9tu8m">
                     <a class="_5lote _pfo25 _vbtk2" href="#none" style="width: 30px; height: 30px;"><img class="_a012k" src="123.jpg" alt="이미지 없음"></a> 사진 링크
                     <div class="_mmgca"> 아이디, 이름
                        <div class="_gzjax"><a class="_4zhc5 notranslate _j71fh" title="아이디">아이디</a></div> 아이디
                        <div class="_2uju6">이름</div> 이름
                     </div>
               
                  <div class="_72gdz">
                     <span class="_e616g">
                        <button type="button" class="btn btn-primary">팔로우</button>
                        <button class="_aj7mu _2hpcs _95tat _o0442">팔로우</button>
                     </span>
                  </div>
               </div>
            </div> 
            </li>
         </ul> -->
         </div>
         
         <div class="modal-footer">
         </div>
       </div>
     </div>
   </div>
   </div>
   
   
   <!-- modal5 -->
   <div class="modal" id="myModal5" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
      <div data-reactroot class="_a1rcs _ea084">
      <div class="_quk42">
            <div class="_7629j">
               <div class="_hj98d">
                                 
               </div>
            </div>
         </div>
         <div class="_7629j">
            <div class="_hj98d" id="hj98d">
               <a class="_qdy3e coreSpriteLeftPaginationArrow" href="javascript:alert('11');" role="button">이전</a>
               <a class="_de018 coreSpriteRightPaginationArrow" href="#" role="button">다음</a>
            </div>
         </div>         
         <div class="_g1ax7">
            <div class="_n3cp9 _d20no">
               <article class="_djxz1 _j5hrx" id="modal5">
                  <!-- <header class="_s6yvg">
                     <a class="_5lote _pss4f _vbtk2">
                        <img class="_a012k" src="https://scontent.cdninstagram.com/t51.2885-19/s150x150/12519560_1521410768167162_695266703_a.jpg">
                     </a>
                     <div class="_f95g7">
                        <a class="_4zhc5 notranslate _ook48" title="anhwichan" href="#">anhwichan</a>
                        <a class="_kul9p _rnlnu" title="페넬로페" href="#">페넬로페</a>
                     </div>
                     <span class="_fbms8 _e616g">
                        <button class="_aj7mu _2hpcs _kenyh _o0442">
                           팔로우
                        </button>
                     </span>
                  </header>
                  <div>
                     <div class="_22yr2 _e0mru">
                     
                        <div class="_jjzlb" style="padding-bottom: 100%; height: 600px; width: 600px">
                           <img alt="기다림이 즐거워🙄💕케이크 먹고싶다는 한마디에 뚝!딱! 항상 고맙지만 오늘은 이렇게 딱 표현해야지,잘먹을게~ 고마워 힛... #케이크#선물#고마워#맛있게#먹겠습니다" class="_icyx7" src="image/like.PNG">
                        </div>
                        <div class="_ovg3g"></div>
                     </div>
                  </div>
                  <div class="_es1du _rgrbt">
                     <section class="_tfkbw _d39wz">
                        <div class="_iuf51 _oajsw">
                           <span class="_tf9x3">좋아요 <span>57</span>개</span>
                        </div>
                        <a class="_rmo1e" href="#">
                           <time class="_379kp" datetime="2016-08-29T16:26:48.000Z" title="2016년 8월 30일">1주</time>
                        </a>
                     </section>
                     <ul class="_mo9iw _123ym">
                        <li class="_nk46a">
                           <h1>
                              <a class="_4zhc5 notranslate _iqaka" title="selimee_e" href="#">selimee_e</a>
                              <span>
                              기다림이 즐거워🙄💕
                              <br>
                              케이크 먹고싶다는 한마디에 뚝!딱!
                              <br>
                              <a href="#">#케이크</a>
                              </span>
                           </h1>
                        </li>
                        <li class="_nk46a">
                           <h1>
                              <a class="_4zhc5 notranslate _iqaka" title="yumyumiku2" href="#">yumyumiku2</a>
                              <span>
                              친하게 지내도 될까요^^?? 인친해요~😃
                              </span>
                           </h1>
                        </li>
                     </ul>
                     <section class="_jveic _rhgel">
                        <a class="_ebwb5 _1tv0k" href="#" role="button" aria-disabled="false">
                           <span class="_soakw coreSpriteHeartOpen">좋아요</span>
                        </a>
                        <form class="_k3t69">
                           <input type="text" class="_7uiwk _qy55y" aria-label="Add a comment…" placeholder="Add a comment…" value>
                        </form>
                        <button class="_9q0pi coreSpriteEllipsis _soakw">옵션 더 보기</button>
                     </section>
                  </div>    -->      
               </article>
            </div>
         </div>
         <button class="_3eajp">닫기</button> 
                   
      </div>
   </div>
   
</div><!-- 모달 -->

  
<script type="text/javascript">

/* var $layerPopupObj = $('#myModa4');
var left = ( $(window).scrollLeft() + ($(window).width() - $layerPopupObj.width()) / 2 );
var top = ( $(window).scrollTop() + ($(window).height() - $layerPopupObj.height()) / 2 );
$layerPopupObj.css({'left':left,'top':top, 'position':'absolute'});
$('body').css('position','relative').append($layerPopupObj); */

// follower
$(function(){
    $('#popbutton').click(function(){

       $.ajax({
          type:"POST",
          url:"follower.do",
          async:true,
          data:"id=${mem.id}&seq=${mem.seq}",
          success: function(data){
             /* alert(data); */
             $('#modal3').html(data);
             $('#myModal3').modal();
          }
       });
    })
    
});

// follow
$(function(){
    $('#popbutton2').click(function(){
       
       $.ajax({
          type:"POST",
          url:"follow.do",
          async:true,
          data:"id=${mem.id}&seq=${mem.seq}",
          success: function(data){
            /*  alert(data); */
             $('#modal4').html(data);
             $('#myModal4').modal();
              
          }
       });
       
    })
    
});

// detail
var end = '${fn:length(peedList)}'-1;
var peed_index = -1;

function openModal5(peed_idx){
   peed_index = peed_idx;
      /* alert(peed_index); */
      $.ajax({
         type:"POST",
         url:"detail.do",
         async:true,
         data:"member_seq=${login.seq}&peed_index="+peed_index,
         success: function(data){
        	 
             var s = '';
             if(peed_index==0 && end==0){
            	 s = '';
             }else if(peed_index == 0){
                 s = '<a class="_de018 coreSpriteRightPaginationArrow" id="_right" href="#none" role="button">다음</a>';
                 
             }else if(peed_index == end){
                 s = '<a class="_qdy3e coreSpriteLeftPaginationArrow" id="_left" href="#none" role="button">이전</a>';
             }else{
                 /* alert(peed_index); */
                 s = '<a class="_qdy3e coreSpriteLeftPaginationArrow" id="_left" href="#none" role="button">이전</a>';
                 s += '<a class="_de018 coreSpriteRightPaginationArrow" id="_right" href="#none" role="button">다음</a>';
             }
             
             $('#hj98d').html(s);///////////////////////////////////////////////////////
            
            $('#modal5').html(data);
            
            $('#myModal5').modal();
         }
      });
      
   
};

$(document).ready(function(){
    $('#hj98d').on('click', '.coreSpriteRightPaginationArrow', function(){
        peed_index++;
        /* alert(peed_index); */
        if(peed_index == end){
            s = '<a class="_qdy3e coreSpriteLeftPaginationArrow" id="_left" href="#none" role="button">이전</a>';
        }else{
            s = '<a class="_qdy3e coreSpriteLeftPaginationArrow" id="_left" href="#none" role="button">이전</a>';
            s += '<a class="_de018 coreSpriteRightPaginationArrow" id="_right" href="#none" role="button">다음</a>';
        }
        $('#hj98d').html(s);
        
        $.ajax({
            type:"POST",
            url:"detail.do",
            async:true,
            data:"id=${login.id}&seq=${login.seq}&peed_index="+peed_index,
            success: function(data) {
                $('#modal5').html(data);
                $('#myModal5').modal();
            }
            
        });
    });
    
    $('#hj98d').on('click', '.coreSpriteLeftPaginationArrow', function(){
        peed_index--;
        /* alert(peed_index); */
        if(peed_index == 0){
            s = '<a class="_de018 coreSpriteRightPaginationArrow" id="_right" href="#none" role="button">다음</a>';
            
        }else{
            s = '<a class="_qdy3e coreSpriteLeftPaginationArrow" id="_left" href="#none" role="button">이전</a>';
            s += '<a class="_de018 coreSpriteRightPaginationArrow" id="_right" href="#none" role="button">다음</a>';
        }
        $('#hj98d').html(s);
        
        $.ajax({
            type:"POST",
            url:"detail.do",
            async:true,
            data:"id=${login.id}&seq=${login.seq}&peed_index="+peed_index,
            success: function(data) {
                $('#modal5').html(data);
                $('#myModal5').modal();
            }
            
        });
    });
});

/* function showModal4(데이터) {
   
    $("#myModalLabel").html("ajax를 통해 얻어온 id에 해당하는 값");
    $("#contentList").html("ajax를 통해 얻어온 id에 해당하는 값");
   
   $('#myModal4').modal('show');
} */

$(function(){
    $('#pImage_12').click(function(){
        $('#myModal5').modal();
    })
    
});

$(document).ready(function(){
  	 $('._quk42').click(function(){
      
      $('#myModal5').modal('hide');
      /* window.location.reload(true); */ 
   });
   
   $('._3eajp').click(function(){
      $('#myModal5').modal('hide');
      /* window.location.reload(true); */
   });
});
 
$(document).ready(function(){
   $('._quk42').click(function(){
       /* alert(this.className); */
      $('#myModal').modal('hide');
   });
   
   $('._quk42').click(function(){
       /* alert(this.className); */
      $('#myModal2').modal('hide');
   });
   
   $('._quk42').click(function(){
       /* alert(this.className); */
      $('#myModal3').modal('hide');
   });
   
   $('._quk42').click(function(){
       /* alert(this.className); */
      $('#myModal4').modal('hide');
   });
   
   
   /* $('._3eajp').click(function(){
      
      $('#myModal').modal('hide');
   }); */
});

/* function wrapWindowByMask(){
    //화면의 높이와 너비를 구한다.
    var maskHeight = $(document).height();  
    var maskWidth = $(window).width();  

    //마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
    $('#mask').css({'width':maskWidth,'height':maskHeight});  

    //애니메이션 효과
    $('#mask').fadeIn(1000);      
    $('#mask').fadeTo("slow",0.8);    
}   
   
$(document).ready(function(){   
   //닫기 버튼을 눌렀을 때
   $('.window .close').click(function (e) {  
       //링크 기본동작은 작동하지 않도록 한다.
       e.preventDefault();  
       $('#mask, .window').hide();  
   });       
   
   //검은 막을 눌렀을 때
   $('#mask').click(function () {  
       $(this).hide();  
       $('.window').hide();  
   });
}); */

	

$('#delete').click(function(){
   alert("프로필 사진을 기본사진으로 변경합니다.");
   location.href='imageDelAF.do?seq=${mem.seq}';
});

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

function DelFollow(){
   alert("팔로우를 취소합니다.");
   $('#Form').attr({'target':'_self', "action":"delFollow.do"}).submit();
}

function IntFollow(){
   alert("팔로우를 신청합니다.");
   if($("#connection").val() == 0){
      $('#Form').attr({'target':'_self', "action":"IntFollow.do"}).submit();
   }else{
      $('#Form').attr({'target':'_self', "action":"updateFollow.do"}).submit()
   }
   
}

function singo(){
   alert("사칭 계정이나 부적절한 컨텐츠를 올린 사용자를 신고합니다. \n신고가 사실이 아닐경우 본인에게 이용에 불이익이 올 수 있습니다.");
   $('#Form').attr({'target':'_self', "action":"singo.do"}).submit();
}
</script>
  
  