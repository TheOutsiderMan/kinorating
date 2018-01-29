<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>

	<fmt:setLocale value="${cookie.locale.value}" />
	<fmt:setBundle basename="localization.locale" var="locale" />
	<fmt:message bundle="${locale}" key="locale.page.title.add.actors" var="page_title" />
	<fmt:message bundle="${locale}" key="locale.actor.age" var="age_label" />
	<fmt:message bundle="${locale}" key="locale.actor.age.input" var="age_input" />
	<fmt:message bundle="${locale}" key="locale.actor.firstname.input" var="first_name_input" />
	<fmt:message bundle="${locale}" key="locale.actor.firstname.label" var="first_name_label" />
	<fmt:message bundle="${locale}" key="locale.actor.lastname.input" var="last_name_input" />
	<fmt:message bundle="${locale}" key="locale.actor.lastname.label" var="last_name_label" />
	<fmt:message bundle="${locale}" key="locale.actor.add.button.translation" var="add_translation" />
	<fmt:message bundle="${locale}" key="locale.actor.add.button" var="submit_button" />
	<fmt:message bundle="${locale}" key="locale.actor.add.language" var="language_information" />
	<fmt:message bundle="${locale}" key="locale.actor.movies" var="actor_movies" />
	
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
				<form action="app" method="post">
				<c:choose>
					<c:when test="${param.translation == null}">
						<div class="form-group">
							<label class="col-form-label" for="first-name"><c:out value="${first_name_label}"/></label>
							<input type="text" class="form-control"	name="first-name" id="first-name" placeholder="<c:out value="${first_name_input}"/>" required="required">
						</div>
						<div class="form-group">
							<label class="col-form-label" for="last-name"><c:out value="${last_name_label}"/></label>
							<input type="text" class="form-control" name="last-name" id="last-name" placeholder='<c:out value="${last_name_input}" />'>
						</div>
						<div class="form-group">
							<label class="col-form-label" for="age"><c:out value="${age_label}"/></label>
							<input type="number" class="form-control" name="age" id="age" placeholder="<c:out value="${age_input}"/>">
						</div>
						<div class="form-group">
							<label class="col-form-label" for="actor-movie"><c:out value="${actor_movies}"/></label>
							<select class="col-form-label" id="actor-movie" name="actor-movie" size="1" required="required">
								<c:forEach items="${requestScope.all_movies}" var="movie">
									<option value="${movie.id}"><c:out value="${movie.title}, ${movie.year}"/></option>
								</c:forEach>
							</select>
						</div>
						<div class="form-group row">
							<label class="col-form-label" for="actor-locale"><c:out value="${language_information}"/></label>
							<select class="col-form-label" id="actor-locale" name="locale" size="1" required="required">
								<option value="en">EN</option>
								<option value="ru">RU</option>
							</select>
						</div>
						<input class="btn btn-primary" type="submit" value='<c:out value="${submit_button}"/>'>
						<input name="action" value="add_actor" hidden="" id="action-name">
					</c:when>
					<c:otherwise>
						<div class="form-group">
							<label class="col-form-label" for="first-name"><c:out value="${first_name_label}"/></label>
							<input type="text" class="form-control"	name="first-name" id="first-name" placeholder="<c:out value="${first_name_input}"/>" required="required">
						</div>
						<div class="form-group">
							<label class="col-form-label" for="last-name"><c:out value="${last_name_label}"/></label>
							<input type="text" class="form-control" name="last-name" id="last-name" placeholder='<c:out value="${last_name_input}" />'>
						</div>
						<div class="form-group row">
							<label class="col-form-label" for="movie-locale"><c:out value="${language_information}"/></label>
							<select class="col-form-label" id="movie-locale" name="locale" size="1" required="required">
								<option value="en">EN</option>
								<option value="ru">RU</option>
							</select>
						</div>
						<input class="btn btn-primary" type="submit" value='<c:out value="${add_translation}"/>'>
						<input name="actorID" value="${param.translation}" hidden="">
						<input name="action" value="add_movie_translation" hidden="" id="action-name">
					</c:otherwise>
				</c:choose>
					
				</form>
			</div>
		</div>
	</main>
	<c:import url="/WEB-INF/jsp/footer.jsp"/>
	
	<script src="<c:url value="js/jquery-3.2.1.min.js"/>"></script>
	<script src="<c:url value="bootstrap/js/bootstrap.bundle.js"/>"></script>
	<script src="<c:url value="js/main.js"/>"></script>
</body>
</html>