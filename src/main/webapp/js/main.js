$(function() {
	$(".delete-movie").click(function() {
		var self = this;
		var user = $(this).attr("data-user");
		var movie = $(this).attr("data-movie");
		var error = $(this).attr("data-error");
		var success = $(this).attr("data-success");
		var page = $(this).attr("data-page");
		$.ajax({
			async: false,
			url : 'app',
			type : 'post',
			dataType: 'html',
			data : {
				action : "delete_user_mark",
				login : user,
				movieID : movie,
				page : page
			}
		})
	});

	$('#pagination-holder').twbsPagination({
		totalPages : $('#pagination-holder').attr("data-pages"),
		startPage : $('#pagination-holder').attr("data-current"),
		href : true,
		prev: "&laquo;",
		next: "&raquo;",
		paginationClass: "pagination justify-content-center",
		pageVariable: "page"
	});
});
