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
import by.tr.web.kinorating.domain.Actor;
import by.tr.web.kinorating.domain.Movie;
import by.tr.web.kinorating.service.ActorService;
import by.tr.web.kinorating.service.ServiceFactory;
import by.tr.web.kinorating.service.exception.ServiceException;

public class CertainActorPageInitImpl implements Command {

	private static final String PROBLEM_WITH_READING_MOVIES = "Problem with reading movies";

	private static final String PROBLEM_WITH_GETTING_ACTOR = "Problem with getting actor";

	private static final String ACTOR_MOVIES_ATTR = "actor_movies";
	private static final String DEFAULT_LANG_NAME = "ru";
	private static final String ITEM_ATTR = "item";
	private static final String ACTOR_PAGE = "actors/actor";

	private static final Logger logger = LogManager.getLogger(CertainActorPageInitImpl.class);

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
		ActorService actorService = factory.getActorService();
		Actor actor = null;
		try {
			actor = actorService.getActorById(id, langName);
		} catch (ServiceException e) {
			logger.error(PROBLEM_WITH_GETTING_ACTOR, e);
			response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			return;
		}
		List<Movie> movies = null;
		try {
			movies = actorService.getMoviesOneActor(id, langName);
		} catch (ServiceException e) {
			logger.error(PROBLEM_WITH_READING_MOVIES, e);
			response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			return;
		}
		request.setAttribute(ITEM_ATTR, actor);
		request.setAttribute(ACTOR_MOVIES_ATTR, movies);
		request.getRequestDispatcher(ACTOR_PAGE).forward(request, response);
	}

}
