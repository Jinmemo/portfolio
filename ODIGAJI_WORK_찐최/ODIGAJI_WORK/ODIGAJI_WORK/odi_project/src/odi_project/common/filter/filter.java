package odi_project.common.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

/**
 * Servlet Filter implementation class EncodingFilter
 */
@WebFilter(urlPatterns="/*") // 모든 url요청에 대해서 서블릿이 실행되기 전에 먼저 이 필터를 거치게함. // 필터 파일 
public class filter implements Filter {

    /** Default constructor.  */
    public filter() {
        // TODO Auto-generated constructor stub
    }

	/** @see Filter#destroy()*/
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/** @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)*/
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {

		request.setCharacterEncoding("UTF-8");

		// pass the request along the filter chain
		chain.doFilter(request, response);
		// 현재 필터가 최종 필터일 경우 => Servlet을 호출
		// 현재 필터가 최종 필터가 아닐 경우 => 또 다른 필터를 호출
		

	}

	/** @see Filter#init(FilterConfig) */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}