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
import by.tr.web.kinorating.domain.Review;
import by.tr.web.kinorating.service.ReviewService;
import by.tr.web.kinorating.service.ServiceFactory;
import by.tr.web.kinorating.service.exception.ServiceException;

public class ReviewsPageInitImpl implements Command {
	private static final String PROBLEM_WITH_GETTING_REVIEWS = "Problem with getting reviews";

	private static final String ITEM_ATTR = "item";
	private static final String REVIEWS_PAGE = "reviews";
	private static final String PAGES_AMOUNT_ATTR = "pages";
	private static final String DEFAULT_LANG_NAME = "ru";
	
	private static final int DEFAULT_ITEMS_PER_PAGE = 10;
	private static final int DEFAULT_PAGE = 1;

	private static final Logger logger = LogManager.getLogger(ReviewsPageInitImpl.class);

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
		ReviewService reviewService = factory.getReviewsService();
		List<Review> reviews = null;
		int start = itemsPerPage * (page - 1);
		int reviewsAmount = 0;
		try {
			reviews = reviewService.getPartOfReviews(start, itemsPerPage, langName);
			reviewsAmount = reviewService.getReviewsAmount();
		} catch (ServiceException e) {
			logger.error(PROBLEM_WITH_GETTING_REVIEWS, e);
			response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			return;
		}
		Integer pages = (int) Math.ceil(reviewsAmount/itemsPerPage);
		request.setAttribute(ITEM_ATTR, reviews);
		request.setAttribute(PAGES_AMOUNT_ATTR, pages);
		request.getRequestDispatcher(REVIEWS_PAGE).forward(request, response);
	}

}
