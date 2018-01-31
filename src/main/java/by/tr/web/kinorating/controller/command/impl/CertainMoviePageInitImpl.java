package by.tr.web.kinorating.controller.command.impl;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import by.tr.web.kinorating.controller.ParameterName;
import by.tr.web.kinorating.controller.command.Command;
import by.tr.web.kinorating.domain.Movie;
import by.tr.web.kinorating.domain.Review;
import by.tr.web.kinorating.domain.User;
import by.tr.web.kinorating.service.MovieService;
import by.tr.web.kinorating.service.ReviewService;
import by.tr.web.kinorating.service.ServiceFactory;
import by.tr.web.kinorating.service.exception.ServiceException;

public class CertainMoviePageInitImpl implements Command {
	
	private static final String POSITIVE_ATTR = "yes";

	private static final String HAS_REVIEW_ATTR = "has_review";

	private static final String USER_ATTR = "user";

	private static final String MOVIE_REVIEWS_ATTR = "movie_reviews";

	private static final String PROBLEM_WITH_GETTING_REVIEWS = "Problem with getting reviews";

	private static final String PROBLEM_WITH_GETTING_MOVIE = "Problem with getting movie";
	
	private static final String DEFAULT_LANG_NAME = "ru";
	private static final String ITEM_ATTR = "item";
	private static final String MOVIE_PAGE = "movies/movie";

	private static final Logger logger = LogManager.getLogger(CertainMoviePageInitImpl.class);

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String idStr = request.getParameter(ParameterName.ID);
		int id = 0;
		if (idStr != null) {
			id = Integer.valueOf(idStr);
		}
		Cookie[] cookies = request.getCookies();
		String langName = DEFAULT_LANG_NAME;
		for (Cookie cookie : cookies) {
			if (cookie.getName().equalsIgnoreCase(ParameterName.LOCALE)) {
				langName = cookie.getValue();
			}
		}
		langName = langName.substring(0, 2);
		
		ServiceFactory factory = ServiceFactory.getInstance();
		MovieService movieService = factory.getMoviesService();
		Movie movie = null;
		try {
			movie = movieService.getMovieById(id, langName);
		} catch (ServiceException e) {
			logger.error(PROBLEM_WITH_GETTING_MOVIE, e);
			response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			return;
		}
		List<Review> reviews = null;
		ReviewService reviewService = factory.getReviewsService();
		try {
			reviews = reviewService.showMovieReviws(id);
		} catch (ServiceException e) {
			logger.error(PROBLEM_WITH_GETTING_REVIEWS, e);
			response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			return;
		}
		User currentUser = (User) request.getSession().getAttribute(USER_ATTR);
		if(!reviews.isEmpty() && currentUser != null) {
			for (Review review : reviews) {
				String author = review.getAuthor().getLogin();
				String currentUserLogin = currentUser.getLogin();
				if(author.equals(currentUserLogin)) {
					request.setAttribute(HAS_REVIEW_ATTR, POSITIVE_ATTR);
					break;
				}
			}
		}
		request.setAttribute(ITEM_ATTR, movie);
		request.setAttribute(MOVIE_REVIEWS_ATTR, reviews);
		request.getRequestDispatcher(MOVIE_PAGE).forward(request, response);
	}

}
