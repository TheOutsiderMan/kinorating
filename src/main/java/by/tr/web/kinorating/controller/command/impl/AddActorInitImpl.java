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
import by.tr.web.kinorating.service.MovieService;
import by.tr.web.kinorating.service.ServiceFactory;
import by.tr.web.kinorating.service.exception.ServiceException;

public class AddActorInitImpl implements Command {
	
	private static final String PROBLEM_WITH_GETTING_MOVIES = "Problem with getting movies";
	
	private static final String ALL_MOVIES_ATTR = "all_movies";
	private static final String FORWARD_PAGE = "actors/add-actor";
	private static final String DEFAULT_LANG_NAME = "ru";

	private static final Logger logger = LogManager.getLogger(AddActorInitImpl.class);
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
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
		List<Movie> movies = null;
		try {
			movies = movieService.getAllMovies(langName);
		} catch (ServiceException e) {
			logger.error(PROBLEM_WITH_GETTING_MOVIES, e);
		}
		request.setAttribute(ALL_MOVIES_ATTR, movies);
		request.getRequestDispatcher(FORWARD_PAGE).forward(request, response);
	}

}
