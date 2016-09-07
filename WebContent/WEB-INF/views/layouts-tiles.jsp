<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<fmt:requestEncoding value="utf-8"/>

<!DOCTYPE html>
<html lang="ko">
<head>
	<tiles:insertAttribute name="header"/>
</head>
<body>
	<span id="react-root">
		<section data-reactroot class="_8f735">
			<main class="_6ltyr _rnpza" role="main">
				<tiles:insertAttribute name="main"/>
			</main>
			<tiles:insertAttribute name="nav"/>
			<footer class="_oofbn" role="contentinfo">
				<tiles:insertAttribute name="footer"/>
			</footer>
		</section>
	</span>
</body>
</html>