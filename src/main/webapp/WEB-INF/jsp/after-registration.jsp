<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
	
	<fmt:setLocale value="${cookie.locale.value}" />
	<fmt:setBundle basename="localization.locale" var="locale"/>
	<fmt:message bundle="${locale}" key="locale.page.title.registration" var="page_title" />
	<fmt:message bundle="${locale}" key="locale.reg.after.button" var="locale_reg_after_button" />
	<fmt:message bundle="${locale}" key="locale.reg.after.message.not.ok" var="message_not_ok" />
	<fmt:message bundle="${locale}" key="locale.reg.after.message.ok" var="message_ok" />
	
	<title>${page_title}</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="apple-touch-icon" sizes="57x57"
	href='<c:url value="/favicon/apple-icon-57x57.png"/>'>
	<link rel="apple-touch-icon" sizes="60x60"
		href="<c:url value="/favicon/apple-icon-60x60.png"/>">
	<link rel="apple-touch-icon" sizes="72x72"
		href="<c:url value="/favicon/apple-icon-72x72.png"/>">
	<link rel="apple-touch-icon" sizes="76x76"
		href="<c:url value="/favicon/apple-icon-76x76.png"/>">
	<link rel="apple-touch-icon" sizes="114x114"
		href="<c:url value="/favicon/apple-icon-114x114.png"/>">
	<link rel="apple-touch-icon" sizes="120x120"
		href="<c:url value="/favicon/apple-icon-120x120.png"/>">
	<link rel="apple-touch-icon" sizes="144x144"
		href="<c:url value="/favicon/apple-icon-144x144.png"/>">
	<link rel="apple-touch-icon" sizes="152x152"
		href="<c:url value="/favicon/apple-icon-152x152.png"/>">
	<link rel="apple-touch-icon" sizes="180x180"
		href="<c:url value="/favicon/apple-icon-180x180.png"/>">
	<link rel="icon" type="image/png" sizes="192x192"
		href="<c:url value="/favicon/android-icon-192x192.png"/>">
	<link rel="icon" type="image/png" sizes="32x32"
		href="<c:url value="/favicon/favicon-32x32.png"/>">
	<link rel="icon" type="image/png" sizes="96x96"
		href="<c:url value="/favicon/favicon-96x96.png"/>">
	<link rel="icon" type="image/png" sizes="16x16"
		href="<c:url value="/favicon/favicon-16x16.png"/>">
	<link rel="manifest" href="<c:url value="/favicon/manifest.json"/>">
	<meta name="msapplication-TileColor" content="#ffffff">
	<meta name="msapplication-TileImage"
		content="<c:url value="/avicon/ms-icon-144x144.png"/>f">
	<meta name="theme-color" content="#ffffff">
	
	<link rel="stylesheet" href="<c:url value="/bootstrap/css/bootstrap.min.css"/>">
	<link rel="stylesheet" href="<c:url value="/css/main.css"/>">
</head>

<body>
	<c:import url="/WEB-INF/jsp/header.jsp"/>
	<main class="container-fluid">
		<div class="row">
			<div class="col-6 offset-3">
					<c:choose>
						<c:when test="${requestScope.registered}">
							<div>
								<c:out value="${message_ok }"></c:out>
							</div>
						</c:when>
						<c:otherwise>
							<div>
								<c:out value="${message_not_ok }"></c:out>
							</div>
						</c:otherwise>
					</c:choose>
				<div><a class="btn btn-primary" href='<c:url value="/main"/>' role="button"><c:out value="${locale_reg_after_button }"/></a></div>
			</div>
		</div>
	</main>
	<c:import url="/WEB-INF/jsp/footer.jsp"/>
	
	<script src="<c:url value="/js/jquery-3.2.1.min.js"/>"></script>
	<script src="<c:url value="/bootstrap/js/bootstrap.bundle.js"/>"></script>
</body>
</html>