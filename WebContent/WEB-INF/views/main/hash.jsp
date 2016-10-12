<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!--실제내용 시작  -->
         
         <main class="_6ltyr _rnpza" role="main">
         <article class="_3n7ri">
         	<header class="_1l53n">
         		<h1 class="_totu9">
         			#${searchDTO.top}
         		</h1>
         		<span class="_s53mj">
         			${searchDTO.bottom}
         		</span>
         	</header>
			
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
                   <c:forEach items="${peedList }" var="peed" varStatus="vs">
                   	<c:if test="${vs.count%3 eq 1 }">
             			<div class="_myci9">
                   	</c:if>
                           <a class="_8mlbc _vbtk2 _t5r8b"   href="#none"> 
                               <div class="_22yr2">
                                  <div class="_jjzlb">
                                     <img alt="이미지 없음${vs.index }" class="_icyx7" src="upload/${peed.image }" onclick="openModal5(${vs.index})" />
                                  </div>
                               </div>
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
         <h4 class="modal-title" id="myModalLabel">팔로잉</h4>
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
      <h4 class="modal-title" id="myModalLabel">팔로워</h4>
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
            <div class="_hj98d">
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
// detail
var end = '${fn:length(peedList)}'-1;
var peed_index = -1;
function openModal5(peed_idx){
   peed_index = peed_idx;

      $.ajax({
         type:"POST",
         url:"detail.do",
         async:true,
         data:"id=${login.id}&seq=${login.seq}&peed_index="+peed_index,
         success: function(data){
             var s = '';
             
             if(end != 0){
            	 if(peed_index == 0){
                     s = '<a class="_de018 coreSpriteRightPaginationArrow" id="_right" href="#none" role="button">다음</a>';
                     
                 }else if(peed_index == end){
                     s = '<a class="_qdy3e coreSpriteLeftPaginationArrow" id="_left" href="#none" role="button">이전</a>';
                 }else{
                     s = '<a class="_qdy3e coreSpriteLeftPaginationArrow" id="_left" href="#none" role="button">이전</a>';
                     s += '<a class="_de018 coreSpriteRightPaginationArrow" id="_right" href="#none" role="button">다음</a>';
                 }
             }
             
             
             $('._hj98d').html(s);
            
            $('#modal5').html(data);
            
            $('#myModal5').modal();
         }
      });
      
   
};

$(document).ready(function(){
    $('._hj98d').on('click', '.coreSpriteRightPaginationArrow', function(){
        peed_index++;
        if(peed_index == end){
            s = '<a class="_qdy3e coreSpriteLeftPaginationArrow" id="_left" href="#none" role="button">이전</a>';
        }else{
            s = '<a class="_qdy3e coreSpriteLeftPaginationArrow" id="_left" href="#none" role="button">이전</a>';
            s += '<a class="_de018 coreSpriteRightPaginationArrow" id="_right" href="#none" role="button">다음</a>';
        }
        $('._hj98d').html(s);
        
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
    
    $('._hj98d').on('click', '.coreSpriteLeftPaginationArrow', function(){
        peed_index--;
        if(peed_index == 0){
            s = '<a class="_de018 coreSpriteRightPaginationArrow" id="_right" href="#none" role="button">다음</a>';
            
        }else{
            s = '<a class="_qdy3e coreSpriteLeftPaginationArrow" id="_left" href="#none" role="button">이전</a>';
            s += '<a class="_de018 coreSpriteRightPaginationArrow" id="_right" href="#none" role="button">다음</a>';
        }
        $('._hj98d').html(s);
        
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

$(function(){
    $('#pImage_12').click(function(){
        $('#myModal5').modal();
    })
    
});

$(document).ready(function(){
   $('._quk42').click(function(){
       /* alert(this.className); */
      $('#myModal5').modal('hide');
   });
   
   $('._3eajp').click(function(){
      
      $('#myModal5').modal('hide');
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
</script>
  
  