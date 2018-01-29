package by.tr.web.kinorating.controller.command.impl;

import java.io.IOException;

import javax.servlet.ServletException;
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

public class AddMovieTranslationImpl implements Command {

	private static final String PROBLEM_WITH_ADDING_TRANSLATION = "Problem with adding translation";

	private static final Logger logger = LogManager.getLogger(AddMovieTranslationImpl.class);

	private static final String REDIRECT_URL = "/movies";
	private static final String DEFAULT_LANG_NAME = "ru";

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String title = request.getParameter(ParameterName.TITLE);
		String director = request.getParameter(ParameterName.DIRECTOR);
		String genre = request.getParameter(ParameterName.GENRE);
		String langName = request.getParameter(ParameterName.LOCALE);
		String movieIdStr = request.getParameter(ParameterName.MOVIE_ID);
		if (langName == null) {
			langName = DEFAULT_LANG_NAME;
		}
		int movieId = 0;
		if (movieId != 0) {
			movieId = Integer.valueOf(movieIdStr);
		}

		Movie translation = new Movie();
		translation.setDirector(director);
		translation.setGenre(genre);
		translation.setTitle(title);
		translation.setId(movieId);

		ServiceFactory factory = ServiceFactory.getInstance();
		MovieService movieService = factory.getMoviesService();
		try {
			movieService.addTranslation(translation, langName);
		} catch (ServiceException e) {
			logger.error(PROBLEM_WITH_ADDING_TRANSLATION, e);
		}
		response.sendRedirect(REDIRECT_URL);
	}

}
