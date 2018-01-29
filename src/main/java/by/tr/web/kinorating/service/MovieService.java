package by.tr.web.kinorating.service;

import java.util.List;

import by.tr.web.kinorating.domain.Movie;
import by.tr.web.kinorating.service.exception.ServiceException;

public interface MovieService {

	boolean addMovie(Movie newMovie, String langName) throws ServiceException;
	
	boolean addTranslation(Movie translation, String langName) throws ServiceException;
	
	List<Movie> getAllMovies(String langName) throws ServiceException;
	
	Movie getMovieById(int id, String langName) throws ServiceException;
	
	List<Movie> getPartOfMovies(String langName, int start, int amount) throws ServiceException;
	
	List<Movie> getRandomMovies(int amount, String langName) throws ServiceException;
	
	int getMoviesAmountOneLanguage(String langName) throws ServiceException;
	
	boolean editMovieTitle(int movieID, String title, String langName) throws ServiceException;
	
	boolean editMovieDirector(int movieID, String director, String langName) throws ServiceException;
	
	boolean editMovieGenre(int movieID, String genre, String langName) throws ServiceException;
	
	boolean editMovieLength(int movieID, int length) throws ServiceException;
	
	boolean editMovieReleaseYear(int movieID, int year) throws ServiceException;
	
	boolean deleteMovie(int movieID) throws ServiceException;
}
