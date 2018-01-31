<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
	
	<fmt:setLocale value="${cookie.locale.value}" />
	<fmt:setBundle basename="localization.locale" var="locale" />
	<fmt:message bundle="${locale}" key="locale.page.title.user" var="page_title"/>
	<fmt:message bundle="${locale}" key="locale.movie.edit" var="edit_data"/>
	<fmt:message bundle="${locale}" key="locale.reg.form.label.email" var="label_email"/>
	<fmt:message bundle="${locale}" key="locale.reg.form.label.login" var="label_login"/>
	<fmt:message bundle="${locale}" key="locale.user.edit.password" var="edit_password"/>
	<fmt:message bundle="${locale}" key="locale.user.profile.date" var="reg_date" />
	<fmt:message bundle="${locale}" key="locale.user.profile.rating" var="user_rating" />
	<fmt:message bundle="${locale}" key="locale.user.profile.role" var="role" />
	<fmt:message bundle="${locale}" key="locale.user.profile.reviews.empty" var="no_reviews" />
	<fmt:message bundle="${locale}" key="locale.user.profile.votes.empty" var="no_votes" />
	<fmt:message bundle="${locale}" key="locale.user.profile.votes" var="user_votes"/>
	<fmt:message bundle="${locale}" key="locale.user.profile.reviews" var="user_reviews"/>
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
	<fmt:message bundle="${locale}" key="locale.user.profile.reviews.movie" var="reviewed_movie"/>
	<fmt:message bundle="${locale}" key="locale.reviews.delete" var="delete_review"/>
	<fmt:message bundle="${locale}" key="locale.extra.actions" var="extra_actions"/>
	<fmt:message bundle="${locale}" key="locale.extra.button.delete" var="delete_movie"/>
	<fmt:message bundle="${locale}" key="locale.extra.button.translation" var="add_translation"/>
	<fmt:message bundle="${locale}" key="locale.extra.button.delete.movie.error" var="delete_movie_error"/>
	<fmt:message bundle="${locale}" key="locale.extra.button.delete.movie.success" var="delete_movie_success"/>
	<fmt:message bundle="${locale}" key="locale.extra.button.edit" var="edit_movie"/>
	<fmt:message bundle="${locale}" key="locale.user.not.registered" var="not_registered"/>
	
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
	<link rel="icon" type="image/png" sizes="32x32" href="<c:url value="/favicon/favicon-32x32.png"/>">
	<link rel="icon" type="image/png" sizes="96x96" href="<c:url value="/favicon/favicon-96x96.png"/>">
	<link rel="icon" type="image/png" sizes="16x16" href="<c:url value="/favicon/favicon-16x16.png"/>">
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
	<title>${page_title}</title>
	<c:set value="${sessionScope.user}" var="user"/>
	<c:url value="/img/stars.png" var="img_url"/>
</head>
<body>
	<c:import url="/WEB-INF/jsp/header.jsp" />
		<c:choose>
			<c:when test="${not empty sessionScope.user}">
				<main role="main" class="container-fluid"> 
					<div class="row">
						<div class="col-6 offset-3 border border-light p-0">
							<h3 class="text-center card-header">${page_title}</h3>
							<div class="row card-body">
								<div class="col-4 h5">
									${label_login}
								</div>
								<div class="col-6 h5">
									${user.login}
								</div>
							</div>
							<div class="row card-body">
								<div class="col-4 h5">
									${label_email}
								</div>
								<div class="col-6 h5">
									${user.email}
								</div>
								<c:if test="${sessionScope.user.role.toString() == 'ADMIN' }">
									<div class="col-2">
										<a href="" class="btn btn-link btn-sm text-secondary" role="button" id="edit-email"><c:out value="${edit_data}"/></a>
									</div>	
								</c:if>
							</div>
							<div class="row card-body">
								<a href="" class="btn btn-link btn-sm text-secondary" role="button" id="edit-email"><c:out value="${edit_password}"/></a>
							</div>
							<div class="row card-body">
								<div class="col-4 h5">
									${role}
								</div>
								<div class="col-6 h5">
									${user.role}
								</div>
							</div>
							<div class="row card-body">
								<div class="col-4 h5">
									${user_rating}
								</div>
								<div class="col-6 h5">
									${user.rating}
								</div>
							</div>
							<div class="row card-body">
								<div class="col-4 h5">
									${reg_date}
								</div>
								<div class="col-6 h5">
									<fmt:formatDate value="${user.registrationDate}" type="date"/>
								</div>
							</div>
							<div class="container-fluid border-light p-0">
								<h3 class="text-center card-header">${user_votes}</h3>
								<c:choose>
									<c:when test="${not empty requestScope.user_voted_movies}">
										<ul class="list-group">
											<c:forEach items="${requestScope.user_voted_movies}" var="movie">
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
																	<span id="vote-amount-${movie.id}" > <c:out value="${movie.voteAmount}"/></span>
																</h5>
															</div>
														</div>
														<c:if test="${sessionScope.user.role.toString() == 'ADMIN' }">
															<div class="p-2">
																<a href="#extra-actions-${movie.id}" data-toggle="collapse" aria-expanded="false" aria-controls="extra-actions-${movie.id}" class="btn btn-link text-secondary" role="button"><c:out value="${extra_actions}"/></a>
																<div class="collapse" id="extra-actions-${movie.id}">
																	<a href="movies/add-movie?translation=${movie.id}" class="btn btn-primary" role="button" id="add-movie-translation"><c:out value="${add_translation}"/></a>
																	<a href="movies/${movie.id}" class="btn btn-primary" role="button" id="edit_movie"><c:out value="${edit_movie}"/></a>
																	<a href="movies/add-actor-to-movie?movie=${movie.id}" class="btn btn-primary" role="button" id="add-actor-to-movie"><c:out value="${add_actors}"/></a>
																	<a href="" data-movie="${movie.id}" data-error="${delete_movie_error}" data-success="${delete_movie_success}" class="btn btn-danger" id="delete-movie"><c:out value="${delete_movie}"/></a>
																</div>
															</div>
														</c:if>
													</div>
												</li>
											</c:forEach>
										</ul>
									</c:when>
									<c:otherwise>
										<p class="m-4">${no_votes}</p>
									</c:otherwise>
								</c:choose>
							</div>
							<div class="container-fluid border-light p-0">
								<h3 class="text-center card-header">${user_reviews}</h3>
								<c:choose>
									<c:when test="${not empty requsestScope.user_reviews}">
										<c:forEach items="${requsestScope.user_reviews}" var="review">
											<div class="card border-light" id="review-${review.id}">
												<div class="card-header">
													<span class="px-1">${reviewed_movie} <a href='<c:url value="/movies/${review.reviewedMovie.id}"/>' class="btn btn-link btn-sm text-secondary" role="button">${review.reviewedMovie.title}</a> </span>
													<span class="px-1">${review_added} <fmt:formatDate type="date" value="${review.additionDate}"/></span>
												</div>
												<div class="card-body">
												    <p class="card-text">${review.textReview}</p>
												    <c:if test="${sessionScope.user.role.toString() == 'ADMIN' }">
														<a href="" class="btn btn-link btn-sm text-secondary" role="button" data-review="${review.id}" id="delete-review"><c:out value="${delete_review}"/></a>
													</c:if>
												</div>
											</div>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<p class="m-4">${no_reviews}</p>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</div>
				</main>
			</c:when>
			<c:otherwise>
				<h3 class="m-4 text-center"><c:out value="${not_registered}"/></h3>
			</c:otherwise>
		</c:choose>
	<c:import url="/WEB-INF/jsp/footer.jsp"/>
</body>
</html>