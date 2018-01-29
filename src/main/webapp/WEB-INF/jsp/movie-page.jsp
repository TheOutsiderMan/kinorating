<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
	<fmt:setLocale value="${cookie.locale.value}" />
	<fmt:setBundle basename="localization.locale" var="locale" />
	<fmt:message bundle="${locale}" key="locale.movie.edit" var="edit_data"/>
	<fmt:message bundle="${locale}" key="locale.movie.page.information" var="movie_information"/>
	<fmt:message bundle="${locale}" key="locale.movie.page.reviews" var="reviews_heading"/>
	<fmt:message bundle="${locale}" key="locale.movie.add.director.label" var="director_label" />
	<fmt:message bundle="${locale}" key="locale.movie.add.genre.label" var="genre_label" />
	<fmt:message bundle="${locale}" key="locale.movie.add.length.label" var="length_label" />
	<fmt:message bundle="${locale}" key="locale.movie.add.title.label" var="title_label" />
	<fmt:message bundle="${locale}" key="locale.movie.add.year.label" var="year_label" />
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
	<fmt:message bundle="${locale}" key="locale.movie.page.rating" var="rating_heading"/>
	<fmt:message bundle="${locale}" key="locale.movie.page.actors" var="actors_heading"/>
	<fmt:message bundle="${locale}" key="locale.movie.page.actors.empty" var="no_actors"/>
	<fmt:message bundle="${locale}" key="locale.movie.reviews.empty" var="no_reviews"/>
	<fmt:message bundle="${locale}" key="locale.reviews.added" var="review_added"/>
	<fmt:message bundle="${locale}" key="locale.reviews.user" var="review_user"/>
	<fmt:message bundle="${locale}" key="locale.movie.add.actors" var="add_actors"/>
	<fmt:message bundle="${locale}" key="locale.actor.age" var="actor_age"/>
	<fmt:message bundle="${locale}" key="locale.reviews.delete" var="delete_review"/>
	
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
	<c:url value="/img/stars.png" var="img_url"/>
	<title>${requestScope.item.title}</title>
