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

public class MoviesPageInitImpl implements Command {

	private static final String CURRENT_PAGE_ATTR = "currentPage";

	private static final String PROBLEM_WITH_GETTING_MOVIES = "Problem with getting movies";

	private static final String DEFAULT_LANG_NAME = "ru";
	private static final String ITEM_ATTR = "item";
	private static final String MOVIES_PAGE = "movies";
	private static final String PAGES_AMOUNT_ATTR = "pages";

	private static final int DEFAULT_ITEMS_PER_PAGE = 10;
	private static final int DEFAULT_PAGE = 1;

	private static final Logger logger = LogManager.getLogger(MoviesPageInitImpl.class);

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String pageStr = request.getParameter(ParameterName.PAGE);
		String itemsPerPageStr = request.getParameter(ParameterName.ITEMS_PER_PAGE);
		int page = DEFAULT_PAGE;
		int itemsPerPage = DEFAULT_ITEMS_PER_PAGE;
		if (pageStr != null ) {
			page = Integer.valueOf(pageStr);
		}
		if (itemsPerPageStr != null) {
			itemsPerPage = Integer.valueOf(itemsPerPageStr);
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
		List<Movie> movies = null;
		int start = itemsPerPage * (page - 1);
		int moviesAmount = 0;
		try {
			movies = movieService.getPartOfMovies(langName, start, itemsPerPage);
			moviesAmount = movieService.getMoviesAmountOneLanguage(langName);
		} catch (ServiceException e) {
			logger.error(PROBLEM_WITH_GETTING_MOVIES, e);
			response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			return;
		}
		Integer pages = (int) Math.ceil((double) moviesAmount / itemsPerPage);
		request.setAttribute(ITEM_ATTR, movies);
		request.setAttribute(PAGES_AMOUNT_ATTR, pages);
		request.setAttribute(CURRENT_PAGE_ATTR, page);
		request.getRequestDispatcher(MOVIES_PAGE).forward(request, response);
	}

}
