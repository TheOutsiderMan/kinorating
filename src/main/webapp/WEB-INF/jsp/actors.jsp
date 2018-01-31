<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
	
	<fmt:setLocale value="${cookie.locale.value}" />
	<fmt:setBundle basename="localization.locale" var="locale" />
	<fmt:message bundle="${locale}" key="locale.page.title.actors"	var="page_title"/>
	<fmt:message bundle="${locale}" key="locale.actor.age" var="actor_age"/>
	<fmt:message bundle="${locale}" key="locale.actor.add.button" var="add_actor"/>
	<fmt:message bundle="${locale}" key="locale.extra.actions" var="extra_actions"/>
	<fmt:message bundle="${locale}" key="locale.extra.button.delete" var="delete_actor"/>
	<fmt:message bundle="${locale}" key="locale.extra.button.translation" var="add_translation"/>
	<fmt:message bundle="${locale}" key="locale.extra.button.delete.actor.error" var="delete_actor_error"/>
	<fmt:message bundle="${locale}" key="locale.extra.button.delete.actor.success" var="delete_actor_success"/>
	<fmt:message bundle="${locale}" key="locale.extra.button.edit" var="edit_actor"/>
	<fmt:message bundle="${locale}" key="locale.page.empty" var="no_actors"/>
	
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
	<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="bootstrap/js/bootstrap.bundle.js"></script>
	<script type="text/javascript" src="js/jquery.twbsPagination.min.js"></script>
	<script type="text/javascript" src="js/main.js"></script>
	
</head>
<body>
	<c:import url="/WEB-INF/jsp/header.jsp"/>
	<main role="main" class="container-fluid">
		<div class="row">
			<div class="col-6 offset-3" id="items">
			<h3 class="my-3 text-center"><c:out value="page_title"/></h3>
			<c:set var="actors" value="${requestScope.item}"/>	
			<c:choose>
				<c:when test="${not empty actors}">
					<ul class="list-group">
						<c:forEach items="${actors}" var="actor">
							<li class="list-group-item card" id="actor-${actor.id}">
								<h3 class="card-title">
										<a href="<c:url value="actors/${actor.id}"/>"><c:out value="${actor.firstName}"/> <c:out value="${actor.secondName}"/></a>	
								</h3>
								<h5 class="card-text text-secondary"><c:out value="${actor_age}"/> <c:out value="${actor.age}"/></h5>
								<c:if test="${sessionScope.user.role.toString() == 'ADMIN' }">
									<div class="p-2">
										<a href="#extra-actions-${actor.id}" data-toggle="collapse" aria-expanded="false" aria-controls="extra-actions" class="btn btn-link text-secondary" role="button"><c:out value="${extra_actions}"/> </a>
										<div class="collapse" id="extra-actions">
											<a href="actors/add-actor?translation=${actor.id}" class="btn btn-primary" role="button" id="add-actor-translation"><c:out value="${add_translation}"/></a>
											<a href="actors/${actor.id}" class="btn btn-primary" role="button" id="edit-actor"><c:out value="${edit_actor}"/></a>
											<a href="" data-actor="${actor.id}" data-error="${delete_actor_error}" data-success="${delete_actor_success}" class="btn btn-danger" id="delete-actor"><c:out value="${delete_actor}"/></a>
										</div>
									</div>
								</c:if>
							</li>		
						</c:forEach>
					</ul>
				</c:when>
				<c:otherwise>
					<p><c:out value="${no_actors}"/></p>
				</c:otherwise>
			</c:choose>	
			</div>
			<c:if test="${sessionScope.user.role.toString() == 'ADMIN' }">
				<div class="col-3" >
					<a href="actors/add-actor" class="btn btn-secondary p-4" role="button" id="add-actor-btn"><c:out value="${add_actor}"/> </a>
				</div>
			</c:if>
			<c:if test="${requestScope.pages > 1}">
				<div class="col-6 offset-3" >
					<!-- class="pagination-wrapper" -->
					<nav >
					  <ul class="pagination justify-content-center" id="pagination-holder" data-pages="${requestScope.pages}" data-current="${requestScope.currentPage}" data-category="movies">
					  </ul>
					</nav>
				</div>
			</c:if>
		</div>
	</main>
	<c:import url="/WEB-INF/jsp/footer.jsp"/>
</body>
</html>