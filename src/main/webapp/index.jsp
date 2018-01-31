<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>

	<fmt:setLocale value="${cookie.locale.value}" />
	<fmt:setBundle basename="localization.locale" var="locale" />
	<fmt:message bundle="${locale}" key="locale.page.title"	var="locale_page_title"/>
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
	<fmt:message bundle="${locale}" key="locale.page.main.heading" var="heading"/>
	
	
	<title>${locale_page_title}</title>
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
	<script src="js/jquery-3.2.1.min.js"></script>
	<script src="bootstrap/js/bootstrap.bundle.js"></script>
	<script src="js/rating.js"></script>
	<script src="js/main.js"></script>
</head>

<body>
	<c:import url="/WEB-INF/jsp/header.jsp"/>
	<main role="main" class="container-fluid">
		<div class="row">
			<div class="col-6 offset-3" id="items">
			<h2 class="text-center main-page-h"><c:out value="${heading}"/></h2>
			<c:set var="randomMovies" value="${requestScope.item}"/>	
			<c:choose>
				<c:when test="${not empty randomMovies}">
					<ul class="list-group">
						<c:forEach items="${randomMovies}" var="movie">
							<li class="list-group-item card">
								<div class="row">
									<div class="col-7">
										<input type="hidden" name="movie" value='<c:out value="${movie.id}"/>'>
										<h3 class="card-title">
											<a href="<c:url value="movies/${movie.id}"/>"><c:out value="${movie.title}"/></a>	
										</h3>
										<h6 class="card-text text-secondary"><c:out value="${movie.year}, ${movie.length} ${minutes}"/></h6>
										<h5 class="card-text text-secondary"><c:out value="${movie.director}"/></h5>
										<h5 class="card-text text-secondary">
											<c:forEach items="${movie.actors}" var="actor" varStatus="i" end="3">
										   		<c:choose>
										   	
										  			<c:when test="${i.count == 3 || i.count == movie.actors.size()}">
										   				<a href="<c:url value="actors/${actor.id}"/>"><c:out value="${actor.firstName} ${actor.secondName}"/></a>
										   			</c:when>
										   			<c:otherwise>
										   				<a href="<c:url value="actors/${actor.id}"/>"><c:out value="${actor.firstName} ${actor.secondName}"/></a>, 
										   			</c:otherwise>
										   		</c:choose>
										   	</c:forEach>
										</h5>
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
											<h5 class="card-text text-secondary">
												<c:out value="${vote_rating}"/>
												<span id="rating-${movie.id}">
													<b><fmt:formatNumber maxFractionDigits="3" value="${movie.rating}"/></b>
												</span>
											</h5>
											<c:choose>
												<c:when test="${user.marks.containsKey(movie.id)}">
													<h5 class="card-text text-secondary user-vote">
														<c:out value="${user_vote}"/>
														<span id="user-vote-${movie.id}" class="badge badge-info" data-user-vote="${user.marks.get(movie.id)}">
															<b><c:out value="${user.marks.get(movie.id)}"/></b>
														</span>
													</h5>
													<a href="" data-user="${user.login}" data-movie="${movie.id}" data-error="${delete_vote_error}" data-success="${delete_vote_succes}" data-page="${pageContext.request.requestURI}" class="delete-movie btn btn-link btn-sm text-secondary"><c:out value="${delete_vote}"/></a>
												</c:when>
												<c:otherwise>
													<h6 class="card-text text-secondary" id="not-voted-${movie.id}">
														<c:out value="${no_user_vote}"/>
													</h6>
												</c:otherwise>
											</c:choose>
											<h5 class="card-text text-secondary">
												<c:out value="${amount_votes}" />
												<span id="vote-amount-${movie.id}" > <c:out value="${movie.voteAmount}"/></span>
											</h5>
										</div>
									</div>
								</div>
							</li>
						</c:forEach>
					</ul>
				</c:when>
				<c:otherwise>
					<c:redirect url="main"/>
				</c:otherwise>
			</c:choose>	
			</div>
		</div>
	</main>
	<c:import url="/WEB-INF/jsp/footer.jsp"/>
</body>
</html>