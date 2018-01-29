package by.tr.web.kinorating.controller.command.impl;

import java.io.IOException;

import javax.servlet.ServletException;
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

public class AddActorTranslationImpl implements Command {
	
	private static final String PROBLEM_WITH_ADDING_TRANSLATION = "Problem with adding translation";

	private static final String REDIRECT_URL = "/actors";

	private static final String DEFAULT_LANG_NAME = "ru";
	
	private static final Logger logger = LogManager.getLogger(AddActorTranslationImpl.class);
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String firstName = request.getParameter(ParameterName.FIRST_NAME);
		String lastName = request.getParameter(ParameterName.LAST_NAME);
		String actorIdStr = request.getParameter(ParameterName.ACTOR_ID);
		int actorID = 0;
		if (actorIdStr != null) {
			actorID = Integer.valueOf(actorIdStr);
		}
		String langName = request.getParameter(ParameterName.LOCALE);
		if (langName == null) {
			langName = DEFAULT_LANG_NAME;
		}
		ServiceFactory factory = ServiceFactory.getInstance();
		ActorService actorService = factory.getActorService();
		Actor translation = new Actor();
		translation.setId(actorID);
		translation.setFirstName(firstName);
		translation.setSecondName(lastName);
		try {
			actorService.addTranslation(translation, langName);
		} catch (ServiceException e) {
			logger.error(PROBLEM_WITH_ADDING_TRANSLATION, e);
		}
		response.sendRedirect(REDIRECT_URL);
	}

}
