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

public class AddActorImpl implements Command {
	
	private static final String REDIRECT_URL = "/actors";

	private static final String PROBLEM_WITH_ADDING_ACTOR = "Problem with adding actor";

	private static final String DEFAULT_LANG_NAME = "ru";
	
	private static final Logger logger = LogManager.getLogger(AddActorImpl.class);
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String firstName = request.getParameter(ParameterName.FIRST_NAME);
		String lastName = request.getParameter(ParameterName.LAST_NAME);
		String ageStr = request.getParameter(ParameterName.AGE);
		String movieIdStr = request.getParameter(ParameterName.ACTOR_MOVIE);
		String langName = request.getParameter(ParameterName.LOCALE);
		int age = 0;
		if (ageStr != null) {
			age = Integer.valueOf(ageStr);
		}
		int movieId = 0;
		if (movieIdStr != null) {
			movieId = Integer.valueOf(movieIdStr);
		}
		if (langName == null) {
			langName = DEFAULT_LANG_NAME;
		}
		ServiceFactory factory = ServiceFactory.getInstance();
		ActorService actorService = factory.getActorService();
		Actor actor = new Actor();
		actor.setFirstName(firstName);
		actor.setSecondName(lastName);
		actor.setAge(age);
		try {
			actorService.addActor(actor, movieId, langName);
		} catch (ServiceException e) {
			logger.error(PROBLEM_WITH_ADDING_ACTOR);
		}
		response.sendRedirect(REDIRECT_URL);
	}

}
