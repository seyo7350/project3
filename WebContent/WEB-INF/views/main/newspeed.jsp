<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<fmt:requestEncoding value="utf-8"/>

<main class="_6ltyr _rnpza" role="main">
	<section class="_jx516">
		<div class="_qj7yb">
			<div id="_last">
			</div>
		</div>
	</section>
</main>


<script  type="text/javascript">

var index = 0;

window.onload = function(){
	$.ajax({
			type:"POST",
	   		url:"./article.do",
	   		data:"index="+index,
	   		async:true,
	   		success: function(data) {
	   			$('#_last').append(data);
	   			index++;
	   		}
		});
};

$(window).bind('scroll', function(){
	if ($(window).scrollTop() == $(document).height() - $(window).height()){
		add();
	}	
});

function add(){
	$(window).unbind('scroll');
	$.ajax({
		type:"POST",
   		url:"./article.do",
   		data:"index="+index,
   		async:true,
   		success: function(data) {
   			alert(index);
   			$('#_last').append(data);
   			index++;
   			$(window).bind('scroll', function(){
   				if ($(window).scrollTop() == $(document).height() - $(window).height()){
   					add();
   				}	
   			});
   		}
	});
};

</script> 