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

public class MainPageInitImpl implements Command{
	
	private static final String PROBLEM_WITH_GETTING_MOVIES = "Problem with getting movies";
	
	private static final int ITEMS_PER_MAIN_PAGE = 5;
	private static final String DEFAULT_LANG_NAME = "ru";
	private static final String FORWARD_TO_MAIN_PAGE = "index.jsp";
	private static final String ITEM_ATTR = "item";
	
	private static final Logger logger = LogManager.getLogger(MainPageInitImpl.class);
	
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
		List<Movie> randomMovies = null;
		try {
			randomMovies = movieService.getRandomMovies(ITEMS_PER_MAIN_PAGE, langName);
		} catch (ServiceException e) {
			logger.error(PROBLEM_WITH_GETTING_MOVIES, e);
			response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			return;
		}
		request.setAttribute(ITEM_ATTR, randomMovies);
		request.getRequestDispatcher(FORWARD_TO_MAIN_PAGE).forward(request, response);
	}

}
