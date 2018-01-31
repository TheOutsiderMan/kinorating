<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
	<fmt:setLocale value="${cookie.locale.value}" />
	<fmt:setBundle basename="localization.locale" var="locale" />
	<fmt:message bundle="${locale}" key="locale.actor.firstname.label" var="first_name"/>
	<fmt:message bundle="${locale}" key="locale.actor.lastname.label" var="last_name"/>
	<fmt:message bundle="${locale}" key="locale.actor.age" var="age"/>
	<fmt:message bundle="${locale}" key="locale.actor.page.movies" var="movies_heading"/>
	<fmt:message bundle="${locale}" key="locale.page.body.minutes" var="minutes"/>
	<fmt:message bundle="${locale}" key="locale.movie.vote.refuse" var="vote_not_ok_msg"/>
	<fmt:message bundle="${locale}" key="locale.movie.vote.accept" var="vote_ok_msg"/>
	<fmt:message bundle="${locale}" key="locale.movie.vote.user" var="user_vote"/>
	<fmt:message bundle="${locale}" key="locale.movie.vote.amount.votes" var="amount_votes"/>
	<fmt:message bundle="${locale}" key="locale.movie.vote.user.nothing" var="no_user_vote"/>
	<fmt:message bundle="${locale}" key="locale.movie.vote.delete" var="delete_vote"/>
	<fmt:message bundle="${locale}" key="locale.movie.vote.refuse.error" var="vote_error"/>
	<fmt:message bundle="${locale}" key="locale.movie.vote.delete.error" var="delete_vote_error"/>
	<fmt:message bundle="${locale}" key="locale.movie.vote.delete.succes" var="delete_vote_succes"/>
	<fmt:message bundle="${locale}" key="locale.movie.vote.rating" var="vote_rating"/>
	<fmt:message bundle="${locale}" key="locale.actor.page.profile" var="actor_profile"/>
	<fmt:message bundle="${locale}" key="locale.actor.edit" var="edit_data"/>
	
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="apple-touch-icon" sizes="57x57" href='<c:url value="/favicon/apple-icon-57x57.png"/>'>
	<link rel="apple-touch-icon" sizes="60x60" href="<c:url value="/favicon/apple-icon-60x60.png"/>">
	<link rel="apple-touch-icon" sizes="72x72" href="<c:url value="/favicon/apple-icon-72x72.png"/>">
	<link rel="apple-touch-icon" sizes="76x76" href="<c:url value="/favicon/apple-icon-76x76.png"/>">
	<link rel="apple-touch-icon" sizes="114x114" href="<c:url value="/favicon/apple-icon-114x114.png"/>">
	<link rel="apple-touch-icon" sizes="120x120" href="<c:url value="/favicon/apple-icon-120x120.png"/>">
	<link rel="apple-touch-icon" sizes="144x144" href="<c:url value="/favicon/apple-icon-144x144.png"/>">
	<link rel="apple-touch-icon" sizes="152x152" href="<c:url value="/favicon/apple-icon-152x152.png"/>">
	<link rel="apple-touch-icon" sizes="180x180" href="<c:url value="/favicon/apple-icon-180x180.png"/>">
	<link rel="icon" type="image/png" sizes="192x192" href="<c:url value="/favicon/android-icon-192x192.png"/>">
	<link rel="icon" type="image/png" sizes="32x32"	href="<c:url value="/favicon/favicon-32x32.png"/>">
	<link rel="icon" type="image/png" sizes="96x96"	href="<c:url value="/favicon/favicon-96x96.png"/>">
	<link rel="icon" type="image/png" sizes="16x16"	href="<c:url value="/favicon/favicon-16x16.png"/>">
	<link rel="manifest" href="<c:url value="/favicon/manifest.json"/>">
	<meta name="msapplication-TileColor" content="#ffffff">
	<meta name="msapplication-TileImage" content="<c:url value="/avicon/ms-icon-144x144.png"/>f">
	<meta name="theme-color" content="#ffffff">
	
	<link rel="stylesheet" href="<c:url value="/bootstrap/css/bootstrap.min.css"/>">
	<link rel="stylesheet" href="<c:url value="/css/main.css"/>">
	<script type="text/javascript" src="<c:url value="/js/jquery-3.2.1.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/bootstrap/js/bootstrap.bundle.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/js/rating.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/js/main.js"/>"></script>
	<c:url value="/img/stars.png" var="img_url"/>
	
	<title>${requestScope.item.firstName} ${requestScope.item.secondName}</title>
