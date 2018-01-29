package by.tr.web.kinorating.controller.command.impl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
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

public class UsersPageInitImpl implements Command {

	private static final String PROBLEM_WITH_GETTING_USERS = "Problem with getting users";
	
	private static final String ITEM_ATTR = "item";
	private static final String USERS_PAGE = "users";
	private static final String PAGES_AMOUNT_ATTR = "pages";
	
	private static final int DEFAULT_ITEMS_PER_PAGE = 10;
	private static final int DEFAULT_PAGE = 1;
	
	private static final Logger logger = LogManager.getLogger(ReviewsPageInitImpl.class);

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String pageStr = request.getParameter(ParameterName.PAGE);
		String itemsPerPageStr = request.getParameter(ParameterName.ITEMS_PER_PAGE);
		int page = DEFAULT_PAGE;
		int itemsPerPage = DEFAULT_ITEMS_PER_PAGE;
		if (pageStr != null && itemsPerPageStr != null) {
			page = Integer.valueOf(pageStr);
			itemsPerPage = Integer.valueOf(itemsPerPageStr);
		}
		ServiceFactory factory = ServiceFactory.getInstance();
		UserService userService = factory.getUserService();
		List<User> users = new ArrayList<>();
		int start = itemsPerPage * (page - 1);
		int usersAmount = 0;
		try {
			users = userService.getPartOfUsers(start, itemsPerPage);
			usersAmount = userService.getUsersAmount();
		} catch (ServiceException e) {
			logger.error(PROBLEM_WITH_GETTING_USERS, e);
			response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			return;
		}
		Integer pages = (int) Math.ceil(usersAmount/itemsPerPage);
		request.setAttribute(ITEM_ATTR, users);
		request.setAttribute(PAGES_AMOUNT_ATTR, pages);
		request.getRequestDispatcher(USERS_PAGE).forward(request, response);
	}
}
