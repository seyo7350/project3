<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<fmt:requestEncoding value="utf-8"/>

<main class="_6ltyr _rnpza" role="main">
	<section class="_jx516">
		<div class="_qj7yb">
			<!-- article이 여러개 들어가야할 자리 -->
		</div>
	</section>
</main>

<script type="text/javascript">
$(document).ready(function(){
 	$.ajax({
		type:"POST",
		url:"./regi.do",
		async:true,
		success: function(data) {
			$('._qj7yb').html(data);
		}
	});
</script>