<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>

	<fmt:setLocale value="${cookie.locale.value}" />
	<fmt:setBundle basename="localization.locale" var="locale" />
	<fmt:message bundle="${locale}" key="locale.page.title.reviews"	var="page_title"/>
	<fmt:message bundle="${locale}" key="locale.page.empty" var="no_reviews"/>
	<fmt:message bundle="${locale}" key="locale.reviews.added" var="review_added"/>
	<fmt:message bundle="${locale}" key="locale.reviews.user" var="review_user"/>
	<fmt:message bundle="${locale}" key="locale.user.profile.reviews.movie" var="reviewed_movie"/>
	<fmt:message bundle="${locale}" key="locale.reviews.delete" var="delete_review"/>
	
	<title>${page_title}</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="apple-touch-icon" sizes="57x57" href="favicon/apple-icon-57x57.png">
	<link rel="apple-touch-icon" sizes="60x60" href="favicon/apple-icon-60x60.png">
	<link rel="apple-touch-icon" sizes="72x72" href="favicon/apple-icon-72x72.png">
	<link rel="apple-touch-icon" sizes="76x76" href="favicon/apple-icon-76x76.png">
	<link rel="apple-touch-icon" sizes="114x114" href="favicon/apple-icon-114x114.png">
	<link rel="apple-touch-icon" sizes="120x120" href="favicon/apple-icon-120x120.png">
	<link rel="apple-touch-icon" sizes="144x144" href="favicon/apple-icon-144x144.png">
	<link rel="apple-touch-icon" sizes="152x152" href="favicon/apple-icon-152x152.png">
	<link rel="apple-touch-icon" sizes="180x180" href="favicon/apple-icon-180x180.png">
	<link rel="icon" type="image/png" sizes="192x192"  href="favicon/android-icon-192x192.png">
	<link rel="icon" type="image/png" sizes="32x32" href="favicon/favicon-32x32.png">
	<link rel="icon" type="image/png" sizes="96x96" href="favicon/favicon-96x96.png">
	<link rel="icon" type="image/png" sizes="16x16" href="favicon/favicon-16x16.png">
	<link rel="manifest" href="favicon/manifest.json">
	<meta name="msapplication-TileColor" content="#ffffff">
	<meta name="msapplication-TileImage" content="favicon/ms-icon-144x144.png">
	<meta name="theme-color" content="#ffffff">
	
	<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="css/main.css">
</head>

<body>
	<c:import url="/WEB-INF/jsp/header.jsp"/>
	<main class="container-fluid">
		<div class="row">
			<div class="col-6 offset-3">
				<h3 class="my-3 text-center"><c:out value="${page_title}"/></h3>
				<c:set var="reviews" value="${requestScope.item}"/>	
				<c:choose>
					<c:when test="${not empty reviews}">
						<ul class="list-group">
						<c:forEach items="${reviews}" var="review">
							<li class="list-group-item card border-light" id="review-${review.id}">
								<div class="card-header">
									<span class="px-1">${reviewed_movie} <a href='<c:url value="/movies/${review.reviewedMovie.id}"/>' class="btn btn-link btn-sm text-secondary" role="button">${review.reviewedMovie.title}</a> </span>
									<span class="px-1">${review_user} ${review.author.login}</span>
									<span class="px-1">${review_added} <fmt:formatDate type="date" value="${review.additionDate}"/></span>
								</div>
								<div class="card-body">
								    <p class="card-text">${review.textReview}</p>
								    <c:if test="${sessionScope.user.role.toString() == 'ADMIN' }">
										<a href="" class="btn btn-link btn-sm text-secondary" role="button" data-review="${review.id}" id="delete-review"><c:out value="${delete_review}"/></a>
									</c:if>
								</div>
							</li>
						</c:forEach>
						</ul>
					</c:when>
					<c:otherwise>
						<p><c:out value="${no_reviews}"/></p>
					</c:otherwise>
				</c:choose>
			</div>
			<c:if test="${requestScope.pages > 1}">
				<div class="col-6 offset-3" >
					<nav >
					  <ul class="pagination justify-content-center" id="pagination-holder" data-pages="${requestScope.pages}" data-current="${requestScope.currentPage}" data-category="reviews">
					  </ul>
					</nav>
				</div>
			</c:if>
		</div>
	</main>
	<c:import url="/WEB-INF/jsp/footer.jsp"/>

	<script src="js/jquery-3.2.1.min.js"></script>
	<script src="bootstrap/js/bootstrap.bundle.js"></script>
	<script src="js/main.js"></script>
</body>
</html>