package by.tr.web.kinorating.controller.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import by.tr.web.kinorating.domain.Role;
import by.tr.web.kinorating.domain.User;

public class AccessPermissionFilter implements Filter {

	private static final String SESSION_ATTR_USER = "user";

	public AccessPermissionFilter() {}

	public void destroy() {}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		User user = (User) req.getSession().getAttribute(SESSION_ATTR_USER);
		if (user != null && user.getRole().equals(Role.ADMIN)) {
			chain.doFilter(request, response);
		} else {
			HttpServletResponse res = (HttpServletResponse) response;
			res.sendError(HttpServletResponse.SC_FORBIDDEN);
		}
	}

	public void init(FilterConfig fConfig) throws ServletException {}

}
