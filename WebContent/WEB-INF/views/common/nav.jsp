<%@ page contentType="text/html; charset=UTF-8"%>

<nav class="_onabe _5z3y6" role="navigation">
	<div class="_fjpuc _sq03j">
		<div class="_6v8vp">
			<div class="_df358">
				<a class="_1b8in _soakw coreSpriteDesktopNavLogoAndWordmark" href="newspeed.do">Instagram</a>
				<div class="_nhei4">
					<div class="_9pxkq _icv3j">
						<input type="text" class="_9x5sw _qy55y" placeholder="검색">
						<div class="_t1y9a _98hun">
							<div class="_etslc">
								<span class="_oqxv9 coreSpriteSearchIcon"></span>
								<span class="_9ea4j">검색</span>
							</div>						
						</div>						
					</div>
					<div class="_pq5am">
						<div class="_7smet" style="margin-right: 30px;">
							<a class="_soakw _vbtk2 coreSpriteDesktopNavExplore" href="write.do">새 피드</a>
						</div>
						<div class="_7smet" style="margin-right: 30px;">
							<a class="_im3et _soakw _vbtk2 coreSpriteDesktopNavActivity" href="#">활동 피드</a>
						</div>
						<div class="_7smet">
							<a class="_soakw _vbtk2 coreSpriteDesktopNavProfile" href="profile.do?seq=${login.seq}">프로필</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</nav>

<script type="text/javascript">
$(document).ready(function(){
	$('div').on('click', '._t1y9a', function(){
		/* alert('1'); */
		var s = '';
		s += '<input type="text" id="searchBox" class="_9x5sw _qy55y" placeholder="검색">';
		s += '<span class="_n3dw7 coreSpriteSearchIcon"></span>';
		s += '<div class="_jacrq"></div>';
		
		$('._9pxkq').html(s);
		$('#searchBox').focus();
				
		$('#searchBox').keyup(function(e){
			/* alert(e.keyCode); */
			var keyword = $('#searchBox').val();
			if(keyword==''||keyword=='#'||keyword=='@'){				
				$('div._jacrq').nextAll().remove();
			}
			else{
				$.ajax({
					type:"POST",
					url:"search.do",
					data:"keyword="+keyword,
					async:true,
					success: function(data){
						$('div._jacrq').nextAll().remove();
						$('div._jacrq').after(data);
					},beforeSend:function(){
						var spi = '';
						spi = '<div class="_pnwyi spiSpinner"></div>';
				        $('div._jacrq').after(spi);
				    }
				    /* ,complete:function(){			        
				        $('div.spiSpinner').remove();				 
				    } */
				});
			}		
		});
	});

	$('div').on('click', '._jacrq', function(){
		/* alert('2'); */
		var s = '';
		s += '<input type="text" class="_9x5sw _qy55y" placeholder="검색">';
		s += '<div class="_t1y9a _98hun">';
		s += '<div class="_etslc">';
		s += '<span class="_oqxv9 coreSpriteSearchIcon"></span>';
		s += '<span class="_9ea4j">검색</span>';
		s += '</div>';					
		s += '</div>';
		
		$('._9pxkq').html(s);
	});
	
	
});
</script>