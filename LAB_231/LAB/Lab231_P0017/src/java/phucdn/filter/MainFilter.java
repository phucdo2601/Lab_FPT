/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phucdn.filter;

import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;

/**
 *
 * @author ASUS
 */
public class MainFilter implements Filter {

    private static final boolean debug = true;
    private static final String LOGIN_PAGE = "login.jsp";
    private static final Logger LOGGER = Logger.getLogger(MainFilter.class);

    // The filter configuration object we are associated with.  If
    // this value is null, this filter instance is not currently
    // configured. 
    private FilterConfig filterConfig = null;

    public MainFilter() {
    }

    private void doBeforeProcessing(ServletRequest request, ServletResponse response)
            throws IOException, ServletException {
        if (debug) {
            log("MainFilter:DoBeforeProcessing");
        }

        // Write code here to process the request and/or response before
        // the rest of the filter chain is invoked.
        // For example, a logging filter might log items on the request object,
        // such as the parameters.
        /*
	for (Enumeration en = request.getParameterNames(); en.hasMoreElements(); ) {
	    String name = (String)en.nextElement();
	    String values[] = request.getParameterValues(name);
	    int n = values.length;
	    StringBuffer buf = new StringBuffer();
	    buf.append(name);
	    buf.append("=");
	    for(int i=0; i < n; i++) {
	        buf.append(values[i]);
	        if (i < n-1)
	            buf.append(",");
	    }
	    log(buf.toString());
	}
         */
    }

    private void doAfterProcessing(ServletRequest request, ServletResponse response)
            throws IOException, ServletException {
        if (debug) {
            log("MainFilter:DoAfterProcessing");
        }

        // Write code here to process the request and/or response after
        // the rest of the filter chain is invoked.
        // For example, a logging filter might log the attributes on the
        // request object after the request has been processed. 
        /*
	for (Enumeration en = request.getAttributeNames(); en.hasMoreElements(); ) {
	    String name = (String)en.nextElement();
	    Object value = request.getAttribute(name);
	    log("attribute: " + name + "=" + value.toString());

	}
         */
        // For example, a filter might append something to the response.
        /*
	PrintWriter respOut = new PrintWriter(response.getWriter());
	respOut.println("<P><B>This has been appended by an intrusive filter.</B>");
         */
    }

    /**
     *
     * @param request The servlet request we are processing
     * @param response The servlet response we are creating
     * @param chain The filter chain we are processing
     *
     * @exception IOException if an input/output error occurs
     * @exception ServletException if a servlet error occurs
     */
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {

//        if (debug) {
//            log("MainFilter:doFilter()");
//        }
//        
//        doBeforeProcessing(request, response);
//        
//        Throwable problem = null;
//        try {
//            chain.doFilter(request, response);
//        } catch (Throwable t) {
//            // If an exception is thrown somewhere down the filter chain,
//            // we still want to execute our after processing, and then
//            // rethrow the problem after that.
//            problem = t;
//            t.printStackTrace();
//        }
//        
//        doAfterProcessing(request, response);
//
//        // If there was a problem, we want to rethrow it if it is
//        // a known type, otherwise log it.
//        if (problem != null) {
//            if (problem instanceof ServletException) {
//                throw (ServletException) problem;
//            }
//            if (problem instanceof IOException) {
//                throw (IOException) problem;
//            }
//            sendProcessingError(problem, response);
//        }
        HttpServletRequest req = (HttpServletRequest) request;
        String uri = req.getRequestURI();
        String url = LOGIN_PAGE;
        HttpSession session = req.getSession();
        String username = (String) session.getAttribute("txtUsername");
        try {
            int lastIndex = uri.lastIndexOf("/");
            String resource = uri.substring(lastIndex + 1);
            if (uri.contains(".css") || uri.contains(".js") || uri.contains(".jpg") || uri.contains(".jsp")
                    || uri.contains(".scss") || uri.contains(".png") || uri.contains(".less")) {
                chain.doFilter(request, response);
            } else {
                if (resource.length() > 0) {
                    if (username != null) {
                        url = resource.substring(0, 1).toUpperCase()
                                + resource.substring(1) + "Controller";
                        if (resource.lastIndexOf(".jsp") > 0 || resource.lastIndexOf(".html") > 0
                                || resource.lastIndexOf(".jsp") > 0
                                || resource.lastIndexOf(".css") > 0
                                || resource.lastIndexOf(".scss") > 0
                                || resource.lastIndexOf(".js") > 0
                                || resource.lastIndexOf(".jsp") > 0
                                || resource.lastIndexOf(".png") > 0
                                || resource.lastIndexOf(".less") > 0) {
                            url = resource;
                        }
                        if (resource.startsWith("A")) {
                            url = "Admin" + resource.substring(1) + "Controller";
                        }
                        if (resource.startsWith("U")) {
                            url = "User" + resource.substring(1) + "Controller";
                        }
                        if (resource.equals("loadAllService")) {
                            url = "loadAllService";
                        }
                        if (resource.equals("UpdateInfoController")) {
                            url = "UpdateInfoController";
                        }
                    } else {
                        request.setAttribute("errorLogin", "You have no permission to access this function!");
                    }
                    if (resource.equals("login")) {
                        url = "LoginController";
                    }

                } /*else {
                    url = LOGIN_PAGE;
                }*/
                if (url != null) {
//                RequestDispatcher rd = req.getRequestDispatcher(url);
//                rd.forward(request, response);
                    req.getRequestDispatcher(url).forward(request, response);
                } else {
                    chain.doFilter(request, response);
                }
            }
        } catch (Exception e) {
            LOGGER.error(e);
            log("ERROR at FilterMainController: " + e.getMessage());
        }
    }

