<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<fmt:setLocale value="${cookie.locale.value}" />
<fmt:setBundle basename="localization.locale" var="locale" />
<fmt:message bundle="${locale}" key="locale.footer.text" var="footer_text" />
<footer class="footer">
	<div class="container">
		<p class="text-center">
			<c:out value="${footer_text}" />
		</p>
	</div>
</footer>