</head>
<body>
	<c:import url="/WEB-INF/jsp/header.jsp" />
	<main role="main" class="container-fluid"> 
		<div class="row">
			<div class="col-6 offset-3">
				<h3 class="text-center my-3">${actor_profile}</h3>
				<div class="row">
					<div class="col-2 h5">
						${first_name}
					</div>
					<div class="col-8 h5">
						${requestScope.item.firstName}
					</div>
					<c:if test="${sessionScope.user.role.toString() == 'ADMIN' }">
						<div class="col-2">
							<a href="" class="btn btn-link btn-sm text-secondary" role="button" id="edit-first-name"><c:out value="${edit_data}"/></a>
						</div>	
					</c:if>
				</div>
				<div class="row">
					<div class="col-2 h5">
						${last_name}
					</div>
					<div class="col-8 h5">
						${requestScope.item.secondName}
					</div>
					<c:if test="${sessionScope.user.role.toString() == 'ADMIN' }">
						<div class="col-2">
							<a href="" class="btn btn-link btn-sm text-secondary" role="button" id="edit-last-name"><c:out value="${edit_data}"/></a>
						</div>	
					</c:if>
				</div>
				<div class="row">
					<div class="col-2 h5">
						${age}
					</div>
					<div class="col-8 h5">
						${requestScope.item.age}
					</div>
					<c:if test="${sessionScope.user.role.toString() == 'ADMIN' }">
						<div class="col-2">
							<a href="" class="btn btn-link btn-sm text-secondary" role="button" id="edit-age"><c:out value="${edit_data}"/></a>
						</div>	
					</c:if>
				</div>
			</div>
			<c:set var="movies" value="${requestScope.actor_movies}"/>	
			<c:if test="${not empty movies}">
				<div class="col-6 offset-3">
					<h3 class="text-center card-header">${movies_heading}</h3>
					<ul class="list-group">
						<c:forEach items="${movies}" var="movie">
							<li class="list-group-item card">
								<div class="row">
									<div class="col-7">
										<input type="hidden" name="movie" value='<c:out value="${movie.id}"/>'>
										<h3 class="card-title">
											<a href="<c:url value="/movies/${movie.id}"/>"><c:out value="${movie.title}"/></a>	
										</h3>
										<h6 class="card-text text-secondary"><c:out value="${movie.year}, ${movie.length} ${minutes}"/></h6>
										<h5 class="card-text text-secondary"><c:out value="${movie.director}"/></h5>
										<h6 class="card-text text-secondary"><c:out value="${movie.genre}"/></h6>
									</div>
									<div class="col-5">
										<div id="rating-movie-${movie.id}">
								            <input type="hidden" class="val" value="<c:out value="${movie.rating}"/>"/>
								        	<input type="hidden" class="votes" value="<c:out value="${movie.voteAmount}"/>"/>
										</div>
										<script type="text/javascript">
											$(function(){
												var auth = false; 
												if('${sessionScope.authenticated}' == 'yes') {
													auth = true
												}
												$('#rating-movie-${movie.id}').rating({
													image: '${img_url}',
													auth: auth,
													msgOK: '${vote_ok_msg}',
													msgNotOk: '${vote_not_ok_msg}',
													login: '${sessionScope.user.login}',
													errorMsg: '${vote_error}',
													movieID: '${movie.id}'
												});
											})
										</script>
										<div class="vote-container">
											<h5 class="card-text text-secondary"><c:out value="${vote_rating}"/> <b><fmt:formatNumber maxFractionDigits="3" value="${movie.rating}"/></b></h5>
											<c:choose>
												<c:when test="${user.marks.containsKey(movie.id)}">
													<h5 class="card-text text-secondary user-vote">
														<c:out value="${user_vote}"/> <span id="user-vote-${movie.id}" class="badge badge-info"><b><c:out value="${user.marks.get(movie.id)}"/></b></span>
													</h5>
													<a href="" data-user="${user.login}" data-movie="${movie.id}" data-error="${delete_vote_error}" data-success="${delete_vote_succes}" data-page="${pageContext.request.requestURL}" class="delete-movie btn btn-link btn-sm text-secondary"><c:out value="${delete_vote}"/></a>
												</c:when>
												<c:otherwise>
													<h6 class="card-text text-secondary" id="not-voted-${movie.id}">
														<c:out value="${no_user_vote}"/>
													</h6>
												</c:otherwise>
											</c:choose>
											<h5 class="card-text text-secondary">
												<c:out value="${amount_votes}" />
												<span id="vote-amount-${movie.id}"> <c:out value="${movie.voteAmount}"/></span>
											</h5>
										</div>
									</div>
								</div>
							</li>
						</c:forEach>
					</ul>
				</div>
			</c:if>
		</div>
	</main>
	<c:import url="/WEB-INF/jsp/footer.jsp" />
</body>
</html>