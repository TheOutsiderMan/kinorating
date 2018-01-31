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
import by.tr.web.kinorating.service.ActorService;
import by.tr.web.kinorating.service.ServiceFactory;
import by.tr.web.kinorating.service.exception.ServiceException;

public class ActorsPageInitImpl implements Command{
	
	private static final String PROBLEM_WITH_GETTING_ACTORS = "Problem with getting actors";

	private static final String DEFAULT_LANG_NAME = "ru";
	private static final String ITEM_ATTR = "item";
	private static final String ACTORS_PAGE = "actors";
	private static final String PAGES_AMOUNT_ATTR = "pages";
	
	private static final int DEFAULT_ITEMS_PER_PAGE = 10;
	private static final int DEFAULT_PAGE = 1;

	private static final Logger logger = LogManager.getLogger(ActorsPageInitImpl.class);

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
		ActorService actorService = factory.getActorService();
		List<Actor> actors = null;
		int start = itemsPerPage * (page - 1);
		int actorsAmount = 0;
		try {
			actors = actorService.getPartOfActors(langName, start, itemsPerPage);
			actorsAmount = actorService.getActorsAmountOneLanguage(langName);
		} catch (ServiceException e) {
			logger.error(PROBLEM_WITH_GETTING_ACTORS, e);
			response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			return;
		}
		Integer pages = (int) Math.ceil(actorsAmount/itemsPerPage);
		request.setAttribute(ITEM_ATTR, actors);
		request.setAttribute(PAGES_AMOUNT_ATTR, pages);
		request.getRequestDispatcher(ACTORS_PAGE).forward(request, response);
	}

}
