package by.tr.web.kinorating.dao;

import java.util.List;

import by.tr.web.kinorating.dao.exception.DAOException;
import by.tr.web.kinorating.domain.Movie;

public interface MovieDAO {
	
	boolean createMovie(Movie movie, String locale) throws DAOException;
	
	boolean addTranslation(Movie translation, String locale) throws DAOException;

	List<Movie> readAllMovies(String locale) throws DAOException;
	
	List<Movie> readPartOfMovies(String locale, int start, int amount) throws DAOException;

	Movie readMovieById(int movieId, String locale) throws DAOException;

	List<Movie> readRandomMovies(int amount, String locale) throws DAOException;

	List<Movie> readMovieByTitle(String title) throws DAOException;

	int countMoviesAmountOneLanguage(String locale) throws DAOException;
	
	boolean updateMovieTitle(Movie movie, String newTitle, String locale) throws DAOException;

	boolean updateMovieLength(Movie movie, int newLength) throws DAOException;

	boolean updateMovieYear(Movie movie, int newYear) throws DAOException;

	boolean updateMovieDirector(Movie movie, String newDirector, String locale) throws DAOException;

	boolean updateMovieGenre(Movie movie, String newGenre, String locale) throws DAOException;

	boolean updateMovieRating(Movie movie) throws DAOException;
	
	boolean updateMovieMarksAmount(Movie movie) throws DAOException;

	boolean deleteMovie(Movie movie) throws DAOException;

}