    /**
     * Return the filter configuration object for this filter.
     */
    public FilterConfig getFilterConfig() {
        return (this.filterConfig);
    }

    /**
     * Set the filter configuration object for this filter.
     *
     * @param filterConfig The filter configuration object
     */
    public void setFilterConfig(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
    }

    /**
     * Destroy method for this filter
     */
    public void destroy() {
    }

    /**
     * Init method for this filter
     */
    public void init(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
        if (filterConfig != null) {
            if (debug) {
                log("MainFilter:Initializing filter");
            }
        }
    }

    /**
     * Return a String representation of this object.
     */
    @Override
    public String toString() {
        if (filterConfig == null) {
            return ("MainFilter()");
        }
        StringBuffer sb = new StringBuffer("MainFilter(");
        sb.append(filterConfig);
        sb.append(")");
        return (sb.toString());
    }

    private void sendProcessingError(Throwable t, ServletResponse response) {
        String stackTrace = getStackTrace(t);

        if (stackTrace != null && !stackTrace.equals("")) {
            try {
                response.setContentType("text/html");
                PrintStream ps = new PrintStream(response.getOutputStream());
                PrintWriter pw = new PrintWriter(ps);
                pw.print("<html>\n<head>\n<title>Error</title>\n</head>\n<body>\n"); //NOI18N

                // PENDING! Localize this for next official release
                pw.print("<h1>The resource did not process correctly</h1>\n<pre>\n");
                pw.print(stackTrace);
                pw.print("</pre></body>\n</html>"); //NOI18N
                pw.close();
                ps.close();
                response.getOutputStream().close();
            } catch (Exception ex) {
            }
        } else {
            try {
                PrintStream ps = new PrintStream(response.getOutputStream());
                t.printStackTrace(ps);
                ps.close();
                response.getOutputStream().close();
            } catch (Exception ex) {
            }
        }
    }

    public static String getStackTrace(Throwable t) {
        String stackTrace = null;
        try {
            StringWriter sw = new StringWriter();
            PrintWriter pw = new PrintWriter(sw);
            t.printStackTrace(pw);
            pw.close();
            sw.close();
            stackTrace = sw.getBuffer().toString();
        } catch (Exception ex) {
        }
        return stackTrace;
    }

    public void log(String msg) {
        filterConfig.getServletContext().log(msg);
    }

}