</head>
<body>
	<c:import url="/WEB-INF/jsp/header.jsp" />
	<main role="main" class="container-fluid"> 
		<div class="row">
			<div class="col-6 offset-3 border border-light p-0">
				<h3 class="text-center card-header">${movie_information}</h3>
				<div class="row card-body border-light">
					<div class="col-4 h5">
						${title_label}
					</div>
					<div class="col-6 h5">
						${requestScope.item.title}
					</div>
					<c:if test="${sessionScope.user.role.toString() == 'ADMIN' }">
						<div class="col-2">
							<a href="" class="btn btn-link btn-sm text-secondary" role="button" id="edit-title"><c:out value="${edit_data}"/></a>
						</div>	
					</c:if>
				</div>
				<div class="row card-body border-light">
					<div class="col-4 h5">
						${director_label}
					</div>
					<div class="col-6 h5">
						${requestScope.item.director}
					</div>
					<c:if test="${sessionScope.user.role.toString() == 'ADMIN' }">
						<div class="col-2">
							<a href="" class="btn btn-link btn-sm text-secondary" role="button" id="edit-director"><c:out value="${edit_data}"/></a>
						</div>	
					</c:if>
				</div>
				<div class="row card-body border-light">
					<div class="col-4 h5">
						${genre_label}
					</div>
					<div class="col-6 h5">
						${requestScope.item.genre}
					</div>
					<c:if test="${sessionScope.user.role.toString() == 'ADMIN' }">
						<div class="col-2">
							<a href="" class="btn btn-link btn-sm text-secondary" role="button" id="edit-genre"><c:out value="${edit_data}"/></a>
						</div>	
					</c:if>
				</div>
				<div class="row card-body border-light">
					<div class="col-4 h5">
						${length_label}
					</div>
					<div class="col-6 h5">
						${requestScope.item.length}
					</div>
					<c:if test="${sessionScope.user.role.toString() == 'ADMIN' }">
						<div class="col-2">
							<a href="" class="btn btn-link btn-sm text-secondary" role="button" id="edit-length"><c:out value="${edit_data}"/></a>
						</div>	
					</c:if>
				</div>
				<div class="row card-body border-light">
					<div class="col-4 h5">
						${year_label}
					</div>
					<div class="col-6 h5">
						${requestScope.item.year}
					</div>
					<c:if test="${sessionScope.user.role.toString() == 'ADMIN' }">
						<div class="col-2">
							<a href="" class="btn btn-link btn-sm text-secondary" role="button" id="edit-year"><c:out value="${edit_data}"/></a>
						</div>	
					</c:if>
				</div>
				<div class="container-fluid border-light p-0">
					<h3 class="text-center card-header">${rating_heading}</h3>
					<div id="rating-movie-" class="m-4">
			            <input type="hidden" class="val" value="<c:out value="${requestScope.item.rating}"/>"/>
			        	<input type="hidden" class="votes" value="<c:out value="${requestScope.item.voteAmount}"/>"/>
					</div>
					<script type="text/javascript">
						$(function(){
							var auth = false; 
							if('${sessionScope.authenticated}' == 'yes') {
								auth = true
							}
							$('#rating-movie-${requestScope.item.id}').rating({
								image: '${img_url}',
								auth: auth,
								msgOK: '${vote_ok_msg}',
								msgNotOk: '${vote_not_ok_msg}',
								login: '${sessionScope.user.login}',
								errorMsg: '${vote_error}',
								movieID: '${requestScope.item.id}'
							});
						})
					</script>
					<div class="vote-container m-4">
						<h5 class="card-text text-secondary"><c:out value="${vote_rating}"/> <b><fmt:formatNumber maxFractionDigits="3" value="${requestScope.item.rating}"/></b></h5>
						<c:choose>
							<c:when test="${user.marks.containsKey(movie.id)}">
								<h5 class="card-text text-secondary user-vote">
									<c:out value="${user_vote}"/> <span id="user-vote-${requestScope.item.id}" class="badge badge-info"><b><c:out value="${user.marks.get(requestScope.item.id)}"/></b></span>
								</h5>
								<a href="" data-user="${user.login}" data-movie="${requestScope.item.id}" data-error="${delete_vote_error}" data-success="${delete_vote_succes}" data-page="${pageContext.request.requestURL}" class="delete-movie btn btn-link btn-sm text-secondary"><c:out value="${delete_vote}"/></a>
							</c:when>
							<c:otherwise>
								<h6 class="card-text text-secondary" id="not-voted-${movie.id}">
									<c:out value="${no_user_vote}"/>
								</h6>
							</c:otherwise>
						</c:choose>
						<h5 class="card-text text-secondary">
							<c:out value="${amount_votes}" />
							<span id="vote-amount-${requestScope.item.id}" > <c:out value="${requestScope.item.voteAmount}"/></span>
						</h5>
					</div>
				</div>
				<div class="container-fluid border-light p-0">
					<h3 class="text-center card-header">${actors_heading}</h3>
					<c:set var="actors" value="${requestScope.item.actors}"/>	
					<c:choose>
						<c:when test="${not empty actors}">
							<ul class="list-group">
								<c:forEach items="${actors}" var="actor">
									<li class="list-group-item card" id="actor-${actor.id}">
										<h3 class="card-title">
												<a href="<c:url value="actors/${actor.id}"/>"><c:out value="${actor.firstName}"/> <c:out value="${actor.secondName}"/></a>	
										</h3>
										<h5 class="card-text text-secondary"><c:out value="${actor_age}"/> <c:out value="${actor.age}"/></h5>
									</li>		
								</c:forEach>
							</ul>
						</c:when>
						<c:otherwise>
							<p>${no_actors}</p>
						</c:otherwise>
					</c:choose>
					<c:if test="${sessionScope.user.role.toString() == 'ADMIN' }">
						<a href="movies/add-actor-to-movie?movie=${movie.id}" class="btn btn-link btn-sm text-secondary" role="button" id="edit-actors"><c:out value="${add_actors}"/></a>
					</c:if>
				</div>
				<div class="container-fluid border-light p-0">
					<h3 class="text-center card-header">${reviews_heading}</h3>
					<c:set var="reviews" value="${requestScope.movie_reviews}"/>
					<c:choose>
						<c:when test="${not empty reviews}">
							<c:forEach items="${reviews}" var="review">
								<div class="card border-light" id="review-${review.id}">
									<div class="card-header">
										<span class="px-1">${review_user} ${review.user.login}</span>
										<span class="px-1">${review_added} <fmt:formatDate type="date" value="${review.additionDate}"/></span>
									</div>
									<div class="card-body">
									    <p class="card-text">${review.textReview}</p>
									    <c:if test="${sessionScope.user.role.toString() == 'ADMIN' }">
											<a href="" class="btn btn-link btn-sm text-secondary" role="button" data-review="${review.id}" id="delete-review"><c:out
												value="${delete_review}" /></a>
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
	<c:import url="/WEB-INF/jsp/footer.jsp"/>
</body>
</html>