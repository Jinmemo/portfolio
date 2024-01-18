package odi_project.common.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

import odi_project.common.wrapper.PasswordEncryptWrapper;



/**
 * Servlet Filter implementation class PasswordEncry
 */
@WebFilter(servletNames = {"loginServlet", "insertServlet"})
public class PasswordEncryFilter implements Filter {

    /**
     * Default constructor. 
     */
    public PasswordEncryFilter() {
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {

		PasswordEncryptWrapper pew = new PasswordEncryptWrapper( (HttpServletRequest)request );
		chain.doFilter(pew, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		
		
		
	}

}