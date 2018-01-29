package by.tr.web.kinorating.controller.command.impl;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import by.tr.web.kinorating.controller.ParameterName;
import by.tr.web.kinorating.controller.command.Command;
import by.tr.web.kinorating.domain.User;
import by.tr.web.kinorating.service.ServiceFactory;
import by.tr.web.kinorating.service.UserService;
import by.tr.web.kinorating.service.exception.ServiceException;

public class VoteImpl implements Command {

	private static final String TEXT_HTML_CHARSET_UTF_8 = "text/html;charset=UTF-8";
	private static final String SESSION_ATTR_USER = "user";
	private static final String DEFAULT_LANG_NAME = "ru";

	private static final String PROBLEM_WITH_VOTING = "Problem with voting";

	private static final Logger logger = LogManager.getLogger(VoteImpl.class);

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String markString = request.getParameter(ParameterName.MARK);
		String login = request.getParameter(ParameterName.LOGIN);
		String movieIDString = request.getParameter(ParameterName.MOVIE_ID);
		int mark = -1;
		int movieID = -1;
		if (markString != null && movieIDString != null) {
			mark = Integer.valueOf(markString);
			movieID = Integer.valueOf(movieIDString);
		} else {
			response.sendError(HttpServletResponse.SC_NOT_ACCEPTABLE);
			return;
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
		UserService userService = factory.getUserService();
		boolean updated = false;
		try {
			updated = userService.changeUserMarkToMovie(login, movieID, mark, langName);
		} catch (ServiceException e) {
			logger.error(PROBLEM_WITH_VOTING, e);
			response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			return;
		}
		if (updated) {
			User user = (User) request.getSession().getAttribute(SESSION_ATTR_USER);
			user.getMarks().put(movieID, mark);
			request.getSession().setAttribute(SESSION_ATTR_USER, user);
			response.setStatus(HttpServletResponse.SC_OK);
			response.setContentType(TEXT_HTML_CHARSET_UTF_8);
		}
	}

}
