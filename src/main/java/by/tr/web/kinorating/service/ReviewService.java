package by.tr.web.kinorating.service;

import java.util.List;

import by.tr.web.kinorating.domain.Review;
import by.tr.web.kinorating.service.exception.ServiceException;

public interface ReviewService {
	
	boolean addReview(String userLogin, int movieID, String text) throws ServiceException;
	
	List<Review> showAllReviews(String langName) throws ServiceException;
	
	List<Review> getPartOfReviews(int start, int amount, String langName) throws ServiceException;
	
	int getReviewsAmount() throws ServiceException;
	
	List<Review> showUserReviews(String login, String langName) throws ServiceException;
	
	List<Review> showMovieReviws(int movieID) throws ServiceException;
	
	boolean editReview(int reviewID, String newText) throws ServiceException;
	
	boolean deleteReview(int reviewID) throws ServiceException;
	
}
