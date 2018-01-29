package by.tr.web.kinorating.service.util;

import by.tr.web.kinorating.dao.connection_pool.ConnectionPool;
import by.tr.web.kinorating.dao.exception.DAOException;
import by.tr.web.kinorating.service.exception.ServiceException;

public final class ConnectionPoolManager {
	
	private final static ConnectionPoolManager initializer = new ConnectionPoolManager();
	
	private ConnectionPoolManager() {}
	
	public static ConnectionPoolManager getInitializer() {
		return initializer;
	}
	
	public void initializeConnectionPool() throws ServiceException {
		try {
			ConnectionPool.getInstance().initPoolData();
		} catch (DAOException e) {
			throw new ServiceException(e);
		}
	}
	
	public void closeAllConnections() throws ServiceException {
		try {
			ConnectionPool.getInstance().dispose();
		} catch (DAOException e) {
			throw new ServiceException(e);
		}
	}
}
