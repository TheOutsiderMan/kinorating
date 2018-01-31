package by.tr.web.kinorating.controller.command.impl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

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

public class UserProfileInit implements Command {
	
	private static final String PROBLEM_WITH_GETTING_USER_REVIEWS = "Problem with getting user's reviews";
	private static final String PROBLEM_WITH_GETTING_MOVIE = "Problem with getting movie";
	
	private static final String USER_PROFILE_FORWARD = "/user/profile";
	private static final String USER_REVIEWS_ATTR = "user_reviews";
	private static final String USER_VOTED_MOVIES_ATTR = "user_voted_movies";
	private static final String REDIRECT_TO_MAIN = "/main";
	private static final String USER_ATTR = "user";
	private static final String DEFAULT_LANG_NAME = "ru";
	
	private static final Logger logger = LogManager.getLogger(UserProfileInit.class);

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		User currentUser = (User) request.getSession().getAttribute(USER_ATTR);
		if (currentUser == null) {
			response.sendRedirect(REDIRECT_TO_MAIN);
			return;
		}
		Set<Integer> userVotesMovieIDs = currentUser.getMarks().keySet();
		ServiceFactory factory = ServiceFactory.getInstance();
		if (!userVotesMovieIDs.isEmpty()) {
			List<Movie> userVotedMovies = new ArrayList<>();
			Cookie[] cookies = request.getCookies();
			String langName = DEFAULT_LANG_NAME;
			for (Cookie cookie : cookies) {
				if (cookie.getName().equalsIgnoreCase(ParameterName.LOCALE)) {
					langName = cookie.getValue();
				}
			}
			langName = langName.substring(0, 2);
			MovieService movieService = factory.getMoviesService();
			for (Integer id : userVotesMovieIDs) {
				try {
					Movie movie = movieService.getMovieById(id, langName);
					userVotedMovies.add(movie);
				} catch (ServiceException e) {
					logger.error(PROBLEM_WITH_GETTING_MOVIE, e);
				}
			}
			request.setAttribute(USER_VOTED_MOVIES_ATTR, userVotedMovies);
		}
		ReviewService reviewService = factory.getReviewsService();
		List<Review> reviews = null;
		try {
			reviews = reviewService.showUserReviews(currentUser.getLogin(), null);
		} catch (ServiceException e) {
			logger.error(PROBLEM_WITH_GETTING_USER_REVIEWS, e);
		}
		request.setAttribute(USER_REVIEWS_ATTR, reviews);
		request.getRequestDispatcher(USER_PROFILE_FORWARD).forward(request, response);
	}

}
