<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>

	<fmt:setLocale value="${cookie.locale.value}" />
	<fmt:setBundle basename="localization.locale" var="locale" />
	<fmt:message bundle="${locale}" key="locale.page.title.users" var="page_title"/>
	<fmt:message bundle="${locale}" key="locale.users.edit.ban" var="ban"/>
	<fmt:message bundle="${locale}" key="locale.users.edit.rating" var="change_rating"/>
	<fmt:message bundle="${locale}" key="locale.users.edit.role" var="change_role"/>
	<fmt:message bundle="${locale}" key="locale.users.edit.unban" var="unban"/>
	<fmt:message bundle="${locale}" key="locale.page.empty" var="no_users"/>
	<fmt:message bundle="${locale}" key="locale.extra.button.delete" var="delete_user"/>
	<fmt:message bundle="${locale}" key="locale.extra.actions" var="extra_actions"/>
	<fmt:message bundle="${locale}" key="locale.extra.button.delete.user.error" var="delete_user_error"/>
	<fmt:message bundle="${locale}" key="locale.users.attribute.login" var="login"/>
	<fmt:message bundle="${locale}" key="locale.users.attribute.email" var="email"/>
	<fmt:message bundle="${locale}" key="locale.users.attribute.role" var="role"/>
	<fmt:message bundle="${locale}" key="locale.users.attribute.status" var="status"/>
	<fmt:message bundle="${locale}" key="locale.users.attribute.rating" var="rating"/>
	<%-- <fmt:message bundle="${locale}" key="" var=""/> --%>
	
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
				<c:set var="users" value="${requestScope.item}"/>	
				<c:choose>
					<c:when test="${not empty users}">
						<table class="table">
							<thead class="thead-light">
							    <tr>
							    	<th scope="col"><c:out value="${login}"/></th>
							      	<th scope="col"><c:out value="${email}"/></th>
							      	<th scope="col"><c:out value="${role}"/></th>
							      	<th scope="col"><c:out value="${status}"/></th>
							      	<th scope="col"><c:out value="${rating}"/></th>
							      	<th scope="col"></th>
							    </tr>
							</thead>
						  	<tbody>
								<c:forEach items="${users}" var="user">
									<tr id="user-${user.login}">
								      	<td><c:out value="${user.login}"/></td>
								      	<td><c:out value="${user.email}"/></td>
								      	<td><c:out value="${fn:toLowerCase(user.role.toString())}"/></td>
								      	<td><c:out value="${fn:toLowerCase(user.status.toString())}"/></td>
								      	<td><c:out value="${user.rating}"/></td>
								      	<td><a href="#extra-actions-${user.login}" data-toggle="collapse" aria-expanded="false" aria-controls="extra-actions-${user.login}" class="btn btn-link text-secondary" role="button"><c:out value="${extra_actions}"/></a></td>
								    </tr>
								    <tr>
										<td colspan="6" class="td-h-0">
											<div class="collapse" id="extra-actions-${user.login}">
												<a href="" class="btn btn-primary" role="button" id="user-role-change"><c:out value="${change_role}"/></a>
												<a href="" class="btn btn-primary" role="button" id="user-rating-change"><c:out value="${change_rating}"/></a>
												<a href="" class="btn btn-warning" role="button" id="user-ban"><c:out value="${ban}"/></a>
												<a href="" class="btn btn-success" role="button" id="user-unban"><c:out value="${unban}"/></a>
												<a href="" data-user="${user.login}" data-error="${delete_user_error}" data-success="${delete_user_success}" class="btn btn-danger" id="user-delete"><c:out value="${delete_user}"/></a>
											</div>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</c:when>
					<c:otherwise>
						<p ><c:out value="${no_users}"/></p>
					</c:otherwise>
				</c:choose>
			</div>
			<c:if test="${requestScope.pages > 1}">
				<div class="col-6 offset-3" >
					<nav >
					  <ul class="pagination justify-content-center" id="pagination-holder" data-pages="${requestScope.pages}" data-current="${requestScope.currentPage}" data-category="users">
					  </ul>
					</nav>
				</div>
			</c:if>
		</div>
	</main>
	<c:import url="/WEB-INF/jsp/footer.jsp"/>
	
	<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="bootstrap/js/bootstrap.bundle.js"></script>
	<script type="text/javascript" src="js/jquery.twbsPagination.min.js"></script>
	<script type="text/javascript" src="js/main.js"></script>
</body>
</html>